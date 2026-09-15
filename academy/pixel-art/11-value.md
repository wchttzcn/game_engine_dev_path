---
title: "1.11 — Üç value ile ayır"
description: "8×8 şişede tıpa, gövde ve sıvıyı üç gri tonla ayır."
section: Teknik · renk ve hacim
---

# {{ $frontmatter.title }}

Bu küçük renk çalışması isteğe bağlı. Şekil çizmeye devam etmek istersen
[1.6 — 8×8 kalkan çiz](/pixel-art/06-shield) dersine geçebilirsin.

**Hedef:** Renk ailesi seçmeden, açık–orta–koyu ayrımıyla şişenin parçalarını okunur yap.

## Görev

Şişe çizimini aç. `File > Save As` ile `art/pickups/potion-value.aseprite`
olarak kaydet. Tıpayı açık, gövdeyi orta, alttaki sıvı alanını koyu gri boya.
İlk denemede aşağıdaki üç rengi aynen kullanabilirsin.

## Ne zaman bitti?

- Şişe 8×8; dış şekli korunmuş.
- Tıpa, gövde ve alttaki sıvı alanı üç gri tonla birbirinden seçiliyor.
- Kaynak dosyan kaydedilmiş. Gerçekçi cam veya gölge çizmen gerekmiyor.

## Bilmen gereken küçük parça

Bir çizimde açık ve koyu alanların ilişkisine **value** açısından bakabiliriz.
Şimdilik gri kullanıyoruz: tıpayı kırmızı, sıvıyı mavi yapmadan da iki alanın
ayrılıp ayrılmadığını görebileceğiz. Birbirine çok yakın üç gri, üç ayrı alan
olmasına rağmen küçük görünümde birleşebilir.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/color/potion-flat.svg" width="128" height="128" alt="Şişenin bütün parçaları aynı griyle dolu." /></div>
    <figcaption><strong>1 · Dış şekli koru</strong><br />Tek tonla başladığında iç parçalar birleşir.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/color/potion-close.svg" width="128" height="128" alt="Tıpa, gövde ve sıvı birbirine yakın gri tonlarda." /></div>
    <figcaption><strong>2 · Yakın tonları karşılaştır</strong><br />Alanlar var; aralarındaki fark küçük.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/color/potion-value.svg" width="128" height="128" alt="Tıpa açık gri, gövde orta gri ve alt iki dolu satır koyu gri." /></div>
    <figcaption><strong>3 · Arayı aç</strong><br />Tıpa açık, gövde orta, alttaki sıvı koyu.</figcaption>
  </figure>
</div>

Foreground color kutusunu açıp hex alanından renk girebilirsin:
**tıpa `#EEEEEE`**, **gövde `#999999`**, **sıvı `#444444`**.
Pencil ile mevcut dolu pixel'leri boya. Sıvı, örnekte en alttaki iki dolu
satırı kaplıyor. Sayfadaki koyu zemin yalnız görmeyi kolaylaştırır; dosyanın
boş alanları transparent kalabilir.

## Sınırlar

Üç gri, bu denemede ayrımı tek başına görmen için seçildi. Her asset'in
mutlaka üç tonu olması gerekmez. İhtiyaç yoksa yeni renk eklemeyiz.

::: details İpucu 1 — Parçalar hâlâ birleşiyor
Önce küçük görünümde hangi iki alanın birleştiğine bak. Yalnız aralarındaki
açık–koyu farkını artır; dış şekli değiştirmene gerek yok.
:::

::: details İpucu 2 — Renkler farklı ama fark az
Üç ayrı gri seçmek yeterli olmayabilir. Birini belirgin açık, birini orta,
birini belirgin koyu seçerek aralarında boşluk bırak.
:::

::: details İpucu 3 — Başlangıç değerleri gerekli
En üst dört pixel'i `#EEEEEE`, şişenin kalanını `#999999` boya.
Alt iki dolu satırı `#444444` yap. Örneği aynen uygulamak yeterli.
:::

::: details Deep Dive — HSV içindeki V ile aynı şey mi?
HSV içindeki V bir renk modelinin sayısal kontrolüdür. Birbirinden farklı
hue'larda aynı V, göze aynı açıklıkta görünmeyebilir. Renk seçmeye geçtiğimizde
hem sayıya hem yan yana duran renklere bakacağız; [renk rehberinde](/pixel-art/color-guide)
bunun görsel örnekleri var.
:::

## Birincil kaynak

[Arne Niklas Jansson — PSG Art tutorial](https://androidarts.com/art_tut.htm).
`RESOURCES.md` içindeki bu kaynağın Values bölümü, renk ayrıntısından önce
açık–koyu ilişkileriyle okunurluk kurmayı destekler. Hex girişi için
[Aseprite Color Bar](https://www.aseprite.org/docs/color-bar/) kullanılır.

**Kazanım:** Bir nesnenin parçalarını az sayıda value ile ayırdın.

**“Pixel Art 1.11 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.12 — Kendi renk rampanı kur](/pixel-art/12-color-ramp).
