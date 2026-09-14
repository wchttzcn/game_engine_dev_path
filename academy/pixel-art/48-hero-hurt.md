---
title: "1.48 — Hurt ve death'i kadroya taşı"
description: "Slime'da öğrendiğin vuruş ve ölüm tepkisini karakterlere uygula."
section: Idle oyun · kadroyu tamamla
---

# {{ $frontmatter.title }}

**Hedef:** Karakterlerin de vurulduğunu ve düştüğünü göster.

**Önce şu teknik:** [1.17 — Aynı frame'leri üç farklı süreyle dene](/pixel-art/17-timing) — Flash bir kare sürer; ölüm kademeleri süreyle kurulur.

## Görev

1.58'deki flash'ı ve 1.59'daki çöküşü warrior üzerinde kur. 8×8 bir dosyada iki frame'lik hurt (normal ve `#ffe5a3` flash), ayrı bir dosyada dört frame'lik death çiz. `art/characters/warrior-hurt.aseprite` ve `warrior-death.aseprite` olarak kaydet.

## Ne zaman bitti?

- Hurt frame'inde siluet birebir aynı; yalnız renk değişmiş.
- Death dört frame'de ayakta, çöküş, yığılma ve dağılma gösteriyor.
- Her frame'de kalan kütle alt kenara yaslı; kaynaklar 8×8.

## Bilmen gereken küçük parça

Monster'ın vurulduğunu ve öldüğünü çizdin. Karakterinki hiç çizilmedi — oysa idle oyunda **karakter de hasar alır.**

Yöntem birebir aynı: flash için siluetin tamamını tek açık renge boya, ölüm için gövdeyi kademe kademe alçalt. Fark yalnız şu: bir karakter slime gibi yayılarak değil, **dizleri bükülerek** çöker. Önce boyu kısalır, sonra yere yığılır.

<PixelAnimation title="Warrior — ölüm" :frames='[{"src":"/pixel-art/craft/death-1.svg","label":"Ayakta","duration":120,"alt":"Warrior normal duruyor."},{"src":"/pixel-art/craft/death-2.svg","label":"Çöküş","duration":120,"alt":"Gövde alçalmış, bacaklar kaybolmuş."},{"src":"/pixel-art/craft/death-3.svg","label":"Yığılma","duration":140,"alt":"Yere yayılmış iki satırlık kütle."},{"src":"/pixel-art/craft/death-4.svg","label":"Dağılma","duration":300,"alt":"Alt satırda birkaç ayrı pixel kalmış."}]' />

Aynı iki dosyayı priest, archer ve mage için de üretmek yeni bir karar gerektirmez; siluet değişir, kademeler aynı kalır. Flash'ı ayrı bir dosyada tutmak işini kolaylaştırır: tek bir frame, her karakter için tekrar.

## Sınırlar

Hurt iki frame, death dört frame. Geri savrulma, kan, yeniden doğma ve hasar sayısı bu göreve girmiyor.

::: details İpucu 1 — Karakter slime gibi eriyor
Önce boyu kısalt, sonra yere yay. Bir gövde yandan değil yukarıdan çöker.
:::

::: details İpucu 2 — Flash'ta karakter tanınmıyor
Bu normal; flash tek karelik. Siluet aynı kaldığı sürece göz karakteri hatırlar.
:::

::: details İpucu 3 — Tam yerleşim
Çöküşte gövde 4–8. satırlar. Yığılmada 7–8. satırlar. Dağılmada yalnız 8. satırda dört ayrı pixel.
:::

## Birincil kaynak

[Aseprite — Replace Color](https://www.aseprite.org/docs/replace-color/).
`RESOURCES.md` içindeki bu belge, bütün renkleri tek seferde değiştirmeyi açıklar; [Animation](https://www.aseprite.org/docs/animation/) frame sırası içindir. Çöküşün kademeleri bu dersin seçimidir.

**Kazanım:** Kadro artık hasar alıyor ve düşüyor. Dövüşün iki tarafı da görünür.

**“Pixel Art 1.48 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.49 — Karakteri sola çevir](/pixel-art/49-hero-flip).
