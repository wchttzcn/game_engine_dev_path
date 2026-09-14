---
title: "1.51 — Kenarlığın farkını gör"
description: "Aynı sprite'ı kenarlıklı ve kenarlıksız karşılaştırarak ne zaman gerektiğini seç."
section: Aynı çizimde derinleşme
---

# {{ $frontmatter.title }}

**Hedef:** Bir sprite'ın zeminden ayrılması için kenarlığın ne yaptığını gör.

## Görev

1.11'deki mage'i 8×8 bir dosyaya kopyala ve arkasını `#3b6149` ile doldur. İkinci bir frame'de aynı mage'e `Edit > FX > Outline` ile `#182e33` renginde dış kenarlık ekle. İki frame'i karşılaştır ve `art/craft/outline-test.aseprite` olarak kaydet.

## Ne zaman bitti?

- İki frame'de de mage aynı ve arka alan aynı yeşil.
- İkinci frame'de kenarlık sprite'ın dışında, tek pixel kalınlığında.
- Kenarlık rengi hem mage'den hem zeminden koyu; kaynak 8×8.

## Bilmen gereken küçük parça

Bir sprite'ın zeminden ayrılması her zaman kolay değil. Yeşil zeminde yeşil bir archer, mor zeminde mor bir mage kaybolur. **Kenarlık bu sorunu çözer:** sprite'ın çevresine koyu bir çizgi koyar ve şekli zeminden koparır.

Bedeli de var. 8×8'de bir pixel'lik kenarlık, çizim alanının önemli bir kısmını yer; sprite içeride daralır. Bu yüzden kenarlık bir stil kararı değil, bir okunurluk kararıdır: zeminle karışma riski varsa ekle, yoksa ekleme.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/outline-off.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Yeşil zeminde kenarlıksız mor mage." /></div>
    <figcaption><strong>1 · Kenarlıksız</strong><br />Mage zeminin üstünde duruyor. Ayakların ve cübbenin kenarı zemine karışıyor.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/outline-on.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Aynı mage, dışında koyu kenarlıkla." /></div>
    <figcaption><strong>2 · Kenarlıklı</strong><br />Tek pixel'lik koyu kenarlık şekli zeminden ayırdı. Silüet netleşti.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/outline-pair.svg" width="204" height="96" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="İki hâl aynı zeminde yan yana." /></div>
    <figcaption><strong>3 · Yan yana</strong><br />Aynı zeminde karşılaştır. Fark, uzaktan bakınca daha da belirginleşir.</figcaption>
  </figure>
</div>

`Edit > FX > Outline` penceresinde kenarlığın rengini ve dışa mı içe mi çizileceğini seçebilirsin. İçe çizmek 8×8'de sprite'ı yer; dışa çizmek ise canvas'ta yer ister. Kenarlığı bir kez uygulayıp saklamak, her sprite için tekrar düşünmekten daha hızlıdır.

## Sınırlar

Tek sprite ve tek kenarlık denemesi. Seçmeli kenarlık, renkli kenarlık ve iç gölge bu göreve girmiyor.

::: details İpucu 1 — Kenarlık sprite'ı yiyor
Outline Location'ı Outside yap. Inside seçilirse kenarlık çizimin içinden yer alır.
:::

::: details İpucu 2 — Kenarlık fark yaratmıyor
Zemin sprite'tan zaten çok farklıysa kenarlık gerekmez. Testi yakın değerli bir zeminde yap.
:::

::: details İpucu 3 — Kenarlık canvas dışına taşıyor
Sprite kenara çok yakın. Önce çizimi bir pixel içeri al, sonra kenarlığı uygula.
:::

## Birincil kaynak

[Aseprite — FX](https://www.aseprite.org/docs/fx/).
`RESOURCES.md` içindeki bu belge, `Edit > FX > Outline` ile kenarlık eklemeyi, kenarlık rengini ve Inside/Outside seçeneğini açıklar. Karşılaştırmanın kurulumu bu dersin seçimidir.

**Kazanım:** Kenarlığı alışkanlıktan değil, gerekçeyle kullanabiliyorsun.

**“Pixel Art 1.51 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.52 — Dithering ile geçiş yap](/pixel-art/52-dithering).
