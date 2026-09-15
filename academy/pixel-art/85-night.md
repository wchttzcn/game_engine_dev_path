---
title: "1.85 — Aynı sahnenin gece paletini kur"
description: "Tek bir çizimi yeniden çizmeden gece hâline çevir."
section: Idle oyun · dünya
---

# {{ $frontmatter.title }}

**Hedef:** Bir sahnenin saatini renkle değiştir.

**Önce şu teknik:** [1.11 — Üç value ile ayır](/pixel-art/11-value) — Gece, her rengin value ve doygunluğunun düşmesidir.

## Görev

1.82'deki kampı 32×16 yeni bir dosyaya kopyala. Her rengi daha koyu ve daha az doygun bir karşılığıyla değiştir; gökyüzüne birkaç yıldız ve bir ay ekle. `art/world/camp-night.aseprite` olarak kaydet.

## Ne zaman bitti?

- Bütün şekiller gündüz hâliyle birebir aynı; tek bir pixel taşınmamış.
- Her renk koyulaşmış ve doygunluğu düşmüş; gökyüzü en çok değişen alan.
- Yıldızlar ve ay nesnelerin üstüne binmiyor; kaynak 32×16.

## Bilmen gereken küçük parça

Idle oyun saatlerce açık kalır. Aynı sahneye uzun süre bakan oyuncu için **saatin değişmesi** ucuz ama güçlü bir yeniliktir. Ve bunun için yeni bir sahne çizmen gerekmez.

Kural: **şekiller sabit, renkler değişir.** Her rengi koyulaştır ve doygunluğunu düşür — gece, gözün renkleri daha az ayırt ettiği zamandır. En çok gökyüzü değişir, en az zemin. Ay ve birkaç yıldız, koyulaşan gökyüzünde artık boş kalan alanı doldurur ve saati doğrudan söyler.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/camp.svg" width="256" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="1.82'deki gündüz kampı." /></div>
    <figcaption><strong>1 · Gündüz</strong><br />Değiştirmeyeceğin yerleşim. Ağaç, çadır ve zemin yerinde kalacak.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/world/camp-night.svg" width="256" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Aynı kampın gece hâli: koyu gökyüzü, ay ve yıldızlar." /></div>
    <figcaption><strong>2 · Gece</strong><br />Her renk koyulaştı. Gökyüzüne ay ve yıldızlar eklendi; şekiller aynı.</figcaption>
  </figure>
</div>

`Edit > Replace Color` ile her rengi tek tek değiştirmek en hızlı yol. Aynı yöntemle akşam, şafak veya fırtına paleti de çıkarabilirsin; her biri aynı sahnenin yeni bir saatidir. Mağara için de gece paleti gerekmez — mağara zaten karanlıktır, bu da bir bilgidir.

## Sınırlar

Tek sahne ve tek palet. Geçiş animasyonu, ışık kaynağı, gölge yönü ve karakterlerin gece hâli bu göreve girmiyor.

::: details İpucu 1 — Gece hâli yalnız karartılmış gibi duruyor
Doygunluğu da düşür. Yalnız parlaklığı azaltmak sahneyi kirli gösterir.
:::

::: details İpucu 2 — Ay ağacın üstünde kalıyor
Ayı ve yıldızları yalnız boş gökyüzüne koy. Nesnelerin üstüne binerse yerleşim bozulur.
:::

::: details İpucu 3 — Tam yerleşim
Ay 25–28. sütunlarda 2–5. satırlarda. Yıldızlar ağaç ve çadırın dışında kalan boş alanlarda.
:::

## Birincil kaynak

[Aseprite — Replace Color](https://www.aseprite.org/docs/replace-color/).
`RESOURCES.md` içindeki bu belge, bir rengi seçili alanda veya bütün frame'lerde değiştirmeyi açıklar; [Color Bar](https://www.aseprite.org/docs/color-bar/) yeni tonu seçmek içindir. Gece paletinin tonları bu dersin seçimidir.

**Kazanım:** Aynı sahneden ikinci bir saat çıkardın; oyun uzun oturumlarda tekdüze kalmıyor.

**“Pixel Art 1.85 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.86 — Asset'lerini tek sprite sheet'e topla](/pixel-art/86-sprite-sheet).
