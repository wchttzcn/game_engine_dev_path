---
title: "1.45 — Priest'i ve iyileştirmesini birleştir"
description: "Yukarı giden bir efekt için canvas'ı yukarı uzat."
section: Idle oyun · skilleri bağla
---

# {{ $frontmatter.title }}

**Hedef:** Efektin yönünün canvas'ın biçimini nasıl belirlediğini gör.

**Önce şu teknik:** [1.15 — Sandığı iki frame ile aç](/pixel-art/15-chest-open) — Sabit parça priest, hareketli parça parıltı.

## Görev

8×16 bir dosyada dört frame kur: priest alt yarıda duruyor, asasını kaldırıyor, parıltı asadan ayrılıp yükseliyor, priest duruşuna dönüyor ve parıltı tepeye çıkıyor. Frame süreleri 220, 140, 160 ve 400 ms olsun. `art/craft/priest-combined.aseprite` olarak kaydet.

## Ne zaman bitti?

- Priest dört frame'de de alt yarıda, aynı satırlarda duruyor.
- Parıltı her frame'de bir öncekinden yukarıda; son frame'de üst kenara yakın.
- Canvas 8 geniş, 16 yüksek ve kaydedilmiş.

## Bilmen gereken küçük parça

Mage'in büyüsü sağa gitti, bu yüzden canvas'ı yana uzattık. Priest'in parıltısı **yukarı** gider — o hâlde canvas yukarı uzamalı.

Bu basit görünen karar bir kural taşıyor: **canvas'ın biçimini efektin yönü belirler.** Efekti sığmadığı bir kutuya sıkıştırmak yerine kutuyu efektin gittiği yöne büyütürsün. Oyunda karakter ve efekt yine ayrı 8×8 dosyalar olarak durur; bu birleşik dosya yalnız zamanlamayı ve yönü görmek için.

<PixelAnimation title="Priest — karakter ve parıltı birlikte" :frames='[{"src":"/pixel-art/craft/pcombine-1.svg","label":"Duruş","duration":220,"alt":"Priest alt yarıda duruyor; parıltı yok."},{"src":"/pixel-art/craft/pcombine-2.svg","label":"Hazırlık","duration":140,"alt":"Asa kalktı; ucunda ışık belirdi."},{"src":"/pixel-art/craft/pcombine-3.svg","label":"Yükselme","duration":160,"alt":"Parıltı asadan ayrıldı ve yükselmeye başladı."},{"src":"/pixel-art/craft/pcombine-4.svg","label":"Tepe","duration":400,"alt":"Priest duruşuna döndü; parıltı üst kenara ulaştı."}]' />

Parıltının priest'ten önce durması, sonra ondan bağımsız yükselmesi mage'in büyüsüyle aynı ayrımdır: karakter efekti başlatır, efekt kendi ömrünü yaşar. Fark yalnız yön. İyileştirmenin kime yapıldığı oyunun kararı; çizim bunu söylemek zorunda değil.

## Sınırlar

Tek karakter ve tek efekt. Hedefin canının artması, sayı gösterimi ve ikinci bir karakter bu göreve girmiyor.

::: details İpucu 1 — Parıltı priest'in içinde kalıyor
Yükselmeye asanın ucundan başla, gövdenin ortasından değil.
:::

::: details İpucu 2 — Canvas dar geliyor
Efekt yukarı gidiyorsa yüksekliği artır. 8×8'e sıkıştırmak yükselmeyi bir pixel'e indirir.
:::

::: details İpucu 3 — Priest her frame'de oynuyor
Priest'i alt yarıda sabitle; yalnız asa ve parıltı değişsin.
:::

## Birincil kaynak

[Aseprite — Layers](https://www.aseprite.org/docs/layers/).
`RESOURCES.md` içindeki bu belge, iki çizimi ayrı katmanlarda üst üste oynatmayı açıklar; [New Sprite](https://www.aseprite.org/docs/new-sprite/) canvas ölçüsünü seçmek içindir. 8×16 seçimi ve süre dağılımı bu dersin kararıdır.

**Kazanım:** Canvas ölçüsünü efektin yönüne göre seçebiliyorsun.

**“Pixel Art 1.45 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.46 — Archer'ı, okunu ve isabetini birleştir](/pixel-art/46-archer-combine).
