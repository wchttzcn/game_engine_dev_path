---
title: "1.46 — Warrior'ı ve kılıç izini birleştir"
description: "Karakterle birlikte başlayıp birlikte biten bir efekti tek zaman çizgisine koy."
section: Idle oyun · skilleri bağla
---

# {{ $frontmatter.title }}

**Hedef:** Efektin karakterden ayrılmadığı durumu çiz.

**Önce şu teknik:** [1.17 — Aynı frame'leri üç farklı süreyle dene](/pixel-art/17-timing) — İzin ne kadar yaşayacağını süre belirler.

## Görev

16×8 bir dosyada dört frame kur: warrior duruyor, kılıcı geri çekiyor, vuruyor ve izi yanında beliriyor, duruşuna dönüyor ve izden birkaç parça kalıyor. Frame süreleri 220, 80, 90 ve 400 ms olsun. `art/craft/warrior-combined.aseprite` olarak kaydet.

## Ne zaman bitti?

- Dört frame sırayla duruş, hazırlık, vuruş ve dönüş gösteriyor.
- İz yalnız vuruş karesinde tam; son karede yalnız birkaç parçası kalmış.
- İz warrior'ın kılıcının geçtiği tarafta duruyor; kaynak 16×8.

## Bilmen gereken küçük parça

1.45'te mage'in büyüsü elinden ayrıldı ve kendi yoluna gitti. Warrior'ın kılıç izi ise **hiçbir yere gitmez.** Karakterle birlikte belirir, karakterle birlikte söner.

Bu iki davranış bir skill'i tasarlarken vereceğin ilk karar. Mermi mi, iz mi? Mermi ayrılır ve ömrü karakterinkinden uzun olur; iz karakterin hareketine yapışıktır ve onunla aynı anda biter. Zaman çizgisi bu farkı doğrudan gösterir.

<PixelAnimation title="Warrior — karakter ve iz birlikte" :columns="16" :rows="8" :frames='[{"src":"/pixel-art/craft/wcombine-1.svg","label":"Duruş","duration":220,"alt":"Warrior duruyor; ekranda iz yok."},{"src":"/pixel-art/craft/wcombine-2.svg","label":"Hazırlık","duration":80,"alt":"Kılıç sola çekilmiş; iz hâlâ yok."},{"src":"/pixel-art/craft/wcombine-3.svg","label":"Vuruş","duration":90,"alt":"Warrior vurdu; kılıç izi hemen yanında belirdi."},{"src":"/pixel-art/craft/wcombine-4.svg","label":"Dönüş","duration":400,"alt":"Warrior duruşuna döndü; izden yalnız parçalar kaldı."}]' />

İzin ikinci karede hiç görünmemesi önemli: hazırlık sırasında kılıç henüz yol almadı. İz ancak hareket gerçekleştiğinde çizilir. Aynı kural bir yumruk, bir kuyruk vuruşu veya bir çekiç için de geçerli.

## Sınırlar

Tek karakter ve tek vuruş. Hedef, hasar ve isabet efekti bu göreve girmiyor.

::: details İpucu 1 — İz vuruştan önce görünüyor
Hazırlık karesinden izi çıkar. İz hareketin sonucu; öncesinde yoktur.
:::

::: details İpucu 2 — İz warrior'dan kopuk duruyor
İzin iç ucu kılıcın vardığı yere değmeli; aradaki boşluk bağı koparır.
:::

::: details İpucu 3 — İz çok uzun kalıyor
Son karede yalnız birkaç parça bırak. İzin ömrü vuruştan uzun olmamalı.
:::

## Birincil kaynak

[Aseprite — Layers](https://www.aseprite.org/docs/layers/).
`RESOURCES.md` içindeki bu belge, karakteri ve efekti ayrı katmanlarda tutup birlikte oynatmayı açıklar; [Frame Duration](https://www.aseprite.org/docs/frame-duration/) süre dağılımı içindir. Dört karelik sıra bu dersin kurgusudur.

**Kazanım:** Karakterle birlikte biten bir efekti, ayrılan bir efektten ayırt edebiliyorsun.

**“Pixel Art 1.46 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.47 — Priest'i ve iyileştirmesini birleştir](/pixel-art/47-priest-combine).
