---
title: "1.9 — Silüet testi yap"
description: "Çizimlerini tek renge boyayarak şeklin tek başına yeterli olup olmadığını ölç."
section: Teknik · okunurluk
---

# {{ $frontmatter.title }}

**Hedef:** Bir çizimin okunurluğunu renkten bağımsız olarak sına.

## Görev

1.1–1.8 arasında çizdiğin nesneleri tek bir 56×8 dosyaya yan yana kopyala. Sonra bir kopyasında bütün dolu pixel'leri `#e9dfc2` yap. İki hâli karşılaştır ve hangi nesnenin silüetten tanınmadığını not et. `art/craft/silhouette-test.aseprite` olarak kaydet.

## Ne zaman bitti?

- Renkli ve tek renkli iki hâl de aynı dosyada veya iki frame'de duruyor.
- Tek renkli hâlde nesnelerin çoğu birbirinden ayırt edilebiliyor.
- Ayırt edilemeyen nesnede hangi parçanın kaybolduğu belirlenmiş.

## Bilmen gereken küçük parça

Küçük bir sprite oyunda çoğu zaman kalabalık bir zeminin üstünde, hızla hareket ederken görünür. O anda oyuncunun gördüğü şey ayrıntı değil **dış şekildir.**

Silüet testi bunu ölçmenin en hızlı yolu: bütün renkleri tek renge indir. Kalan şekil hâlâ tanınıyorsa çizim sağlamdır. Tanınmıyorsa sorun renkte değil, dış hatta; rengi düzeltmek o çizimi kurtarmaz. Bu test her çizim için çalışır — nesne, karakter, ikon ya da UI parçası fark etmez.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/objects-color.svg" width="448" height="64" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Yedi nesne kendi renkleriyle yan yana." /></div>
    <figcaption><strong>1 · Renkli hâl</strong><br />Anahtar, kılıç, kalp, şişe, kalkan, sandık ve coin. Her biri renkleriyle tanınıyor.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/objects-solid.svg" width="448" height="64" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Aynı yedi nesnenin tek renge boyanmış silüeti." /></div>
    <figcaption><strong>2 · Silüet</strong><br />Aynı yedi şekil, tek renk. Hangileri hâlâ tanınıyor, hangileri kutuya dönüştü?</figcaption>
  </figure>
</div>

Sonuca göre düzeltme küçük olur: bir pixel'lik boşluk açmak, bir parçayı bir pixel uzatmak veya bir ayrıntıyı tamamen silmek. `Edit > Replace Color` ile bütün renkleri tek seferde tek renge indirip testi saniyeler içinde yapabilirsin. Aynı testi ileride karakterlerine ve UI parçalarına da uygulayacaksın.

## Sınırlar

Yalnız ölçme ve küçük düzeltme. Yeniden tasarım ve renk çalışması bu göreve girmiyor.

::: details İpucu 1 — Bütün nesneler aynı kutu gibi görünüyor
Şekiller fazla dolu olabilir. Dış hatta boşluk aç: bir çentik, bir daralma veya bir çıkıntı.
:::

::: details İpucu 2 — Test bir şey söylemiyor gibi
Tek renkli hâle uzaktan veya %100 zoom'da bak. Yakından bakınca göz şekli ezberden tamamlar.
:::

::: details İpucu 3 — Ne düzelteceğimi bulamıyorum
İki hâli yan yana koy ve yalnız kaybolan parçayı ara. Kaybolan parça, ayrılması gereken parçadır.
:::

## Birincil kaynak

[Pedro Medeiros — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/).
`RESOURCES.md` içindeki bu kaynak, küçük bir sprite'ı önce dış şekille kurma yaklaşımı için kullanıldı. Testin bu nesneler üzerinde uygulanışı bu dersin seçimidir.

**Kazanım:** Elinde, çizdiğin her şeye uygulayabileceğin hızlı bir okunurluk ölçüsü var.

**“Pixel Art 1.9 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.10 — Kenarlığın farkını gör](/pixel-art/10-outline).
