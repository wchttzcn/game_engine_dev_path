---
title: "3.13 — Ses ve varyasyon"
description: "Dosya kullanmadan kendi sample buffer'ından bir ses üret ve her çalışta pitch'ini dar bir aralıkta rastgele seç."
section: Oyun hissi
---

# 3.13 — Ses ve varyasyon

**Hedef:** Tuğla kırılınca dosyasız üretilmiş bir ses çal ve her vuruşta
pitch'i dar bir aralıkta rastgele seçerek tekrarın kulağı yormasını önle.

## Görev

Bir tuğla kırıldığında bir ses duyulsun. Elinde bir ses dosyası yok ve bu ders
sana bir tane indirtmeyecek — sesi kendi sample buffer'ından üreteceksin:
sabit boyutlu bir `i16` array'i sinüs dalgası ve zamanla sıfıra süzülen bir
sönme zarfıyla (envelope) doldur, bunu bir `Wave`'e sarıp `Sound`'a çevir.
Aynı sesi her tuğla kırıldığında birebir aynı yükseklikte çalarsan kulak birkaç
saniyede bunu fark eder; her çalıştan önce pitch'i dar bir aralıktan rastgele
seç.

## Ne zaman bitti?

- Tuğla kırıldığında bir ses duyuluyor.
- Ses bir dosyadan değil, elle doldurulmuş bir sample buffer'ından geliyor.
- Sesin sonunda belirgin bir “klik” yok — zarf genliği sıfıra indiriyor.
- Art arda birkaç tuğla kırıldığında sesler birebir aynı yükseklikte
  duyulmuyor; pitch dar bir aralıkta değişiyor.
- Ses cihazı `main`'in başında bir kez açılıyor, `defer` ile kapanıyor; aynı
  şekilde yüklenen `Sound` `defer` ile serbest bırakılıyor.
- `odin check games/breakout` geçiyor.

## Bilmen gereken küçük parça

raylib'in ses tarafı iki kurulum çağrısıyla açılıp kapanıyor, tıpkı `InitWindow`
/ `CloseWindow` çiftini 3.1'den beri `defer`'le kullandığın gibi:

```odin
rl.InitAudioDevice()
defer rl.CloseAudioDevice()
```

Bir `Sound`'u dosyadan değil kendi verinden kurmanın yolu `Wave` struct'ını
elle doldurup `rl.LoadSoundFromWave`'e vermek:

```odin
SAMPLE_RATE :: 44100
BLIP_FRAMES :: SAMPLE_RATE / 20

samples: [BLIP_FRAMES]i16
// samples'i doldur: her i için bir sinüs değeri × sönme zarfı

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

`data` alanı `rawptr` — `&samples[0]` ile array'in ilk elemanının adresini
veriyorsun, `LoadSoundFromWave` oradan `frameCount * sampleSize / 8` byte
okuyor. Bu satırı bir kez, `main`'in başında çalıştırman yeterli; oyun boyunca
aynı `Sound`'u tekrar tekrar çalacaksın.

Samples'i yalnızca sinüsle doldurup zarfı atlarsan sesin sonunda kulağa
tırmalayıcı gelen bir “klik” duyarsın — dalga tam bir periyodun ortasında
aniden sıfıra kesiliyor, ani genlik sıçraması bir klik olarak duyuluyor.
Sönme zarfı bu sıçramayı önlüyor: örnek değerini, buffer'ın başında 1'e yakın,
sonunda 0'a yakın olacak şekilde çarparak dalgayı yumuşakça susturuyor.

Çalmadan hemen önce pitch'i değiştirmek `rl.SetSoundPitch` ile oluyor; aralıktan
ondalıklı bir sayı çekmek 3.7'de kullandığın `rand.float32_range`'in aynısı:

```odin
pitch := rand.float32_range(0.95, 1.05)
rl.SetSoundPitch(sound, pitch)
rl.PlaySound(sound)
```

`SetSoundPitch` çağrıdığı `Sound`'un pitch'ini kalıcı olarak değiştirir —
sıradaki `PlaySound` da o pitch'le çalar, çağrı sırası bu yüzden önemli: önce
pitch'i ayarla, sonra çal.

## Sınırlar

- Yalnızca pitch değişiyor; volume varyasyonu bu derste yok — tek bir
  varyasyon boyutuyla farkı duymak yeterli, ikisini aynı anda ayarlamak ayrı
  bir Deep Dive konusu.
- Tek bir ses türü (tuğla kırılma sesi) yeterli; farklı olaylar için farklı
  sesler bu dersin kapsamı dışında.
- Zarfın şekli (lineer sönme, exponansiyel sönme) serbest; hangisini seçtiğin
  önemli değil, sesin sonunda klik kalmaması önemli.

::: details İpucu 1 — Örnek indeksinden zamana
Sample buffer'ında `i`, kaçıncı örnekte olduğunu söylüyor; saniyeye çevirmek
için örnekleme hızına bölüyorsun: `t := f32(i) / SAMPLE_RATE`. Sinüs
fonksiyonu `core:math` paketinde (`math.sin`), argümanı radyan cinsinden
istiyor — frekansı Hz'den radyana çevirmek için `t * 2 * math.PI * frekans`
kullanılıyor. Frekans olarak 200-500 Hz arası bir değer tuğla kırılma sesi
için makul.
:::

::: details İpucu 2 — Zarf ve genlik ölçeği
Zarf, `i` buffer'ın başındayken 1'e, sonuna yaklaştıkça 0'a giden bir çarpan:
`envelope := 1.0 - f32(i) / f32(BLIP_FRAMES)`. `math.sin` -1 ile 1 arasında bir
`f32` döndürüyor; bunu `i16`'nın taşımayacağı bir tepe genliğe (örneğin 8000,
`i16`'nın üst sınırı olan 32767'nin çok altında) ölçekleyip zarfla çarpıp
`i16`'ya çeviriyorsun.
:::

::: details İpucu 3 — Tam doldurma döngüsü
```odin
for i in 0 ..< BLIP_FRAMES {
	t := f32(i) / SAMPLE_RATE
	envelope := 1.0 - f32(i) / f32(BLIP_FRAMES)
	samples[i] = i16(math.sin(t * 2 * math.PI * 300) * envelope * 8000)
}
```
Bu döngü `wave`'i kurmadan önce, `samples` array'i tanımlandıktan hemen sonra
çalışmalı. Frekansı ve tepe genliği kendi kulağına göre ayarlayabilirsin.
:::

::: details Deep Dive — Pitch aralığı ve LoadSoundAlias
Pitch aralığını ne kadar dar tutman gerektiği kulağa bırakılan bir karar
değil, ölçülebilir bir sınır: `0.95`-`1.05` gibi dar bir aralık aynı sesin
küçük varyasyonları gibi duyulur, `0.5`-`2.0` gibi geniş bir aralık artık
başka bir ses gibi duyulmaya başlar — dinleyici “aynı olay, biraz farklı”
yerine “farklı olaylar” algılar. Pitch ve volume de farklı şeyler söylüyor:
pitch değişimi “bu tam olarak aynı vuruş değil” izlenimini, volume değişimi
“bu vuruş daha güçlü/daha uzaktaydı” izlenimini veriyor — ikisini karıştırmak
oyuncunun hangi bilgiyi okuduğunu bulanıklaştırır.

`rl.SetSoundPitch` tek bir `Sound` nesnesinin pitch'ini değiştirir. Aynı
`Sound`'u art arda, önceki çalma bitmeden tekrar çalarsan ikinci
`SetSoundPitch` çağrısı birincinin pitch'ini de değiştirir — hâlâ çalmakta
olan sesin yüksekliği aniden kayar. `rl.LoadSoundAlias(source: Sound) -> Sound`
tam bu yüzden var: kaynak verisini paylaşan ama kendi pitch/volume state'ini
tutan bağımsız bir ikinci `Sound` döndürür, birden çok örneği aynı anda farklı
pitch'lerle çalmak istediğinde kullanılır. Bu oyunda buna ihtiyacın yok: 3.5'te
topun tuğla döngüsü ilk çarpışmadan sonra `break` ile duruyor, yani bir frame'de
en fazla bir tuğla kırılabiliyor — üst üste binen, aynı anda çalan iki farklı
pitch isteği bu oyunda oluşmuyor.
:::

## Birincil kaynak

`vendor:raylib` audio modülü girdisi (`RESOURCES.md`). `InitAudioDevice`,
`LoadSoundFromWave`, `SetSoundPitch`, `PlaySound` ve `Wave` struct'ının
alanları buradan doğrulandı; `Wave`'i elle doldurup `LoadSoundFromWave`'e
vermenin dosyasız çalıştığı kurulu derleyicide çalıştırılarak doğrulandı.

**Kazanım:** Artık oyunun hissi yalnızca görsel geri bildirimden değil sesten
de geliyor, ve o ses hiçbir asset olmadan, tamamen kendi ürettiğin sayılardan
çıkıyor. Pitch varyasyonu küçük ama tekrarın yorucu hissini kesen bir detay —
sıradaki ders bu tür sayıları (hitstop süresi, trauma, pitch aralığı, top
hızı) tek bir yerde toplayıp oyunu kapatmadan ayarlanabilir hale getiriyor.

**“Breakout 3.13 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu sayıları oyunu kapatmadan ayarlamak:
[3.14 — F1 ayar paneli](/worlds/03-breakout/14-tuning-panel).
