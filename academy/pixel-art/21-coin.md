---
title: "1.21 — 8×8 coin çiz"
description: "Tek bir iç işaretle idle oyununun coin ikonunu çiz."
section: Idle RPG · Eşya ve monster
---

# {{ $frontmatter.title }}

**Hedef:** Küçük bir yuvarlak şekli içindeki işaretle coin olarak ayırt et.

## Görev

8×8 transparent RGB dosyada coin çiz. Kenar için `#E3AB52`, iç alan için `#9E6537`, işaret için `#FFE5A3` kullan. `art/idle-items/coin.aseprite` olarak kaydet.

## Ne zaman bitti?

- Kenar kapalı, içindeki dikey işaret seçiliyor.
- İç alan transparent bir delik değil; coin dolu bir nesne olarak görünüyor.
- Canvas 8×8 ve kaynak kaydedilmiş.

## Bilmen gereken küçük parça

Idle oyunda para, loot ve satın alma aynı coin işaretini tekrar kullanabilir. İlk ikonumuzda gerçek madeni paranın bütün ayrıntılarını çizmiyoruz. Kenar, iç alan ve tek bir dikey işaret yeterli; renkler hazır.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/coin-1.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="coin-1 — 8×8 ders örneği" /></div>
    <figcaption><strong>1 · Yuvarlak biçim</strong><br />İlk ve son satırı boş bırak. Ortada üstü ve altı daralan altı pixel genişliğinde biçim kur.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/coin-2.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="coin-2 — 8×8 ders örneği" /></div>
    <figcaption><strong>2 · Dolu iç alan</strong><br />Ortadaki dört satırın orta dört pixel'ini koyu renkle doldur. Kenar altın rengi kalsın.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/coin.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="coin — 8×8 ders örneği" /></div>
    <figcaption><strong>3 · Tek işaret</strong><br />Dördüncü sütunda, üçüncü satırdan altıncıya kadar açık renk bir çizgi ekle.</figcaption>
  </figure>
</div>

%100 görünümde iç işaret görünürse kaydet. Ekrandaki para miktarını bu 8×8 ikona yazmak gerekmiyor; sayı oyun UI'ında yanında yer alabilir.

## Sınırlar

Tek işaret, küçük ikonu rastgele ayrıntıyla doldurmadan tanınır hale getirmek için.

::: details İpucu 1 — Ring gibi görünüyor
Ortası transparent kalmamalı. Koyu alan da boyalı pixel'lerden oluşur.
:::

::: details İpucu 2 — İşaret kenara değiyor
Dikey açık çizginin üstünde ve altında altın kenar kalsın.
:::

::: details İpucu 3 — Tam yerleşim
Dolu genişlikler 0, 4, 6, 6, 6, 6, 4, 0. Dört orta satırın orta dördü koyu; 4. sütundaki iç pixel'ler açık.
:::

## Birincil kaynak

[Pedro Medeiros — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/).
`RESOURCES.md` içindeki bu kaynak, küçük bir sprite'ı az araçla görerek kurma yaklaşımı için kullanıldı. Buradaki ikonlar ve adımlar özgün ders örnekleridir.

**Kazanım:** Aynı coin'i loot göstergesinde ve alışveriş UI'ında kullanabileceğin küçük bir işarete dönüştürdün.

**“Pixel Art 1.21 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.22 — 8×8 armor ikonu çiz](/pixel-art/22-armor).
