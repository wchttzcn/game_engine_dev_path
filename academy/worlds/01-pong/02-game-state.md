---
title: "1.2 — Oyun state'ini kur"
description: "Raket ve top verisini literal çizim çağrılarından ayır."
section: Temel hareket
---

# 1.2 — Oyun state'ini kur

**Hedef:** Ekrana çizdiğin şeylerin verisini, çizim çağrılarından ayrı bir game state olarak tut.

## Görev

`games/pong/main.odin`'de iki raket ve bir topu taşıyan bir `Game` state
kur: `player`, `opponent`, `ball` field'ları. Player 1.1'deki değerlerle
(`x = 40, y = 160, width = 20, height = 100`) solda başlasın; opponent sağda,
top ortada olacak şekilde kendi başlangıç değerlerini seç. Her frame
state'ten okuyarak üçünü de çiz: raketleri `DrawRectangleRec`, topu
`DrawCircleV` ile.

## Ne zaman bitti?

- `Paddle`, `Ball` ve `Game` declaration'ları `main`'in dışında duruyor.
- `main` içinde iki raket ile topu taşıyan tek bir `Game` değeri oluşturuluyor.
- Sabit sayılar yerine state field'larıyla iki raket ve ortadaki top çiziliyor.
- Her raket, kendi field'larından kurulan bir `rl.Rectangle` değişkeniyle
  `DrawRectangleRec` ile çiziliyor.
- `odin check games/pong` geçiyor.

## Elindekiler

`Paddle`, `Ball` ve ikisini taşıyan `Game` (üçü de `main`'in dışında):

```odin
Paddle :: struct {
	x, y, width, height: f32,
}
Ball :: struct {
	x, y, radius: f32,
}
Game :: struct {
	player, opponent: Paddle,
	ball:              Ball,
}
```

Tüm field'lar `f32`; hareket ve collision hesapları baştan sona kesirli
çalışacak. `Ball`'da `x, y` merkez konumu, `radius` yarıçap — bu temsil
sonraki collision derslerinde de aynı kalır.

```odin
// vendor:raylib
// DrawRectangleRec :: proc(rec: Rectangle, color: Color)
// Rectangle :: struct { x, y, width, height: f32 }
// DrawCircleV :: proc(center: Vector2, radius: f32, color: Color)
```

Raketi çizmeden önce kendi field'larından bir `rl.Rectangle` değişkeni kur;
topu `rl.Vector2{game.ball.x, game.ball.y}` ile `DrawCircleV`'e ver.

## Sınırlar

`draw_paddle` helper'ı, array veya genel entity sistemi ekleme; iki nesne
için gerek yok — her raketin rectangle'ını kendi local değişkeninde tut.
Sadece state'i render'a bağla; hareket ve collision sonraki derslerin
konusu.

::: details İpucu 1 — Kurulum sırası
Önce üç struct'ı tanımla, sonra `main` içinde tek bir `Game` literal'i ile
`player`, `opponent`, `ball` field'larını doldur. Sonra çizim bölümünde her
birini kendi field'larından okuyarak çiz: önce iki raketin rectangle'ını kur
ve `DrawRectangleRec` çağır, sonra topu `DrawCircleV` ile çiz.
:::

::: details İpucu 2 — Merkez mi, köşe mi?
`Ball`'un `x, y`'si `Paddle`'ın `x, y`'sinden farklı anlama gelir: raket için
sol üst köşe, top için MERKEZ. `DrawCircleV`'e verdiğin `Vector2` merkezdir;
`DrawRectangle` gibi köşeden ölçmezsin. İkisini karıştırırsan top görsel
olarak kaymış durur, ama compiler bunu yakalamaz.
:::

::: details İpucu 3 — Tam çözüm
```odin
game := Game{
	player   = Paddle{x = 40, y = 160, width = 20, height = 100},
	opponent = Paddle{x = 740, y = 160, width = 20, height = 100},
	ball     = Ball{x = 400, y = 225, radius = 5},
}
```
Çizim bölümünde, `ClearBackground` ile `EndDrawing` arasında:
```odin
player_rect := rl.Rectangle{game.player.x, game.player.y, game.player.width, game.player.height}
opponent_rect := rl.Rectangle{game.opponent.x, game.opponent.y, game.opponent.width, game.opponent.height}
rl.DrawRectangleRec(player_rect, rl.WHITE)
rl.DrawRectangleRec(opponent_rect, rl.WHITE)
rl.DrawCircleV(rl.Vector2{game.ball.x, game.ball.y}, game.ball.radius, rl.WHITE)
```
`game` literal'i `main`'in başında, pencere açıldıktan sonra kuruluyor.
:::

## Kaynak

[Odin Overview — Structs](https://odin-lang.org/docs/overview/#structs).
`struct` declaration'ı ve field literal sözdizimi; bu derste ilk kez
tanımlanan `Paddle`, `Ball`, `Game` buna dayanıyor. `rl.Rectangle` ve
`DrawRectangleRec` imzaları için [Odin vendor:raylib binding
referansı](https://pkg.odin-lang.org/vendor/raylib/#DrawRectangleRec).

## Kazanım

Pong nesnelerinin verisini çizim literal'larından ayırdın; state artık
render'dan bağımsız bir gerçek.

**“Pong 1.2 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım: [1.3 — Oyuncu input'u](/worlds/01-pong/03-player-input).
