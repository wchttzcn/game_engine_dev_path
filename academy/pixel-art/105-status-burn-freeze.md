---
title: "1.105 — Yanma, donma ve stun'ı ayır"
description: "Üç durumu, üç farklı rampa ve üç farklı hareket kuralıyla birbirinden ayır."
section: Idle oyun · durum etkileri
---

# {{ $frontmatter.title }}

**Hedef:** Üç durumu yalnız renkle değil, karakterin nasıl davrandığıyla da ayır.

**Önce şu teknik:** [1.12 — Kendi renk rampanı kur](/pixel-art/12-color-ramp) — Her durum karakteri başka bir rampaya taşır.

## Görev

Warrior'ın üç durumunu ikişer kareyle çiz. Yanma: sıcak rampa (`#c8a66b`, `#f2c078`, `#8c6847`) ve başın üstünde yer değiştiren alev uçları. Donma: soğuk rampa (`#9de7f5`, `#cdf4fb`, `#526779`), çevresinde dört buz kırığı ve **iki kare birebir aynı.** Stun: karakter kendi renklerinde, başının üstünde dönen üç yıldız (`#ffe5a3`). `art/fx/status-set.aseprite` olarak altı frame kaydet.

## Ne zaman bitti?

- Üç durumda da siluet birebir aynı; hiçbir pixel eklenmemiş.
- Yanma ve stun'da ikinci kare birinciden farklı, donmada aynı.
- Üç durum yan yana konduğunda hangisinin hangisi olduğu renge bakmadan da anlaşılıyor.
- Alev, buz ve yıldızlar siluetin dışında.

## Bilmen gereken küçük parça

Üç durumu birbirinden ayıran şey yalnız renk değil. Renk hızlıdır ama tek başına kırılgandır; üç ayrı **davranış** ekleyince ayrım sağlamlaşır.

Yanma hareketlidir: alev uçları her karede yer değiştirir, çünkü ateş durmaz. Donma **hareketsizdir**: iki kare birebir aynıdır, çünkü donmanın anlamı tam olarak budur — karakter kımıldamıyor. Stun ise karakteri hiç değiştirmez; onun yerine başının üstünde dönen yıldızlar durur, çünkü stun karakterin rengini değil kontrolünü elinden alır.

<PixelAnimation title="Yanma" :frames='[{"src":"/pixel-art/status/burn-1.svg","label":"Alev sol","duration":140,"alt":"Warrior sıcak rampada; başının üstünde iki alev ucu."},{"src":"/pixel-art/status/burn-2.svg","label":"Alev sağ","duration":140,"alt":"Aynı warrior; alev uçları yer değiştirmiş."}]' />

<PixelAnimation title="Donma" :frames='[{"src":"/pixel-art/status/freeze-1.svg","label":"Donmuş","duration":400,"alt":"Warrior soğuk rampada; çevresinde dört buz kırığı."},{"src":"/pixel-art/status/freeze-2.svg","label":"Hâlâ donmuş","duration":400,"alt":"Birebir aynı kare; hiçbir şey kımıldamıyor."}]' />

<PixelAnimation title="Stun" :frames='[{"src":"/pixel-art/status/stun-1.svg","label":"Yıldızlar solda","duration":160,"alt":"Warrior kendi renklerinde; başının üstünde üç yıldız."},{"src":"/pixel-art/status/stun-2.svg","label":"Yıldızlar sağda","duration":160,"alt":"Aynı warrior; yıldızlar başın çevresinde dönmüş."}]' />

Donmanın iki karesinin aynı olması ilk bakışta hata gibi görünür — bir animasyonda iki aynı kare ne işe yarar? Cevap şu: o karakterin **idle animasyonu da durur.** Donmuş bir karakter nefes almaz. Bu, çizimle değil timeline'la anlatılan bir bilgidir ve etkisi renkten güçlüdür.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/status/effect-row.svg" width="416" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Üç durum yan yana: yanan sıcak rampada, donan soğuk rampada, sersemleyen kendi renklerinde ama yıldızlı." /></div>
    <figcaption><strong>Üçü yan yana</strong><br />İki rampa, bir hareket kuralı. Stun tek başına renk kullanmıyor.</figcaption>
  </figure>
</div>

Stun'ın rengi değiştirmemesi bilinçli bir boşluk. Üç durumun üçü de paleti değiştirseydi üçü birbirine benzerdi; birinin renge hiç dokunmaması, diğer ikisini de daha okunur yapar.

## Sınırlar

Üç durum ve ikişer kare. Aynı anda iki durum, durumun bitiş animasyonu ve zeminde kalan iz bu göreve girmiyor.

::: details İpucu 1 — Yanan ve donan karakter aynı şeye benziyor
Rampalar birbirine yakın value'da olabilir. Sıcak rampa orta ve açık tonlarda, soğuk rampa en açık tonlarda kalsın; ikisinin en koyu rengi de farklı olsun.
:::

::: details İpucu 2 — Donma durgun değil, ölü duruyor
Buz kırıklarını unutmuş olabilirsin. Karakter kımıldamaz ama çevresinde dört sabit işaret durur; o işaretler karakterin durduğunu değil **tutulduğunu** söyler.
:::

::: details İpucu 3 — Tam yerleşim
Yanma: alev uçları 1. satırda 3. ve 5. sütunlar ile 2. satırda 4. sütun; ikinci karede 1. satırda 4. sütun ve 2. satırda 3. ve 6. sütunlar. Donma: buz kırıkları 4. satırda 1. sütun, 5. satırda 8. sütun, 7. satırda 2. sütun, 2. satırda 7. sütun. Stun: yıldızlar 1. satırda 3. ve 6. sütunlar ile 2. satırda 4. sütun; ikinci karede 1. satırda 4. sütun ve 2. satırda 3. ve 6. sütunlar.
:::

## Birincil kaynak

[Aseprite — Linked Cels](https://www.aseprite.org/docs/linked-cels/).
`RESOURCES.md` içindeki bu belge, aynı görüntüyü birden çok frame'in paylaşmasını açıklar; donma karesinin iki kez kullanılması için kullanıldı. Her duruma ayrı bir hareket kuralı verilmesi bu dersin seçimidir.

**Kazanım:** Durumları renkten başka bir şeyle de — hareketin kendisiyle — ayırabiliyorsun.

**“Pixel Art 1.105 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.106 — Buff aurasını ve kalkan kabuğunu çiz](/pixel-art/106-status-layers).
