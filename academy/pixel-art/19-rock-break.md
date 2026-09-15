---
title: "1.19 — Bir nesneyi parçalara ayır"
description: "Çatlak, patlama ve kalan parçalarla bir nesnenin kırılışını çiz."
section: Teknik · hareket
---

# {{ $frontmatter.title }}

**Hedef:** Bir nesnenin yok olmasını, silmek yerine parçalayarak anlat.

## Görev

8×8 RGB dosyada dört frame çiz: sağlam taş, çatlamış taş, iki yana açılan parçalar ve yerde kalan kırıntılar. Gövde için `#6b6b7d`, çatlak ve gölge için `#4a4a5a` kullan. Frame süreleri 400, 90, 70 ve 250 ms olsun. `art/craft/rock-break.aseprite` olarak kaydet.

## Ne zaman bitti?

- Sağlam ve çatlamış frame'lerde dış şekil aynı; yalnız içeride koyu bir çizgi beliriyor.
- Üçüncü frame'de parçalar iki yana ayrılmış ve aralarında boşluk var.
- Son frame'de yalnız birkaç kırıntı kalmış; kaynak 8×8.

## Bilmen gereken küçük parça

1.15'te sandığı açtın: bir nesne **durum değiştirdi**. Kırılmak ise başka bir şey — nesne geri dönmemek üzere **yok olur.**

Sıra üç adımdan oluşur. Önce çatlak: dış şekil hiç değişmez, içeride koyu bir çizgi belirir. Sonra patlama: parçalar birbirinden ayrılır ve aralarında boşluk açılır — **boşluk, kırılmanın kendisidir.** En son kırıntılar. Çatlak karesinin kısa, sağlam karenin uzun olması, kırılmanın ani geldiğini anlatır.

<PixelAnimation title="Taş kırılıyor" :frames='[{"src":"/pixel-art/craft/rock-1.svg","label":"Sağlam","duration":400,"alt":"Taş bütün hâlde duruyor."},{"src":"/pixel-art/craft/rock-2.svg","label":"Çatlak","duration":90,"alt":"Dış şekil aynı; içinde koyu bir çatlak belirdi."},{"src":"/pixel-art/craft/rock-3.svg","label":"Patlama","duration":70,"alt":"Parçalar iki yana ayrıldı; ortada boşluk var."},{"src":"/pixel-art/craft/rock-4.svg","label":"Kırıntı","duration":250,"alt":"Yerde birkaç küçük parça kaldı."}]' />

Aynı dört kademe bir fıçı, bir vazo veya bir kaya için de çalışır. Çatlak karesini atlarsan kırılma sebepsiz görünür; kırıntı karesini atlarsan nesne sihirle yok olmuş gibi durur. Dört kare, bir sebep ve bir sonuç demektir.

## Sınırlar

Tek nesne ve dört kare. Toz bulutu, parçaların yere düşüşü ve ses bu göreve girmiyor.

::: details İpucu 1 — Kırılma yerine küçülme görünüyor
Parçaları merkeze doğru daraltma; iki yana aç. Aradaki boşluk kırılmayı anlatır.
:::

::: details İpucu 2 — Çatlak fark edilmiyor
Çatlak dış hatta değil içeride olmalı ve gövdeden belirgin biçimde koyu olmalı.
:::

::: details İpucu 3 — Tam yerleşim
Gövde 3–7. satırlar. Çatlak 4–6. satırlarda köşegen ilerler. Patlamada sol parça 1–3., sağ parça 7–8. sütunlarda.
:::

## Birincil kaynak

[Aseprite — New Frame](https://www.aseprite.org/docs/new-frame/).
`RESOURCES.md` içindeki bu belge, kopyalanmış frame eklemeyi açıklar; [Frame Duration](https://www.aseprite.org/docs/frame-duration/) süre dağılımı içindir. Kırılmanın kademeleri bu dersin seçimidir.

**Kazanım:** Bir nesnenin yok oluşunu sebebiyle birlikte gösterebiliyorsun.

**“Pixel Art 1.19 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.20 — Tekrarlanabilir zemin tile'ı çiz](/pixel-art/20-tile).
