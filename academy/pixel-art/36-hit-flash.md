---
title: "1.36 — Hasar flash'ı çiz"
description: "Siluetin tamamını tek renge boyayarak vuruş anını göster."
section: Tepki ve geri bildirim
---

# {{ $frontmatter.title }}

**Hedef:** Bir düşmanın vurulduğunu, şeklini hiç değiştirmeden anlat.

## Görev

1.24'teki slime'ı 8×8 yeni bir dosyaya kopyala ve iki frame kur. İlk frame normal renkleriyle kalsın; ikinci frame'de bütün dolu pixel'ler `#ffe5a3` olsun. Süreler 320 ve 60 ms olsun. `art/fx/hit-flash.aseprite` olarak kaydet.

## Ne zaman bitti?

- İki frame'de de siluet birebir aynı; tek pixel eklenmemiş veya çıkarılmamış.
- Flash frame'inde göz dâhil bütün dolu alan tek renkte.
- Flash frame'i normal frame'den belirgin biçimde kısa; kaynak 8×8.

## Bilmen gereken küçük parça

Idle oyunda çarpışma sayılarla olur, ama oyuncu ekranda bir şey görmezse vuruş olmamış gibi hisseder. En ucuz geri bildirim **flash'tır:** bir kare boyunca siluetin tamamı tek açık renge boyanır.

Flash'ın işe yaraması için şeklin değişmemesi gerekir. Değişen tek şey renk olduğunda göz bunu darbe olarak okur; şekil de değişirse dönüşüm gibi görünür. Süre de kısa olmalı: uzun flash yanıp sönen bir hata gibi durur.

<PixelAnimation title="Slime — hasar flash'ı" :frames='[{"src":"/pixel-art/fx/flash-1.svg","label":"Normal","duration":320,"alt":"Slime kendi yeşil renkleriyle duruyor."},{"src":"/pixel-art/fx/flash-2.svg","label":"Flash","duration":60,"alt":"Aynı siluetin tamamı tek açık krem renge boyanmış."}]' />

`Edit > Replace Color` ile ikinci frame'deki her rengi tek seferde değiştirebilirsin; Tolerance değerini yükseltirsen yakın tonlar da birlikte değişir. Aynı flash her monster için çalışır: sprite değişir, yöntem aynı kalır.

## Sınırlar

Yalnız iki frame ve tek renk. Geri itilme, sayı gösterimi ve ekran sarsıntısı bu göreve eklenmiyor.

::: details İpucu 1 — Flash göze çarpmıyor
Renk yeterince açık değil. Karanlık zeminde en açık tonu seç ve süreyi kısa tut.
:::

::: details İpucu 2 — Slime başka bir şeye dönüşmüş gibi
Flash frame'inde şekil değişmiş olabilir. Kopyala-yapıştır ile başla, yalnız rengi değiştir.
:::

::: details İpucu 3 — Tam yerleşim
Siluet 1.24'teki slime ile birebir aynı. Flash frame'inde gözün koyu pixel'leri de açık renge boyanır.
:::

## Birincil kaynak

[Aseprite — Replace Color](https://www.aseprite.org/docs/replace-color/).
`RESOURCES.md` içindeki bu belge, bir rengi seçilen alanda veya bütün frame'lerde değiştirmeyi ve Tolerance alanını açıklar. Flash rengi ve süresi bu dersin seçimidir.

**Kazanım:** Elinde her monster'a uygulayabileceğin, tek karelik bir vuruş geri bildirimi var.

**“Pixel Art 1.36 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.37 — Slime'ın ölüşünü çiz](/pixel-art/37-slime-death).
