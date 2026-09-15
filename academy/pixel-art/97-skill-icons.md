---
title: "1.97 — Karaktere özel skill ikonu çiz"
description: "Her karakterin skill'ini, o karakterin efektinden türeyen tek bir ikona indir."
section: Idle oyun · skill ve auto
---

# {{ $frontmatter.title }}

**Hedef:** Dört skill'i, hangi karaktere ait olduğu okunacak şekilde ikona çevir.

**Önce şu teknik:** [1.9 — Silüet testi yap](/pixel-art/09-silhouette-test) — Dört ikon ancak dış şekilleri ayrıysa karışmaz.

## Görev

8×8 dört skill ikonu çiz. Her biri o karakterin 1.28–1.43 arasında çizdiğin efektinden türesin: mage için kıvılcım (`#cdf4fb` ve `#9de7f5`), warrior için kılıç izi hilali (`#92afc3`), priest için iyileştirme haçı (`#b7efd0`), archer için ok (`#9b6b43`). `art/idle-ui/skills.aseprite` olarak dört frame kaydet.

## Ne zaman bitti?

- Dört ikon da 8×8 ve tek renge boyandığında hâlâ birbirinden ayrılıyor.
- Her ikon, karakterin efektiyle aynı biçim ailesinden geliyor.
- Hiçbir ikon karakterin kendisini çizmiyor; yalnız yaptığı işi çiziyor.
- Dört ikon aynı dosyada dört frame.

## Bilmen gereken küçük parça

Skill slotunda karakterin portresi durmaz; **skill'in kendisi** durur. Ama oyuncunun o slota bakınca hangi karakterin skill'i olduğunu bilmesi gerekir.

Bunun yolu ikona karakterin yüzünü koymak değil. Skill ikonunu, o karakterin sahnede bıraktığı **ize** benzetmektir. Mage'in büyüsü dört yöne açılan bir kıvılcımdı; ikonu da öyle. Warrior'ın vuruşu bir hilal iz bırakıyordu; ikonu o hilal. Priest'in iyileştirmesi bir artı biçiminde parlıyordu, archer'ın oku yatay ve sivriydi. Oyuncu bu bağı kimse söylemeden kurar, çünkü aynı biçimi sahnede zaten gördü.

<PixelAnimation title="Dört skill ikonu" :frames='[{"src":"/pixel-art/skills/mage.svg","label":"Mage","duration":650,"alt":"Dört yöne açılan camgöbeği kıvılcım."},{"src":"/pixel-art/skills/warrior.svg","label":"Warrior","duration":650,"alt":"Sağa açılan hilal biçiminde kılıç izi."},{"src":"/pixel-art/skills/priest.svg","label":"Priest","duration":650,"alt":"Açık yeşil kalın artı işareti."},{"src":"/pixel-art/skills/archer.svg","label":"Archer","duration":650,"alt":"Yatay duran, ucu sağda olan ok."}]' />

Dört ikonun dış şekilleri de birbirinden ayrı tutuldu: kıvılcım çapraz, hilal eğri, artı dik, ok yatay. Dördü küçük bir slotun içine girdiğinde ayırt eden şey bu.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/skills/hero-skill-pairs.svg" width="420" height="204" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Üstte dört karakter, altında her birinin kendi skill ikonu." /></div>
    <figcaption><strong>Karakter ve skill'i</strong><br />Üstte kim, altında ne yaptığı. Bağ renk ve biçimden kuruluyor.</figcaption>
  </figure>
</div>

Renk bağı da ikinci bir iple aynı düğümü atıyor: mage'in büyüsü camgöbeği, priest'in parıltısı yeşil, archer'ın oku ahşap kahvesi. Bir karakterin rengi oyunda tek bir şeyi anlatırsa oyuncu onu öğrenir ve bir daha unutmaz.

## Sınırlar

Dört ikon ve tek ölçü. İkinci skill, ultimate ikonu ve skill'in seviye rozeti bu göreve girmiyor.

::: details İpucu 1 — İkon karakterin kendisine benziyor
Skill ikonu karakteri değil eylemi çizer. Gövdeyi çıkar, geriye kalan izi büyüt.
:::

::: details İpucu 2 — İki ikon karışıyor
Aynı yöne uzuyor olabilirler. Dördünü yan yana koy ve her birinin farklı bir eksene baskın olduğunu doğrula: çapraz, eğri, dik, yatay.
:::

::: details İpucu 3 — Tam yerleşim
Kıvılcım 2–6. satırlarda; 4. sütun dikey, 4. satır yatay, merkez üç pixel açık ton. Hilal 2–7. satırlarda ve 3–7. sütunlarda, ortası boş. Artı 2–7. satırlarda; dikey kol 4–5. sütunlar, yatay kol 4–5. satırlar tam genişlik. Ok 2–6. satırlarda; gövde 4. satırda 1–7. sütunlar, ucu 3. ve 5. satırlarda birer pixel.
:::

## Birincil kaynak

[Pedro Medeiros — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/).
`RESOURCES.md` içindeki bu kaynak, küçük ölçüde okunur şekil kurmayı açıklar; dört ikonun dış şekilden ayrılması için kullanıldı. İkonların karakterin efektinden türetilmesi bu dersin seçimidir.

**Kazanım:** Bir skill'i, sahibini ele veren tek bir ikona indirebiliyorsun.

**“Pixel Art 1.97 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.98 — Skill barını dört karede doldur](/pixel-art/98-skill-bar).
