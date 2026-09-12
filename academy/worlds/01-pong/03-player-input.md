---
title: "1.3 — Oyuncu input'u"
description: "Klavye input'u ile player raketini ekran sınırları içinde hareket ettir."
section: Temel hareket
---

# 1.3 — Oyuncu input'u

**Hedef:** Basılı tuşu her frame okuyup player raketinin `y` state'ini değiştir.

## Görev

W ve S tuşlarıyla sol raketi yukarı/aşağı hareket ettir. Raket pencerenin üstüne
veya altına taşmamalı.

Sınırı kontrol edebilmek için önce ona bir isim ver: `SCREEN_WIDTH` ve
`SCREEN_HEIGHT` sabitlerini dosya seviyesinde tanımla ve `rl.InitWindow`
çağrısında da bunları kullan; aynı sayıyı iki ayrı yerde tutarsan pencere
boyutunu değiştirdiğin gün sınır kontrolü sessizce yanlış kalır. Bu derste
dikey sınır yeter; `SCREEN_WIDTH` 1.10'da yatay sınır olarak işini görecek.

Input ve `game.player.y` güncellemesini `BeginDrawing`'den önce, game loop'un içinde yap;
render kodu yalnızca güncel game state'ini çizsin. Bu ders için frame başına
sabit bir hareket miktarı kullanabilirsin.

## Ne zaman bitti?

- W basılıyken player raketi yukarı, S basılıyken aşağı gider.
- `SCREEN_WIDTH` ve `SCREEN_HEIGHT` dosya seviyesinde tanımlı; pencere de bu
  sabitlerle açılıyor.
- Raketin üst kenarı `0`'ın üstüne çıkmaz; alt kenarı `SCREEN_HEIGHT`'i geçmez.
- Rakip ve top sabit kalır.
- `odin check games/pong` geçiyor.

## Bilmen gereken küçük parça

`rl.IsKeyDown` tuş basılı kaldığı her frame `true` döner. Beklediği tuş değeri
`rl.KeyboardKey` enum'undan gelir. Odin, parametrenin tipini zaten bildiği için
enum adını tekrar yazmana gerek yok; başına nokta koyup `.W` yazman yeterli:

```odin
if rl.IsKeyDown(.W) {
    game.player.y -= 5.0
}
```

Uzun hali `rl.KeyboardKey.W`; ikisi de aynı değeri verir. `rl.W` biçimi derlenmez.

Bu, React'teki tek seferlik key event'e değil, her frame çalışan bir update'e
benzer. Aynı anda iki tuş basılıysa iki koşul da çalışabilir; bu Pong için kabul
edilebilir bir başlangıç davranışı.

Sınır kontrolünde yalnızca `game.player.y` değil, raketin tamamı önemlidir. Alt
sınır, `game.player.y + game.player.height` değerini `SCREEN_HEIGHT` ile
karşılaştırarak bulunur.

Sabitleri 1.2'de `Paddle` için kullandığın `::` ile yazarsın; untyped
kaldıkları için hem `rl.InitWindow`'ın integer parametresine hem de `f32` raket
hesabına dönüşümsüz girerler:

```odin
SCREEN_WIDTH :: 800
SCREEN_HEIGHT :: 450
```

## Sınırlar

Yalnızca player raketini kontrol et. Rakip AI, acceleration, input mapping ve
delta time henüz gerekli değil. Sınır kontrolünü eklemek, bir sonraki hız
değişikliğinde görünmeyen bir gameplay bug birikmesini önler.

::: details İpucu 1 — Tuş kontrolünün yeri
`for !rl.WindowShouldClose()` bloğunda, `BeginDrawing()`'den önce iki ayrı
`rl.IsKeyDown` koşulu yaz. Böylece çizim güncel state'i görür.
:::

::: details İpucu 2 — Alt kenar
Yukarı hareketten sonra `game.player.y < 0` ise `game.player.y = 0` yap. Aşağı için
`game.player.y + game.player.height > SCREEN_HEIGHT` durumunda `game.player.y`'yi
`SCREEN_HEIGHT - game.player.height` değerine sabitle.
:::

::: details İpucu 3 — Tuş adları
Çağrılar `rl.IsKeyDown(.W)` ve `rl.IsKeyDown(.S)` şeklinde olmalı. W için
`y` azaltılır, S için artırılır.
:::

::: details Deep Dive — Input state neden her frame okunur?
Bir tuşun basılması bir olaydır; basılı kalması ise zamana yayılan state'tir.
Pong'da raketin hareketi ikinci bilgiye ihtiyaç duyar. Daha sonra dash gibi
tek-atımlı hareketlerde `IsKeyPressed`, devam eden yürüyüşte `IsKeyDown`
arasındaki fark oyuncu hissini doğrudan belirleyecek.
:::

## Birincil kaynak

[Odin vendor:raylib — `IsKeyDown`](https://pkg.odin-lang.org/vendor/raylib/#IsKeyDown).
Basılı tutma ile tek atımlık basışın (`IsKeyPressed`) imzalarını yan yana
gördüğün yer. Bu derste tanıtılan `::` sabit tanımı için [Odin Overview —
Constant declarations](https://odin-lang.org/docs/overview/#constant-declarations).

**Kazanım:** Input'un game state'i değiştirdiği, render'ın da sonucu gösterdiği
ilk frame akışını kurdun.

**“Pong 1.3 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım: [1.4 — Delta time](/worlds/01-pong/04-delta-time).
