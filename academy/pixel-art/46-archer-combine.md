---
title: "1.46 — Archer'ı, okunu ve isabetini birleştir"
description: "Hazırlık, mermi ve isabeti tek bir zaman çizgisinde birleştir."
section: Idle oyun · skilleri bağla
---

# {{ $frontmatter.title }}

**Hedef:** Bir skill'in bütün halkalarını tek animasyonda sırala.

**Önce şu teknik:** [1.17 — Aynı frame'leri üç farklı süreyle dene](/pixel-art/17-timing) — Beş karenin süresi zincirin tamamını kurar.

## Görev

24×8 bir dosyada beş frame kur: archer duruyor, yayı geriyor, ok ayrılıyor, ok yolun ortasında, ok hedefe değiyor ve sağda isabet açılıyor. Frame süreleri 250, 160, 70, 70 ve 300 ms olsun. `art/craft/archer-combined.aseprite` olarak kaydet.

## Ne zaman bitti?

- Beş frame sırayla duruş, germe, ayrılma, yol ve isabet gösteriyor.
- Ok her frame'de bir öncekinden sağda; isabet karesinde ok yok.
- Archer üçüncü frame'den sonra duruşuna dönmüş; kaynak 24×8.

## Bilmen gereken küçük parça

Bu paketin bütün skill parçaları burada bir araya geliyor: hazırlık pozu, mermi, uçuş ve isabet. Archer'ın zinciri en uzun olanı, bu yüzden en iyi örnek.

Dikkat edeceğin tek şey **kimin ne zaman bittiği.** Archer okla birlikte değil, oku bıraktıktan hemen sonra duruşuna döner. Ok yolculuğuna tek başına devam eder. İsabet karesinde ok artık yoktur; yerini parıltı almıştır. Üç ayrı şey, üç ayrı ömür.

<PixelAnimation title="Archer — hazırlık, ok ve isabet" :frames='[{"src":"/pixel-art/craft/acombine-1.svg","label":"Duruş","duration":250,"alt":"Archer duruyor; yay boşta."},{"src":"/pixel-art/craft/acombine-2.svg","label":"Germe","duration":160,"alt":"Yay gerildi; ok kirişte bekliyor."},{"src":"/pixel-art/craft/acombine-3.svg","label":"Ayrılma","duration":70,"alt":"Ok kirişten ayrıldı; archer hâlâ germe pozunda."},{"src":"/pixel-art/craft/acombine-4.svg","label":"Yol","duration":70,"alt":"Archer duruşuna döndü; ok yolun ortasında."},{"src":"/pixel-art/craft/acombine-5.svg","label":"İsabet","duration":300,"alt":"Ok yerini isabet parıltısına bıraktı."}]' />

24 pixel genişlik okun yol alabilmesi için. Oyunda bu üç parça ayrı ayrı çizilir ve mesafe kodun kararıdır; burada gördüğün şey **sıra ve süre.** Aynı kurgu bir büyü, bir taş veya bir bıçak için de geçerli: hazırlık, ayrılma, yol, varış.

## Sınırlar

Tek atış. Hedef sprite'ı, hasar ve ikinci bir atış bu göreve girmiyor.

::: details İpucu 1 — Archer okla birlikte donup kalıyor
Dördüncü kareden itibaren archer duruş pozunda olmalı; ok kendi başına devam eder.
:::

::: details İpucu 2 — İsabet karesinde ok da duruyor
Ok varınca silinir. İkisini birlikte göstermek okun hedefi geçtiğini düşündürür.
:::

::: details İpucu 3 — Ok yayın içinden çıkıyor gibi
Ayrılma karesinde ok ile yay arasında en az iki pixel boşluk bırak.
:::

## Birincil kaynak

[Aseprite — Animation](https://www.aseprite.org/docs/animation/).
`RESOURCES.md` içindeki bu belge, frame sırası ve playback için kullanıldı; [Frame Duration](https://www.aseprite.org/docs/frame-duration/) süre dağılımı içindir. Beş karelik sıra ve mesafeler bu dersin kurgusudur.

**Kazanım:** Dört karakterin de skill'ini karakteriyle birleştirebiliyorsun. Bir skill artık tek bir olay.

**“Pixel Art 1.46 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.47 — Kadronun tamamına idle ver](/pixel-art/47-hero-idle).
