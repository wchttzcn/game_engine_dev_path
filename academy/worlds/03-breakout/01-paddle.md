---
title: "3.1 — Raketi çiz ve oynat"
description: "games/breakout paketini kur ve ekranın altında A/D ile yatay hareket eden, kenarlardan çıkmayan bir raket çiz."
section: Breakout iskeleti
---

# 3.1 — Raketi çiz ve oynat

**Hedef:** Yeni bir `games/breakout` paketi kur ve ekranın altında `A`/`D` ile
yatay hareket eden, ekrandan çıkmayan bir raket çiz.

## Görev

`games/breakout/main.odin` oluştur, pencereyi aç ve `Game` struct'ında raketin
konumunu tut. `A`/`D` ile `x` ekseninde hareket ettir, hareketi delta time ile
hesapla ve raketi ekranın içinde tut.

## Ne zaman bitti?

- Raket ekranın altında görünüyor.
- `A` ve `D` raketi sola ve sağa hareket ettiriyor.
- Raket ekranın sol veya sağ kenarından dışarı çıkamıyor.
- Hız saniye başına pixel cinsinden; FPS değişse de aynı hızda gidiyor.
- `odin check games/breakout` geçiyor.

## Elindekiler

Pencere açma ve oyun döngüsü Pong'dakiyle aynı: `rl.InitWindow`,
`rl.SetTargetFPS(60)`, `for !rl.WindowShouldClose()` içinde
`rl.BeginDrawing()`/`rl.EndDrawing()`. Yeni olan `Game` ve `Paddle`
struct'ları ile sabitler:

```odin
package main

import rl "vendor:raylib"

SCREEN_WIDTH  :: 800
SCREEN_HEIGHT :: 600
PADDLE_WIDTH  :: 100

Game :: struct {
	player: Paddle,
}

Paddle :: struct {
	rect:  rl.Rectangle,
	speed: f32,
}
```

Çizim için `rl.DrawRectangleRec` ve girdi için `rl.IsKeyDown` — ikisini de
Pong'dan biliyorsun.

## Sınırlar

- Top yok, tuğla yok. Bu ders yalnızca raket.
- `update_game`/`draw_game` gibi proc'lara bölmek zorunda değilsin; Snake'teki
  gibi `main` içinde inline tutabilirsin.

::: details İpucu 1 — Hareket ve sınır
Her frame: `A` basılıysa `x`'ten `speed * dt` çıkar, `D` basılıysa ekle. Sonra
konumu iki sınırla karşılaştır: `x` sıfırın altındaysa sıfırla; raketin sağ ucu
(`x + width`) ekran genişliğini geçtiyse sağa yasla. Önce hareket, sonra sınır
kontrolü.
:::

::: details İpucu 2 — Hangi kenarı kontrol ediyorsun
Sağ kenarda `paddle.rect.x`'i `SCREEN_WIDTH` ile karşılaştırmak cazip ama
yanlış: raketin sol köşesi ekranı geçmeden, genişliği kadar önce durur ve
sağda boş bir şerit kalır. Karşılaştırman gereken raketin sağ ucu, yani
`x + width`.
:::

::: details İpucu 3 — Tam çözüm
```odin
if rl.IsKeyDown(.A) do game.player.rect.x -= game.player.speed * dt
if rl.IsKeyDown(.D) do game.player.rect.x += game.player.speed * dt

if game.player.rect.x < 0 do game.player.rect.x = 0
if game.player.rect.x + game.player.rect.width > SCREEN_WIDTH {
	game.player.rect.x = SCREEN_WIDTH - game.player.rect.width
}
```
Bu kod `for !rl.WindowShouldClose()` döngüsünün içine, çizimden önce giriyor.
`game.player.speed`'i kurulumda `400` gibi bir değere ayarla.
:::

## Kaynak

[Odin vendor:raylib binding referansı](https://pkg.odin-lang.org/vendor/raylib/) —
`#IsKeyDown` anchor'ı. Basılı tutma ile tek basış arasındaki fark burada;
Pong'da aynı çağrıyı dikey eksende kullanmıştın, burada eksen değişiyor.

## Kazanım

Üçüncü oyununun iskeleti ayakta ve tanıdık bir problemi yeni bir eksende
çözdün. Buradan sonrası Pong'un tekrarı değil: Breakout'un topu üç duvardan
seker, dördüncüsünden düşer.

**“Breakout 3.1 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım topu sahneye sokmak: [3.2 — Topu hareket ettir](/worlds/03-breakout/02-ball).
