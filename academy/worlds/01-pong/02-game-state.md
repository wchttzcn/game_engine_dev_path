---
title: "1.2 — Oyun state'ini kur"
description: "Raket ve top verisini literal çizim çağrılarından ayır."
---

# 1.2 — Oyun state'ini kur

**Hedef:** Ekrana çizdiğin şeylerin verisini, çizim çağrılarından ayrı bir game state olarak tut.

## Görev

`games/pong/main.odin` içinde iki raket ve bir top için minimal state oluştur.
`Game` adlı bir struct bu iki `Paddle` ile bir `Ball` değerini `player`,
`opponent` ve `ball` field'larında taşısın. Başlangıçta player raketi solda,
ikinci raket sağda, top ortada dursun. Her frame bu state'i kullanarak üçünü de çiz.

`Paddle` için `x`, `y`, `width`, `height`; `Ball` için merkez konumunu taşıyan
`x`, `y` ile `radius` yeterli. Konumları ve radius'u `f32`, paddle boyutlarını
`c.int` tutmak sonraki hareket dersleri için işini kolaylaştırır.
`DrawRectangle` integer istediği için paddle konumunu çizimde `c.int(...)` ile
dönüştürebilirsin; bunun için dosyanın başına `import "core:c"` satırını ekle.
Topu `DrawCircleV` ile çizebilirsin.

## Ne zaman bitti?

- `Paddle`, `Ball` ve `Game` declaration'ları `main`in dışında duruyor.
- `main` içinde iki raket ile topu taşıyan tek bir `Game` değeri oluşturuluyor.
- Önceden doğrudan yazılmış sayılar yerine state field'larıyla iki raket ve
  ortadaki daire top çiziliyor.
- `odin check games/pong` geçiyor.

## Bilmen gereken küçük parça

Şu an `DrawRectangle(40, 160, 20, 100, ...)` hem **ne** çizildiğini hem de o
şeyin verisini taşıyor. Bir raket hareket etmeye başlayınca `y` değeri değişecek;
bu değerin render çağrısında kaybolması, güncelleme işini gereksiz zorlaştırır.

TypeScript'teki bir component state'i gibi düşün: `Game` bir frame'de oyunun
anlık halidir. Render kodu state'i okur; ileride input ve physics aynı state'i
değiştirir. Şimdilik reusable engine API çıkarmıyoruz.

Örnek bir declaration şekli:

```odin
Paddle :: struct {
    x, y:          f32,
    width, height: c.int,
}
```

`rl.DrawCircleV(rl.Vector2{game.ball.x, game.ball.y}, game.ball.radius, rl.WHITE)`
biçimindeki çağrıda `game.ball.x` ve `game.ball.y` dairenin merkezidir. Bu merkez temsili sonraki
duvar ve paddle collision hesaplarında aynı anlamı koruyacak.

## Sınırlar

`draw_paddle` helper'ı, array veya genel entity sistemi ekleme. Bunlar iki nesne
için henüz bir problemi çözmüyor. State ile render çağrısını bağla; hareket ve
collision sonraki derslerin konusu.

::: details İpucu 1 — Başlangıç değerleri
Sol raket için önceki `x = 40`, `y = 160`, `width = 20`, `height = 100`
değerlerini kullan. Sağ raket için `x` değerini pencerenin sağ kenarına yakın
seç; topu da yaklaşık merkeze koy.
:::

::: details İpucu 2 — Field'a erişim
Bir field'ı `game.player.y` gibi okursun. `DrawRectangle` çağrısının ilk iki
argümanında `c.int(game.player.x)` ve `c.int(game.player.y)` kullanabilirsin.
:::

::: details İpucu 3 — Her şeyi render et
`ClearBackground` sonrasında üç çizim çağrısı olmalı: player, rakip ve top.
Raketlerin `width` ve `height` field'larını, topun `radius` field'ını kullan.
:::

::: details Deep Dive — State neden değer olarak duruyor?
Bu küçük oyunda `game` doğrudan `main`in local değeri olabilir. İçindeki player,
opponent ve ball değerlerinin ömrü game loop boyunca sürer; owner `game`dir.
İleride procedure'lar aynı state'e eriştiğinde pointer ve update sırası gerçek
sorulara dönüşecek; şimdiden heap allocation gerekmez.
:::

## Birincil kaynak

[Odin Overview — Structs](https://odin-lang.org/docs/overview/#structs).
`struct` declaration'ı, field sözdizimi ve struct değerlerinin nasıl
oluşturulduğu.

**Kazanım:** Pong nesnelerinin verisini çizim literal'larından ayırdın.
Sonraki adım: [1.3 — Oyuncu input'u](/worlds/01-pong/03-player-input).
