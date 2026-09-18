---
title: "1.1 — İlk raketi çiz"
description: "Pong penceresine ilk raketi çiz."
section: Temel hareket
---

# 1.1 — İlk raketi çiz

**Hedef:** Pong raketinin ekrandaki yerini screen coordinates ile belirle.

## Görev

`games/pong/main.odin` dosyasındaki TODO yerine tek bir çizim çağrısı ekle:
beyaz, sol üst köşesi `x = 40, y = 160`, boyutu `width = 20, height = 100`
olan bir dikdörtgen. Çağrı `ClearBackground` ile `EndDrawing` arasında,
TODO'nun olduğu satırda kalsın.

## Ne zaman bitti?

- Çizim döngüsünde, arka plan temizlendikten sonra beyaz raketi çizen bir
  çağrı var.
- Raket görevde verilen konum ve boyutta duruyor.
- `odin check games/pong` geçiyor.

## Elindekiler

Pencerenin sol üst köşesi `(0, 0)`; `x` sağa, `y` aşağı artar, ölçü birimi
pixel — CSS'teki `left`/`top` gibi düşünebilirsin.

```odin
// vendor:raylib — DrawRectangle :: proc(posX, posY, width, height: c.int, color: Color)
rl.DrawRectangle(0, 0, 50, 50, rl.WHITE)
```

İlk iki argüman dikdörtgenin sol üst köşesini, sonraki ikisi o köşeden
itibaren genişlik ve yüksekliği verir. `rl`, dosyada import edilen raylib'in
kısa adı.

## Sınırlar

- Yalnız TODO'daki tek çağrıyı ekle; struct, state veya helper fonksiyon
  kurma — bunlar 1.2'nin konusu.
- Rengi veya boyutu görevdekinden farklı seçme.
- Game loop'un başka satırlarına dokunma.

::: details İpucu 1 — Argümanların sırası
Çağrının argümanları sırasıyla konum (`x`, `y`), sonra boyut (`width`,
`height`), sonra renk gelir. Görevdeki dört sayıyı bu sırayla diz, en sona
`rl.WHITE` ekle.
:::

::: details İpucu 2 — Çağrının yeri
Çağrıyı `ClearBackground`'dan önce koyarsan hemen ardından silinir, ekranda
hiç görünmez. `BeginDrawing`/`EndDrawing` çifti içinde, `ClearBackground`
çağrısından SONRA, TODO'nun bulunduğu satırda dur.
:::

::: details İpucu 3 — Tam çözüm
```odin
rl.BeginDrawing()
rl.ClearBackground(rl.BLACK)
rl.DrawRectangle(40, 160, 20, 100, rl.WHITE)
rl.EndDrawing()
```
Sayılar görevdeki `x`, `y`, `width`, `height` değerleriyle aynı; bu sayılar
1.2'de state'e taşınacak.
:::

## Kaynak

[Odin vendor:raylib binding referansı](https://pkg.odin-lang.org/vendor/raylib/#DrawRectangle).
Odin binding'inin kendi referansı; parametre sırasını ve tiplerini C
dokümanından değil buradan doğrula.

## Daha derine

Her frame `ClearBackground` önceki görüntüyü siler, çağrın hemen ardından
çalışır, `EndDrawing` sonucu ekrana basar — bu yüzden raketi bir kez değil
her frame çiziyoruz. Kalıbın adı game loop: [Game Programming Patterns —
Game Loop](https://gameprogrammingpatterns.com/game-loop.html).

## Kazanım

Kendi çizim kodunla Pong'un ilk raketini ekrana koydun.

**“Pong 1.1 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım: [1.2 — Oyun state'ini kur](/worlds/01-pong/02-game-state).
