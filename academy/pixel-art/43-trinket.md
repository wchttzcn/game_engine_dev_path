---
title: "1.43 — 8×8 trinket çiz"
description: "Zincir ve taşla küçük bir amulet oluştur."
section: Idle oyun · eşya ve monster
---

# {{ $frontmatter.title }}

**Hedef:** İnce bağlantı ile dolu bir odağı birleştirerek trinket ikonu kur.

**Önce şu teknik:** [1.9 — Silüet testi yap](/pixel-art/09-silhouette-test) — Zincir ile taş silüette ayrılmazsa ikon okunmaz.

## Görev

8×8 transparent RGB dosyada amulet çiz. Zincir ve çerçeve `#E3AB52`, taş `#81CFB3`, tek vurgu `#FFE5A3` olsun. `art/idle-items/trinket.aseprite` olarak kaydet.

## Ne zaman bitti?

- Üstte zincir boşluğu, altta çerçeveli dolu taş seçiliyor.
- Zincir ile taş bağlı; taşın içinde transparent delik yok.
- Canvas 8×8, en fazla üç renk ve dosya kaydedilmiş.

## Bilmen gereken küçük parça

Trinket bir ring, amulet veya küçük charm olabilir. İlk örnekte boyna takılan zinciri ve altında bir taşı seçtik. Zincirin ortası boş, taşın ortası dolu kalınca iki parça aynı küçük canvas'ta farklı okunur.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/trinket-1.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="trinket-1 — 8×8 ders örneği" /></div>
    <figcaption><strong>1 · Zincir</strong><br />Üstteki geniş çizgiyi iki yandan aşağı daralt. Dördüncü satırda ortadaki iki pixel birleşsin.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/trinket-2.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="trinket-2 — 8×8 ders örneği" /></div>
    <figcaption><strong>2 · Taş ve çerçeve</strong><br />Alt iki satıra ortası iki pixel taş, kenarları altın renkli dört pixel çiz. Altına iki altın pixel'le tabanı kapat.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/trinket.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="trinket — 8×8 ders örneği" /></div>
    <figcaption><strong>3 · Küçük vurgu</strong><br />Taşın sağ alt pixel'ini açık renge çevir. Çerçeveye yeni renk ekleme.</figcaption>
  </figure>
</div>

Bu tek vurgu, taşın yerini bulmayı kolaylaştırmak için seçildi; kapsamlı shading gerekmiyor. Ring aynı eşya ailesinin başka bir örneği olarak aşağıda duruyor.

<div class="pixel-preview">
  <figure><div class="pixel-canvas"><img src="/pixel-art/idle/ring.svg" width="96" height="96" alt="Ring · Kapalı halka ve üstte taş" /></div><figcaption>Ring · Kapalı halka ve üstte taş</figcaption></figure>
</div>

## Sınırlar

Bir bağlantı ve bir taş, küçük takıyı okunur tutmak için. Stat sembolleri veya bütün rarity çeşitleri bu göreve eklenmiyor.

::: details İpucu 1 — Amulet ve ring aynı görünüyor
Amulet'te taş zincirin altında asılı; ring örneğinde taş halkanın üstünde.
:::

::: details İpucu 2 — Taş zincirden koptu
Dördüncü satırdaki iki altın pixel taşın üst çerçevesine değmeli.
:::

::: details İpucu 3 — Alt kısmı kuramıyorum
5–6. satırlarda 3. sütun altın, 4–5. sütun taş, 6. sütun altın. 7. satırda orta iki pixel altın. Vurgu 5. sütunun 6. satırında.
:::

## Birincil kaynak

[Pedro Medeiros — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/).
`RESOURCES.md` içindeki bu kaynak, küçük bir sprite'ı az araçla görerek kurma yaklaşımı için kullanıldı. Buradaki ikonlar ve adımlar özgün ders örnekleridir.

**Kazanım:** Boş zincir ile dolu taşı ayırarak bir idle RPG trinket'i ürettin.

**“Pixel Art 1.43 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.44 — 8×8 slime çiz](/pixel-art/44-slime).
