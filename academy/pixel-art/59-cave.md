---
title: "1.59 — 32×16 mağara kur"
description: "Kampla aynı kalıptan, farklı paletle ikinci bir bölge çıkar."
section: Idle oyun · dünya
---

# {{ $frontmatter.title }}

**Hedef:** Bir bölge kalıbını başka bir yere taşıyarak yeni bir mekân kur.

**Önce şu teknik:** [1.14 — Dithering ile geçiş yap](/pixel-art/14-dithering) — Zemin ile duvar arasındaki geçiş dama deseniyle yumuşatılabilir.

## Görev

32×16 RGB dosyada mağara çiz. Arka alan `#26262f`, kaya `#6b6b7d`, mağara ağzı `#12121a`, zemin `#4a4a5a` olsun. `art/world/cave.aseprite` olarak kaydet.

## Ne zaman bitti?

- Alt dört satır zemin; bütün nesneler ona oturuyor veya tavandan sarkıyor.
- Solda yerden yükselen, üstte tavandan sarkan şekiller var; sağda mağara ağzı duruyor.
- Kaynak 32×16 ve kaydedilmiş.

## Bilmen gereken küçük parça

1.58'deki kampın kalıbı şuydu: bir zemin, iki büyük şekil, aralarında boşluk. O kalıp kampa özel değil — **bölge değişir, kalıp kalır.**

Mağarayı ayıran iki şey var. Birincisi palet: yeşil ve kahve yerine gri ve mor. İkincisi yön: kampta her şey yerden yükseliyordu, mağarada tavandan da sarkan parçalar var. Aynı düzeni farklı renkle tekrarlamak, bölgelerin aynı oyuna ait olduğunu hissettirir.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/world/cave-ground.svg" width="256" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Yalnız koyu arka alan ve taş zemin." /></div>
    <figcaption><strong>1 · Zemin</strong><br />Canvas'ı koyu kaya rengiyle doldur. Alt dört satırı zemin rengi yap.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/world/cave.svg" width="256" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Sarkıtlar, stalagmit ve mağara ağzıyla tamamlanmış mağara." /></div>
    <figcaption><strong>2 · Şekiller</strong><br />Üst köşelere sarkıtlar, sola yerden yükselen bir kaya, sağa mağara ağzı koy.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/camp.svg" width="256" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="1.58'deki yeşil kamp alanı." /></div>
    <figcaption><strong>3 · Karşılaştırma</strong><br />Aynı kalıp: zemin, iki büyük şekil ve aralarında boşluk. Değişen yalnız palet ve yön.</figcaption>
  </figure>
</div>

Mağara ağzının içini zeminden de koyu tutmak derinlik hissi verir; göz en koyu alanı en uzak yer olarak okur. Aynı yöntemle orman, çöl veya kar bölgesi de çıkarabilirsin: kalıbı koru, paleti değiştir.

## Sınırlar

Tek bir mağara görüntüsü. Bölgeler arası geçiş, ışık kaynağı, derinlik katmanları ve tile sistemi bu göreve girmiyor.

::: details İpucu 1 — Mağara kamptan farksız duruyor
Palet yeterince uzaklaşmamış olabilir. Yeşilden griye geçerken doygunluğu da düşür.
:::

::: details İpucu 2 — Sarkıtlar havada duruyor
Sarkıtlar üst kenardan başlamalı. Tavana değmeyen bir sarkıt, uçan bir kaya gibi görünür.
:::

::: details İpucu 3 — Tam yerleşim
Zemin 13–16. satırlar. Sarkıtlar 1–4. satırlarda 3–6. ve 23–26. sütunlarda, aşağı doğru daralır. Mağara ağzı 6–12. satırlarda 14–24. sütunlar arasında; içi 16–22. sütunlarda.
:::

## Birincil kaynak

[Pedro Medeiros — Cluster Sketching and Painting](https://saint11.art/pixel_art_articles/article2/).
`RESOURCES.md` içindeki bu kaynak, ayrıntıdan önce büyük renk alanlarıyla yerleşim kurma yaklaşımı için kullanıldı. Mağaranın paleti ve şekilleri bu ders için seçildi.

**Kazanım:** Elinde iki bölge var ve ikisi de aynı oyuna ait görünüyor. Yeni bölge artık bir palet kararı.

**“Pixel Art 1.59 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.60 — Asset'lerini tek sprite sheet'e topla](/pixel-art/60-sprite-sheet).
