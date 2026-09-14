---
title: "1.1 — 8×8 anahtarını çiz"
description: "Görsel adımları takip ederek 8×8 canvas'ta küçük bir oyun anahtarı çiz."
section: 8×8 başlangıç
---

# {{ $frontmatter.title }}

**Hedef:** Bir anahtarı 8×8 pixel içinde tanınabilir bir şekle dönüştür.

## Görev

Aşağıdaki örneği takip ederek Aseprite'te tek renkli bir anahtar çiz.
İlk denemende örneği aynen yapabilirsin. Çizimini
`art/first-key/key.aseprite` olarak kaydet; klasörü ilk kayıtta oluşturabilirsin.

<div class="pixel-preview">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/key/key.svg" width="128" height="128" alt="Büyütülmüş anahtar: solda ortası boş halka, sağa uzanan sap ve aşağı bakan iki diş." /></div>
    <figcaption>Çizerken büyütülmüş görünüm · %1600</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/key/key.svg" width="8" height="8" alt="Aynı anahtar gerçek 8×8 pixel boyutunda." /></div>
    <figcaption>Aynı çizim · %100, 8×8 pixel</figcaption>
  </figure>
</div>

## Ne zaman bitti?

- Canvas 8×8; anahtarın halkası, sapı ve dişleri birbirine bağlı.
- Halkanın ortasında boşluk var; küçük görünümde şekil ayırt ediliyor.
- `.aseprite` dosyan kaydedilmiş. Örneğin oranlarını değiştirmek zorunda değilsin.

## Bilmen gereken küçük parça

8×8 canvas, her yönde sekiz pixel verir. Çizerken zoom'u büyütürüz;
dosya hâlâ 8×8 kalır. Buradaki anahtarın kimliğini halka ve dişler taşıyor.
Az sayıda pixel'i bu belirgin parçalara ayırarak şekli kuracağız.

### Aseprite'i hazırla

1. `File > New` aç. **Width: 8**, **Height: 8**, **RGB/RGBA**, **Transparent** seç.
2. Toolbar'dan **Pencil** seç; üstte brush size **1 px** olsun.
3. Soldaki palette'ten açık bir renge sol tıkla. Örnekteki sarıyı bulman şart değil.
4. Mouse wheel ile büyüt veya zoom alanını **%1600** yap. Yanlış pixel'i **Eraser** ile silebilirsin.

### Aynı şekli üç adımda kur

Görsellerdeki her kare canvas'taki bir pixel'e karşılık gelir. Soldan sağa
aynı çizime parça ekleniyor; üç ayrı dosya açmana gerek yok.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/key/body.svg" width="128" height="128" alt="Birinci adım: 3×3 halkanın çevresi çizili, ortadaki pixel boş." /></div>
    <figcaption><strong>1 · Halka</strong><br />3×3'lük bir karenin çevresini boya. Ortadaki tek pixel'i boş bırak.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/key/shaft.svg" width="128" height="128" alt="İkinci adım: halkanın sağ orta pixel'inden sağa uzanan dört pixel eklenmiş." /></div>
    <figcaption><strong>2 · Sap</strong><br />Halkanın sağ orta noktasından sağa doğru dört pixel ekle.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/key/key.svg" width="128" height="128" alt="Üçüncü adım: sapın altına aralarında bir boşluk olan iki diş eklenmiş." /></div>
    <figcaption><strong>3 · Dişler</strong><br />Sapın altına iki pixel ekle; aralarında bir boşluk bırak.</figcaption>
  </figure>
</div>

Zoom'u **%100** yapıp anahtarın küçüldüğünde nasıl göründüğüne bak.
Ardından `File > Save` ile `.aseprite` dosyanı kaydet. Bu büyütülmüş
örnekler ders için hazırlandı; çizimi kendi Aseprite dosyanda sen yapıyorsun.

## Sınırlar

8×8 ve tek renk, bu ilk denemede yalnız şeklin parçalarına odaklanmak için
seçildi. Gölge ve animasyon ihtiyacı geldiğinde onları ayrı ele alacağız.

::: details İpucu 1 — Şekle nereden başlayacağım?
Anahtarı tek seferde çizmeye çalışma. Önce soldaki halkayı kur; sonra sağa
uzanan sapı ekle. En son sapın altındaki küçük çıkıntılara geç.
:::

::: details İpucu 2 — Parçalar nasıl birleşiyor?
Halka, ortası boş 3×3 bir çerçeve. Sap halkanın sağ orta pixel'ine dokunur;
dişler de sapın altına dokunur. Böylece boşluk dışında kopuk bir parça kalmaz.
:::

::: details İpucu 3 — Parçalar sığmıyorsa
Halkanın sol üst pixel'ini soldan ikinci, üstten üçüncü kareye yerleştir.
Halka 3×3 yer kaplar; sap orta satırdan sağ kenara kadar uzar. Dişleri
sapın son pixel'inin ve ondan iki öncekinin altına koy.
:::

::: details Deep Dive — Saint11'i nasıl kullanacağız?
Saint11'in başlangıç yazısı, araçları ve küçük bir nesnenin çizimini görsel
olarak gösteriyor. İstersen yeni dosya ve Pencil bölümlerini onun ekran
görüntülerinden de takip et. Oradaki ilk canvas 16×16; burada senin seçtiğin
8×8 ile ve bu daha küçük nesneyle başlıyoruz. Kupa, kılıç ve diğer
örneklerin hepsini bitirmen gerekmiyor.
:::

## Birincil kaynak

[Pedro Medeiros — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/).
`RESOURCES.md` içindeki bu kaynak, az araçla küçük bir nesneyi görerek
çalışma yaklaşımını destekler; 8×8 anahtar bu dersin kendi örneğidir.
Araç ve zoom adımları Aseprite'ın
[New Sprite](https://www.aseprite.org/docs/new-sprite/),
[Drawing](https://www.aseprite.org/docs/drawing/) ve
[Zoom](https://www.aseprite.org/docs/zoom/) belgeleriyle doğrulandı.

**Kazanım:** Bir oyun nesnesini az sayıda pixel'le, görsel adımları takip ederek kurdun.

**“Pixel Art 1.1 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.2 — 8×8 PNG çıkar](/pixel-art/02-export).
