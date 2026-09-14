---
title: "1.53 — Aynı iki frame'i üç süreyle dene"
description: "Tek pixel değiştirmeden, yalnız süreyle üç farklı his üret."
section: Aynı çizimde derinleşme
---

# {{ $frontmatter.title }}

**Hedef:** Bir animasyonun karakterini belirleyen şeyin yalnız çizim olmadığını gör.

## Görev

1.15'teki mage idle'ını aç ve üç kopyasını üret. Birincide her iki frame 90 ms, ikincide 400 ms olsun; üçüncüde ilk frame 600, ikinci frame 150 ms olsun. Üçünü de oynat ve hangisinin nefes alıyor gibi durduğunu not et. `art/craft/timing-test.aseprite` olarak kaydet.

## Ne zaman bitti?

- Üç denemede de çizimler birebir aynı; tek bir pixel değişmemiş.
- Üç farklı süre ayarı kaydedilmiş ve oynatıldığında farklı hissettiriyor.
- Hangi ayarın idle için uygun olduğuna dair bir seçim yapılmış.

## Bilmen gereken küçük parça

Animasyonun yarısı çizim, yarısı süredir. Aynı iki kare saniyede on kez oynarsa titreme, iki kez oynarsa **nefes** olur. Aradaki fark tek bir sayıda.

Eşit süreler mekanik bir his verir; makineler böyle hareket eder. Canlılar ise eşit sürelerle hareket etmez: bir pozda uzun durur, diğerine kısa geçer. Üçüncü denemedeki dengesiz süre bu yüzden en canlı olanıdır.

<PixelAnimation title="Hızlı — 90 ms" :frames='[{"src":"/pixel-art/animation/idle-1.svg","label":"Dinlenme","duration":90,"alt":"Mage dik duruyor."},{"src":"/pixel-art/animation/idle-2.svg","label":"Alçalma","duration":90,"alt":"Mage bir pixel alçalmış."}]' />

<PixelAnimation title="Orta — 400 ms" :frames='[{"src":"/pixel-art/animation/idle-1.svg","label":"Dinlenme","duration":400,"alt":"Mage dik duruyor."},{"src":"/pixel-art/animation/idle-2.svg","label":"Alçalma","duration":400,"alt":"Mage bir pixel alçalmış."}]' />

<PixelAnimation title="Dengesiz — 600 ve 150 ms" :frames='[{"src":"/pixel-art/animation/idle-1.svg","label":"Uzun duruş","duration":600,"alt":"Mage dik duruyor ve uzun süre kalıyor."},{"src":"/pixel-art/animation/idle-2.svg","label":"Kısa alçalma","duration":150,"alt":"Mage kısa bir an alçalıp geri dönüyor."}]' />

Üç örnek de aynı iki dosyayı kullanıyor. Frame süresini `Frame > Frame Properties` ile veya timeline'da frame'e çift tıklayarak değiştirebilirsin. Bundan sonra bir animasyon yavan geldiğinde ilk bakacağın yer çizim değil, süreler olsun.

## Sınırlar

Yalnız süre denemesi. Yeni frame eklemek, çizim düzeltmek ve easing bu göreve girmiyor.

::: details İpucu 1 — Üç deneme de aynı geliyor
Süre farkları yeterince büyük değil. 90 ile 400 arasındaki fark dört kattan fazla olmalı.
:::

::: details İpucu 2 — Hızlı olan titriyor
Bu beklenen sonuç. Titreme bir hata değil; idle için yanlış olduğunu gösteren bir bilgi.
:::

::: details İpucu 3 — Hangisini seçeceğimi bilmiyorum
Karakterin ne yaptığına bak: bekliyorsa yavaş ve dengesiz, koşuyorsa hızlı ve eşit.
:::

## Birincil kaynak

[Aseprite — Frame Duration](https://www.aseprite.org/docs/frame-duration/).
`RESOURCES.md` içindeki bu belge, her frame'e ayrı süre vermeyi açıklar; [Animation](https://www.aseprite.org/docs/animation/) playback içindir. Üç süre ayarı ve karşılaştırma bu dersin kurgusudur.

**Kazanım:** Bir animasyonu çizimi değiştirmeden düzeltebileceğini biliyorsun.

**“Pixel Art 1.53 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.54 — Üç frame ile vuruşa ağırlık ver](/pixel-art/54-anticipation).
