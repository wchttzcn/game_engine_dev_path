---
title: "1.49 — Karakteri sola çevir"
description: "Yatay çevirmenin neyi bozduğunu gör ve asimetrik parçaya karar ver."
section: Idle oyun · kadroyu tamamla
---

# {{ $frontmatter.title }}

**Hedef:** Bir karakteri ters yöne baktırırken nelerin bozulduğunu fark et.

**Önce şu teknik:** [1.9 — Silüet testi yap](/pixel-art/09-silhouette-test) — Çevrilen karakter silüette hâlâ kendisi olmalı.

## Görev

1.37'deki archer'ı 8×8 yeni bir dosyaya kopyala ve `Edit > Flip Horizontal` (`Shift+H`) ile çevir. İki hâli yan yana koy, yayın ve elin hangi tarafa geçtiğini not et. `art/characters/archer-left.aseprite` olarak kaydet.

## Ne zaman bitti?

- Çevrilmiş dosyada karakterin bütün parçaları karşı tarafa geçmiş.
- Yayın hangi tarafta olması gerektiğine karar verilmiş ve gerekçesi söylenebiliyor.
- İki dosya ayrı ayrı açılabiliyor; kaynaklar 8×8.

## Bilmen gereken küçük parça

Bir karakter her zaman sağa bakamaz. Sola yürüdüğünde, sola saldırdığında ters yöne dönmesi gerekir. Aseprite'ta bu tek menü seçeneği — ama **her sprite çevirmeye uygun değildir.**

Simetrik olanlar sorunsuz: slime, coin, kalp. Asimetrik olanlarda karar vermen gerekir. Archer'ın yayı çevrilince sola geçer ve bu doğrudur, çünkü yay atış yönündedir. Ama warrior'ın kalkanı çevrilince **yanlış ele** geçer; kalkan hep aynı kolda kalmalıysa onu çevirmeden yeniden yerleştirmen gerekir.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/flip-right.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Sağa bakan archer; yayı sağ tarafta." /></div>
    <figcaption><strong>1 · Özgün yön</strong><br />1.37'deki archer. Yay sağda, yani atış yönünde.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/flip-left.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Sola bakan archer; yayı sol tarafa geçmiş." /></div>
    <figcaption><strong>2 · Çevrilmiş</strong><br />`Edit > Flip Horizontal`. Yay sola geçti ve hâlâ atış yönünde: doğru.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/flip-pair.svg" width="204" height="96" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Sağa ve sola bakan archer yan yana." /></div>
    <figcaption><strong>3 · Yan yana</strong><br />İki yönü birlikte gör. Karakterin kimliği ikisinde de aynı kalmalı.</figcaption>
  </figure>
</div>

Çevirmenin bir bedeli daha var: ışık yönü de çevrilir. 1.13'te tek ışık yönü çalıştıysan, çevrilmiş sprite'ta ışık ters taraftan gelir. 8×8'de bu çoğu zaman göze çarpmaz; bir gün çarparsa çözüm, gölgeyi çevirdikten sonra elle düzeltmektir.

## Sınırlar

Yalnız yatay çevirme. Yukarı ve aşağı bakan pozlar, dört yönlü set ve döndürme bu göreve girmiyor.

::: details İpucu 1 — Çevrilmiş karakter yabancı görünüyor
Asimetrik bir parça yanlış tarafa geçmiş olabilir. O parçayı çevirmeden özgün tarafına geri taşı.
:::

::: details İpucu 2 — Kalkan yanlış ele geçti
Karar senin: ya kalkanı geri taşı ya da her iki elde de kalkan taşıyabildiğini kabul et. İkisi de geçerli, kararsızlık değil.
:::

::: details İpucu 3 — Çevirdikten sonra karakter kayıyor
Sprite canvas içinde ortalanmamış olabilir. Önce ortala, sonra çevir.
:::

## Birincil kaynak

[Aseprite — Flip](https://www.aseprite.org/docs/flip/).
`RESOURCES.md` içindeki bu belge, `Edit > Flip Horizontal` (`Shift+H`) ile sprite'ı veya seçimi yatayda çevirmeyi açıklar; [Transformations](https://www.aseprite.org/docs/transformations/) dönüşümlerin tamamını listeler. Asimetrik parçaya dair karar bu dersin konusudur.

**Kazanım:** Karakterlerin iki yöne de bakabiliyor ve çevirmenin neyi bozduğunu biliyorsun.

**“Pixel Art 1.49 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.50 — 8×8 armor ikonu çiz](/pixel-art/50-armor).
