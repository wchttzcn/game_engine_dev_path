---
title: "1.38 — Priest için koruma kubbesi çiz"
description: "Karakterin etrafında kurulup bir süre kalan, sonra kırılan bir kalkan çiz."
section: Idle oyun · priest
---

# {{ $frontmatter.title }}

**Hedef:** Yerinde duran bir skill'i, taşınan bir skill'den biçimle ayır.

**Önce şu teknik:** [1.17 — Aynı frame'leri üç farklı süreyle dene](/pixel-art/17-timing) — Kalkanın açık kaldığı süre, en uzun frame'dir.

## Görev

8×8 transparent RGB dosyada beş frame'lik koruma kubbesi çiz. Tek renk `#81cfb3` kullan. Frame süreleri 120, 120, 600, 200 ve 250 ms olsun. `art/fx/priest-guard.aseprite` olarak kaydet.

## Ne zaman bitti?

- Kubbe alttan başlayıp yanlardan yukarı kapanıyor.
- Üçüncü frame kapalı bir çember ve en uzun süreye sahip.
- Dördüncü frame'de çember kırılmış, beşinci frame tamamen boş.
- Kaynak 8×8 ve kaydedilmiş.

## Bilmen gereken küçük parça

1.37'deki iyileştirme yukarı doğru yükseliyordu. Koruma ise **hiçbir yere gitmez;** karakterin etrafında durur. Bu fark biçimle anlatılır: yükselen parçacık yerine kapalı bir çember.

Süre de anlatının parçası. Kuruluş ve kırılma kısa, açık kalma uzun. Bir kalkanın işi ekranda bir süre durmaktır; frame süreleri bunu doğrudan söyler.

<PixelAnimation title="Priest — koruma kubbesi" :frames='[{"src":"/pixel-art/fx/priest-guard-1.svg","label":"Kuruluş","duration":120,"alt":"Alttan başlayan kısa bir yay."},{"src":"/pixel-art/fx/priest-guard-2.svg","label":"Yanlar","duration":120,"alt":"Yay iki yandan yukarı doğru uzamış."},{"src":"/pixel-art/fx/priest-guard-3.svg","label":"Açık kalkan","duration":600,"alt":"Kapalı bir çember; en uzun süre burada."},{"src":"/pixel-art/fx/priest-guard-4.svg","label":"Kırılma","duration":200,"alt":"Çemberin yanları kopmuş; yalnız köşe parçaları kalmış."},{"src":"/pixel-art/fx/priest-guard-5.svg","label":"Efekt yok","duration":250,"alt":"Kalkan kaybolmuş; frame tamamen transparent."}]' />

Kubbe 8×8'de karakterden ayrı bir sprite. Oyunda priest'in üstüne çizilir; ikisini aynı canvas'a sığdırmak gerekmiyor. Kalkanın ne kadar dayandığı oyunun kararı olacak, ama görsel üç aşamayı zaten anlatıyor: kuruluyor, duruyor, kırılıyor.

## Sınırlar

Yalnız kalkanın görseli çiziliyor. Hasar emme, süre ve priest'in pozu bu göreve girmiyor.

::: details İpucu 1 — Kalkan yükseliyor gibi duruyor
Parçaları yukarı taşıma. Çember hep aynı merkezde kalmalı; yalnız kapanır ve kırılır.
:::

::: details İpucu 2 — Çember kare görünüyor
Köşelerde birer pixel içeri gir. Dört köşeyi doldurursan kutu olur.
:::

::: details İpucu 3 — Tam yerleşim
Kapalı çemberde üst ve alt yay 3–6. sütunlarda, yanlar 1. ve 8. sütunlarda 3–6. satırlarda, köşeler 2. ve 7. sütunlarda 2. ve 7. satırlarda.
:::

## Birincil kaynak

[Aseprite — Frame Duration](https://www.aseprite.org/docs/frame-duration/).
`RESOURCES.md` içindeki bu belge, her frame'e ayrı süre vermeyi açıklar. Kubbenin biçimi ve süre dağılımı bu dersin özgün seçimidir.

**Kazanım:** Dört karakterin de skill zinciri artık kapalı. Yerinde duran ve taşınan efektleri biçimle ayırabiliyorsun.

**“Pixel Art 1.38 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.39 — 8×8 archer çiz](/pixel-art/39-archer).
