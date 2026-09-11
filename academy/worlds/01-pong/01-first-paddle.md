---
title: "1.1 — İlk raketi çiz"
description: "Pong penceresine bir raket çiz; x değişince yerinin nasıl değiştiğini gözle."
next: false
---

# 1.1 — İlk raketi çiz

**Hedef:** Pong raketinin ekrandaki yerini screen coordinates ile belirle.

## Görev

`games/pong/main.odin` dosyasındaki TODO yerine beyaz bir raket çiz:
`x = 40`, `y = 160`, `width = 20`, `height = 100`.
Sonra yalnızca `x` değerini `100` yap. Çalıştırmadan önce hangi yöne
gideceğini tahmin et; çalıştırıp sonucu gör.

## Ne zaman bitti?

Siyah pencerenin içinde raketin görünüyor. `x` değişikliğinin etkisini
gördün ve sohbette **“Şunu bekledim, şunu gördüm”** diyebiliyorsun.
Journal veya tablo doldurman gerekmiyor.

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
Raketi başka yere taşımakla onu daha geniş çizmek farklı işlemler.
Değiştirdiğin argüman bunlardan hangisini belirliyor?
:::

::: details İpucu 2 — Dikdörtgenin hangi köşesi?
İlk iki argüman dikdörtgenin sol üst köşesini belirler. Sonraki ikisi
o köşeden itibaren ne kadar geniş ve yüksek çizileceğini söyler.
:::

::: details İpucu 3 — Çağrıyı kur
Görevdeki değerleri sırasıyla `x, y, width, height` yerlerine koy;
son argüman `rl.WHITE` kalsın. İkinci denemede yalnızca ilk argümanı değiştir.
:::

::: details Deep Dive — Çizim neden döngünün içinde?
Her frame başında `ClearBackground` önceki görüntüyü temizler.
Raket çağrın bunun ardından çalışır; `EndDrawing` çizilen frame'i sunar.
Bu yüzden raketi yalnızca programın başında bir kez çizmek yerine her frame
çiziyoruz. Şimdilik hazır döngüyü kullanman yeterli.

İstersen [Odin raylib binding'indeki başlangıç örneğine](https://github.com/odin-lang/Odin/blob/master/vendor/raylib/README.md#basic-example)
ve [DrawRectangle referansına](https://pkg.odin-lang.org/vendor/raylib/#DrawRectangle) bakabilirsin.
:::

**Kazanım:** Kendi çizim kodunla Pong'un ilk raketini ekrana koydun.
**“1.1 denememi değerlendir”** yaz; kodunu ve gözlemini inceleyelim.
Sonraki küçük adım ikinci raket ve top; henüz ayrı ders olarak hazırlanmadı.
