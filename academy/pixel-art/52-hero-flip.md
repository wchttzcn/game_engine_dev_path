---
title: "1.52 — Karakteri sola çevir"
description: "Bütün kadroyu ters yöne baktır ve her karakterde çevirmenin neyi bozduğuna karar ver."
section: Idle oyun · kadroyu tamamla
---

# {{ $frontmatter.title }}

**Hedef:** Dört karakteri de ters yöne baktırırken her birinde nelerin bozulduğunu fark et.

**Önce şu teknik:** [1.9 — Silüet testi yap](/pixel-art/09-silhouette-test) — Çevrilen karakter silüette hâlâ kendisi olmalı.

## Görev

Mage, warrior, priest ve archer'ı 8×8 birer yeni dosyaya kopyala ve her birini `Edit > Flip Horizontal` (`Shift+H`) ile çevir. Dördünü özgün hâlleriyle yan yana koy, her karakterde hangi parçanın karşı tarafa geçtiğini not et ve o parçanın orada kalıp kalmayacağına karar ver. `art/characters/` altına `<karakter>-left` olarak kaydet.

## Ne zaman bitti?

- Dört çevrilmiş dosya var ve her birinde bütün parçalar karşı tarafa geçmiş.
- Her karakter için asimetrik parça adlandırılmış; kalması ya da geri taşınması gerekçesiyle söylenebiliyor.
- Hiçbir karakter çevrildikten sonra canvas içinde kaymamış.
- Sekiz dosya ayrı ayrı açılabiliyor; kaynaklar 8×8.

## Bilmen gereken küçük parça

Bir karakter her zaman sağa bakamaz. Sola yürüdüğünde, sola saldırdığında ters yöne dönmesi gerekir. Aseprite'ta bu tek menü seçeneği — ama **her sprite çevirmeye uygun değildir.**

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/flip-row-right.svg" width="256" height="64" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Dört karakter sağa bakıyor: mage, warrior, priest, archer." /></div>
    <figcaption><strong>1 · Özgün yön</strong><br />Kadronun tamamı sağa bakıyor. Warrior'ın kılıcı, priest'in asası ve archer'ın yayı sağda.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/flip-row-left.svg" width="256" height="64" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Aynı dört karakter kendi kareleri içinde sola çevrilmiş." /></div>
    <figcaption><strong>2 · Çevrilmiş</strong><br />Her karakter kendi 8×8 karesi içinde çevrildi. Silah ve asa sola geçti; mage'in yüzü de yer değiştirdi.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/flip-pair.svg" width="204" height="96" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Sağa ve sola bakan archer yan yana." /></div>
    <figcaption><strong>3 · Yakından</strong><br />Archer'ın iki yönü yan yana. Karakterin kimliği ikisinde de aynı kalmalı.</figcaption>
  </figure>
</div>

Simetrik olanlar sorunsuz: slime, coin, kalp. Kadroda ise dört ayrı karar var ve dördü aynı değil.

**Archer** en kolayı: yay atış yönündedir, çevrilince sola geçer ve bu doğrudur. **Warrior** aynı mantıkla çalışır; kılıç saldırı yönünü gösterir, o yüzden onun da yön değiştirmesi gerekir. Burada dikkat edeceğin şey elin kendisi değil, silahın nereyi gösterdiği.

**Priest** farklı. Asa bir silah değil, karakterin işareti — hep aynı elde durması beklenir. Çevirdiğinde asa karşı tarafa geçer; ya bunu kabul edersin ya da asayı çevirmeden özgün sütununa geri taşırsın. İkisi de geçerli bir karardır, kararsızlık olan tek şey hiç karar vermemektir.

**Mage** ise asimetrik bir eşya taşımadığı hâlde bozulur: yüzü sprite'ın tam ortasında değildir, bu yüzden çevirince bir sütun sağa kayar. Bu, çevirmenin en sinsi bedeli — kaybolan parça değil, yerinden oynayan karakterin kendisi. Çözümü çevirmeden önce sprite'ı canvas içinde ortalamaktır.

Çevirmenin bir bedeli daha var: ışık yönü de çevrilir. 1.13'te tek ışık yönü çalıştıysan, çevrilmiş sprite'ta ışık ters taraftan gelir. 8×8'de bu çoğu zaman göze çarpmaz; bir gün çarparsa çözüm, gölgeyi çevirdikten sonra elle düzeltmektir.

## Sınırlar

Yalnız yatay çevirme. Yukarı ve aşağı bakan pozlar, dört yönlü set ve döndürme bu göreve girmiyor.

::: details İpucu 1 — Çevrilmiş karakter yabancı görünüyor
Asimetrik bir parça yanlış tarafa geçmiş olabilir. O parçayı çevirmeden özgün tarafına geri taşı.
:::

::: details İpucu 2 — Asa yanlış ele geçti
Karar senin: ya asayı geri taşı ya da priest'in her iki elinde de asa tutabildiğini kabul et. İkisi de geçerli, kararsızlık değil.
:::

::: details İpucu 3 — Çevirdikten sonra karakter kayıyor
Sprite canvas içinde ortalanmamış demektir; mage'de bu kesin olur. Önce sprite'ı yatayda ortala, sonra çevir.
:::

## Birincil kaynak

[Aseprite — Flip](https://www.aseprite.org/docs/flip/).
`RESOURCES.md` içindeki bu belge, `Edit > Flip Horizontal` (`Shift+H`) ile sprite'ı veya seçimi yatayda çevirmeyi açıklar; [Transformations](https://www.aseprite.org/docs/transformations/) dönüşümlerin tamamını listeler. Dört karakterin her birinde asimetrik parçaya dair karar bu dersin konusudur.

**Kazanım:** Kadronun tamamı iki yöne de bakabiliyor ve çevirmenin her karakterde neyi bozduğunu biliyorsun.

**“Pixel Art 1.52 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.53 — Dört frame'lik yürüyüş döngüsü kur](/pixel-art/53-walk-cycle).
