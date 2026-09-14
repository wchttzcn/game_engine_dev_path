---
title: "1.76 — 16×16 gelir üreten yapı çiz"
description: "Geliri temsil eden, zemine oturan küçük bir demirci kur."
section: Idle oyun · dünya
---

# {{ $frontmatter.title }}

**Hedef:** Oyunun gelirini bir karakter yerine bir yapıyla göster.

**Önce şu teknik:** [1.11 — Üç value ile ayır](/pixel-art/11-value) — Koyu gövde ve parlak ocak, üç value ayrımının ta kendisi.

## Görev

16×16 RGB dosyada bir demirci çiz. Taş gövde için `#6b6b7d`, çatı ve zemin için `#593c35`, ocağın ateşi için `#e3ab52` kullan. Üstüne ince bir baca ekle. `art/world/forge.aseprite` olarak kaydet.

## Ne zaman bitti?

- Yapı alt kenara oturuyor; havada durmuyor.
- İçindeki ateş dışarıdan görünüyor ve yapının en parlak yeri.
- Baca gövdeden ince; kaynak 16×16 ve kaydedilmiş.

## Bilmen gereken küçük parça

Idle oyunlar geliri çoğu zaman **yapılarla** temsil eder: fabrikalar, çiftlikler, atölyeler. Bizim kadromuz karakterlerden oluşuyor ama karakter bir yerde çalışır; o yer henüz çizilmedi.

Bir üretim yapısının tek anlatması gereken şey **çalışıyor olmasıdır.** Bunu söyleyen şey ateştir: koyu bir gövdenin içindeki açık renk alan, dışarıdan bakan için çalışan bir ocaktır. 16×16 seçmemizin sebebi de bu — 8×8'de hem gövde hem içerideki ateş okunmaz.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/world/forge-base.svg" width="160" height="160" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:10px 10px;outline:1px solid #486452" alt="Demircinin yalnız taş gövdesi ve zemini." /></div>
    <figcaption><strong>1 · Gövde</strong><br />Alt kenara oturan geniş bir taş kütle ve üstünde koyu bir çatı şeridi.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/world/forge.svg" width="160" height="160" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:10px 10px;outline:1px solid #486452" alt="Bacası ve içinde yanan ateşiyle demirci." /></div>
    <figcaption><strong>2 · Ocak ve baca</strong><br />Gövdenin ortasına koyu bir boşluk aç, içine ateşi koy. Üste ince bir baca ekle.</figcaption>
  </figure>
</div>

Yapı 1.74'teki kampın zemin çizgisine oturur; ağaç ve çadırla aynı satıra basar. Aynı kalıptan ikinci bir yapı çıkarmak kolay: gövde ve zemin aynı kalır, içindeki parlak alan değişir — değirmen için dönen bir çark, ahır için açık bir kapı.

## Sınırlar

Tek yapı ve durağan görüntü. Duman animasyonu, içeride çalışan karakter ve yükseltme seviyeleri bu göreve girmiyor.

::: details İpucu 1 — Yapı havada duruyor
Alt iki satırı zemin yap ve gövdeyi ona yasla. Boşluk kalırsa yapı yüzer.
:::

::: details İpucu 2 — Çalıştığı anlaşılmıyor
Ateş yeterince parlak değil. Gövdenin en açık rengi ocağın içinde olmalı.
:::

::: details İpucu 3 — Tam yerleşim
Çatı 6–7. satırlar, gövde 8–14. satırlar, ocak boşluğu 6–11. sütunlarda 10–14. satırlar, baca 4–5. sütunlarda 3–5. satırlar.
:::

## Birincil kaynak

[Pedro Medeiros — Cluster Sketching and Painting](https://saint11.art/pixel_art_articles/article2/).
`RESOURCES.md` içindeki bu kaynak, ayrıntıdan önce büyük renk alanlarıyla yerleşim kurma yaklaşımı için kullanıldı. Demircinin ölçüsü ve ocağın yeri bu dersin seçimidir.

**Kazanım:** Oyunun geliri artık dünyada bir yere sahip.

**“Pixel Art 1.76 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.77 — Asset'lerini tek sprite sheet'e topla](/pixel-art/77-sprite-sheet).
