---
title: "1.55 — Düşen coin'i çiz"
description: "Aynı coin'i yalnız yukarı aşağı taşıyarak loot düşme hissi kur."
section: Idle oyun · eşya ve monster
---

# {{ $frontmatter.title }}

**Hedef:** Tek bir sprite'ı taşıyarak, yeni çizim yapmadan hareket üret.

**Önce şu teknik:** [1.16 — Coin'i dört frame'de döndür](/pixel-art/16-coin-spin) — Aynı coin, bu kez dönmek yerine taşınıyor.

## Görev

8×8 transparent RGB dosyada dört frame kur. 1.8'deki coin'i her frame'de farklı yükseklikte göster; son frame'de yalnız birkaç pixel kalsın. Frame süreleri 80, 110, 90 ve 200 ms olsun. `art/fx/coin-drop.aseprite` olarak kaydet.

## Ne zaman bitti?

- Coin ilk frame'de altta, ikinci frame'de en yukarıda, üçüncü frame'de yeniden altta.
- Hiçbir frame'de coin canvas dışına taşmıyor.
- Son frame'de coin yerine iki küçük parça kalmış; kaynak 8×8.

## Bilmen gereken küçük parça

Idle oyunun tekrar eden olayı loot düşmesidir. Bunun için yeni bir çizime gerek yok: **var olan ikonu taşımak yeterli.**

Zıplama üç konumdan oluşur: aşağı, yukarı, aşağı. Ortadaki frame'in biraz uzun kalması, coin'in tepede asılı kaldığı hissini verir; yerçekimi orada en yavaştır. Son frame'de ikonu parçalara indirmek, coin'in toplandığını söyler.

<PixelAnimation title="Coin düşüşü" :frames='[{"src":"/pixel-art/fx/coin-drop-1.svg","label":"Yerde","duration":80,"alt":"Coin canvas&#39;ın altına yakın duruyor."},{"src":"/pixel-art/fx/coin-drop-2.svg","label":"Tepe","duration":110,"alt":"Aynı coin iki pixel yukarıda; en uzun süre burada."},{"src":"/pixel-art/fx/coin-drop-3.svg","label":"İniş","duration":90,"alt":"Coin yeniden alt konuma dönmüş."},{"src":"/pixel-art/fx/coin-drop-4.svg","label":"Toplandı","duration":200,"alt":"Coin yerine iki küçük altın parça kalmış."}]' />

Sprite'ı taşımak için her frame'de yeniden çizmen gerekmez: `Frame > Duplicate Cels` ile kopyala, sonra seçip ok tuşlarıyla kaydır. Aynı yöntem kalp, iksir veya herhangi bir eşya ikonu için de çalışır.

## Sınırlar

Yalnız dikey zıplama. Yana savrulma, gölge, sayı gösterimi ve toplanma sesi bu göreve eklenmiyor.

::: details İpucu 1 — Coin kırpılıyor
Yukarı taşırken bir pixel yetiyor. İki pixel'den fazlası 8×8'de üst kenarı keser.
:::

::: details İpucu 2 — Zıplama mekanik duruyor
Tepedeki frame'in süresini biraz uzat. Eşit süreler zıplamayı asansör gibi gösterir.
:::

::: details İpucu 3 — Tam yerleşim
Alt konumda coin 3–8. satırlar arasında. Tepede aynı şekil bir satır yukarıda. Son frame'de 6. satırda 3–4. sütunlar ve 7. satırda 5–6. sütunlar dolu.
:::

## Birincil kaynak

[Aseprite — New Frame](https://www.aseprite.org/docs/new-frame/).
`RESOURCES.md` içindeki bu belge, yeni ve kopyalanmış frame oluşturmayı açıklar; [Frame Duration](https://www.aseprite.org/docs/frame-duration/) süreler içindir. Zıplama yüksekliği ve süre dağılımı bu dersin seçimidir.

**Kazanım:** Elinde, var olan her ikondan üretebileceğin bir loot animasyonu kalıbı var.

**“Pixel Art 1.55 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.56 — Level up parıltısı çiz](/pixel-art/56-level-up).
