---
title: "1.13 — Tek ışık yönüyle hacim ver"
description: "8×8 kalpte aydınlık ve gölge alanlarını tek bir ışık yönüne göre yerleştir."
section: Teknik · renk ve hacim
---

# {{ $frontmatter.title }}

Bu küçük shading çalışması isteğe bağlı; sonraki nesne ve karakterleri
düz renklerle çizebilirsin.

**Hedef:** Açık ve koyu renkleri nesnenin her yanına dağıtmak yerine tek bir ışık yönüne göre yerleştir.

## Görev

Kalp çizimini aç. `File > Save As` ile `art/pickups/heart-shaded.aseprite`
olarak kaydet. Işığı **sol üstten** düşün; önceki rampanın orta rengiyle
başlayıp sağ alta gölge, sol üste küçük bir açık alan ekle.

## Ne zaman bitti?

- Canvas 8×8; kalbin çentiği ve dış şekli korunmuş.
- Aydınlık sol üstte, koyu alan sağ altta; ortada temel renk hâlâ görünür.
- En fazla üç renk kullanılmış ve kaynak dosyan kaydedilmiş.

## Bilmen gereken küçük parça

Bir renk rampası, ışığın nereye düştüğünü kendi başına söylemez. Bu kararı
şeklin üzerinde sen verirsin. Örnekte ışığa dönük üst-sol bölgeleri açıp
alt-sağ bölgeleri koyulaştırıyoruz. 8×8'de birkaç pixel yeterli; bütün kenarlara
aynı koyu çerçeveyi çekmek bu yönü belirsizleştirir.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/color/heart-base.svg" width="128" height="128" alt="Temel maviyle doldurulmuş 8×8 kalp." /></div>
    <figcaption><strong>1 · Temel renk</strong><br />Kalbin dolu alanlarını rampanın orta rengiyle boya.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/color/heart-shadow.svg" width="128" height="128" alt="Kalbin sağ alt kenarında ve alt ucunda koyu mavi gölge." /></div>
    <figcaption><strong>2 · Gölge</strong><br />Koyu rengi sağ ve alt tarafa yerleştir; üst kenarı çepeçevre koyulaştırma.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/color/heart-light.svg" width="128" height="128" alt="Kalbin sol üst çıkıntısında küçük açık mavi alan, sağ altında koyu gölge." /></div>
    <figcaption><strong>3 · Aydınlık</strong><br />Sol üst çıkıntıya küçük bir açık alan ekle. Orta rengi tamamen kapatma.</figcaption>
  </figure>
</div>

Bu, mavi bir oyun pickup'ı için stilize bir örnek. Şeffaf boşlukları boyama;
ışık oku veya background çizmen gerekmiyor. %100 görünümde kalbin şeklinin
renk eklenmeden önceki kadar seçilip seçilmediğine bak ve kaydet.

## Sınırlar

Tek ışık yönü ve üç renk, ilk hacim kararını görünür tutmak için.
Yansıma, yere düşen gölge ve dither bu küçük örneğin ön koşulu değil.

::: details İpucu 1 — Neresi açık olmalı?
Işığı bir kez sol üstte düşün. Önce yalnız gölgeyi karşı tarafa yerleştir;
aydınlık pixel'leri sonra ekleyebilirsin.
:::

::: details İpucu 2 — Kalp iç içe çerçevelere dönüştü
Üst kenarın tamamını koyu boyadıysan bir kısmını temel renge döndür.
Gölgeyi sağ-alt bölgede toplamak ışığın yönünü daha net gösterir.
:::

::: details İpucu 3 — Örneği nasıl tamamlarım?
Orta mavi `#3D6B99` ile başla. En alt iki pixel'i ve sağ alt kenarı
`#243E59` yap. Sol üst çıkıntıya örnekteki gibi `#5798D9` ekle.
:::

::: details Deep Dive — Shading ink ne zaman işe yarar?
Palette'inde kullanacağın ramp hazır olduğunda Aseprite'in kendi Shading ink'i
mevcut pixel renklerini o ramp içinde ilerletebilir. Academy Color Keys ise
çizmeden önce foreground rengini değiştirir. [Araç rehberindeki Shading ink bölümü](/pixel-art/color-keys#shading-ink)
bu farklı ihtiyacı küçük adımlarla gösterir; bu dersi bitirmek için kurulum gerekmez.
:::

## Birincil kaynak

[Pedro Medeiros — Basic Shading](https://saint11.art/pixel_art_articles/article4/).
`RESOURCES.md` içindeki bu kaynağın Identifying Faces ve Pillow shading bölümleri,
açık–koyu alanları belirli bir ışık yönüyle ilişkilendirmeyi destekler.

**Kazanım:** Şekil, renk rampası ve ışık yönünü küçük bir oyun asset'inde birleştirdin.

**“Pixel Art 1.13 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.14 — Dithering ile geçiş yap](/pixel-art/14-dithering).
