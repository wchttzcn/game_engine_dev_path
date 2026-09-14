---
title: "1.9 — 8×8 kalkan çiz"
description: "Düz bir gövdeyi aşağı doğru daraltarak kalkan silüeti kur."
section: 8×8 nesnelerle devam
---

# {{ $frontmatter.title }}

**Hedef:** Bir nesnenin alt kenarını daraltarak kalkan olarak okunmasını sağla.

## Görev

Yeni bir 8×8 transparent RGB canvas aç. Örnekteki kalkanı tek renk `#92AFC3` ile çiz ve `art/pickups/shield.aseprite` olarak kaydet.

## Ne zaman bitti?

- Üst gövde geniş, alt uç iki pixel'e kadar daralıyor.
- İki taraf dengeli; dışarıda kopuk pixel yok.
- Canvas 8×8 ve kaynak dosya kaydedilmiş.

## Bilmen gereken küçük parça

Kalkanı tanıtmak için metal dokusuna ihtiyacın yok. Üstteki geniş alan ve altta daralan uç yeterli bir başlangıç işareti. İlk dört dolu satırı aynı genişlikte kur; biçimi alt iki satır değiştirecek.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/objects/shield-1.svg" width="128" height="128" alt="Ortada altı pixel genişliğinde ve dört pixel yüksekliğinde blok." /></div>
    <figcaption><strong>1 · Geniş gövde</strong><br />İlk satırı boş bırak. Sonraki dört satırda ortalanmış altışar pixel boya.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/objects/shield-2.svg" width="128" height="128" alt="Geniş bloğun altında dört pixel'lik daha dar satır." /></div>
    <figcaption><strong>2 · Daralma</strong><br />Bir alt satıra ortalanmış dört pixel ekle. Her iki yandan birer pixel geri çekilmiş olursun.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/objects/shield.svg" width="128" height="128" alt="Alt kısmı dört ve iki pixel'e daralan bitmiş kalkan." /></div>
    <figcaption><strong>3 · Alt uç</strong><br />Bir alt satıra ortalanmış iki pixel ekle. En alt satır boş kalsın.</figcaption>
  </figure>
</div>

Örneği aynen çizmen yeterli. %100 görünümde alt ucun hâlâ seçildiğine bak. Bu kalkan bir inventory nesnesi; warrior'ın elindeki işaret daha küçük olacak.

## Sınırlar

Tek renk kullanıyoruz; kalkanı tanıtan kararın dış şekil olduğunu görebilmek için.

::: details İpucu 1 — Kalkan kutu gibi
Gövdeyi yeniden çizmeden alt iki satırın genişliğine bak.
:::

::: details İpucu 2 — Uç yana kayıyor
Dört pixel'lik satırın iki yanında ikişer, iki pixel'lik satırın iki yanında üçer boş pixel kalmalı.
:::

::: details İpucu 3 — Satırları karıştırdım
Yukarıdan aşağı dolu genişlikler: 0, 6, 6, 6, 6, 4, 2, 0. Hepsini ortala.
:::

## Birincil kaynak

[Pedro Medeiros — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/).
`RESOURCES.md` içindeki bu kaynak, az araç ve küçük nesneyle görerek başlamayı destekler. Buradaki 8×8 çizim ve adımlar bu ders için özgün hazırlandı.

**Kazanım:** Aynı canvas'ta yalnız kenar biçimiyle yeni bir oyun nesnesi ürettin.

**“Pixel Art 1.9 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.10 — 8×8 sandık çiz](/pixel-art/10-chest).

