---
title: "1.19 — Priest için iyileştirme çiz"
description: "Yukarı yükselen küçük bir parıltıyla iyileştirme etkisi tasarla."
section: 8×8 skill VFX
---

# {{ $frontmatter.title }}

**Hedef:** Bir parıltının yükselip dağılmasıyla sakin bir iyileştirme etkisi kur.

## Görev

8×8 transparent RGB dosyada priest için dört frame'lik iyileştirme parıltısı çiz. Tek renk `#B7EFD0` kullan. `art/fx/priest-heal.aseprite` olarak kaydet.

## Ne zaman bitti?

- Işık altta beliriyor, üstte daha büyük görünüyor, sonra yukarıda iki parçaya ayrılıyor.
- Son frame boş; ışık başlangıca geri düşmüyor.
- Frame süreleri 180, 180, 220, 450 ms; dosya 8×8 ve kaydedilmiş.

## Bilmen gereken küçük parça

Bu skill için yumuşakça yukarı çıkan bir ışık seçiyoruz. Mage'in sağa giden çizgisi yerine, burada yükselen küçük bir artı var. Renk yeşile yakın olsa da anlamı yalnız renk taşımıyor; yön ve daha sakin süreler de farklı bir olay gösteriyor. Bu bir tasarım seçimi, her oyunda iyileştirmenin aynı görünmesi gerekmiyor.

<PixelAnimation title="Priest — iyileştirme parıltısı" :frames='[{"src":"/pixel-art/animation/heal-1.svg","label":"Belirme","duration":180,"alt":"Canvas&#39;ın alt yarısında bir pixel&#39;lik ışık beliriyor."},{"src":"/pixel-art/animation/heal-2.svg","label":"Yükselme","duration":180,"alt":"Işık yükselip beş pixel&#39;lik artı biçiminde parlıyor."},{"src":"/pixel-art/animation/heal-3.svg","label":"Yukarıda sönme","duration":220,"alt":"Canvas&#39;ın üstünde iki ayrı küçük ışık parçacığı sönüyor."},{"src":"/pixel-art/animation/heal-4.svg","label":"Efekt yok","duration":450,"alt":"İyileştirme parıltısı bitmiş; frame tamamen transparent."}]' />

Önizlemeyi durdurup frame'leri sırayla seç: başlangıç altta, büyük şekil ortada, son parçalar üstte. Parıltı kendi 8×8 dosyasında; oyunda iyileştirilen karakterin yanında veya üzerinde gösterilebilir.

1. İlk frame'in alt yarısına tek pixel koy. Sonraki pozu `Frame > New Empty Frame` ile oluştur; daha yukarıda beş pixel'lik artı çiz.
2. Üçüncü frame'de üst satırlarda iki ayrı pixel bırak. Dördüncü frame'i boş tut; ışık sönünce döngü beklesin.
3. Süreleri önizlemedeki gibi ayarla. Oynatıp yükselme yönüne bak ve kaydet. İkinci bir renk eklemek gerekmiyor.

## Sınırlar

Tek renk ve yukarı giden tek parıltı, farklı bir skill'i şekil ve hareketle ayırmayı çalışmak için.

::: details İpucu 1 — Işık geri aşağı zıplıyor
Üstteki parçacıkların ardından boş frame gelmeli. İlk noktaya anında dönme.
:::

::: details İpucu 2 — Artı biçimini kuramıyorum
Bir merkez pixel çiz ve üstüne, altına, sağına, soluna birer pixel ekle.
:::

::: details İpucu 3 — Yerleşimler nasıl?
İlk ışık 4. sütun, 6. satırda. İkinci frame'in artı merkezi 4. sütun, 4. satırda. Üçüncü frame'de 2. satırın 3. ve 5. sütunları dolu.
:::

## Birincil kaynak

[Pedro Medeiros — A Basic Aseprite Animation](https://saint11.art/pixel_art_articles/article3/).
`RESOURCES.md` içindeki bu kaynak, basit hareketi sırayla çizip frame süreleriyle
okunur hale getirmek için kullanıldı. İyileştirme fikri ve dört frame'lik
uyarlama bu dersin tasarımıdır; kaynak bir healing reçetesi sunmaz.

**Kazanım:** Bir skill'in hissini yeni bir palette kurmadan, hareket yönü ve süreyle değiştirdin.

**“Pixel Art 1.19 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.20 — Archer için isabet parıltısı çiz](/pixel-art/20-archer-impact).

