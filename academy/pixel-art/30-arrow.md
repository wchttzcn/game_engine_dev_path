---
title: "1.30 — 8×8 ok çiz"
description: "Uç, gövde ve tüyü ayırarak yönü belli bir ok sprite'ı kur."
section: Skill zincirini tamamla
---

# {{ $frontmatter.title }}

**Hedef:** Kısa bir çubuğu, tek bakışta yönü anlaşılan bir oka dönüştür.

## Görev

8×8 transparent RGB dosyada sağa bakan bir ok çiz. Gövde için `#9b6b43`, uç için `#92afc3`, tüy için `#6eae72` kullan. `art/fx/arrow.aseprite` olarak kaydet.

## Ne zaman bitti?

- Ok tek bakışta sağa bakıyor; uç ile tüy birbirine karışmıyor.
- Gövde tek satır kalınlığında; uç ve tüy gövdenin iki ucunda.
- Canvas 8×8 ve kaynak kaydedilmiş.

## Bilmen gereken küçük parça

1.20'de okun hedefe değdiği anı çizdin, ama okun kendisi hiç görünmedi. Idle oyunda mermi çoğu zaman **karakterden ayrı bir sprite'tır;** ekranda tek başına uçar.

Bir okun yönünü taşıyan şey ucudur. Uç bir yöne sivrilir, tüy ters yönde açılır. Bu iki işaret zıt yönlere baktığı sürece ok, tek satırlık gövdeyle bile okunur. Yatay çizmek 8×8'de en çok yeri bırakır.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/fx/arrow-shaft.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Ortada tek satırlık düz kahverengi gövde." /></div>
    <figcaption><strong>1 · Gövde</strong><br />Ortadaki satıra soldan sağa beş pixel'lik düz bir çubuk çiz.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/fx/arrow-head.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Gövdenin sağ ucuna eklenmiş üç pixel'lik sivri uç." /></div>
    <figcaption><strong>2 · Uç</strong><br />Çubuğun sağ ucuna üstte, ortada ve altta birer pixel koy; en sağa tek pixel daha ekle.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/fx/arrow.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Sol uçta iki pixel'lik yeşil tüy, sağda sivri uç." /></div>
    <figcaption><strong>3 · Tüy</strong><br />Sol uca ters yöne açılan iki pixel'lik tüy ekle. Uç sivrilir, tüy açılır.</figcaption>
  </figure>
</div>

Ucu ve tüyü farklı renkte tutmak, 8×8'de ikisini ayırmanın en ucuz yolu. Aynı çizimi sola bakan bir ok için yatayda çevirebilirsin; `Edit > Flip Horizontal` bunu tek adımda yapar.

## Sınırlar

Ok yalnız yatay ve tek yön. Eğik açılar, ok çeşitleri ve yanma gibi efektler bu göreve eklenmiyor.

::: details İpucu 1 — Ok iki yöne de bakıyor gibi
Uç ile tüy aynı biçimde olmasın. Uç sivrilerek daralır; tüy açılarak genişler.
:::

::: details İpucu 2 — Ok çok kalın görünüyor
Gövde tek satır olmalı. İkinci satır eklemek 8×8'de oku çubuk gibi gösterir.
:::

::: details İpucu 3 — Tam yerleşim
Gövde 5. satırda, 1–4. sütunlar. Uç 5. sütunda 4–6. satırlar ve 6. sütunda 5. satır. Tüy 1. sütunda 4–6. satırlar ve 2. sütunda 5. satır.
:::

## Birincil kaynak

[Aseprite — Drawing](https://www.aseprite.org/docs/drawing/).
`RESOURCES.md` içindeki bu belge, pixel ve çizgi araçlarıyla küçük şekiller kurmayı açıklar. Okun oranları ve renk ayrımı bu dersin seçimidir.

**Kazanım:** Artık archer'ın attığı şey ekranda görünebiliyor. Aynı kalıpla mızrak veya büyü mermisi de çıkar.

**“Pixel Art 1.30 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.31 — Archer'ın yay germe pozunu çiz](/pixel-art/31-archer-draw).
