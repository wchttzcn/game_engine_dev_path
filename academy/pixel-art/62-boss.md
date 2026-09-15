---
title: "1.62 — 16×16 boss çiz"
description: "Kadronun tek istisnası olarak, iki kat büyük bir düşman kur."
section: Idle oyun · eşya ve monster
---

# {{ $frontmatter.title }}

**Hedef:** Bir düşmanı, ölçüsünü büyüterek önemli kıl.

**Önce şu teknik:** [1.9 — Silüet testi yap](/pixel-art/09-silhouette-test) — Büyük gövde, küçük göz: oran silüette okunur.

## Görev

16×16 transparent RGB dosyada taçlı bir slime kralı çiz. Gövde için 1.58'deki `#7dbd72`, gözler için `#182e33`, taç için `#e3ab52` kullan. `art/monsters/boss.aseprite` olarak kaydet.

## Ne zaman bitti?

- Gövde 8×8 slime ile aynı renk ailesinde ve aynı biçimde; yalnız iki kat büyük.
- Gözler gövdeye oranla 8×8'dekiyle aynı büyüklükte, yani orantılı olarak daha küçük.
- Taç gövdenin üstüne oturuyor; kaynak 16×16.

## Bilmen gereken küçük parça

Bu pakette tek bir canvas istisnası var ve o da burada. **Boss büyük olduğu için önemlidir;** aynı ölçüde bir düşman, renk veya taç eklense bile sıradan kalır.

İki kat büyümek yeni bir çizim değil, yeni bir karar getirir: **hangi ayrıntı büyüyecek?** Gözleri de iki katına çıkarırsan boss şişmiş bir slime olur. Gözleri aynı bırakırsan gövde gerçekten büyük görünür — çünkü göz ölçüsü bizim için tanıdık bir birimdir. Taç ise rolü söyler: bu, slime'ların kralı.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/slime.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="1.58'deki 8×8 slime." /></div>
    <figcaption><strong>1 · Sıradan slime</strong><br />Kadronun temel düşmanı. Boss bunun büyük hâli olacak.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/monsters/boss.svg" width="160" height="160" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:10px 10px;outline:1px solid #486452" alt="Taçlı, 16×16 slime kralı." /></div>
    <figcaption><strong>2 · Boss</strong><br />Gövde iki kat; gözler aynı ölçüde kaldı. Üstüne beş uçlu bir taç oturuyor.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/boss-scale.svg" width="240" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="8×8 slime ve 16×16 boss yan yana." /></div>
    <figcaption><strong>3 · Yan yana</strong><br />Ölçü farkı ancak yan yana görünce anlaşılır. Boss ekranda tek başına durmamalı.</figcaption>
  </figure>
</div>

Boss'un 16×16 olması paketin geri kalanını değiştirmez: karakterler, eşyalar ve diğer monster'lar 8×8 kalır. **İstisna, kuralı bozmaz — kuralı görünür kılar.** Boss'a 1.64'teki flash'ı ve 1.66'daki ölüm kademelerini uygularken kademeleri bir satır daha uzatman yeterli.

## Sınırlar

Tek boss ve tek kare. Saldırı pozu, ikinci faz, can barı ve 16×16'ya geçen başka asset bu göreve girmiyor.

::: details İpucu 1 — Boss şişmiş slime gibi duruyor
Gözleri büyütmüş olabilirsin. Gözü 2×2 bırak; gövde büyüdükçe oran değişsin.
:::

::: details İpucu 2 — Taç gövdeye gömülüyor
Tacın altı gövdenin üst hattına değmeli, içine girmemeli. Bir satır boşluk bırak.
:::

::: details İpucu 3 — Tam yerleşim
Gövde 6–15. satırlar, en geniş yeri 2–15. sütunlar. Gözler 10–11. satırlarda 5–6. ve 11–12. sütunlarda. Taç 4–5. satırlarda.
:::

## Birincil kaynak

[Pedro Medeiros — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/).
`RESOURCES.md` içindeki bu kaynak, küçük bir sprite'ı dış şekille kurma yaklaşımı için kullanıldı. Ölçü istisnası ve gözlerin sabit kalması bu dersin kararıdır.

**Kazanım:** Kadroda bir boss var ve neden büyük olduğunu biliyorsun.

**“Pixel Art 1.62 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.63 — Slime'ın saldırı pozunu çiz](/pixel-art/63-slime-attack).
