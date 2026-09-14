---
title: "1.11 — 8×8 mage çiz"
description: "Sivri şapka ve geniş cübbeyle ilk küçük karakterini kur."
section: 8×8 karakterler
---

# {{ $frontmatter.title }}

**Hedef:** Bir karakterin rolünü sivri şapka gibi belirgin bir şekille anlat.

## Görev

8×8 transparent RGB canvas'ta mage çiz. Şapka ve cübbe `#9874D3`, yüz `#F3C68D`, ayaklar `#524565` olsun. `art/characters/mage.aseprite` olarak kaydet.

## Ne zaman bitti?

- Sivri şapka, altındaki yüz ve genişleyen cübbe seçiliyor.
- En altta aralarında boşluk bulunan iki ayak var; en üst satır boş.
- Canvas 8×8, en fazla üç renk ve kaynak dosya kaydedilmiş.

## Bilmen gereken küçük parça

İlk karakterde yüz anatomisi, parmak veya kumaş kıvrımı çalışmıyoruz. Mage'i tanıtan büyük işaret şapkası. Baş, gövde ve ayakları birkaç renk alanıyla kuracağız; şapkanın genişliği yüzü örten bir siper oluşturacak.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/characters/mage-1.svg" width="128" height="128" alt="Bir, üç ve beş pixel genişliğinde sivri mor şapka." /></div>
    <figcaption><strong>1 · Şapkadan başla</strong><br />En üst satırı boş bırak. Altına bir, sonra üç, sonra beş mor pixel çiz; üç satırın merkezi aynı sütunda olsun.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/characters/mage-2.svg" width="128" height="128" alt="Şapkanın altında iki pixel'lik yüz ve üç pixel genişliğinde gövde." /></div>
    <figcaption><strong>2 · Yüz ve gövde</strong><br />Şapkanın altına iki ten rengi pixel koy. Sonraki iki satırda üçer mor pixel'le gövdeyi kur.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/characters/mage.svg" width="128" height="128" alt="Geniş cübbeli ve iki ayrı ayaklı bitmiş mage." /></div>
    <figcaption><strong>3 · Cübbe ve ayak</strong><br />Gövdenin alt satırını iki yandan birer pixel genişlet. En altta iki koyu ayak çiz; arada bir boş pixel bırak.</figcaption>
  </figure>
</div>

Bu şekli aynen kopyalayabilirsin. Üstte bıraktığımız boş satır ileride küçük bir hareket için yer sağlar. Göz veya gölge eklemeden %100 görünümde şapkaya bak ve kaydet.

## Sınırlar

Hazır üç renk ve tek poz, ilk karakterin biçimine odaklanmak için. Renk teorisi derslerini bitirmek ön koşul değil.

::: details İpucu 1 — İnsan gibi görünmüyor
Önce şapka, yüz, gövde ve ayakların üstten alta sırasını kontrol et. Bu ölçüde her parçanın bir işareti yeterli.
:::

::: details İpucu 2 — Şapka tepesi kayık
Şapkanın bir, üç ve beş pixel'lik satırları aynı merkez etrafında genişliyor.
:::

::: details İpucu 3 — Yerleşimi kuramıyorum
Sütunları soldan 1–8 say: tepe 4'te; yüz 3–4'te; gövde 3–5'te; cübbe eteği 2–6'da; ayaklar en altta 3 ve 5'te.
:::

## Birincil kaynak

[Pedro Medeiros — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/).
`RESOURCES.md` içindeki bu kaynak, az araç ve küçük nesneyle görerek başlamayı destekler. Buradaki 8×8 çizim ve adımlar bu ders için özgün hazırlandı.

**Kazanım:** Küçük bir karakteri ayrıntıyla doldurmadan, rolünü taşıyan bir şekille kurdun.

**“Pixel Art 1.11 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.12 — 8×8 warrior çiz](/pixel-art/12-warrior).

