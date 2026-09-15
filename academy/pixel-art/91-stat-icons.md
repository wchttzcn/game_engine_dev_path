---
title: "1.91 — Beş stat ikonu çiz"
description: "Beş statı yazı değil, birbirine benzemeyen beş şekil ayırsın."
section: Idle oyun · stat ve ekipman
---

# {{ $frontmatter.title }}

**Hedef:** Beş statı tek bakışta ayırt edilen beş ayrı 8×8 şekille göster.

**Önce şu teknik:** [1.9 — Silüet testi yap](/pixel-art/09-silhouette-test) — Beş ikonu tek renge boyayıp hâlâ ayırt edilip edilmediğini burada sınarsın.

## Görev

8×8 beş stat ikonu çiz: ATK kılıç (`#f2c078`), DEF kalkan (`#92afc3`), HP kalp (`#8ac982`), SPD çizme (`#9de7f5`), CRIT yıldız (kollar `#e3ab52`, merkez `#ffe5a3`). Beşini yan yana koyup silüet testi yap. `art/idle-ui/stats.aseprite` olarak beş frame kaydet.

## Ne zaman bitti?

- Beş ikon de 8×8 ve sırasıyla kılıç, kalkan, kalp, çizme, yıldız.
- Renkler doğru: ATK `#f2c078`, DEF `#92afc3`, HP `#8ac982`, SPD `#9de7f5`, CRIT kollar `#e3ab52`, merkez `#ffe5a3`.
- Beşi tek renge boyandığında bile şekiller birbirine karışmıyor.
- `art/idle-ui/stats.aseprite` beş frame olarak kaydedildi.

## Bilmen gereken küçük parça

Stat satırında yazıya yer yok. `42` yazısının yanına “ATK” diye yazmak yerine, yazının kendisini bir şekle indirgersin: oyuncu şekli gördüğü an hangi stat olduğunu anlar, okumaz.

Şekiller birbirine benzemediği sürece renk ikinci bir ipucu olur, tek ipucu değil. Kılıç dikey ve sivri; tepede tek pixel, ortada üç sütunluk dar bir gövde. Kalkan geniş ve yuvarlak; altı sütuna yayılıp alta doğru daralıyor. Kalp çift tepeli; üstte iki ayrı öbek, ortada birleşiyor. Çizme iki ayaklı; iki dikey sütun paralel iniyor, en altta birleşiyor. Yıldız dört kollu; merkezden dört yöne çıkan ince kollar. Beşi küçültülünce bile karışmaz, çünkü hiçbiri diğerinin ana hatlarını paylaşmıyor.

<PixelAnimation title="Beş stat ikonu" :frames='[{"src":"/pixel-art/stats/atk.svg","label":"ATK","duration":260,"alt":"Dikey, sivri uçlu kılıç silueti."},{"src":"/pixel-art/stats/def.svg","label":"DEF","duration":260,"alt":"Geniş, alta doğru daralan kalkan silueti."},{"src":"/pixel-art/stats/hp.svg","label":"HP","duration":260,"alt":"Çift tepeli kalp silueti."},{"src":"/pixel-art/stats/spd.svg","label":"SPD","duration":260,"alt":"İki paralel sütunlu çizme silueti."},{"src":"/pixel-art/stats/crit.svg","label":"CRIT","duration":260,"alt":"Merkezden dört kola açılan yıldız silueti."}]' />

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/stats/icon-row.svg" width="352" height="64" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Beş stat ikonu yan yana: kılıç, kalkan, kalp, çizme, yıldız." /></div>
    <figcaption><strong>Beş ikon yan yana</strong><br />Aralarında boşluk yok; yalnız şekil farkı gözü satırdan satıra taşıyor.</figcaption>
  </figure>
</div>

## Sınırlar

Bu görev yalnız ikonun şekli ve rengiyle ilgili. Stat satırının hizalanması, ad ve rakam yerleşimi bir sonraki derse giriyor.

::: details İpucu 1 — İki ikon aynı ana hatta düşüyor
Her ikonu tek başına, diğerlerinden ayrı çiz. Bir tanesinin ana hattı diğerine benziyorsa (ör. kalkan ile kalp ikisi de geniş üstten başlıyorsa), üsteki genişliği veya alt daralmayı belirginleştir.
:::

::: details İpucu 2 — Renk tek ipucu oluyor
Renk körü bir oyuncu kırmızı ile yeşili ayıramayabilir. Silüet testini geçmeyen bir ikon, renk kaldırıldığında okunmaz olur — bu yüzden testi rengi kapatarak yap.
:::

::: details İpucu 3 — Tam yerleşim
Kılıç: tepe 1. satırda tek pixel (4. sütun), gövde 2–4. satırlarda 3–6. sütunlar, çapraz 5. satırda 3–8. sütunlar, kabza 6. satırda tek pixel, namlu 7. satırda 4–6. sütunlar. Kalkan: 2–5. satırlarda 2–8. sütunlar dolu, 6. satırda 3–6. sütunlar, 7. satırda 4–5. sütunlar. Kalp: 2. satırda iki ayrı ikili öbek (2–3 ve 6–7. sütunlar), 3–4. satırlar tam genişlik, 5. satırda 2–7, 6. satırda 3–6, 7. satırda 4–5. Çizme: 2–5. satırlarda iki paralel ikili sütun (2–3 ve 5–6), 6. satırda 2–4 ve 6–8 birleşiyor. Yıldız: 1–2. satırlarda üst kol (4. sütun), 3. satırda 3–5, 4. satırda sol kol (1–3), merkez (4. sütun) açık renk, sağ kol (5–7), 5. satırda 3–5, 6–7. satırlarda alt kol (4. sütun).
:::

## Birincil kaynak

[Pedro Medeiros — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/).
`RESOURCES.md` içindeki bu belge, küçük canvas ve az renkle okunabilir bir ilk sprite kurmayı anlatır. Beş statı beş ayrı ana hatla kodlamak bu dersin seçimidir.

**Kazanım:** Stat satırının okunmasını sağlayan beş şekli, yalnızca ana hatlarına bakarak ayırt edebiliyorsun.

**“Pixel Art 1.91 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.92 — Stat satırını hizala](/pixel-art/92-stat-row).
