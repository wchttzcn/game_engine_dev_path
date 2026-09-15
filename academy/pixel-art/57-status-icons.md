---
title: "1.57 — Durum etkisi ikonlarını çiz"
description: "Zehir, yanma ve donma için tek bakışta okunan üç küçük işaret kur."
section: Idle oyun · eşya ve monster
---

# {{ $frontmatter.title }}

**Hedef:** Karakterin üstünde duran bir durumu tek ikonla anlat.

**Önce şu teknik:** [1.9 — Silüet testi yap](/pixel-art/09-silhouette-test) — Üç durum önce biçimle, sonra renkle ayrılır.

## Görev

8×8 transparent RGB dosyada üç ikon çiz: zehir damlası (`#7dbd72`), alev (`#e3ab52` ve `#ffe5a3`) ve buz kristali (`#9de7f5`). `art/idle-ui/status.aseprite` olarak üç frame kaydet.

## Ne zaman bitti?

- Üç ikon birbirinden tek bakışta ayırt ediliyor.
- Her ikon kendi rengini taşıyor; renkler birbirine yakın değil.
- Üçü de 8×8 içinde ve kenarlara değmiyor.

## Bilmen gereken küçük parça

Idle oyunda savaş kendiliğinden yürür. Oyuncunun bakınca anlaması gereken şey **ne olduğu** değil, **ne durumda olduğudur:** zehirlendi mi, yanıyor mu, donmuş mu?

Bunun için ikonların iki işi var. Birincisi biçim: damla, alev ve kristal birbirine hiç benzemez. İkincisi renk: yeşil, turuncu ve camgöbeği. **İki ayrım birlikte çalışır** — küçük ölçüde yalnız birine güvenmek risklidir.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/status-poison.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Yeşil zehir damlası." /></div>
    <figcaption><strong>1 · Zehir</strong><br />Üstü sivri, altı geniş bir damla. Ağırlık aşağıda.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/status-burn.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Turuncu alev, içinde açık renk çekirdek." /></div>
    <figcaption><strong>2 · Yanma</strong><br />Alev yukarı doğru sivrilir; içindeki açık renk sıcaklığı anlatır.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/status-row.svg" width="192" height="64" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Zehir, alev ve buz ikonları yan yana." /></div>
    <figcaption><strong>3 · Üçü birlikte</strong><br />Buz kristali köşeli ve simetrik. Üçü yan yana karışmıyor.</figcaption>
  </figure>
</div>

Bu ikonlar karakterin üstünde veya can barının yanında küçük bir rozet olarak görünür. Aynı seti büyütmek kolay: kalkan için 1.38'deki kubbenin küçük hâli, hız için bir ok işareti. Kural aynı kalır — biçim ve renk birlikte ayırsın.

## Sınırlar

Üç durum ve tek kare. Sayaç, süre göstergesi, yığılan durumlar ve animasyon bu göreve girmiyor.

::: details İpucu 1 — İkonlar birbirine benziyor
Biçimleri farklılaştır. Renk tek başına yetmez; damla, alev ve kristal ayrı siluetler olmalı.
:::

::: details İpucu 2 — Alev zehir gibi duruyor
Alev yukarı sivrilir, damla aşağı genişler. Yönleri ters olmalı.
:::

::: details İpucu 3 — Tam yerleşim
Zehir 2–7. satırlar, en geniş yeri 5–6. satırlarda. Alev 2–8. satırlar. Kristal 2–7. satırlar, merkez 4–5. satırda.
:::

## Birincil kaynak

[Aseprite — Drawing](https://www.aseprite.org/docs/drawing/).
`RESOURCES.md` içindeki bu belge, küçük şekilleri kurmak için kullanıldı; [Color Bar](https://www.aseprite.org/docs/color-bar/) renk seçimi içindir. Üç durumun biçim ve renk seçimi bu dersin kararıdır.

**Kazanım:** Oyuncu bir karakterin durumunu yazı okumadan anlayabilir.

**“Pixel Art 1.57 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.58 — 8×8 slime çiz](/pixel-art/58-slime).
