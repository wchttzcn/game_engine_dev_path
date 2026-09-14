---
title: "1.69 — İkinci para birimini çiz"
description: "Coin'den biçim ve renkle ayrılan bir prestige para birimi kur."
section: Idle oyun · ilerleme
---

# {{ $frontmatter.title }}

**Hedef:** Oyunun ikinci para birimini, birincisiyle karışmayacak biçimde çiz.

**Önce şu teknik:** [1.9 — Silüet testi yap](/pixel-art/09-silhouette-test) — İki para birimi önce silüetle ayrılmalı.

## Görev

8×8 transparent RGB dosyada bir prestige taşı çiz. Gövde için `#9874d3`, parlama için `#c9aef0` kullan. Coin'in yanına koyup ikisinin karışmadığını doğrula. `art/idle-items/gem.aseprite` olarak kaydet.

## Ne zaman bitti?

- Taşın silueti coin'den farklı: yuvarlak değil, köşeli.
- Rengi coin'in altın tonlarıyla aynı aileden değil.
- İkisi yan yana konduğunda hangisinin hangisi olduğu tek bakışta belli; kaynak 8×8.

## Bilmen gereken küçük parça

Idle oyunların hemen hepsi **prestige** denen bir döngü kullanır: oyuncu ilerlemesini gönüllü olarak sıfırlar ve karşılığında kalıcı bir avantaj alır. Bu avantaj neredeyse her zaman **ikinci bir para birimiyle** ölçülür.

İki para biriminin karışmaması hayati. Altın harcanır ve tükenir; prestige parası birikir ve nadirdir. Bu farkı iki yönde kur: **biçim** (coin yuvarlak, taş köşeli) ve **renk** (altın sarısı, taş mor). Yalnız rengi değiştirmek yetmez — küçük ölçüde iki yuvarlak ikon uzaktan aynı görünür.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/gem.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Mor prestige taşı; sol yüzü açık renkle parlıyor." /></div>
    <figcaption><strong>1 · Taş</strong><br />Üstü geniş, altı sivri köşeli bir gövde çiz. Sol yüzü bir ton açık bırak.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/currency-pair.svg" width="204" height="96" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Altın coin ve mor prestige taşı yan yana." /></div>
    <figcaption><strong>2 · Yan yana</strong><br />Coin'in yanına koy. Biçim ve renk aynı anda ayırıyorsa iş tamam.</figcaption>
  </figure>
</div>

Aynı taş ekranda üç yerde görünecek: prestige ekranında kazanılan miktar, mağazada fiyat ve HUD'da sayaç. Üçünde de aynı 8×8 ikon kullanılır. Üçüncü bir para birimi gerekirse aynı kuralı tekrar uygula: yeni biçim, yeni renk ailesi.

## Sınırlar

Tek ikon. Prestige ekranının tamamı, dönüşüm oranı ve sayaç animasyonu bu göreve girmiyor.

::: details İpucu 1 — Taş coin gibi duruyor
Siluet fazla yuvarlak olabilir. Alt ucu tek pixel'e indir; köşeli biten şekiller yuvarlaktan ayrılır.
:::

::: details İpucu 2 — Taş düz görünüyor
Tek bir açık sütun ekle. Bir yüzün diğerinden açık olması hacim hissi verir.
:::

::: details İpucu 3 — Tam yerleşim
Gövde 2–7. satırlar, en geniş yeri 3–4. satırlarda 2–7. sütunlar. Açık sütun 3. sütunda 3–6. satırlarda.
:::

## Birincil kaynak

[Aseprite — Color Bar](https://www.aseprite.org/docs/color-bar/).
`RESOURCES.md` içindeki bu belge, ön plan rengini seçmeyi ve palet kullanımını açıklar. Taşın biçimi ve iki para biriminin ayrımı bu dersin seçimidir.

**Kazanım:** Oyunun ikinci para birimi var ve birincisiyle karışmıyor.

**“Pixel Art 1.69 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.70 — Çarpan rozetini çiz](/pixel-art/70-multiplier).
