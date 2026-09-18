---
title: "1.7 — Rakete değdi mi?"
description: "Circle ile rectangle'ın çakışmasını AABB üzerinden tespit et."
section: Oynanış
---

# 1.7 — Rakete değdi mi?

**Hedef:** Top ile iki raketten biri çakıştığında bunu görünür bir state'e dönüştür.

## Görev

Topun circle collision shape'i ile her iki raketin rectangle'ı arasında
overlap olup olmadığını tespit et. İki sonucu ayrı bool'larda tutabilir veya
tek bir `paddle_hit` sonucunda birleştirebilirsin. Collision varsa topu
örneğin `rl.RED`, yoksa `rl.WHITE` çiz. Bu derste topun velocity'sini
değiştirme.

## Ne zaman bitti?

- Top iki raketten birinin üzerinde veya içinden geçerken seçtiğin collision
  rengine dönüyor.
- Renk, top raketten ayrılınca normale dönüyor.
- Top hâlâ raketin içinden geçiyor; bu dersin beklenen davranışı.
- `odin check games/pong` geçiyor.

## Elindekiler

raylib'in circle-rectangle testi hazır geliyor:

```odin
// vendor:raylib — CheckCollisionCircleRec :: proc(center: Vector2, radius: f32, rec: Rectangle) -> bool
hit := rl.CheckCollisionCircleRec(center, game.ball.radius, rec)
```

`center` bir `rl.Vector2`, `rec` ise `rl.Rectangle`. Raketlerin rectangle'ı
zaten elinde: 1.2'de `DrawRectangleRec`'e verdiğin `game.player.rect` ve
`game.opponent.rect` değerleri collision testine olduğu gibi gider; yeni bir
rectangle kurmana gerek yok.

## Sınırlar

Bu derste bir `hit` bool'u veya doğrudan renk seçimi yeterli. Skor, ses,
velocity değişikliği ve yeni collision kuralı ekleme; sonraki ders
overlap'in sonucunu ele alacak.

::: details İpucu 1 — Adımlar
Topun merkezini `rl.Vector2{game.ball.x, game.ball.y}` olarak kur.
`CheckCollisionCircleRec`'i bir kez `game.player.rect`, bir kez
`game.opponent.rect` ile çağır; iki sonucu `||` ile `paddle_hit`'te
birleştir veya ayrı ayrı tut. `DrawCircleV`'ye verdiğin rengi bu sonuca göre
`rl.RED` veya `rl.WHITE` seç.
:::

::: details İpucu 2 — Tuzak: hangi rectangle'ı test ediyorsun?
Çizim için kullandığın `game.player.rect` ile collision testine verdiğin
rectangle aynı değer olmalı. Ayrı bir rectangle hesaplarsan (örneğin eski
`x`/`y`'den yeniden kurarsan) ikisi zamanla ayrışabilir: gördüğün raket ile
test edilen shape farklı yerlerde olur, çarpma görünmeden tetiklenir veya
tersi.
:::

::: details İpucu 3 — Tam çözüm
```odin
game.ball.color = rl.WHITE
if rl.CheckCollisionCircleRec(
	rl.Vector2{game.ball.x, game.ball.y},
	game.ball.radius,
	game.opponent.rect,
) {
	game.ball.color = rl.RED
}
if rl.CheckCollisionCircleRec(
	rl.Vector2{game.ball.x, game.ball.y},
	game.ball.radius,
	game.player.rect,
) {
	game.ball.color = rl.RED
}
```
Bu blok topu hareket ettiren satırlardan sonra, render'dan önce gidiyor;
`DrawCircleV` çağrısı zaten `game.ball.color`'ı okuyor, ona dokunmana gerek
yok.
:::

## Kaynak

[Odin vendor:raylib — `CheckCollisionCircleRec`](https://pkg.odin-lang.org/vendor/raylib/#CheckCollisionCircleRec).
Circle-rectangle testinin gerçek imzası; bu dersin tek yeni çağrısı.

## Daha derine

Ders bittikten sonra: [MDN — 2D collision
detection](https://developer.mozilla.org/en-US/docs/Games/Techniques/2D_collision_detection).
Detection ile response ayrımını ve AABB/circle testlerini JavaScript
örnekleriyle anlatır; circle-rectangle durumunu kapsamaz, onu raylib
üstlenir. Axis-aligned bounding box, dönmeyen bir rectangle'ın sol, üst,
genişlik ve yükseklik bilgisiyle tanımlanan shape'idir; Pong'un dikdörtgen
paddle'ları için gereksiz karmaşıklık taşımaz.

## Kazanım

Detection ile response'u ayırıp collision'ı görünür hale getirdin.

**“Pong 1.7 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım: [1.8 — Çakışmayı çöz](/worlds/01-pong/08-collision-response).
