---
title: "1.24 — Türkçe harfleri ekle"
description: "3×5 gövdeyi koruyup üstüne ve altına işaret ekleyerek Ç, Ğ, İ, Ö, Ş ve Ü'yü kur."
section: Teknik · tekrar eden parçalar
---

# {{ $frontmatter.title }}

**Hedef:** Var olan harf setini bozmadan Türkçe karakterleri ekle.

## Görev

1.23'teki harf setini aç ve altı harf daha ekle: Ç, Ğ, İ, Ö, Ş ve Ü. Gövdeleri C, G, I, O, S ve U ile birebir aynı kalsın; yalnız üstlerine veya altlarına birer işaret gelsin. Kutu 3×7 olsun. `art/idle-ui/letters.aseprite` dosyasına ekle.

## Ne zaman bitti?

- Altı harfin gövdesi karşılık geldiği Latin harfle birebir aynı.
- İşaretler gövdeye değmiyor; üstte veya altta birer satır boşlukta duruyor.
- Ç ve Ş'nin işareti altta, diğerlerininki üstte; kutu 3×7.

## Bilmen gereken küçük parça

Oyununun menüleri Türkçe olacaksa altı harf daha gerekir. İyi haber: **yeni harf çizmiyorsun.** Ç zaten C'dir, Ö zaten O'dur; değişen tek şey bir işaret.

Bunun için kutuyu bir satır yukarı ve bir satır aşağı büyütürsün: 3×5 gövde, üstte bir satır, altta bir satır. Gövdeye dokunmamak önemli — dokunursan aynı yazıda iki farklı C görünür ve göz bunu hemen yakalar. İşaretin gövdeye değmemesi de aynı sebeple: değerse harf başka bir şeye dönüşür.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/letters-tr.svg" width="322" height="98" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:14px 14px;outline:1px solid #486452" alt="Ç, Ğ, İ, Ö, Ş ve Ü harfleri; işaretleri üstte veya altta." /></div>
    <figcaption><strong>1 · Altı harf</strong><br />Ğ'nin üstünde çizgi, İ'nin üstünde nokta, Ö ve Ü'nün üstünde iki nokta, Ç ve Ş'nin altında kuyruk.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/letters-tr-pair.svg" width="370" height="70" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:10px 10px;outline:1px solid #486452" alt="Latin harfler ile Türkçe harfler yan yana." /></div>
    <figcaption><strong>2 · Yan yana</strong><br />Gövdeler aynı; yalnız işaret farklı. Aynı satırda karışmıyorlar.</figcaption>
  </figure>
</div>

Bütün harfleri 3×7 kutuda tutmak satır yüksekliğini bir arada tutar: işaretsiz harfler de aynı kutuda durur, yalnız üst ve alt satırları boş kalır. Böylece bir kelimede harfler zıplamaz. Rakamlar da aynı kutuya girebilir.

## Sınırlar

Yalnız altı harf ve büyük harf. Küçük harfler, noktalama ve değişken genişlik bu göreve girmiyor.

::: details İpucu 1 — İşaret harfe yapışıyor
İşaret ile gövde arasında bir satır boşluk kalmalı. Değerse Ö bir O'ya, Ğ bir G'ye döner.
:::

::: details İpucu 2 — Kelimede harfler zıplıyor
Bütün harfleri 3×7 kutuya al; işaretsiz olanların üst ve alt satırı boş kalsın.
:::

::: details İpucu 3 — Tam yerleşim
Gövde 2–6. satırlarda. Üst işaret 1. satırda, alt işaret 7. satırda ve gövdenin orta sütununda.
:::

## Birincil kaynak

[Aseprite — Drawing](https://www.aseprite.org/docs/drawing/).
`RESOURCES.md` içindeki bu belge, tek pixel aracıyla küçük şekiller kurmayı açıklar. İşaretlerin biçimi ve 3×7 kutu bu dersin seçimidir.

**Kazanım:** Ekranda Türkçe yazabilirsin ve harf setin tutarlı kaldı.

**“Pixel Art 1.24 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.25 — 8×8 mage çiz](/pixel-art/25-mage).
