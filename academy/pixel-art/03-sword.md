---
title: "1.3 — 8×8 kılıç çiz"
description: "Kılıcın parçalarını farklı genişliklerde kurarak küçük boyutta ayırt edilmesini sağla."
section: Teknik · ilk şekiller
---

# {{ $frontmatter.title }}

**Hedef:** Kılıcın parçalarını farklı genişliklerde kurarak küçük boyutta ayırt edilmesini sağla.

## Görev

8×8 transparent RGB canvas'ta aşağıdaki kılıcı tek renkle çiz. Pencil ve 1 px brush kullan; dosyanı `art/pickups/sword.aseprite` olarak kaydet.

## Ne zaman bitti?

- Sivri uç, gövde, geniş siper ve sap birbirine bağlı.
- Siper gövdeden, gövde saptan geniş; canvas 8×8.
- Çizim tek renk ve kaynak dosyan kaydedilmiş.

## Bilmen gereken küçük parça

Bu kadar küçük bir kılıçta metal dokusu için yer ayırmadan da nesneyi tanıtabiliriz. İnce sap, geniş siper ve sivri uç birbirinden farklı görevler taşır. Aynı genişlikte bir çizgiye dönüşürlerse bu ayrım kaybolur.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/objects/sword-1.svg" width="128" height="128" alt="Kılıcın sivri ucu ve üç pixel genişliğindeki gövdesi." /></div>
    <figcaption><strong>1 · Gövde</strong><br />Üstte tek pixel ile başla. Altındaki üç satırı üçer pixel genişliğinde çiz.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/objects/sword-2.svg" width="128" height="128" alt="Gövdenin altında iki yana uzanan beş pixel genişliğinde siper." /></div>
    <figcaption><strong>2 · Siper</strong><br />Gövdenin altına, iki yana birer pixel taşan beş pixel'lik bir satır ekle.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/objects/sword.svg" width="128" height="128" alt="Siperin altına eklenmiş ince sap ve geniş uç." /></div>
    <figcaption><strong>3 · Sap</strong><br />Siperin orta noktasının altına bir pixel; onun altına üç pixel ekle.</figcaption>
  </figure>
</div>

Örneği aynen yapabilirsin. %100 görünümde parçaların birlikte nasıl okunduğuna bak; sonra `.aseprite` kaynağını kaydet.

## Sınırlar

Tek renk kullanmak, malzeme yerine parçaların oranını çalışmak için. Metal parıltısını renk ve gölge gerektiğinde ekleyeceğiz.

::: details İpucu 1 — Nereden başlamalıyım?
Önce uzun gövdeyi çiz. Elin tuttuğu bölüm daha aşağıda ve daha ince kalacak.
:::

::: details İpucu 2 — Her şey aynı genişlikte görünüyor
Gövdeyi üç, siperi beş, sapı bir pixel genişliğinde düşün. Siperin iki ucu gövdeden dışarı çıkar.
:::

::: details İpucu 3 — Örnek sığmıyor
Sivri uç üst satırda soldan beşinci karede. Üç pixel'lik gövde ikinci, üçüncü ve dördüncü satırda; siper beşinci, sap altıncı, en alttaki üç pixel yedinci satırda.
:::

::: details Deep Dive — 8×8 ölçüde tam ortalama şart mı?
Sekiz çift sayı; tek pixel kalınlığındaki bir çizgi iki orta sütundan birinde durur. Burada sağdaki orta sütunu kullandık. Kabul için canvas'ın geometrik merkezini bulman gerekmiyor; parçaların birbirine bağlanması ve okunması yeterli.
:::

## Birincil kaynak

[Pedro Medeiros — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/).
`RESOURCES.md` içindeki bu kaynak, küçük bir oyun nesnesini görsel adımlarla
kurma yaklaşımını destekler. Buradaki 8×8 örnek ve adımlar ders için özgün hazırlandı.

**Kazanım:** Bir nesnenin kimliğini, birkaç parçanın oranıyla kurdun.

**“Pixel Art 1.3 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.4 — 8×8 kalp çiz](/pixel-art/04-heart).
