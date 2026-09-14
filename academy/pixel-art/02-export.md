---
title: "1.2 — 8×8 PNG çıkar"
description: "Aseprite kaynağından aynı ölçüde, transparent bir PNG üret."
section: 8×8 başlangıç
---

# {{ $frontmatter.title }}

**Hedef:** Çizdiğin anahtarı, düzenlenebilir kaynağını koruyarak 8×8 PNG olarak çıkar.

## Görev

`art/first-key/key.aseprite` dosyanı kaydet. `File > Export > Export As`
ile aynı klasöre `key.png` çıkar; **Resize: %100** seç. PNG'yi Aseprite'te
yeniden açıp anahtarın ölçüsünü ve görünümünü kontrol et.

## Ne zaman bitti?

- `.aseprite` kaynak dosyası ve `.png` çıktısı ayrı duruyor.
- PNG 8×8; halkanın deliği ve nesnenin çevresi transparent.
- PNG'yi açtığında kaynak çizimindeki anahtar aynı biçimde görünüyor.

## Bilmen gereken küçük parça

`.aseprite` çizime devam edeceğin kaynak, PNG ise burada tek frame'in
görünen sonucu. Çizerken %1600 zoom kullanman, dosyanın 128×128 olduğu
anlamına gelmez. Export'ta %100, kaynakta çizdiğin 8×8 ölçüsünü korur.

<div class="pixel-preview">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/key/key.svg" width="128" height="128" alt="Düzenleme sırasında büyütülmüş görünen anahtar." /></div>
    <figcaption><strong>Kaynak · key.aseprite</strong><br />Burada düzenlersin. Görsel %1600 büyütülmüş.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/key/key.svg" width="8" height="8" alt="Oyun çıktısının 8×8 boyutta görünüm örneği." /></div>
    <figcaption><strong>Çıktı · key.png</strong><br />Export %100 olduğunda pixel ölçüsü 8×8 kalır.</figcaption>
  </figure>
</div>

Export penceresi önceki ayarları hatırlayabilir; bu yüzden Resize alanına
bak. `File > Open` ile PNG'yi açtıktan sonra ölçüsünü kontrol et. Buradaki
iki görsel aynı çizimin farklı zoom'larda gösterimidir; senin PNG dosyan
kendi çiziminden üretilecek.

## Sınırlar

Tek frame ve %100 export ölçeği kullan. İlk küçük çıktının doğru ölçüde
olduğunu görmek yeterli; oyuna yükleme ihtiyaç geldiğinde ayrı bir adım olacak.

::: details İpucu 1 — PNG büyük görünüyorsa
Önce dosyanın ölçüsüne bak. 8×8 dosya da editörde yüksek zoom ile büyük
görünebilir; yalnız ekrandaki büyüklüğüne bakarak yeniden boyutlandırma.
:::

::: details İpucu 2 — Halkanın deliği doluysa
Kaynakta o pixel'i Eraser ile sil ve tekrar export et. Transparent
boşluk, anahtarın renginden farklı bir renkle doldurulmuş alan değildir.
:::

::: details İpucu 3 — PNG gerçekten 128×128 çıktıysa
Kaynak 8×8 ise canvas'ı değiştirme. Export penceresine dön, Resize'ı
%100 yap ve PNG'yi yeniden çıkar. Kaynak dosyan aynı kalabilir.
:::

::: details Deep Dive — Oyunda da bu kadar küçük mü görünecek?
Kaynak pixel ölçüsü ile oyunda çizileceği ölçü ayrı kararlardır. Bu 8×8
asset, daha sonra bir oyun ekranında büyütülerek gösterilebilir. İlk
entegrasyonda ölçek ve kenarların görünümünü o oyunun içinde ele alacağız.
:::

## Birincil kaynak

[Aseprite — Exporting](https://www.aseprite.org/docs/exporting/).
`RESOURCES.md` içindeki bu belge, kaynak dosyadan PNG üretimini,
hatırlanan export seçeneklerini ve Resize alanını açıklar.

**Kazanım:** Kendi çiziminin düzenlenebilir kaynağı ve 8×8 oyun çıktısı hazır. Aynı küçük canvas'ta farklı bir nesneyle devam edebilirsin.

**“Pixel Art 1.2 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.3 — 8×8 kılıç çiz](/pixel-art/03-sword).
