---
title: "1.49 — Aynı skill'den üç element çıkar"
description: "Tek bir büyü atışından ateş, buz ve zehir varyantı üret."
section: Idle oyun · skilleri bağla
---

# {{ $frontmatter.title }}

**Hedef:** Bir efektin element varyantını, sıfırdan çizmeden üret.

**Önce şu teknik:** [1.9 — Silüet testi yap](/pixel-art/09-silhouette-test) — Üç element önce biçimle, sonra renkle ayrılır.

## Görev

1.28'deki büyü atışını üç kez çoğalt. Ateş için `#e3ab52`, buz için `#9de7f5`, zehir için `#7dbd72` kullan ve her birinde şeklin uçlarını değiştir. `art/fx/elements.aseprite` olarak kaydet.

## Ne zaman bitti?

- Üç varyantın da merkezi aynı büyüklükte; yalnız uçları ve rengi farklı.
- Ateş dalgalı, buz köşeli, zehir yuvarlak okunuyor.
- Üçü yan yana konduğunda aynı büyünün varyantları gibi duruyor; kaynak 8×8.

## Bilmen gereken küçük parça

Bir idle oyunda skill çeşitlenmesi gerekir ama her element için yeni bir efekt çizmek işi hızla tıkar. Çözüm 1.59'daki tier mantığının aynısı: **ortak gövde, değişen ayrıntı.**

Burada değişen iki şey var. Birincisi renk — herkesin bildiği eşleşme: turuncu ateş, camgöbeği buz, yeşil zehir. İkincisi **uçların biçimi:** ateş dalgalanır, buz köşelenir, zehir yuvarlanıp damlar. Yalnız rengi değiştirirsen üçü aynı büyünün boyanmış hâli gibi durur; biçim de değişince her biri kendi elementi gibi davranır.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/element-fire.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Turuncu, uçları dalgalı büyü." /></div>
    <figcaption><strong>1 · Ateş</strong><br />Uçları düzensiz ve asimetrik. Alev hiçbir zaman simetrik değildir.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/element-ice.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Camgöbeği, köşeli büyü." /></div>
    <figcaption><strong>2 · Buz</strong><br />Uçlar sivri ve simetrik. Kristal düzenlidir.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/element-row.svg" width="256" height="64" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Temel büyü ile üç varyant yan yana." /></div>
    <figcaption><strong>3 · Dördü birlikte</strong><br />Soldan sağa: temel büyü, ateş, buz, zehir. Zehir yuvarlak ve altında damlası var.</figcaption>
  </figure>
</div>

Aynı üç element 1.57'deki durum ikonlarıyla eşleşir: ateş büyüsü yanma durumunu, zehir büyüsü zehir durumunu bırakır. Aynı renkleri iki yerde kullanmak oyuncunun tek bir dil öğrenmesini sağlar.

## Sınırlar

Üç varyant ve tek kare. Her elementin ayrı isabet efekti, hasar türü ve direnç bu göreve girmiyor.

::: details İpucu 1 — Üçü aynı büyünün boyanmışı gibi duruyor
Rengi değiştirmek yetmez. Uçların biçimini de değiştir: dalgalı, köşeli, yuvarlak.
:::

::: details İpucu 2 — Varyantlar birbirine ait görünmüyor
Merkez aynı büyüklükte kalmalı. Ortak gövdeyi bozarsan aile dağılır.
:::

::: details İpucu 3 — Tam yerleşim
Üçünde de merkez 4–5. sütunlar ve 4–5. satırlar. Değişen yalnız 2–7. sütunlardaki uçlar.
:::

## Birincil kaynak

[Aseprite — Replace Color](https://www.aseprite.org/docs/replace-color/).
`RESOURCES.md` içindeki bu belge, bir rengi tek adımda değiştirmeyi açıklar; [Color Bar](https://www.aseprite.org/docs/color-bar/) yeni renk seçimi içindir. Üç elementin biçim farkları bu dersin seçimidir.

**Kazanım:** Bir skill'den üç skill çıkardın ve üçü de aynı oyuna ait görünüyor.

**“Pixel Art 1.49 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.50 — Kadronun tamamına idle ver](/pixel-art/50-hero-idle).
