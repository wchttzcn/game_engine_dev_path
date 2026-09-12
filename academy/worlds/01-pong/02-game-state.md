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
`x`, `y` ile `radius` yeterli. Bu field'ların hepsi `f32` olsun: Pong'un hareket
ve collision hesapları baştan sona kesirli çalışacak.

Raketi `DrawRectangleRec` ile çiz. Bu çağrı ayrı ayrı sayılar yerine tek bir
`rl.Rectangle` alır ve o rectangle'ın `x`, `y`, `width`, `height` field'ları da
`f32`'dir. Her raketin rectangle'ını çizimden önce bir değişkende tut; sonraki
collision ve debug derslerinde aynı değeri tekrar kullanacaksın. Topu
`DrawCircleV` ile çizebilirsin.

## Ne zaman bitti?

- `Paddle`, `Ball` ve `Game` declaration'ları `main`in dışında duruyor.
- `main` içinde iki raket ile topu taşıyan tek bir `Game` değeri oluşturuluyor.
- Önceden doğrudan yazılmış sayılar yerine state field'larıyla iki raket ve
  ortadaki daire top çiziliyor.
- Her raket, kendi field'larından kurulan bir `rl.Rectangle` değişkeniyle
  `DrawRectangleRec` üzerinden çiziliyor.
- `odin check games/pong` geçiyor.

## Bilmen gereken küçük parça

Şu an `DrawRectangle(40, 160, 20, 100, ...)` hem **ne** çizildiğini hem de o
şeyin verisini taşıyor. Bir raket hareket etmeye başlayınca `y` değeri değişecek;
bu değerin render çağrısında kaybolması, güncelleme işini gereksiz zorlaştırır.

Veri state'e taşınınca çizim çağrısı da değişir: 1.1'deki `DrawRectangle` dört
ayrı integer isterdi, `DrawRectangleRec` ise raketin tamamını tarif eden tek bir
`f32` rectangle alır. Böylece state ile çizim aynı değeri paylaşır.

TypeScript'teki bir component state'i gibi düşün: `Game` bir frame'de oyunun
anlık halidir. Render kodu state'i okur; ileride input ve physics aynı state'i
değiştirir. Şimdilik reusable engine API çıkarmıyoruz.

Örnek bir declaration şekli:

```odin
Paddle :: struct {
    x, y, width, height: f32,
}
```

Raketin çizimi, aynı field'lardan kurulan bir rectangle ile yapılır:

```odin
player_rect := rl.Rectangle{
    game.player.x,
    game.player.y,
    game.player.width,
    game.player.height,
}
rl.DrawRectangleRec(player_rect, rl.WHITE)
```

`rl.DrawCircleV(rl.Vector2{game.ball.x, game.ball.y}, game.ball.radius, rl.WHITE)`
biçimindeki çağrıda `game.ball.x` ve `game.ball.y` dairenin merkezidir. Bu merkez temsili sonraki
duvar ve paddle collision hesaplarında aynı anlamı koruyacak.

## Sınırlar

`draw_paddle` helper'ı, array veya genel entity sistemi ekleme. Bunlar iki nesne
için henüz bir problemi çözmüyor; her raketin rectangle'ını kendi local
değişkeninde tutmak yeterli. State ile render çağrısını bağla; hareket ve
collision sonraki derslerin konusu.

::: details İpucu 1 — Başlangıç değerleri
Sol raket için önceki `x = 40`, `y = 160`, `width = 20`, `height = 100`
değerlerini kullan. Sağ raket için `x` değerini pencerenin sağ kenarına yakın
seç; topu da yaklaşık merkeze koy.
:::

::: details İpucu 2 — Field'a erişim
Bir field'ı `game.player.y` gibi okursun. `rl.Rectangle{...}` literal'ında
field'ları `x`, `y`, `width`, `height` sırasıyla ver; hepsi zaten `f32` olduğu
için araya dönüşüm girmez.
:::

::: details İpucu 3 — Her şeyi render et
`ClearBackground` sonrasında üç çizim çağrısı olmalı: player, rakip ve top.
`player_rect` ve `opponent_rect` değişkenlerini kur, ikisini `DrawRectangleRec`'e
ver; `DrawCircleV` topun merkezi ile `radius` field'ını kullanır.
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
oluşturulduğu. Bu derste kullanılan `rl.Rectangle` ve `DrawRectangleRec`
imzaları için [Odin vendor:raylib binding
referansı](https://pkg.odin-lang.org/vendor/raylib/#DrawRectangleRec).

**Kazanım:** Pong nesnelerinin verisini çizim literal'larından ayırdın.
Sonraki adım: [1.3 — Oyuncu input'u](/worlds/01-pong/03-player-input).
