---
title: "1.4 — 8×8 kalp çiz"
description: "İki tarafın dengesini ve üstteki boşluğu kullanarak okunur bir kalp çiz."
section: 8×8 nesneler
---

# {{ $frontmatter.title }}

**Hedef:** İki tarafın dengesini ve üstteki boşluğu kullanarak okunur bir kalp çiz.

## Görev

Yeni bir 8×8 transparent RGB canvas aç. Görsel adımlarla tek renk bir kalp çiz ve `art/pickups/heart.aseprite` olarak kaydet.

## Ne zaman bitti?

- Kalbin iki üst çıkıntısı ve aralarındaki çentik seçiliyor.
- Gövde aşağıya doğru daralıyor; iki taraf aynı genişlikte.
- Canvas 8×8 ve `.aseprite` kaynak kaydedilmiş.

## Bilmen gereken küçük parça

Kalbi yalnız kırmızı olduğu için tanımayız. Üstte iki çıkıntı, arada bir çentik ve aşağıda daralan gövde onu tanıtır. Bu örnekte iki tarafı eşit kurarak bu şekli kolayca görebileceğiz.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/objects/heart-1.svg" width="128" height="128" alt="Üstte iki ayrı çıkıntı, altlarında birleşen geniş satır." /></div>
    <figcaption><strong>1 · İki çıkıntı</strong><br />İkinci satıra ikişer pixel'lik iki parça çiz; aralarında iki boşluk bırak. Bir alt satırda birleştir.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/objects/heart-2.svg" width="128" height="128" alt="Kalbin geniş gövdesi ve iki yandan daralmaya başlayan altı." /></div>
    <figcaption><strong>2 · Gövde</strong><br />Bir tam satır daha boya. Sonraki satırda iki kenardan birer pixel içeri gir.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/objects/heart.svg" width="128" height="128" alt="Aşağıya doğru dört ve iki pixel'e daralan tamamlanmış kalp." /></div>
    <figcaption><strong>3 · Alt uç</strong><br />Sonraki iki satırı dört ve iki pixel genişliğinde ortala. Son satır boş kalır.</figcaption>
  </figure>
</div>

Kopyalamak serbest. Küçük görünümde kalbin üstünü kapatan yanlış bir pixel varsa Eraser ile aç. Çentik, iki çıkıntıyı ayıran boşluk olarak kalmalı.

## Sınırlar

Şimdilik tek renk ve dengeli iki taraf kullan. Simetri burada bir çizim desteği; ilerideki her nesnenin simetrik olması gerekmeyecek.

::: details İpucu 1 — Kalp kutuya benziyor
Üst çentiğe ve alt kısmın daralmasına bak. Bu iki karar şeklin kimliğini taşır.
:::

::: details İpucu 2 — Bir taraf ağır basıyor
Orta iki sütunun iki yanında eşit sayıda pixel bırak. Aşağı inerken her iki kenardan birer pixel eksilt.
:::

::: details İpucu 3 — Satırları yerleştiremiyorum
Üst satır boş. İkinci satırda soldan ikinci–üçüncü ve altıncı–yedinci kareler dolu. Sonraki satırların genişliği sırasıyla 8, 8, 6, 4, 2; en alttaki satır boş.
:::

::: details Deep Dive — Symmetry aracı şimdi gerekli mi?
Aseprite'in symmetry seçenekleri daha büyük çizimlerde tekrar eden işi azaltabilir. Bu küçük örnekte iki tarafı gözle kurmak yeterli; henüz yeni bir araç ayarı öğrenmene gerek yok.
:::

## Birincil kaynak

[Pedro Medeiros — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/).
`RESOURCES.md` içindeki bu kaynak, küçük bir oyun nesnesini görsel adımlarla
kurma yaklaşımını destekler. Buradaki 8×8 örnek ve adımlar ders için özgün hazırlandı.

**Kazanım:** Dolu pixel'ler kadar aradaki boşluğun da nesneyi tanıttığını çizimde kullandın.

**“Pixel Art 1.4 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.5 — 8×8 iksir şişesi çiz](/pixel-art/05-potion).
