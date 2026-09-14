---
title: "1.10 — 8×8 sandık çiz"
description: "Kapak ile gövdeyi tek bir çizgiyle ayırarak küçük bir sandık çiz."
section: 8×8 nesnelerle devam
---

# {{ $frontmatter.title }}

**Hedef:** Bir iç çizgiyi, sandığın kapak ve gövdesini ayırmak için kullan.

## Görev

8×8 transparent RGB canvas'ta sandığı çiz. Hazır renkleri kullan: ahşap `#B87848`, birleşim çizgisi `#593C35`, kilit `#F2C078`. `art/pickups/chest.aseprite` olarak kaydet.

## Ne zaman bitti?

- Kapak üstte, koyu birleşim çizgisi ortada ve gövde altta seçiliyor.
- Kilit, birleşim çizgisinin ortasında duruyor.
- Canvas 8×8, en fazla üç renk ve kaynak dosya kaydedilmiş.

## Bilmen gereken küçük parça

Şimdi bir dış şeklin içine anlamlı bir ayrım ekliyoruz. Sandığın ortasındaki koyu satır, kapağın nerede bittiğini gösterir. Bu bir shading çalışması değil; renkleri yalnız parçaları ayırmak için kullanıyoruz.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/objects/chest-1.svg" width="128" height="128" alt="Altı pixel genişliğinde ahşap dikdörtgen." /></div>
    <figcaption><strong>1 · Gövdeyi kur</strong><br />İlk iki satırı boş bırak. Sonraki beş satıra ortalanmış altışar ahşap pixel çiz.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/objects/chest-2.svg" width="128" height="128" alt="Yuvarlatılmış kapak ve gövdeyi ayıran yatay koyu satır." /></div>
    <figcaption><strong>2 · Kapağı ayır</strong><br />İkinci satıra dört ahşap pixel ekle. Beşinci satırdaki altı pixel'i koyu renge çevir.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/objects/chest.svg" width="128" height="128" alt="Birleşim çizgisinde ikiye iki pixel'lik kilidi bulunan sandık." /></div>
    <figcaption><strong>3 · Kilidi yerleştir</strong><br />Koyu satırın ortasındaki iki pixel'i ve hemen altlarındaki iki pixel'i altın rengine boya.</figcaption>
  </figure>
</div>

Sandığın yüzeyine ahşap çizgileri eklemek gerekmiyor. %100 görünümde kapak, gövde ve kilit birlikte seçiliyorsa kaydet.

## Sınırlar

Üç hazır renk, yeni palette seçme yükü olmadan iç parçaların ayrımını çalışmak için.

::: details İpucu 1 — Kapak görünmüyor
Gövdenin ortasındaki koyu satır kesintisiz bir ayrım oluşturmalı; kilit bu satırın üzerine oturur.
:::

::: details İpucu 2 — Kilit kenara kaçtı
Sekiz sütunun ortası dördüncü ve beşinci sütundur. Kilidi bu iki sütunda tut.
:::

::: details İpucu 3 — Tam örnek nasıl?
Dolu satır genişlikleri 0, 4, 6, 6, 6, 6, 6, 0. Beşinci satır koyu; kilit beşinci ve altıncı satırın orta iki pixel'ini kaplar.
:::

## Birincil kaynak

[Pedro Medeiros — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/).
`RESOURCES.md` içindeki bu kaynak, az araç ve küçük nesneyle görerek başlamayı destekler. Buradaki 8×8 çizim ve adımlar bu ders için özgün hazırlandı.

**Kazanım:** Bir iç çizgi ve küçük kilitle, düz bir kutuyu sandığa dönüştürdün.

**“Pixel Art 1.10 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.11 — 8×8 mage çiz](/pixel-art/11-mage).

