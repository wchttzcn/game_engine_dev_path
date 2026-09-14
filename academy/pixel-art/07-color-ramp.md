---
title: "1.7 — Kendi renk rampanı kur"
description: "Bir temel renkten, birlikte kullanılabilecek koyu ve açık renkler üret."
section: İsteğe bağlı renk çalışmaları
---

# {{ $frontmatter.title }}

Bu küçük renk çalışması isteğe bağlı. Karakter derslerindeki hazır renkleri
kullanmak için ramp kurmayı öğrenmiş olman gerekmiyor.

**Hedef:** Bir temel rengin yanına ondan ayrılan koyu ve açık bir renk seç.

## Görev

8×8 transparent RGB canvas'ta **koyu → orta → açık** üç şerit çiz.
`art/pickups/color-ramp.aseprite` olarak kaydet. Örnekteki maviyi başlangıç
alabilirsin; sonraki derste bu renklerle kalbine hacim vereceğiz.

## Ne zaman bitti?

- Üç şerit aynı renk ailesinde; koyu–orta–açık sırası gözle seçiliyor.
- Her şerit tek renkle dolu ve şeritler arasında boşluk var.
- Canvas 8×8 ve kaynak dosyan kaydedilmiş; script kullanmak zorunlu değil.

## Bilmen gereken küçük parça

**Color ramp**, birbiriyle ilişkili renklerin sırasıdır. Bu ilk rampada hue
ve saturation'ı sabit tutup yalnız HSV value'yu değiştireceğiz. Böylece
aynı nesnenin karanlık ve aydınlık alanları için küçük bir seçimimiz olacak.
Bu başlangıç yöntemi, her ışığın yalnız V artırılarak çizileceği anlamına gelmez.

![Koyu #243e59, orta #3d6b99 ve açık #5798d9 renkleri.](/pixel-art/color/blue-palette.svg)

1. Foreground color kutusunu aç; örnek temel renk olarak `#3D6B99` gir.
2. HSV görünümünde **H: 210°, S: %60, V: %60** değerlerini ayarla.
3. H ve S aynı kalırken V'yi **%35** yaparak koyuyu, **%85** yaparak açığı üret.
4. Pencil ile iki pixel genişliğinde, altı pixel yüksekliğinde üç şerit çiz.
   Aralarında birer sütun boş kalsın; ilk ve son satır boş olabilir.

<div class="pixel-preview">
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/color/ramp.svg" width="128" height="128" alt="8×8 canvas üzerinde aralarında bir sütun boşluk bulunan üç mavi şerit." /></div>
    <figcaption>Örnek çalışma · koyu, orta, açık</figcaption>
  </figure>
</div>

### Klavyeyle aynı kararı vermek

İstersen [Academy Color Keys kurulumu](/pixel-art/color-keys) ile bu adımı
klavyeye taşı. Temel maviden **W'ye beş kez** basmak V'yi %60'tan %85'e;
**S'ye beş kez** basmak %60'tan %35'e getirir. İki yönü de aynı temel
renkten başlat. Mouse ile çizgiyi çiz, bırak, rengi değiştir, sonraki çizgiyi çiz.

Renkleri yeniden kullanmak için **I** ile çizdiğin şeritten örnek alıp
**B** ile Pencil'e dönebilirsin. Palette'e her basışta yeni renk eklenmez;
bu küçük denemede şeritlerin kendisi renk örneğin olur.

## Sınırlar

İlk rampada üç renk ve tek hue kullanmak, açık–koyu sırasını görmeyi kolaylaştırır.
Script'in her ürettiği ara rengi asset'e ekleme; şu an kullanacağın üç rengi seç.

::: details İpucu 1 — Hangi maviyle başlayacağım?
Örnekteki orta maviyi kullanabilirsin. İlk hedef doğru başlangıç rengini
tahmin etmek değil, onun iki yanına ayrılan renkler yerleştirmek.
:::

::: details İpucu 2 — Koyu renk temel renge çok yakın
Bir tuş basışı yalnız beş yüzde puan değiştirir. Birkaç basışla arayı açıp
yan yana çizerek bak; yalnız sayıların farklı olması yeterli değil.
:::

::: details İpucu 3 — Aynı sonucu görmek istiyorum
Koyu için `#243E59`, orta için `#3D6B99`, açık için `#5798D9` kullan.
Script kullanmadan bu renkleri hex alanından girerek de görevi tamamlayabilirsin.
:::

::: details Deep Dive — Daha canlı rampalar
Bir sonraki denemede hue veya saturation da değişebilir. Örneğin ışık ve
gölgeyi biraz farklı hue'lara taşıyabilirsin. Bu karar ışığa ve istediğin
görsel dile bağlıdır; [renk rehberinin hue shift bölümü](/pixel-art/color-guide#hue-shift)
isteğe bağlı devamdır.
:::

## Birincil kaynak

[Pedro Medeiros — Basic Color Theory](https://saint11.art/pixel_art_articles/article6/).
`RESOURCES.md` içindeki bu kaynak HSV kontrolleri ile shading renkleri arasındaki
ilişkiyi açıklar. Bu ders, o konunun tek hue'lu en küçük denemesidir.

**Kazanım:** Bir temel renkten, çiziminde kullanabileceğin küçük bir ramp ürettin.

**“Pixel Art 1.7 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.8 — Tek ışık yönüyle hacim ver](/pixel-art/08-shading).
