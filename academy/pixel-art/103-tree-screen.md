---
title: "1.103 — Skill tree ekranını kur"
description: "Bir kök, üç dal ve altı düğümle karakterin skill ağacını tek ekrana yerleştir."
section: Idle oyun · skill tree
---

# {{ $frontmatter.title }}

**Hedef:** Bir ilerleme ağacını, oyuncunun bir sonraki adımını göreceği kadar sade tut.

**Önce şu teknik:** [1.21 — 9-slice çerçeve kur](/pixel-art/21-nine-slice) — Ekranın paneli ve düğüm kutuları aynı çerçeve mantığından çıkar.

## Görev

160×96 bir dosyada warrior'ın skill ağacını kur. Üstte durum şeridi ve `POINTS` sayacı. Ortada bir kök düğüm, altında üç dal, alt sırada iki düğüm daha. Kökten sola giden yol alınmış (yeşil), diğer yollar sönük. Bir düğüm açılabilir (altın kenarlı), kalanlar kilitli. En altta tek satır bilgi yazısı. `art/idle-ui/skill-tree.aseprite` olarak kaydet.

## Ne zaman bitti?

- Kök düğüm ekranın yatay ortasında.
- Üç dal eşit aralıkla yerleşmiş ve hatları köke bağlı.
- Ekranda tam olarak bir düğüm altın kenarlı.
- Hatlar düğümlerin kenarına değiyor; hiçbiri boşlukta bitmiyor.

## Bilmen gereken küçük parça

Skill tree'nin ilk sürümünde en sık yapılan hata onu **büyük** yapmaktır. Kırk düğümlü bir ağaç oyuncuya derinlik hissi vermez; ne yapacağını bulamadığı bir harita verir.

Bu ağaçta altı düğüm var ve her anda yalnız biri alınabilir durumda. Oyuncunun sorusu — *şimdi ne alabilirim* — ekranda tek bir altın kutuyla cevaplanıyor. Ağaç büyüdükçe bu sayı ikiye üçe çıkabilir; ama sıfır ya da on olduğu anda ekran işini yapmayı bırakır.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/screens/skill-tree.svg" width="640" height="384" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:4px 4px;outline:1px solid #486452" alt="160×96 skill tree ekranı: üstte tek kök düğüm, altında üç dal ve iki alt düğüm; alınmış yol yeşil, bir düğüm altın kenarlı." /></div>
    <figcaption><strong>Skill ağacı</strong><br />Bir kök, üç dal, altı düğüm. Yeşil yol geçmişi, altın kutu şimdiyi gösterir.</figcaption>
  </figure>
</div>

| Bölge | Parça | Dersi |
| --- | --- | --- |
| Düğümler | Dört aşama | [1.101 — Skill tree düğümünün dört hâlini çiz](/pixel-art/101-tree-node) |
| Düğüm ikonları | Skill biçimleri | [1.97 — Karaktere özel skill ikonu çiz](/pixel-art/97-skill-icons) |
| Yollar | Düz ve dirsek hat | [1.102 — Düğümleri bağlayan hattı çiz](/pixel-art/102-tree-link) |
| Durum şeridi | Altın sayacı | [1.8 — 8×8 coin çiz](/pixel-art/08-coin) |
| Yazı ve sayaç | Harf ve rakam | [1.23 — 3×5 harf seti çiz](/pixel-art/23-letters) ve [1.22 — 3×5 rakam seti çiz](/pixel-art/22-digits) |

Hatların çizim sırası burada gerçek bir tuzak. Alınmış yeşil yolu önce çizip üstüne sönük yolları çizersen, ortak gövdeyi sönük hat ezer ve yeşil yol kopuk görünür. Doğrusu önce bütün sönük yolları, sonra alınmış yolları çizmek: geçmiş, her zaman üstte kalmalı.

Üç dalın eşit aralıkla yerleşmesi de gözle değil sayıyla yapılır. Üç düğüm 36 pixel, aralarındaki iki boşluk 68 pixel; kalan 56 pixel ikiye bölününce iki yana 28'er düşer. Simetri, bakarak değil bölerek kurulur.

## Sınırlar

Tek karakterin ağacı ve altı düğüm. Diğer karakterlerin ağaçları, düğüm maliyetleri, puan sıfırlama ve ağaç içinde kaydırma bu göreve girmiyor.

::: details İpucu 1 — Alınmış yol kopuk görünüyor
Çizim sırası ters. Önce bütün sönük hatları çiz, alınmış hatları en son çiz.
:::

::: details İpucu 2 — Ekranda ne yapacağım belli değil
Birden fazla düğüm altın kenarlı olabilir ya da hiçbiri değildir. Tam olarak bir tane bırak; ağacın işi bir sonraki adımı göstermek.
:::

::: details İpucu 3 — Tam yerleşim
Durum şeridi 2–13. satırlar. `POINTS` sayacı 20. satır. Kök düğüm 29–40. satırlarda, 77–88. sütunlarda. Orta sıra 49–60. satırlarda; üç düğüm 31, 77 ve 123. sütunlardan başlar. Alt sıra 69–80. satırlarda, 31. ve 123. sütunlarda. Hatlar düğümlerin orta sütunundan çıkar ve iki sıranın tam ortasındaki satırda yana kayar. Bilgi satırı 88. satır.
:::

## Birincil kaynak

[Pedro Medeiros — Cluster Sketching and Painting](https://saint11.art/pixel_art_articles/article2/).
`RESOURCES.md` içindeki bu kaynak, ayrıntıdan önce büyük alanlarla yerleşim kurmayı açıklar; ağacın üç sıraya bölünmesi için kullanıldı. Altı düğümle sınırlı kalma kararı bu dersin seçimidir.

**Kazanım:** Bir ilerleme ağacını, oyuncunun bir sonraki adımını görebileceği kadar sade kurabiliyorsun.

**“Pixel Art 1.103 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.104 — Zehri karakterin üstünde göster](/pixel-art/104-status-poison).
