---
title: "1.102 — Düğümleri bağlayan hattı çiz"
description: "İki düğüm arasındaki yolu, alınmış ve alınmamış hâlleriyle tek pixel genişliğinde kur."
section: Idle oyun · skill tree
---

# {{ $frontmatter.title }}

**Hedef:** Bir ağacı, düğümleri değil **aralarındaki yolu** çizerek ağaç yap.

**Önce şu teknik:** [1.20 — Tekrarlanabilir zemin tile'ı çiz](/pixel-art/20-tile) — Hat, her yerde tekrarlanan tek bir parçadır.

## Görev

İki bağlantı parçası çiz. Düz hat: 3×10, ortadaki sütun dolu. Dirsek hattı: 14×10, yukarıdan iner, yatayda sağa gider, sonra aşağı devam eder. Her ikisinin alınmamış (`#354b50`) ve alınmış (`#8ac982`) hâlini üret. `art/idle-ui/tree-link.aseprite` olarak dört frame kaydet.

## Ne zaman bitti?

- Hatlar bir pixel genişliğinde; düğümlerin kenarından ince.
- Dirsek hattının dönüş noktası keskin; köşede fazladan pixel yok.
- Alınmış hat alınmamıştan ayrılıyor ama düğümlerden daha parlak değil.
- İki parça uç uca eklendiğinde ek yeri görünmüyor.

## Bilmen gereken küçük parça

Skill tree'yi ağaç yapan şey düğümler değil, düğümlerin **birbirine bağlı olması.** Yan yana on iki kutu bir ızgaradır; aynı kutuları hatlarla bağladığın an bir sıra, bir öncelik ve bir yol ortaya çıkar.

Hattın bir pixel kalmasının sebebi hiyerarşi. Düğüm bir karardır, hat yalnız o kararların sırasıdır. Hat kalınlaşırsa düğümlerle yarışır ve göz yolu değil çizgileri okur.

<PixelAnimation title="Düz hat, iki durum" :columns="3" :rows="10" :frames='[{"src":"/pixel-art/tree/link-straight-off.svg","label":"Alınmamış","duration":700,"alt":"Tek pixel genişliğinde sönük dikey çizgi."},{"src":"/pixel-art/tree/link-straight-on.svg","label":"Alınmış","duration":700,"alt":"Aynı çizgi yeşile dönmüş."}]' />

<PixelAnimation title="Dirsek hattı, iki durum" :columns="14" :rows="10" :frames='[{"src":"/pixel-art/tree/link-elbow-off.svg","label":"Alınmamış","duration":700,"alt":"Aşağı inip sağa dönen ve tekrar aşağı devam eden sönük hat."},{"src":"/pixel-art/tree/link-elbow-on.svg","label":"Alınmış","duration":700,"alt":"Aynı dirsek hattı yeşile dönmüş."}]' />

İki parçanın yetmesi, 1.20'deki tile mantığının aynısı. Bir ağaçta yalnız iki tür bağ vardır: düğüm doğrudan altındakine gider (düz), ya da yana kayar (dirsek). Üçüncü bir parça çizmek yerine dirseği yatayda çevirirsen sola giden bağı da elde edersin.

Hattın rengi düğümden daha sönük tutulur. Alınmış bir yol yeşildir ama alınmış bir **düğüm** kadar parlak değildir; yol bir bilgi, düğüm bir karardır. Ekranda en parlak şey hep alınabilir düğüm kalmalı.

## Sınırlar

İki hat parçası ve iki durum. Dallanma noktasındaki birleşim süsleri, ok uçları ve hattın üzerinde akan animasyon bu göreve girmiyor.

::: details İpucu 1 — Ağaç bir ızgaraya benziyor
Hatlar düğümlere değmiyor olabilir. Hattın ucu düğümün kenarına temas etmeli; bir pixel'lik boşluk bile bağı koparır.
:::

::: details İpucu 2 — Dirsek köşesi bulanık
Köşeyi yumuşatmaya çalışmışsın. Bir pixel genişliğinde hatta köşe keskindir: aşağı giden son pixel ile sağa giden ilk pixel aynı kareyi paylaşır, fazlası düğüm gibi okunur.
:::

::: details İpucu 3 — Tam yerleşim
Düz hat 3 geniş, 10 yüksek; yalnız 2. sütunun 1–10. satırları dolu. Dirsek 14 geniş, 10 yüksek; 2. sütunun 1–6. satırları, 6. satırın 2–13. sütunları ve 13. sütunun 6–10. satırları dolu.
:::

## Birincil kaynak

[Aseprite — Tiled Mode](https://www.aseprite.org/docs/tiled-mode/).
`RESOURCES.md` içindeki bu belge, bir parçanın kendini tekrarlarken ek yerini nasıl gizlediğini açıklar; hattın uç uca eklenebilmesi için kullanıldı. İki parçanın yeterli sayılması bu dersin seçimidir.

**Kazanım:** Bir ilerleme ağacını, kutular yığınından yola çevirebiliyorsun.

**“Pixel Art 1.102 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.103 — Skill tree ekranını kur](/pixel-art/103-tree-screen).
