---
title: "1.81 — Yokken kazandıkların ekranını kur"
description: "Oyuncu geri döndüğünde ne kazandığını gösteren karşılama ekranını çiz."
section: Idle oyun · ilerleme
---

# {{ $frontmatter.title }}

**Hedef:** Oyun kapalıyken geçen zamanı ve kazancı tek ekranda anlat.

**Önce şu teknik:** [1.23 — 3×5 harf seti çiz](/pixel-art/23-letters) — Başlık ve kazanç satırları bu harf setiyle yazılır.

## Görev

160×96 bir ekran kur: 9-slice panel, `WELCOME BACK` başlığı, saat ikonu ve `2H 14M` süresi, altın ve prestige kazancı için iki satır, altta `COLLECT` düğmesi. Saat ikonunu 8×8 olarak sen çiz. `art/idle-ui/offline-screen.aseprite` olarak kaydet.

## Ne zaman bitti?

- Panelde başlık, süre, en az iki kazanç satırı ve tek bir düğme var.
- Süre saat ikonuyla birlikte gösteriliyor; rakamlar ve harfler hazır setlerden.
- Ekrandaki en parlak öğe COLLECT düğmesi; kaynak 160×96.

## Bilmen gereken küçük parça

Bir idle oyunu idle yapan şey, **sen yokken de çalışmasıdır.** Oyuncu geri döndüğünde ilk gördüğü şey bu ekran olur ve tek bir işi vardır: geçen zamanı ve karşılığını göstermek.

Üç bilgi, tek eylem. Ne kadar süre geçti, ne kazandın, topla. Saat ikonu süreyi yazı olmadan bağlama oturtur; her kazanç satırı kendi para biriminin ikonuyla başlar. Düğme paletteki en açık rengi kullanır çünkü oyuncunun yapması gereken tek şey odur.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/clock.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Akrep ve yelkovanı olan saat ikonu." /></div>
    <figcaption><strong>1 · Saat</strong><br />Dairesel kenar, içinde iki kol. Yukarı ve sağa bakan kollar saati belli eder.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/screens/offline.svg" width="640" height="384" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:4px 4px;outline:1px solid #486452" alt="WELCOME BACK başlıklı karşılama ekranı." /></div>
    <figcaption><strong>2 · Ekran</strong><br />Başlık, süre, iki kazanç satırı ve tek düğme. Her satır kendi ikonuyla başlıyor.</figcaption>
  </figure>
</div>

Altın satırının yanındaki `X2` rozeti, offline kazancın bir çarpanla arttığını söyler — 1.78'de çizdiğin rozet burada ikinci kez iş görüyor. Bu, iyi bir UI parçasının işareti: bir kez çizilir, birçok yerde kullanılır.

## Sınırlar

Tek ekran ve durağan bir görüntü. Sayıların artarak sayılması, reklam düğmesi ve süre sınırı bu göreve girmiyor.

::: details İpucu 1 — Ekran kalabalık duruyor
Satır sayısını azalt. İki kazanç satırı yeter; üçüncüsü bilgiyi değil gürültüyü artırır.
:::

::: details İpucu 2 — Hangi düğmeye basılacağı belli değil
Ekranda tek bir parlak öğe olmalı. Başka bir şey aynı açıklıktaysa onu söndür.
:::

::: details İpucu 3 — Tam yerleşim
Panel 5–156. sütunlar, 5–92. satırlar. Başlık 11. satırda ortalanır, süre 27. satırda, kazanç satırları 41. ve 59. satırlarda, düğme 79. satırda.
:::

## Birincil kaynak

[Aseprite — Slices](https://www.aseprite.org/docs/slices/).
`RESOURCES.md` içindeki bu belge, 9-slice ile paneli istediğin boyda kurmayı açıklar; [Drawing](https://www.aseprite.org/docs/drawing/) saat ikonu içindir. Ekranın yerleşimi ve bilgi sırası bu dersin seçimidir.

**Kazanım:** Oyunun sen yokken çalıştığı, geri döndüğünde tek ekranda anlaşılıyor.

**“Pixel Art 1.81 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.82 — 32×16 kamp alanı kur](/pixel-art/82-camp).
