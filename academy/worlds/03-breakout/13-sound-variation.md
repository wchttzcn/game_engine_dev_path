---
title: "3.13 — Ses ve varyasyon"
description: "Dosya kullanmadan kendi sample buffer'ından bir ses üret ve her çalışta pitch'ini dar bir aralıkta rastgele seç."
section: Oyun hissi
---

# 3.13 — Ses ve varyasyon

**Hedef:** Tuğla kırılınca dosyasız üretilmiş bir ses çal ve her vuruşta
pitch'i dar bir aralıkta rastgele seçerek tekrarın kulağı yormasını önle.

## Görev

Bir tuğla kırıldığında bir ses duyulsun. Ses bir dosyadan değil, kendi
ürettiğin sample buffer'ından gelsin: sabit boyutlu bir `i16` array'ini sinüs
dalgası ve sıfıra süzülen bir sönme zarfıyla (envelope) doldur, `Wave`'e sarıp
`Sound`'a çevir. Aynı sesi her seferinde birebir aynı yükseklikte çalarsan
kulak birkaç saniyede fark eder; çalmadan önce pitch'i dar bir aralıktan
rastgele seç.

## Ne zaman bitti?

- Tuğla kırıldığında bir ses duyuluyor.
- Ses bir dosyadan değil, elle doldurulmuş bir sample buffer'ından geliyor.
- Sesin sonunda belirgin bir “klik” yok — zarf genliği sıfıra indiriyor.
- Art arda birkaç tuğla kırıldığında pitch birebir aynı değil, dar bir
  aralıkta değişiyor.
- Ses cihazı `main`'in başında bir kez açılıyor, `defer` ile kapanıyor; aynı
  şekilde yüklenen `Sound` da `defer` ile serbest bırakılıyor.
- `odin check games/breakout` geçiyor.

## Elindekiler

Ses cihazı `main`'in başında açılır, `defer` ile kapanır — 3.1'den beri
`InitWindow`/`CloseWindow` çiftiyle tanıdığın kalıp:

```odin
rl.InitAudioDevice()
defer rl.CloseAudioDevice()
```

Sinüsü üretmek `core:math`'in `math.sin`'ini istiyor — dosyanın başına
`import "core:math"` ekle. Örnekleri dolduracağın procedure:

```odin
SAMPLE_RATE :: 44100
BLIP_FRAMES :: SAMPLE_RATE / 20

fill_blip_samples :: proc(samples: []i16) {
}
```

Dolu buffer'ı bir `Sound`'a çeviren kısım hazır, elle yazman gerekmiyor:

```odin
samples: [BLIP_FRAMES]i16
fill_blip_samples(samples[:])
wave := rl.Wave {
	frameCount = BLIP_FRAMES,
	sampleRate = SAMPLE_RATE,
	sampleSize = 16,
	channels   = 1,
	data       = &samples[0],
}
sound := rl.LoadSoundFromWave(wave)
defer rl.UnloadSound(sound)
```

Çalmadan hemen önce pitch'i seçmek 3.7'nin `rand.float32_range`'iyle oluyor:

```odin
SetSoundPitch :: proc(sound: Sound, pitch: f32)
PlaySound :: proc(sound: Sound)
```

## Sınırlar

- Yalnızca pitch değişiyor; volume varyasyonu bu derste yok.
- Tek bir ses türü (tuğla kırılma) yeterli; farklı olaylar için farklı sesler
  bu dersin kapsamı dışında.
- Zarfın şekli (lineer, exponansiyel) serbest; önemli olan sesin sonunda klik
  kalmaması.

::: details İpucu 1 — Örnek indeksinden sese
Her `i` için saniyeye çevir: `t := f32(i) / SAMPLE_RATE`. `math.sin` radyan
istiyor; frekansı Hz'den radyana çevirmek `t * 2 * math.PI * frekans` ile
oluyor, 200-500 Hz tuğla sesi için makul. Zarf, `i` baştayken `1`'e, sona
yaklaşınca `0`'a giden bir çarpan: `envelope := 1.0 - f32(i) / f32(len(samples))`.
Sinüsü zarfla çarp, `i16`'nın taşımayacağı bir tepe genliğe (örnek `8000`)
ölçekleyip `i16`'ya çevir.
:::

::: details İpucu 2 — Pitch'i çalmadan önce ayarlamak
`rl.SetSoundPitch` pitch'i kalıcı olarak değiştirir; sıradaki `rl.PlaySound` o
pitch'le çalar. Sırayı ters yazıp önce çalıp sonra pitch ayarlarsan, o çalış
eski pitch'te duyulur — yeni pitch bir sonraki çalışa sızar, kulağa gecikmeli
bir varyasyon gibi gelir. Sıra hep aynı: önce `SetSoundPitch`, sonra
`PlaySound`.
:::

::: details İpucu 3 — Tam çözüm
```odin
fill_blip_samples :: proc(samples: []i16) {
	for i in 0 ..< len(samples) {
		t := f32(i) / SAMPLE_RATE
		envelope := 1.0 - f32(i) / f32(len(samples))
		samples[i] = i16(math.sin(t * 2 * math.PI * 300) * envelope * 8000)
	}
}
```
Doldurma çağrısı `main`'in başında, `wave` kurulmadan önce bir kez çalışır.
Çalma çağrısı tuğlanın kırıldığı yere, `particle_spawn`'ın yanına gidiyor:

```odin
rl.SetSoundPitch(sound, rand.float32_range(0.95, 1.05))
rl.PlaySound(sound)
```
:::

## Kaynak

`vendor:raylib` audio modülü girdisi (`RESOURCES.md`) — `InitAudioDevice`,
`LoadSoundFromWave`, `SetSoundPitch`, `PlaySound` ve `Wave` struct'ının
alanları buradan doğrulandı; `Wave`'i elle doldurup `LoadSoundFromWave`'e
vermenin dosyasız çalıştığı kurulu derleyicide çalıştırılarak doğrulandı.

## Daha derine

Pitch aralığını ne kadar dar tutman gerektiği kulağa bırakılan bir karar
değil: `0.95`-`1.05` gibi dar bir aralık aynı sesin küçük varyasyonu gibi
duyulur, `0.5`-`2.0` gibi geniş bir aralık başka bir ses gibi duyulmaya
başlar — dinleyici “aynı olay, biraz farklı” yerine “farklı olaylar” algılar.

`rl.SetSoundPitch` tek bir `Sound`'un pitch'ini değiştirir. Aynı `Sound`'u
önceki çalma bitmeden tekrar çalarsan ikinci çağrı birincinin pitch'ini de
değiştirir. `rl.LoadSoundAlias(source: Sound) -> Sound` bunun için var:
kaynak veriyi paylaşan ama kendi pitch state'ini tutan bağımsız bir ikinci
`Sound` döner. Bu oyunda buna ihtiyaç yok — top-tuğla döngüsü ilk
çarpışmadan sonra `break` ile duruyor, bir frame'de en fazla bir tuğla
kırılabiliyor.

## Kazanım

Artık oyunun hissi görsel geri bildirimden değil sesten de geliyor, ve o ses
hiçbir asset olmadan kendi ürettiğin sayılardan çıkıyor. Sıradaki ders bu tür
sayıları (hitstop süresi, trauma, pitch aralığı, top hızı) tek bir yerde
toplayıp oyunu kapatmadan ayarlanabilir hale getiriyor.

**“Breakout 3.13 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu sayıları oyunu kapatmadan ayarlamak:
[3.14 — F1 ayar paneli](/worlds/03-breakout/14-tuning-panel).
