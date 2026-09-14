---
title: "1.48 — Tekrarlanabilir zemin tile'ı çiz"
description: "Yan yana dizildiğinde ek yeri görünmeyen bir zemin parçası üret."
section: Çevre ilerlemesi
---

# {{ $frontmatter.title }}

**Hedef:** Küçük bir kareden, istediğin genişlikte zemin kurabilmeyi öğren.

## Görev

8×8 RGB dosyada zemin tile'ı çiz. Taban için `#557447`, desen için `#3b6149` kullan. `View > Tiled Mode` ile tekrarını kontrol et ve `art/world/ground-tile.aseprite` olarak kaydet.

## Ne zaman bitti?

- Tile yan yana dizildiğinde kare sınırları görünmüyor.
- Desen kenarlara yaslı değil; hiçbir kenar boyunca kesintisiz çizgi yok.
- Kaynak 8×8, tamamı dolu ve kaydedilmiş.

## Bilmen gereken küçük parça

1.28'de kampı tek bir 32×16 dosya olarak çizdin. Oyun büyüdüğünde her zemini elle çizmek mümkün değil. Bunun yerine **küçük bir kareyi tekrarlarsın.**

Ek yerinin görünmemesi tek bir kurala bağlı: kenarlarda göze çarpan bir şey olmamalı. Bir kenar boyunca uzanan açık renk çizgi, tile tekrar ettiğinde ızgaraya dönüşür. Deseni içeriye dağıtmak bu ızgarayı yok eder.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/world/tile.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="8×8 zemin tile'ı; desen içeride dağınık." /></div>
    <figcaption><strong>1 · Tek tile</strong><br />Kareyi tabanla doldur. Desen parçalarını kenarlardan uzak, dağınık yerleştir.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/world/tile-grid.svg" width="240" height="160" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:10px 10px;outline:1px solid #486452" alt="Aynı tile'ın 3×2 dizilmiş hâli; ek yeri görünmüyor." /></div>
    <figcaption><strong>2 · Tekrar</strong><br />Aynı tile altı kez. Kare sınırları görünmüyor; yalnız desen tekrarı fark ediliyor.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/world/tile-seam-grid.svg" width="240" height="160" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:10px 10px;outline:1px solid #486452" alt="Kenarları açık renk olan tile dizildiğinde çıkan ızgara." /></div>
    <figcaption><strong>3 · Karşı örnek</strong><br />Üst satırı ve sol sütunu açık yapılmış tile. Dizilince ızgara ortaya çıkar.</figcaption>
  </figure>
</div>

`View > Tiled Mode` çizerken tekrarı canlı gösterir; bir pixel'i kenara koyduğunda ızgaranın nasıl belirdiğini anında görürsün. Desenin kendisi tekrar edecektir, bu normal. Amaç ek yerini gizlemek; deseni gizlemek değil.

## Sınırlar

Tek bir zemin tile'ı. Kenar tile'ları, köşe parçaları, tilemap düzeni ve seviye kurma bu göreve girmiyor.

::: details İpucu 1 — Dizince ızgara çıkıyor
Kenar satırı veya sütunu boyunca uzanan tek renk şerit var. Onu kaldır.
:::

::: details İpucu 2 — Tekrar çok göze çarpıyor
Desen parçalarını azalt ve dağıt. Düzenli aralıklı desen, dizilince çizgi gibi okunur.
:::

::: details İpucu 3 — Tam yerleşim
Taban bütün kareyi kaplar. Desen çiftleri 2. satırda 3–4. sütunlar, 4. satırda 7–8. sütunlar, 6. satırda 2–3. sütunlar ve 7. satırda 6–7. sütunlarda.
:::

## Birincil kaynak

[Aseprite — Tiled Mode](https://www.aseprite.org/docs/tiled-mode/).
`RESOURCES.md` içindeki bu belge, `View > Tiled Mode` ile deseni tekrarlayarak çizmeyi açıklar. Tile'ın renkleri ve desen dağılımı bu dersin seçimidir.

**Kazanım:** Artık tek bir kareden istediğin genişlikte zemin kurabilirsin.

**“Pixel Art 1.48 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.49 — 32×16 mağara kur](/pixel-art/49-cave).
