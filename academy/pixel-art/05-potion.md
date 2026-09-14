---
title: "1.5 — 8×8 iksir şişesi çiz"
description: "Dar boyun ile geniş gövdeyi ayırarak küçük bir şişe şekli kur."
section: Teknik · ilk şekiller
---

# {{ $frontmatter.title }}

**Hedef:** Dar boyun ile geniş gövdeyi ayırarak küçük bir şişe şekli kur.

## Görev

8×8 transparent RGB canvas'ta örnekteki şişeyi tek renkle çiz. `art/pickups/potion.aseprite` olarak kaydet; sonraki value dersinde aynı çizimle devam edeceğiz.

## Ne zaman bitti?

- Tıpa, dar boyun ve geniş gövde birbirine bağlı.
- Boyun gövdeden dar; şişenin altı tekrar daralıyor.
- Canvas 8×8, tek renk ve kaynak dosyan kaydedilmiş.

## Bilmen gereken küçük parça

Şişenin içindeki sıvıyı veya cam yansımalarını çizmeden önce dış şeklin şişe olarak okunmasına bakıyoruz. Dar boynun altında genişleyen gövde bunu sağlar. Her parçayı aynı genişlikte tutmak bu farkı siler.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/objects/potion-1.svg" width="128" height="128" alt="Dört pixel'lik tıpa ve iki pixel genişliğinde boyun." /></div>
    <figcaption><strong>1 · Tıpa ve boyun</strong><br />Üst satıra ortalanmış dört pixel çiz. Altındaki iki satırda yalnız orta iki pixel'i boya.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/objects/potion-2.svg" width="128" height="128" alt="Boynun altında önce dört, sonra altı pixel genişliğinde gövde." /></div>
    <figcaption><strong>2 · Genişleyen gövde</strong><br />Sonraki satırı dört, onun altını altı pixel genişliğinde çiz. İki tarafı eşit genişlet.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/objects/potion.svg" width="128" height="128" alt="Altı pixel genişliğinde devam eden, altta dörde daralan şişe." /></div>
    <figcaption><strong>3 · Taban</strong><br />Bir satır daha altı pixel çiz; altındaki satırı dörde daralt. Son satırı boş bırak.</figcaption>
  </figure>
</div>

Bu örneğin kopyası yeterli. Çizimini %100 görünümde kontrol et ve kaydet. İç renkleri bir sonraki derste, neyi ayırmak istediğimizi bilerek ekleyeceğiz.

## Sınırlar

Tek renk, tıpa ve boynun yalnız şekille seçilip seçilmediğini görmek için. Cam fiziği, yansıma ve ışık kaynakları bu görevin parçası değil.

::: details İpucu 1 — Şişe bir bloğa benziyor
Önce boynun dar kaldığından emin ol. Gövde ona göre genişlemeli.
:::

::: details İpucu 2 — Geçiş çok keskin
Tıpada dört, boyunda iki, omuzda dört, gövdede altı pixel var. Genişlik değişimi her iki tarafta aynı anda olur.
:::

::: details İpucu 3 — Şekli tamamlayamıyorum
Yukarıdan aşağıya dolu alan genişlikleri 4, 2, 2, 4, 6, 6, 4; her satırı ortala. Sekizinci satır boş.
:::

::: details Deep Dive — Aynı şişe başka bir pickup olabilir mi?
Daha sonra sıvı rengi veya tıpa biçimi değişerek farklı bir oyun anlamı kazanabilir. Bu ders için ikinci bir sürüm gerekmiyor; şimdilik tek okunur şekil yeterli.
:::

## Birincil kaynak

[Pedro Medeiros — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/).
`RESOURCES.md` içindeki bu kaynak, küçük bir oyun nesnesini görsel adımlarla
kurma yaklaşımını destekler. Buradaki 8×8 örnek ve adımlar ders için özgün hazırlandı.

**Kazanım:** Bir başka nesneyi dar ve geniş parçaların ilişkisiyle kurdun.

**“Pixel Art 1.5 denememi değerlendir”** yaz; çizimini inceleyelim.

1.11–1.13 küçük renk çalışmaları isteğe bağlı. Şimdi daha fazla şekil çizmek
istiyorsan [1.6 — 8×8 kalkan çiz](/pixel-art/06-shield) ile devam edebilirsin;
renk dersleri karakter veya animasyon için ön koşul değil.

Sonraki adım (isteğe bağlı renk çalışması): [1.11 — Üç value ile ayır](/pixel-art/11-value).

Sonraki adım: [1.6 — 8×8 kalkan çiz](/pixel-art/06-shield).
