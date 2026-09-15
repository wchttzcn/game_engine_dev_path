---
title: "1.30 — 8×8 warrior çiz"
description: "Miğfer ve eldeki küçük kalkanla warrior'ı ayırt edilir yap."
section: Idle oyun · warrior
---

# {{ $frontmatter.title }}

**Hedef:** Aynı küçük karakter ölçüsünde ekipmanla farklı bir rol göster.

**Önce şu teknik:** [1.9 — Silüet testi yap](/pixel-art/09-silhouette-test) — Miğfer ve kalkan silüette ayırt edilmezse warrior mage'e benzer.

## Görev

8×8 transparent RGB canvas'ta warrior çiz. Zırh `#92AFC3`, yüz `#F3C68D`, kalkan ve ayaklar `#626080` olsun. `art/characters/warrior.aseprite` olarak kaydet.

## Ne zaman bitti?

- Yüzün iki yanında miğfer var ve sağdaki küçük kalkan gövdeden ayrılıyor.
- İki ayak ve üstte bir boş satır korunmuş.
- Canvas 8×8, en fazla üç renk ve kaynak dosya kaydedilmiş.

## Bilmen gereken küçük parça

Bir önceki sivri şapka yerine geniş bir miğfer ve elde kalkan kullanıyoruz. Ekipman büyüyünce karakterin yüzünü veya ayaklarını kapatabilir; bu yüzden eldeki kalkan, ayrı çizdiğin inventory kalkanının birebir küçültülmüş kopyası olmak zorunda değil.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/characters/warrior-1.svg" width="128" height="128" alt="Geniş miğferin iki yanından çevrelediği üç pixel'lik yüz." /></div>
    <figcaption><strong>1 · Miğfer ve yüz</strong><br />İlk satırı boş bırak. Üç, sonra beş zırh pixel'i çiz. Alt sırada ortadaki üç pixel yüz, iki yanındaki pixel'ler miğfer olsun.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/characters/warrior-2.svg" width="128" height="128" alt="Dik gövdeli, iki ayrı ayaklı warrior." /></div>
    <figcaption><strong>2 · Duruş</strong><br />Yüzün altına üç satır boyunca üçer zırh pixel'i koy. En altta iki ayrı koyu ayak çiz.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/characters/warrior.svg" width="128" height="128" alt="Warrior'ın sağ elinde küçük, aşağı doğru daralan kalkan." /></div>
    <figcaption><strong>3 · Eldeki kalkan</strong><br />Gövdenin sağında ikiye iki koyu blok ekle. Bu bloğun sağ altına bir pixel daha koy.</figcaption>
  </figure>
</div>

Kalkanın yüzü örtmesi gerekmiyor. %100 görünümde miğferli baş ve yandaki ekipman seçiliyorsa bu poz yeterli. Sonraki hareket dersinde ayakların yerini değiştireceğiz.

## Sınırlar

Tek bir ekipman işareti, küçük karakteri kalabalıklaştırmadan warrior rolünü anlatmak için. Metal shading'i bu göreve eklemiyoruz.

::: details İpucu 1 — Kalkan gövdede kayboldu
Kalkanın sağ kenarı gövdeden dışarı çıkmalı. İç rengi değişse bile bu çıkıntı kalır.
:::

::: details İpucu 2 — Yüz görünmüyor
Miğferin alt satırının orta üç pixel'i ten rengi; yalnız yanları zırh renginde.
:::

::: details İpucu 3 — Kalkanı yerleştiremiyorum
Soldan 6–7. sütunları yukarıdan 5–6. satırlarda boya. Altına, 7. sütunun 7. satırına tek pixel ekle.
:::

## Birincil kaynak

[Pedro Medeiros — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/).
`RESOURCES.md` içindeki bu kaynak, az araç ve küçük nesneyle görerek başlamayı destekler. Buradaki 8×8 çizim ve adımlar bu ders için özgün hazırlandı.

**Kazanım:** Bir karakterin ekipmanını, bütün parçalarını ayrıntılı çizmeden okunur kıldın.

**“Pixel Art 1.30 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.31 — İki pozla yerinde adımla](/pixel-art/31-walk).

