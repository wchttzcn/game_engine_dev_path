---
title: "1.7 — Rakete değdi mi?"
description: "Circle ile rectangle'ın çakışmasını AABB üzerinden tespit et."
---

# 1.7 — Rakete değdi mi?

**Hedef:** Top ile iki raketten biri çakıştığında bunu görünür bir state'e dönüştür.

## Görev

Topun circle collision shape'i ile her iki raketin rectangle'ı arasında overlap
olup olmadığını tespit et. İki sonucu ayrı bool'larda tutabilir veya tek bir
`paddle_hit` sonucu için birleştirebilirsin. Collision varsa topu örneğin
`rl.RED`, yoksa `rl.WHITE` çiz. Bu derste topun velocity'sini değiştirme.

raylib'in `rl.CheckCollisionCircleRec(center, radius, rec)` fonksiyonu circle
ve rectangle için `bool` döndürür. `center` bir `rl.Vector2`, raket ise
`rl.Rectangle` olmalı. Raketin rectangle'ı zaten elinde: 1.2'de
`DrawRectangleRec`'e verdiğin `player_rect` ve `opponent_rect` değerleri
collision testine olduğu gibi gider.

## Ne zaman bitti?

- Top iki raketten birinin üzerinde veya içinden geçerken seçtiğin collision
  rengine dönüyor.
- Renk, top raketten ayrılınca normale dönüyor.
- Top hâlâ raketin içinden geçiyor; bu bu dersin beklenen davranışı.
- `odin check games/pong` geçiyor.

## Bilmen gereken küçük parça

Collision detection yalnızca “iki shape şu anda overlap ediyor mu?” sorusuna
cevap verir. Collision response ise “olduysa state nasıl değişecek?” sorusudur.
Bu ayrım, yanlış detection mı yoksa yanlış response mu olduğunu debugging'de
ayrı görmeni sağlar.

`rl.Rectangle` bir AABB'dir: eksenlere paralel rectangle. Pong raketi dönmediği
için bu temsil yeterli. Topu rectangle gibi yaklaşık almak yerine gerçek circle
shape'i kullandığımızdan köşelerde daha doğru bir temas sınırı elde ederiz.

## Sınır

Bu derste bir `hit` bool'u veya doğrudan renk seçimi yeterli. Skor, ses,
velocity değişikliği ve yeni collision kuralı ekleme; sonraki ders overlap'in
sonucunu ele alacak.

::: details İpucu 1 — Circle center
`rl.Vector2{game.ball.x, game.ball.y}` topun merkezi için gereken shape'tir.
:::

::: details İpucu 2 — Aynı rectangle'ı kullan
Yeni bir rectangle kurma. 1.2'de çizim için oluşturduğun `player_rect` ve
`opponent_rect` değişkenlerini `CheckCollisionCircleRec`'e olduğu gibi ver. Tek
değeri hem çizime hem teste vermek, gördüğün raketle test edilen shape'in
zamanla ayrışmasını engeller.
:::

::: details İpucu 3 — Rengi seç
İki collision bool'unu `||` ile `paddle_hit` sonucunda birleştir. `DrawCircleV`
çağrısına verdiğin color'ı bu sonuca göre `rl.RED` veya `rl.WHITE` seç.
:::

::: details Deep Dive — AABB neyi ifade eder?
Axis-aligned bounding box, dönmeyen bir rectangle'ın sol, üst, genişlik ve
yükseklik bilgisiyle tanımlanan shape'idir. Dönük bir paddle veya eğik bir
duvar olsaydı bu shape gerçek sınırı temsil etmezdi; Pong'un dikdörtgen
paddle'ları için gereksiz karmaşıklık taşımaz.
:::

## Birincil kaynak

[Odin vendor:raylib — `CheckCollisionCircleRec`](https://pkg.odin-lang.org/vendor/raylib/#CheckCollisionCircleRec).
Circle-rectangle testinin gerçek imzası. Detection ile response ayrımının daha
geniş anlatımı için [MDN 2D collision
detection](https://developer.mozilla.org/en-US/docs/Games/Techniques/2D_collision_detection).

**Kazanım:** Detection ile response'u ayırıp collision'ı görünür hale getirdin.
Sonraki adım: [1.8 — Çakışmayı çöz](/worlds/01-pong/08-collision-response).
