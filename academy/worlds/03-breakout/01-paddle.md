---
title: "3.1 — Raketi çiz ve oynat"
description: "games/breakout paketini kur ve ekranın altında A/D ile yatay hareket eden, kenarlardan çıkmayan bir raket çiz."
section: Breakout iskeleti
---

# 3.1 — Raketi çiz ve oynat

**Hedef:** Yeni bir `games/breakout` paketi kur ve ekranın altında `A`/`D` ile
yatay hareket eden, ekrandan çıkmayan bir raket çiz.

## Görev

`games/breakout/main.odin` oluştur. Pencereyi aç, bir `Game` struct'ı içinde
raketin konumunu ve boyutunu tut, `A`/`D` ile `x` ekseninde hareket ettir ve
raketi ekranın içinde tut. Hareket delta time ile hesaplansın.

## Ne zaman bitti?

- Raket ekranın altında görünüyor.
- `A` ve `D` raketi sola ve sağa hareket ettiriyor.
- Raket ekranın sol veya sağ kenarından dışarı çıkamıyor.
- Hız saniye başına pixel cinsinden; FPS değişse de aynı hızda gidiyor.
- `odin check games/breakout` geçiyor.

## Bilmen gereken küçük parça

Bunların hepsini Pong'da yaptın. Değişen tek şey eksen: Pong'un raketi dikeydi,
`y` ekseninde hareket ediyordu ve sınırı ekran yüksekliğiydi. Breakout'un raketi
yatay, `x` ekseninde hareket ediyor ve sınırı ekran genişliği.

Clamp fikri birebir aynı:

```odin
if paddle.rect.x < 0 do paddle.rect.x = 0
if paddle.rect.x + paddle.rect.width > SCREEN_WIDTH {
	paddle.rect.x = SCREEN_WIDTH - paddle.rect.width
}
```

Sağ kenarda `paddle.rect.x`'i değil `paddle.rect.x + paddle.rect.width`'i kontrol ettiğine
dikkat et — raketin sağ ucu ekranı geçmemeli, sol köşesi değil.

Pencere boyutu sende, ama Breakout'ta üstte tuğla duvarı olacağı için Pong'un
`800×450`'sinden daha uzun bir pencere işine yarar; `800×600` iyi bir başlangıç.

## Sınırlar

- Top yok, tuğla yok. Bu ders yalnızca raket.
- `update_game`/`draw_game` gibi proc'lara bölmek zorunda değilsin; Snake'teki
  gibi `main` içinde inline tutabilirsin.

::: details İpucu 1 — Ne tutman gerekiyor
Raketin çizilmesi ve hareket ettirilmesi için gereken en küçük veri: nerede
olduğu, ne kadar büyük olduğu ve ne kadar hızlı gittiği. İlk ikisi tek bir
`rl.Rectangle`'a sığıyor — `x`, `y`, `width`, `height` alanlarını zaten o taşıyor,
yani aynı dört sayıyı struct'ta ikinci kez tutmana gerek yok:

```odin
Paddle :: struct {
	rect:  rl.Rectangle,
	speed: f32,
}
```
:::

::: details İpucu 2 — Delta time
`dt := rl.GetFrameTime()` ve hareket `paddle.rect.x += paddle.speed * dt`.
`speed` saniye başına pixel, yani `400` gibi bir değer. Frame başına sabit
ekleme yaparsan hız FPS'e bağlanır.
:::

::: details İpucu 3 — Input ve çizim
```odin
if rl.IsKeyDown(.A) do game.player.rect.x -= game.player.speed * dt
if rl.IsKeyDown(.D) do game.player.rect.x += game.player.speed * dt
```
`IsKeyDown`, `IsKeyPressed` değil — raket tuş basılı tutuldukça hareket etmeli.
Çizim için `rl.DrawRectangleRec` ve bir `rl.Rectangle`.
:::

## Birincil kaynak

[Odin vendor:raylib — `IsKeyDown`](https://pkg.odin-lang.org/vendor/raylib/#IsKeyDown).
Basılı tutma ile tek basış arasındaki farkın imza tarafı burada; Snake'te
`IsKeyPressed` kullanmıştın çünkü orada yön bir kez seçiliyordu.

**Kazanım:** Üçüncü oyununun iskeleti ayakta ve tanıdık bir problemi yeni bir
eksende çözdün. Buradan sonrası Pong'un tekrarı değil: Breakout'un topu üç
duvardan seker, dördüncüsünden düşer.

**“Breakout 3.1 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım topu sahneye sokmak: [3.2 — Topu hareket ettir](/worlds/03-breakout/02-ball).
