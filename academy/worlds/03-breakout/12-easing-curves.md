---
title: "3.12 — Eğriler"
description: "Bir değerin A'dan B'ye lineer değil, eğrisel gitmesiyle parçacıkların sönüşüne his kat."
section: Oyun hissi
---

# 3.12 — Eğriler

**Hedef:** Parçacıklarının sönüşünü lineer bir azalma yerine bir easing
eğrisinden geçir.

## Görev

3.7'de kurduğun parçacık havuzunda her parçacığın bir ömrü var. Şu an o ömür
muhtemelen lineer kullanılıyor — kalan süre azaldıkça alpha veya boyut da
düzgün, sabit bir hızla azalıyor. Bu ömür oranını `vendor:raylib/easings.odin`
içindeki bir easing fonksiyonundan geçirip parçacığın solma veya küçülme
hissini değiştir. Aynı süre, aynı başlangıç ve bitiş değerleri — yalnız
aradaki yolun şekli değişsin.

## Ne zaman bitti?

- Parçacıkların sönüşü artık lineer değil; en az bir easing fonksiyonu
  (örneğin `rl.EaseQuadOut` veya `rl.EaseCubicOut`) kullanılıyor.
- Bir easing'i başka biriyle değiştirdiğinde (örnek `EaseLinearNone` ile
  `EaseBounceOut` arasında) his gözle görülür şekilde farklılaşıyor.
- Easing çağrısına verdiğin `c` parametresi toplam **değişim**; bitiş değeri
  değil.
- `odin check games/breakout` geçiyor.

## Bilmen gereken küçük parça

Lineer interpolasyon (`b + (c) * (t/d)`) bir değeri `A`'dan `B`'ye sabit hızla
taşır: yol boyunca hız hiç değişmez. Easing aynı işi yapar ama `t/d` oranını
düz bir doğru yerine bir eğriden geçirerek yeniden haritalar — başta hızlı,
sonda yavaş; ya da tersi; ya da zıplayarak, esneyerek. Aynı süre, aynı iki uç
nokta, tamamen farklı bir his.

`vendor:raylib/easings.odin` içindeki bütün easing fonksiyonları aynı imzayı
paylaşır:

```odin
EaseQuadOut :: proc(t, b, c, d: f32) -> f32
```

- `t` — o ana kadar geçen süre.
- `b` — başlangıç değeri.
- `c` — toplam **değişim** (bitiş değeri değil!).
- `d` — toplam süre.

`c`'nin “toplam değişim” olması en sık yapılan hata. Bir değeri `0`'dan `1`'e
götürmek istiyorsan `b = 0, c = 1` — `c` burada tesadüfen bitiş değeriyle aynı
çünkü başlangıç sıfır. Ama `10`'dan `4`'e gitmek istiyorsan `b = 10, c = -6`:
değişim `4 - 10 = -6`, `c`'ye bitiş değeri olan `4`'ü yazarsan eğri yanlış
yere gider.

Mevcut easing'lerden bazıları: `EaseLinearNone` (eğrisiz, karşılaştırma için),
`EaseSineOut`, `EaseQuadOut`, `EaseCubicOut`, `EaseExpoOut`, `EaseBackOut`,
`EaseElasticOut`, `EaseBounceOut`. Her aile ayrıca `In` (yavaş başlar, hızlı
biter) ve `InOut` (her iki uçta da yavaş) varyantlarına sahip —
`EaseQuadIn`, `EaseQuadInOut` gibi. Hepsi `rl.` ile çağrılır.

Parçacığın alpha'sını değiştirmek istersen `rl.Color` bir `[4]u8` ve doğrudan
alan ataması yapabilirsin, ama hazır bir yardımcı da var:

```odin
Fade :: proc(color: Color, alpha: f32) -> Color
```

`alpha` `0.0` ile `1.0` arasında; `rl.Fade(rl.WHITE, 0.3)` orijinal rengi
korur, yalnız saydamlığını değiştirir.

## Sınırlar

- Yalnız parçacıkların sönüşünü değiştir; powerup'ın ölçeklenmesi bu dersin
  kapsamı dışında — ikisini birden istemek tek dersin tek fikrini bulanıklaştırır.
  İstersen powerup tarafını sonra kendi başına dener.
- Hangi easing'i seçtiğin serbest; “doğru” tek bir cevap yok, gözle
  karşılaştırıp seç.

::: details İpucu 1 — `t` neyin süresi
Parçacığın ömrünü tutan alanın (kalan süre veya geçen süre, 3.7'de nasıl
kurduysan) `t` ve `d` olarak easing'e vermen gerekiyor. `t` sıfırdan `d`'ye
gittiğinde (parçacık yeni doğduğunda `t = 0`, öldüğünde `t = d`) fonksiyon
`b`'den `b + c`'ye gider. Eğer elindeki alan “kalan ömür” ise, easing'e vermeden
önce “geçen ömrü” hesapla — `t = d - kalan_ömür` gibi.
:::

::: details İpucu 2 — Eğriyi alpha'ya bağlamak
```odin
t := elapsed_life(particle) // geçen süre, senin hesabın
alpha := rl.EaseQuadOut(t, 1.0, -1.0, particle.lifetime)
color := rl.Fade(rl.WHITE, alpha)
```
Burada `b = 1.0` (tam görünür başlıyor), `c = -1.0` (tam görünürden tam
saydama, yani `-1` kadar bir değişim). `t` sıfırken `alpha = 1.0`, `t = d`
olduğunda `alpha = 0.0`.
:::

::: details İpucu 3 — Eğriyi değiştirip karşılaştırmak
Aynı satırda `EaseQuadOut`'u `EaseLinearNone` ile değiştirip iki sürümü
yan yana dene:

```odin
alpha := rl.EaseLinearNone(t, 1.0, -1.0, particle.lifetime)
// vs
alpha := rl.EaseExpoOut(t, 1.0, -1.0, particle.lifetime)
```
`EaseLinearNone` sabit hızda söner — gözle takip edilebilir ama düz hissettirir.
`EaseExpoOut` başta neredeyse hiç sönmeyip sona doğru hızla kaybolur; parçacık
daha uzun süre “orada” kalıyormuş gibi hissettirir. İkisini de dene, hangisi
tuğla kırılma anına daha çok yakışıyor sen seç.
:::

::: details Deep Dive — Neden `Out` ailesi vuruş geri bildiriminde daha iyi hissettiriyor, ve easing gerçekte ne
Bir vuruş anında oyuncuya en çok bilgiyi **olayın olduğu an** vermek istersin —
parçacık patladı, powerup düştü, tuğla kırıldı. `Out` ailesi (`EaseQuadOut`,
`EaseCubicOut`, ...) hızlı başlar: değer, sürenin ilk diliminde hedefine doğru
büyük bir adım atar, kalan süreyi yavaşlayarak tamamlar. Bu, olayın anında en
çok görsel enerjiyi harcaman anlamına gelir — göz olayı tam o anda fark eder.
`In` ailesi tam tersini yapar: yavaş başlar, sona doğru hızlanır — bu bir
şeyin **birikerek** geldiği hissi verir (örnek: bir şey yaklaşıyor), ani bir
vuruşun geri bildirimi için ters bir sırada bilgi verir.

Easing'in kendisi aslında hiç gizemli değil: `t/d` oranını alıp `0..1`
aralığına indirgeyen, sonra bu `0..1`'i başka bir `0..1`'e — ama düz değil,
eğrisel — eşleyen saf bir fonksiyon. `EaseQuadOut`'un gövdesi kurulu
derleyicide birkaç satırlık bir matematik ifadesi; `b` ve `c` yalnız sonucu
doğru aralığa taşıyor. Bunun anlamı: kendi eğrini yazmak da mümkün. `t/d`'yi
karesini alıp `1 - (1-x)*(1-x)` gibi bir ifadeden geçirmek de bir easing'dir
— raylib'in sağladığı isimli eğriler yalnızca sık kullanılan, üzerinde
düşünülmüş hazır şekiller.
:::

## Birincil kaynak

`vendor:raylib/easings.odin` — kurulu derleyicideki easing procedure'ları.
Hepsi `proc(t, b, c, d: f32) -> f32` imzasını paylaşır; dosya raylib'in
`easings.h` çevirisi ve kurulu derleyiciyle doğrulandı.

**Kazanım:** Artık oyun hissinin üçüncü katmanı elinde: hitstop zamanı
durduruyor, kamera sarsıntısı ekranı hareket ettiriyor, easing bir değerin
zamanla nasıl değiştiğini biçimlendiriyor. Üçü de aynı prensibi paylaşıyor —
doğru çalışan bir oyunu bozmadan, yalnızca geri bildirimini zenginleştiriyorlar.

**“Breakout 3.12 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım kulağa da bir şey söylemek: [3.13 — Ses ve varyasyon](/worlds/03-breakout/13-sound-variation).
