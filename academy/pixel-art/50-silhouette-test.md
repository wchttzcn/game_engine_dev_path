---
title: "1.50 — Silüet testi yap"
description: "Çizimlerini tek renge boyayarak şeklin tek başına yeterli olup olmadığını ölç."
section: Aynı çizimde derinleşme
---

# {{ $frontmatter.title }}

**Hedef:** Bir çizimin okunurluğunu renkten bağımsız olarak sına.

## Görev

1.11–1.14'teki dört karakteri tek bir 32×8 dosyaya yan yana kopyala. Sonra bir kopyasında bütün dolu pixel'leri `#e9dfc2` yap. İki dosyayı karşılaştır ve hangi karakterin silüetten tanınmadığını not et. `art/craft/silhouette-test.aseprite` olarak kaydet.

## Ne zaman bitti?

- Renkli ve tek renkli iki hâl de aynı dosyada veya iki frame'de duruyor.
- Tek renkli hâlde en az üç karakter birbirinden ayırt edilebiliyor.
- Ayırt edilemeyen karakterde hangi parçanın kaybolduğu belirlenmiş.

## Bilmen gereken küçük parça

Küçük bir sprite oyunda çoğu zaman kalabalık bir zeminin üstünde, hızla hareket ederken görünür. O anda oyuncunun gördüğü şey ayrıntı değil **dış şekildir.**

Silüet testi bunu ölçmenin en hızlı yolu: bütün renkleri tek renge indir. Kalan şekil hâlâ tanınıyorsa çizim sağlamdır. Tanınmıyorsa sorun renkte değil, dış hatta; rengi düzeltmek o çizimi kurtarmaz.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/heroes-color.svg" width="256" height="64" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Dört karakter kendi renkleriyle yan yana." /></div>
    <figcaption><strong>1 · Renkli hâl</strong><br />Mage, warrior, priest ve archer yan yana. Her biri renkleriyle tanınıyor.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/heroes-solid.svg" width="256" height="64" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Aynı dört karakterin tek renge boyanmış silüeti." /></div>
    <figcaption><strong>2 · Silüet</strong><br />Aynı dört şekil, tek renk. Şapka, kalkan, cübbe ve yay hâlâ görünüyor mu?</figcaption>
  </figure>
</div>

Sonuca göre düzeltme küçük olur: bir pixel'lik boşluk açmak, bir parçayı bir pixel uzatmak veya bir ayrıntıyı tamamen silmek. `Edit > Replace Color` ile bütün renkleri tek seferde tek renge indirip testi saniyeler içinde yapabilirsin.

## Sınırlar

Yalnız ölçme ve küçük düzeltme. Yeniden tasarım, poz değişikliği ve renk çalışması bu göreve girmiyor.

::: details İpucu 1 — Bütün karakterler aynı kutu gibi görünüyor
Rol işaretleri gövdeye çok yapışık olabilir. Şapka, yay veya asayı gövdeden bir pixel ayır.
:::

::: details İpucu 2 — Test bir şey söylemiyor gibi
Tek renkli hâle uzaktan veya %100 zoom'da bak. Yakından bakınca göz şekli ezberden tamamlar.
:::

::: details İpucu 3 — Ne düzelteceğimi bulamıyorum
İki hâli yan yana koy ve yalnız kaybolan parçayı ara. Kaybolan parça, ayrılması gereken parçadır.
:::

## Birincil kaynak

[Pedro Medeiros — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/).
`RESOURCES.md` içindeki bu kaynak, küçük bir sprite'ı önce dış şekille kurma yaklaşımı için kullanıldı. Testin bu dört karakter üzerinde uygulanışı bu dersin seçimidir.

**Kazanım:** Elinde, çizdiğin her şeye uygulayabileceğin hızlı bir okunurluk ölçüsü var.

**“Pixel Art 1.50 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.51 — Kenarlığın farkını gör](/pixel-art/51-outline).
