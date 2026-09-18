---
title: "1.3 — Oyuncu input'u"
description: "Klavye input'u ile player raketini ekran sınırları içinde hareket ettir."
section: Temel hareket
---

# 1.3 — Oyuncu input'u

**Hedef:** Basılı tuşu her frame okuyup player raketinin `y` state'ini değiştir.

## Görev

W ve S tuşlarıyla sol raketi yukarı/aşağı hareket ettir; raket pencerenin
üstüne veya altına taşmasın. Önce `SCREEN_WIDTH` ve `SCREEN_HEIGHT` sabitlerini
dosya seviyesinde tanımla ve `rl.InitWindow` da bunları kullansın. Input ve
`y` güncellemesi `BeginDrawing`'den önce olsun; çizim yalnız güncel state'i
göstersin.

## Ne zaman bitti?

- W basılıyken player raketi yukarı, S basılıyken aşağı gider.
- `SCREEN_WIDTH` ve `SCREEN_HEIGHT` dosya seviyesinde tanımlı; pencere de bu
  sabitlerle açılıyor.
- Raketin üst kenarı `0`'ın üstüne çıkmaz; alt kenarı `SCREEN_HEIGHT`'i geçmez.
- Rakip ve top sabit kalır.
- `odin check games/pong` geçiyor.

## Elindekiler

Aynı sayıyı iki yerde tutmamak için sabitler; `::` ile untyped kaldıkları için
hem `InitWindow`'ın integer parametresine hem `f32` hesaba dönüşümsüz girerler:

```odin
SCREEN_WIDTH :: 800
SCREEN_HEIGHT :: 450
```

Tuş okuma çağrısı ve kullanımı:

```odin
// vendor:raylib — IsKeyDown :: proc(key: KeyboardKey) -> bool
// Tuş basılı kaldığı HER frame true döner.
if rl.IsKeyDown(.W) {
}
```

Beklenen değer `rl.KeyboardKey` enum'undan gelir. Odin parametrenin tipini
bildiği için enum adını tekrar yazmazsın: `.W` yeter. Uzun hâli
`rl.KeyboardKey.W`; `rl.W` derlenmez.

## Sınırlar

- Yalnız player raketi. Rakip AI, acceleration ve input mapping yok.
- Delta time henüz yok; bu derste frame başına sabit bir miktar kullan.
- İki tuş aynı anda basılıysa iki koşul da çalışabilir; bu şimdilik kabul
  edilebilir.

::: details İpucu 1 — Sıra
Döngünün içinde, `BeginDrawing`'den önce iki ayrı `IsKeyDown` koşulu yaz: biri
`y`'yi azaltsın, diğeri artırsın. Hemen ardından iki sınır kontrolü gelsin —
önce hareket, sonra düzeltme. Çizim bölümü bu ikisinden sonra çalıştığı için
oyuncu hiçbir zaman sınır dışında bir kare görmez.
:::

::: details İpucu 2 — Hangi kenar taşar
Üst sınırda raketin `y`'si yeter, ama alt sınırda raketin **alt** kenarı
taşar: karşılaştırman gereken değer `y + height`. Yalnız `y`'yi
`SCREEN_HEIGHT` ile karşılaştırırsan raket yüksekliği kadar ekranın altına
sarkar ve hata raket boyu değişene kadar görünmez.
:::

::: details İpucu 3 — Tam çözüm
```odin
if rl.IsKeyDown(.W) {
	game.player.y -= 5.0
}
if rl.IsKeyDown(.S) {
	game.player.y += 5.0
}

if game.player.y < 0 {
	game.player.y = 0
}
if game.player.y + game.player.height > SCREEN_HEIGHT {
	game.player.y = SCREEN_HEIGHT - game.player.height
}
```
Bu blok `for !rl.WindowShouldClose()` döngüsünde, `rl.BeginDrawing()`
çağrısından önce durur.
:::

## Kaynak

[Odin vendor:raylib binding referansı](https://pkg.odin-lang.org/vendor/raylib/) —
`#IsKeyDown` anchor'ı. Basılı tutma ile tek atımlık basışın (`IsKeyPressed`)
imzaları orada yan yana; ikisinin farkı ilerideki dash gibi hareketlerde işine
yarayacak.

## Kazanım

Input'un state'i değiştirdiği, render'ın sonucu gösterdiği ilk frame akışını
kurdun. Sınır kontrolünü uzak kenardan yapmak, ileride raket boyu veya hızı
değiştiğinde sessizce bozulmayan tek yoldur.

**“Pong 1.3 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım: [1.4 — Delta time](/worlds/01-pong/04-delta-time).
