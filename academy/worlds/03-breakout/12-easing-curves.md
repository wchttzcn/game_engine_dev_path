---
title: "3.12 — Eğriler"
description: "Bir değerin A'dan B'ye lineer değil, eğrisel gitmesiyle parçacıkların sönüşüne his kat."
section: Oyun hissi
---

# 3.12 — Eğriler

**Hedef:** Parçacıklarının sönüşünü lineer bir azalma yerine bir easing
eğrisinden geçir.

## Görev

3.7'nin parçacık havuzunda her `Particle`'ın `life` alanı doğarken `1`'e
kurulup her frame `dt` kadar azalıyor. Bu oranı `vendor:raylib/easings.odin`
içindeki bir easing fonksiyonundan geçirip parçacığın alpha'sını hesapla.
Aynı süre, aynı uç değerler — yalnız aradaki yolun şekli değişsin.

## Ne zaman bitti?

- Parçacığın alpha'sı artık lineer değil, en az bir easing fonksiyonundan
  (örneğin `rl.EaseQuadOut`) geçiyor.
- Bir easing'i başka biriyle değiştirdiğinde (örnek `EaseLinearNone` ile
  `EaseBounceOut` arasında) his gözle görülür şekilde farklılaşıyor.
- Easing çağrısına verdiğin `c` parametresi toplam **değişim**; bitiş değeri
  değil.
- `odin check games/breakout` geçiyor.

## Elindekiler

`Particle.life`, doğarken `1`'e kuruluyor ve her frame `dt` kadar azalıyor —
başlangıcı `1` olduğu için aynı anda hem kalan ömrü hem kalan oranı taşıyor.
Bu oranı easing'e verip alpha üretecek procedure'ın imzası:

```odin
particle_alpha :: proc(p: Particle) -> f32 {
}
```

`vendor:raylib/easings.odin`'deki bütün easing fonksiyonları aynı imzayı
paylaşır: `t` geçen süre, `b` başlangıç değeri, `c` toplam **değişim** (bitiş
değeri değil), `d` toplam süre.

```odin
EaseQuadOut :: proc(t, b, c, d: f32) -> f32
```

Rengin saydamlığını ayarlayan hazır bir yardımcı da var:

```odin
Fade :: proc(color: Color, alpha: f32) -> Color
```

`rl.Fade(rl.WHITE, 0.3)` orijinal rengi korur, yalnız saydamlığını değiştirir.

## Sınırlar

- Yalnız parçacıkların sönüşünü değiştir; powerup'ın ölçeklenmesi bu dersin
  kapsamı dışında.
- Hangi easing'i seçtiğin serbest; “doğru” tek bir cevap yok, gözle
  karşılaştırıp seç.

::: details İpucu 1 — `t` ve `d`'yi neyden kuruyorsun
`particle_alpha` içinde geçen süreyi (`t`) ve toplam süreyi (`d`) `p.life`'tan
türet: `life` `1`'den `0`'a indiği için `d = 1.0`, `t = d - p.life`. Bunu
`EaseQuadOut(t, 1.0, -1.0, d)` gibi bir çağrıya ver — `b = 1.0` tam görünür
başlangıç, `c = -1.0` tam görünürden tam saydama giden değişim. Sonucu
`rl.Fade` ile bir renge çevirip çizimde kullan.
:::

::: details İpucu 2 — `c`'yi bitiş değeriyle karıştırmak
`c`'ye bitiş değerini (`0.0`) yazmak cazip ama yanlış: `c` toplam **değişim**,
bitiş değeri değil. Tam saydama gitmek istiyorsan `c = 0.0 - b`, yani
`b = 1.0` iken `c = -1.0`. `c`'ye `0.0` yazarsan alpha hiç değişmez, easing
sabit `b` değerinde donar — eğri hiç çalışmıyor gibi görünür.
:::

::: details İpucu 3 — Tam çözüm
```odin
particle_alpha :: proc(p: Particle) -> f32 {
	t := 1.0 - p.life
	return rl.EaseQuadOut(t, 1.0, -1.0, 1.0)
}
```
Çağrı yeri çizim döngüsünde, parçacığı çizdiğin satırda:
```odin
for particle in game.particles {
	if particle.alive {
		color := rl.Fade(rl.WHITE, particle_alpha(particle))
		rl.DrawCircleV(particle.pos, 5, color)
	}
}
```
`rl.DrawCircleV(particle.pos, 5, rl.WHITE)` satırının yerine geçiyor.
:::

## Kaynak

[`vendor:raylib/easings.odin` — kurulu derleyicideki easing procedure'ları](https://pkg.odin-lang.org/vendor/raylib/)
(`RESOURCES.md`). Hepsi `proc(t, b, c, d: f32) -> f32` imzasını paylaşır; bu
dersin tek yeni çağrısı orada, kurulu derleyiciyle doğrulandı.

## Daha derine

Ders bittikten sonra: `Out` ailesi (`EaseQuadOut`, `EaseCubicOut`, ...) hızlı
başlar — değer sürenin ilk diliminde hedefine doğru büyük bir adım atar, kalan
süreyi yavaşlayarak tamamlar. Bu, olayın anında en çok görsel enerjiyi
harcaman anlamına gelir — göz olayı tam o anda fark eder. `In` ailesi tersini
yapar: yavaş başlar, sona doğru hızlanır, bir şeyin birikerek geldiği hissini
verir — ani bir vuruşun geri bildirimi için ters bir sırada bilgi verir.

Easing'in kendisi gizemli değil: `t/d` oranını `0..1`'e indirgeyen, sonra bu
`0..1`'i düz değil eğrisel bir eşlemeden geçiren saf bir fonksiyon. Kendi
eğrini yazmak da mümkün — raylib'in isimli eğrileri yalnızca sık kullanılan,
üzerinde düşünülmüş hazır şekiller.

## Kazanım

Artık oyun hissinin üçüncü katmanı elinde: hitstop zamanı durduruyor, kamera
sarsıntısı ekranı hareket ettiriyor, easing bir değerin zamanla nasıl
değiştiğini biçimlendiriyor.

**“Breakout 3.12 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım kulağa da bir şey söylemek: [3.13 — Ses ve varyasyon](/worlds/03-breakout/13-sound-variation).
