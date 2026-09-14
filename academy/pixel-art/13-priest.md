---
title: "1.13 — 8×8 priest çiz"
description: "Uzun cübbe ve ince asayı birbirinden ayırarak priest çiz."
section: 8×8 karakterler
---

# {{ $frontmatter.title }}

**Hedef:** Karakterin yanında ince bir ekipmanın seçilmesini boşlukla sağla.

## Görev

8×8 transparent RGB canvas'ta priest çiz. Cübbe `#E9DFC2`, yüz ve el `#DCA47A`, asa ve ayaklar `#A97842` olsun. `art/characters/priest.aseprite` olarak kaydet.

## Ne zaman bitti?

- Cübbe aşağıda genişliyor; yandaki asa baştan ayrı seçiliyor.
- Asa ile gövde arasında bazı satırlarda transparent boşluk var; el onları bir noktada birleştiriyor.
- Canvas 8×8, en fazla üç renk ve kaynak dosya kaydedilmiş.

## Bilmen gereken küçük parça

Asa yalnız bir pixel genişliğinde olabilir. Okunmasını sağlayan şey kalınlığı kadar yanındaki boşluktur. Başın sağını doldurmazsak ince dikey şekil ayrı bir ekipman gibi görünür. Açık cübbe ve asa, bu oyunun priest tasarımı için seçtiğimiz işaretler; evrensel karakter kuralları değil.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/characters/priest-1.svg" width="128" height="128" alt="Dar açık renk başlık ve altındaki küçük yüz." /></div>
    <figcaption><strong>1 · Başlığı kur</strong><br />İlk satırı boş bırak. Üç açık pixel'lik başlık çiz; alt satırın ortasını ve onun altındaki üç pixel'i ten rengine boya.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/characters/priest-2.svg" width="128" height="128" alt="Eteği genişleyen açık cübbe ve iki küçük ayak." /></div>
    <figcaption><strong>2 · Uzun cübbe</strong><br />Yüzün altına üç satır gövde çiz. Son gövde satırını beş pixel'e genişlet; iki ayağı en alta koy.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/characters/priest.svg" width="128" height="128" alt="Başın yanında boşlukla ayrılan kıvrık asa; ortada onu tutan tek pixel'lik el." /></div>
    <figcaption><strong>3 · Asa ve el</strong><br />Sağdan ikinci sütunda 2–7. satırlara asa çiz. Tepesinden sağa bir pixel çıkar. Beşinci satırda el ile gövdeye bağla.</figcaption>
  </figure>
</div>

Asayı başlığa yapıştırmadan örneği tamamla. %100 görünümde ince çizgi hâlâ seçiliyorsa kaydet. İyileştirme parıltısını daha sonra ayrı bir 8×8 efekt olarak çizeceğiz.

## Sınırlar

Asa tek pixel genişliğinde; ince bir çizginin çevresindeki boşluğu fark etmek için. Kumaş kıvrımı veya ışık eklemek gerekmiyor.

::: details İpucu 1 — Asa cübbenin parçası gibi
Baş ile asanın arasındaki boş sütunu yeniden aç.
:::

::: details İpucu 2 — Asa havada duruyor
Beşinci satırda gövdenin sağındaki tek ten rengi pixel eldir; asaya temas eder.
:::

::: details İpucu 3 — Asanın yerini bulamıyorum
Asa 7. sütunda, 2. satırdan 7. satıra uzanır. 8. sütunun 2. satırında kıvrım, 6. sütunun 5. satırında el vardır.
:::

## Birincil kaynak

[Pedro Medeiros — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/).
`RESOURCES.md` içindeki bu kaynak, az araç ve küçük nesneyle görerek başlamayı destekler. Buradaki 8×8 çizim ve adımlar bu ders için özgün hazırlandı.

**Kazanım:** Boşluğu koruyarak karakterin ince ekipmanını gövdesinden ayırdın.

**“Pixel Art 1.13 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.14 — 8×8 archer çiz](/pixel-art/14-archer).

