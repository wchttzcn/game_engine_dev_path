---
title: "1.8 — Çakışmayı çöz"
description: "Topu raketin dışına al ve yatay yönünü doğru tarafa çevir."
section: Oynanış
---

# 1.8 — Çakışmayı çöz

**Hedef:** Her paddle hit'inden sonra topu çakışmanın dışına taşıyıp doğru yöne gönder.

## Görev

1.7'deki overlap'lerden biri true olduğunda iki response uygula: topu
çarptığı raketin hemen dışına taşı, sonra yatay velocity'sini raketten
uzağa yönlendir — sol paddle sonrası pozitif, sağ paddle sonrası negatif.
Topun radius'unu yeni `x` position'ına katmayı unutma.

## Ne zaman bitti?

- Soldan gelen top sol rakete çarptığında sağa döner.
- Sağdan gelen top sağ rakete çarptığında sola döner.
- Top raketin içinde kalmaz ve frame'ler arasında titreşip tekrar tekrar yön
  değiştirmez.
- `odin check games/pong` geçiyor.

## Elindekiler

Yeni alan yok; sol raketin sağ kenarı `game.player.x + game.player.width`,
sağ raketin sol kenarı `game.opponent.x`'tir. Yatay velocity'nin
büyüklüğünü, 1.6'da tanıdığın `abs` ile koruyabilirsin:

```odin
speed := abs(game.ball.velocity_x)
```

İşareti paddle tarafına göre sen seçiyorsun; büyüklüğü bu satır değiştirmez.

## Sınırlar

Bu response yalnızca yatay yönü belirler ve yandan gelen temas için
doğrudur: top raketin üst veya alt kenarına yukarıdan değerse yatay
düzeltme onu yanlış tarafa iter. Açıya göre sekme, hızlanma ve skor
sonraki küçük problemlerdir.

::: details İpucu 1 — Adımlar
Sol hit'te `game.ball.x`'i sol raketin sağ kenarına `game.ball.radius`
ekleyerek kur; sağ hit'te sağ raketin sol kenarından `game.ball.radius`
çıkararak kur. Sonra `velocity_x`'in büyüklüğünü `abs` ile bul; sol hit
sonrası pozitif, sağ hit sonrası negatif yap. Bu iki adımı overlap true
olan her paddle için ayrı ayrı uygula.
:::

::: details İpucu 2 — Tuzak: sadece işareti çevirmek yetmez
Yalnızca `velocity_x`'in işaretini değiştirirsen top collision frame'inde
raketin içinde kalabilir; sonraki frame detection yeniden çalışır ve hız
tekrar çevrilebilir — top raketin içinde titreşir. Position'ı da düzeltmek
topu geçerli tarafa çıkarır ve bu döngüyü kırar.
:::

::: details İpucu 3 — Tam çözüm
```odin
if rl.CheckCollisionCircleRec(
	rl.Vector2{game.ball.x, game.ball.y},
	game.ball.radius,
	game.opponent.rect,
) {
	game.ball.color = rl.RED
	game.ball.x = game.opponent.x - game.ball.radius
	game.ball.velocity_x = -abs(game.ball.velocity_x)
}
if rl.CheckCollisionCircleRec(
	rl.Vector2{game.ball.x, game.ball.y},
	game.ball.radius,
	game.player.rect,
) {
	game.ball.color = rl.RED
	game.ball.x = game.player.x + game.player.width + game.ball.radius
	game.ball.velocity_x = abs(game.ball.velocity_x)
}
```
Bu, 1.7'deki iki collision bloğunun içine ekleniyor — `color` satırının
yanına `x` ve `velocity_x` satırları giriyor, çağrı yeri değişmiyor.
:::

## Kaynak

[Odin builtin — `abs`](https://pkg.odin-lang.org/base/builtin/#abs).
Bu dersin de temel aracı: hızın büyüklüğünü bozmadan yönünü seçmek yine
`abs`'e dayanıyor, 1.6'daki aynı builtin.

## Daha derine

Ders bittikten sonra: [MDN — 2D collision
detection](https://developer.mozilla.org/en-US/docs/Games/Techniques/2D_collision_detection).
Narrow phase testlerini ve overlap'in neden ayrı bir adımda çözüldüğünü
JavaScript örnekleriyle anlatır; circle-rectangle durumunu kapsamaz, onu
raylib üstlenir. Collision response'un position correction ve yön
kararından oluştuğu fikri Pong ölçeğinde bu kadarıyla yeterli; daha genel
bir physics engine penetrasyonu impulse ve mass ile çözer, burada gereksiz.

## Kazanım

Collision response'un position correction ve yön kararından oluştuğunu
kullandın.

**“Pong 1.8 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım: [1.9 — Rakip kendi kendine hareket
etsin](/worlds/01-pong/09-opponent-ai).
