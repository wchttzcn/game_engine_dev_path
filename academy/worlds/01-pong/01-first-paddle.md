---
title: "1.1 — İlk raketi çiz"
description: "Pong penceresine ilk raketi çiz."
---

# 1.1 — İlk raketi çiz

**Hedef:** Pong raketinin ekrandaki yerini screen coordinates ile belirle.

## Görev

`games/pong/main.odin` dosyasındaki TODO yerine beyaz bir raket çiz:
`x = 40`, `y = 160`, `width = 20`, `height = 100`.

## Ne zaman bitti?

- Çizim döngüsünde siyah arka planın ardından beyaz raketi çizen bir çağrı var.
- Raket görevde verilen konum ve boyutta duruyor.
- `odin check games/pong` geçiyor.

Programı oynama/debugging için çalıştırabilirsin; ayrıca gözlem raporu gerekmiyor.

## Bilmen gereken küçük parça

Pencerenin sol üst köşesi `(0, 0)`. `x` sağa, `y` aşağı doğru artar;
burada ölçü birimi pixel. CSS'teki `left` ve `top` gibi düşünebilirsin.

Çizim çağrısının biçimi `rl.DrawRectangle(x, y, width, height, rl.WHITE)`.
`rl`, dosyada import edilen raylib'in kısa adı. Çağrını TODO'nun olduğu
yere ekle; hazır kod pencereyi açık tutup her frame yeniden çiziyor.
Bu döngünün ayrıntılarını şimdi ezberlemen gerekmiyor.

Repo kökünde çalıştır:

```sh
odin run games/pong -out:/tmp/mucahit-pong
```

İlk hali boş siyah pencere açar; raketin çizim kodunu sen ekleyeceksin.
Kapatıp kodu değiştirebilir, aynı komutla yeniden çalıştırabilirsin.
Kurulum veya compiler hatası olursa çıktıyı sohbete getir; birlikte çözeriz.

::: details İpucu 1 — Konum mu, boyut mu?
Çağrının ilk iki argümanı konumu, sonraki ikisi boyutu belirler.
Görevdeki değerleri bu sırayla eşleştir.
:::

::: details İpucu 2 — Dikdörtgenin hangi köşesi?
İlk iki argüman dikdörtgenin sol üst köşesini belirler. Sonraki ikisi
o köşeden itibaren ne kadar geniş ve yüksek çizileceğini söyler.
:::

::: details İpucu 3 — Çağrıyı kur
Görevdeki değerleri sırasıyla `x, y, width, height` yerlerine koy;
son argüman `rl.WHITE` kalsın.
:::

::: details Deep Dive — Çizim neden döngünün içinde?
Her frame başında `ClearBackground` önceki görüntüyü temizler.
Raket çağrın bunun ardından çalışır; `EndDrawing` çizilen frame'i sunar.
Bu yüzden raketi yalnızca programın başında bir kez çizmek yerine her frame
çiziyoruz. Şimdilik hazır döngüyü kullanman yeterli.

İstersen [Odin raylib binding'indeki başlangıç örneğine](https://github.com/odin-lang/Odin/blob/master/vendor/raylib/README.md#basic-example)
ve [DrawRectangle referansına](https://pkg.odin-lang.org/vendor/raylib/#DrawRectangle) bakabilirsin.
:::

## Birincil kaynak

[Odin vendor:raylib — `DrawRectangle`](https://pkg.odin-lang.org/vendor/raylib/#DrawRectangle).
Odin binding'inin kendi referansı; parametre sırasını ve tiplerini C
dokümanından değil buradan doğrula.

**Kazanım:** Kendi çizim kodunla Pong'un ilk raketini ekrana koydun.
**“Pong 1.1 denememi değerlendir”** yaz; kodunu inceleyelim.
Sonraki adım: [1.2 — Oyun state'ini kur](/worlds/01-pong/02-game-state).
