---
title: "1.60 — İki frame'lik bat çiz"
description: "Kanatları yukarı ve aşağı alarak yerinde duran bir uçuş kur."
section: Idle oyun · eşya ve monster
---

# {{ $frontmatter.title }}

**Hedef:** İki frame ile havada durma hissi üret.

**Önce şu teknik:** [1.15 — Sandığı iki frame ile aç](/pixel-art/15-chest-open) — Gövde sabit, kanatlar hareketli.

## Görev

8×8 transparent RGB dosyada iki frame'lik bat çiz. Gövde ve kanatlar için `#aa83bf`, gözler için `#182e33` kullan. Frame süreleri 140 ve 140 ms olsun. `art/monsters/bat.aseprite` olarak kaydet.

## Ne zaman bitti?

- İki frame'de de gövde ve gözler aynı yerde duruyor.
- Kanat uçları bir frame'de gövdeden yukarıda, diğerinde aşağıda.
- Kanat açıklığı canvas'ın iki kenarına değiyor; kaynak 8×8.

## Bilmen gereken küçük parça

Slime yerde durur, bat havada. Bu farkı anlatan şey gövde değil **kanatların gövdeye göre konumu.**

Uçuş için iki frame yeter: kanatlar yukarıda ve aşağıda. Gövdenin sabit kalması önemli; gövde de oynarsa bat yerinde durmaz, savrulur. İki uç poz arasındaki fark ne kadar büyükse hareket o kadar net okunur.

<PixelAnimation title="Bat — kanat çırpma" :frames='[{"src":"/pixel-art/monsters/bat-1.svg","label":"Kanat yukarı","duration":140,"alt":"Kanat uçları gövdenin üstüne çıkmış."},{"src":"/pixel-art/monsters/bat-2.svg","label":"Kanat aşağı","duration":140,"alt":"Kanatlar gövdenin altına inmiş; açıklık genişlemiş."}]' />

1.26'daki mage idle'ında ayaklar sabitti, gövde oynuyordu; burada tam tersi. Hangi parçanın sabit kalacağı, hareketin ne olduğunu belirler. İki frame'in eşit süreli olması kanat çırpmayı düzenli gösterir.

## Sınırlar

Yalnız yerinde uçuş. İleri hareket, dalış, ses ve gölge bu göreve eklenmiyor.

::: details İpucu 1 — Bat yerinde durmuyor
Gövde ve gözler iki frame'de de aynı pixel'lerde olmalı. Yalnız kanatlar değişir.
:::

::: details İpucu 2 — Kanat çırpma görünmüyor
İki poz arasındaki fark çok küçük. Kanat uçlarını gövdenin belirgin biçimde üstüne ve altına taşı.
:::

::: details İpucu 3 — Tam yerleşim
Gövde 4–5. satırlarda 3–6. sütunlar, gözler 4. satırda 4. ve 5. sütunlar. Kanat yukarı frame'inde uçlar 2. satırda 1. ve 8. sütunlarda; kanat aşağı frame'inde 5. satırda.
:::

## Birincil kaynak

[Aseprite — Animation](https://www.aseprite.org/docs/animation/).
`RESOURCES.md` içindeki bu belge, frame sırası ve playback için kullanıldı; [Onion Skinning](https://www.aseprite.org/docs/onion-skinning/) iki pozu üst üste görmek içindir. Kanat pozları bu dersin seçimidir.

**Kazanım:** Kadroda artık yerde duran ve havada duran iki farklı düşman var.

**“Pixel Art 1.60 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.61 — Sandıktan mimic çıkar](/pixel-art/61-mimic).
