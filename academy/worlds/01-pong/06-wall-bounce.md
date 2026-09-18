---
title: "1.6 — Duvarlardan sek"
description: "Topun dikey hızını sınırda tersine çevir."
section: Oynanış
---

# 1.6 — Duvarlardan sek

**Hedef:** Top üst veya alt sınıra geldiğinde onu sınır içine alıp dikey yönünü tersine çevir.

## Görev

Hareket eden topa üst ve alt duvar collision'ı ekle. Topun görünür alanı
`game.ball.radius` ile `SCREEN_HEIGHT - game.ball.radius` arasındadır. Top
bu sınırlardan birini geçerse önce `game.ball.y`'yi geçerli sınıra düzelt,
sonra `game.ball.velocity_y`'yi o duvardan uzağa yönlendir.

## Ne zaman bitti?

- Top pencerenin üst ve alt kenarından taşmadan sürekli sekebiliyor.
- Sol/sağ hareketi bu değişiklikten etkilenmiyor.
- `odin check games/pong` geçiyor.

## Elindekiler

Yeni alan veya sabit yok; `game.ball.y`, `.radius` ve `.velocity_y` zaten
1.5'ten beri elinde. Yönü tersine çevirirken hızın büyüklüğünü bozmadan
işaretini seçmek gerekiyor — bunun için Odin'in `abs` builtin'i kullanışlı:

```odin
// core:builtin — abs :: proc(value: T) -> T
magnitude := abs(game.ball.velocity_y)
```

`abs` import gerektirmeden her sayısal tipte çalışır; `clamp`, `min`, `max`
ile aynı builtin listesinde.

## Sınırlar

Bu derste yalnızca `game.ball.y` ile `game.ball.velocity_y` değişsin. Topun
hızını artırma, skorlama ekleme veya paddle collision'ına geçme; hedef
duvarın hareket yönüne etkisini izole etmek.

::: details İpucu 1 — Adımlar
Önce topu velocity ve `dt` ile hareket ettir. Üst kenar
`game.ball.y - game.ball.radius`, alt kenar `game.ball.y + game.ball.radius`
olur; bu iki değeri `0` ve `SCREEN_HEIGHT` ile karşılaştır. Üst kenar
sınırın dışına çıktıysa `y`'yi `radius`'a eşitle ve `velocity_y`'yi pozitif
yap; alt kenar çıktıysa `y`'yi `SCREEN_HEIGHT - radius`'a eşitle ve
`velocity_y`'yi negatif yap.
:::

::: details İpucu 2 — Tuzak: yalnız işaret değil, konum da düzelt
Yalnızca `velocity_y`'nin işaretini değiştirip `y`'ye dokunmazsan top
sınırın biraz dışında kalabilir; sonraki frame aynı collision yeniden
tetiklenip hız tekrar tekrar çevrilebilir, top duvara yapışır. Position
correction bu titremeyi önler: `y`'yi her zaman geçerli sınıra taşı,
işareti ayrıca seç.
:::

::: details İpucu 3 — Tam çözüm
```odin
if game.ball.y - game.ball.radius < 0 {
	game.ball.y = game.ball.radius
	game.ball.velocity_y = abs(game.ball.velocity_y)
}
if game.ball.y + game.ball.radius > SCREEN_HEIGHT {
	game.ball.y = SCREEN_HEIGHT - game.ball.radius
	game.ball.velocity_y = -abs(game.ball.velocity_y)
}
```
Bu blok topu velocity ile hareket ettiren satırlardan hemen sonra, render
çağrılarından önce gidiyor.
:::

## Kaynak

[Odin builtin — `abs`](https://pkg.odin-lang.org/base/builtin/#abs).
Velocity'nin magnitude'ını almak için import gerektirmeyen builtin;
`clamp`, `min` ve `max` ile aynı sayfada.

## Kazanım

Position ile velocity'nin ayrı state olduğunu, collision'ın da velocity'yi
değiştirebildiğini kullandın.

**“Pong 1.6 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım: [1.7 — Rakete değdi mi?](/worlds/01-pong/07-paddle-collision).
