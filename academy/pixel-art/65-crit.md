---
title: "1.65 — Kritik vuruşu ayır"
description: "Normal vuruştan farklı renk, biçim ve süreyle ikinci bir flash kur."
section: Idle oyun · eşya ve monster
---

# {{ $frontmatter.title }}

**Hedef:** İki vuruşu birbirinden ayırarak büyük olanı hissettir.

**Önce şu teknik:** [1.11 — Üç value ile ayır](/pixel-art/11-value) — Kritik, paletteki en açık tonu kullanır.

## Görev

1.64'teki flash'ın yanına ikinci bir flash çiz: siluet `#ffffff` olsun ve çevresine `#e3ab52` renginde kısa uçlar eklensin. Kritik flash normalden bir kare uzun sürsün. `art/fx/crit-flash.aseprite` olarak kaydet.

## Ne zaman bitti?

- Normal ve kritik flash'ta siluet birebir aynı.
- Kritik flash daha açık renkte ve çevresinde uçlar var.
- Kritik flash normalden uzun süreli; kaynak 8×8.

## Bilmen gereken küçük parça

Idle oyunda bütün vuruşlar aynı görünürse hiçbiri önemli olmaz. **Kritik vuruş, oyuncunun beklediği küçük ödüldür** — ve ancak normalden ayrılırsa ödül olur.

Ayrımı üç yönde birden kur. Renk: krem yerine beyaz, yani paletteki en açık ton. Biçim: siluetin çevresine dışa taşan uçlar. Süre: kritik bir kare daha uzun kalır. Tek bir yönde ayırmak yetmez — hızlı akan bir savaşta göz üç işaretten en az birini yakalar.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/crit-1.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Normal vuruşun krem flash'ı." /></div>
    <figcaption><strong>1 · Normal</strong><br />1.64'teki flash. Siluetin tamamı tek krem renkte.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/crit-2.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Beyaz flash ve çevresinde altın uçlar." /></div>
    <figcaption><strong>2 · Kritik</strong><br />Siluet beyaza döndü, çevresine sekiz kısa uç eklendi.</figcaption>
  </figure>
</div>

Kritik sayısını da ayırmayı unutma: 1.68'de süzülen hasar sayısını çizdin, kritik için aynı rakamları altın renkte kullan. Aynı olayı hem flash hem sayı ile işaretlemek, oyuncunun kaçırmasını imkânsız kılar.

## Sınırlar

İki flash ve tek renk farkı. Ekran sarsıntısı, yavaşlatma ve ayrı bir kritik efekti bu göreve girmiyor.

::: details İpucu 1 — İki flash birbirine benziyor
Yalnız rengi değiştirmek yetmez. Uçları ekle ve süreyi uzat; üç ayrım birlikte çalışsın.
:::

::: details İpucu 2 — Uçlar siluete yapışık duruyor
Uçlar canvas'ın kenarında, siluetten bir pixel uzakta olmalı.
:::

::: details İpucu 3 — Tam yerleşim
Uçlar 1. ve 8. satır ile 1. ve 8. sütunun köşelerinde ve orta noktalarında; toplam on iki pixel.
:::

## Birincil kaynak

[Aseprite — Replace Color](https://www.aseprite.org/docs/replace-color/).
`RESOURCES.md` içindeki bu belge, bütün renkleri tek adımda değiştirmeyi açıklar; [Frame Duration](https://www.aseprite.org/docs/frame-duration/) süre farkı içindir. Üç yönlü ayrım bu dersin seçimidir.

**Kazanım:** Büyük vuruş artık küçük vuruştan ayrılıyor.

**“Pixel Art 1.65 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.66 — Slime'ın ölüşünü çiz](/pixel-art/66-slime-death).
