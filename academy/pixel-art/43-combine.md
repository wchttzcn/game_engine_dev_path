---
title: "1.43 — Mage'i ve büyüsünü aynı zaman çizgisine koy"
description: "Hazırlık, çıkış ve dönüşü tek bir animasyonda birleştir."
section: Idle oyun · skilleri bağla
---

# {{ $frontmatter.title }}

**Hedef:** Karakterin pozuyla efektin ne zaman buluşacağına karar ver.

**Önce şu teknik:** [1.17 — Aynı frame'leri üç farklı süreyle dene](/pixel-art/17-timing) — Karakterin pozu ile efektin ömrü farklı sürelerdir.

## Görev

16×8 bir dosyada dört frame kur: mage duruyor, mage büyü pozunda ve elinde ışık, mage aynı pozda ve büyü yola çıkmış, mage duruşuna dönmüş ve büyü uzaklaşmış. Frame süreleri 220, 140, 110 ve 400 ms olsun. `art/craft/mage-cast-combined.aseprite` olarak kaydet.

## Ne zaman bitti?

- Dört frame sırayla duruş, hazırlık, çıkış ve dönüş gösteriyor.
- Büyü ilk frame'de yok; son frame'de karakter duruşuna dönmüş ama büyü hâlâ ekranda.
- Hazırlık frame'i çıkış frame'inden uzun; kaynak 16×8 ve kaydedilmiş.

## Bilmen gereken küçük parça

Bir skill'in bütün parçaları elinde: duruş, hazırlık pozu, efektin kendisi ve isabeti. Eksik olan tek şey **sıra.** Hangi karede ne görünecek?

Kural şu: karakter efekti başlatır, efekt karakterden bağımsız devam eder. Mage elini kaldırır, ışık toplanır, büyü ayrılır — ve mage duruşuna döner. Büyü hâlâ yolda. Bu ayrılma önemli: karakterin pozu efektin ömrü kadar sürmez. Oyunda ikisi ayrı sprite olarak, ayrı sürelerle oynayacak; burada o ayrımı tek dosyada çalışıyoruz.

<PixelAnimation title="Mage — karakter ve efekt birlikte" :frames='[{"src":"/pixel-art/craft/combine-1.svg","label":"Duruş","duration":220,"alt":"Mage duruyor; ekranda efekt yok."},{"src":"/pixel-art/craft/combine-2.svg","label":"Hazırlık","duration":140,"alt":"Mage kolunu kaldırdı; elinde ışık toplandı."},{"src":"/pixel-art/craft/combine-3.svg","label":"Çıkış","duration":110,"alt":"Mage aynı pozda; büyü elden ayrılmış."},{"src":"/pixel-art/craft/combine-4.svg","label":"Dönüş","duration":400,"alt":"Mage duruşuna döndü; büyü yoluna devam ediyor."}]' />

16×8 canvas yalnız bu çalışma için. Oyunda mage 8×8 kendi dosyasında, büyü 8×8 kendi dosyasında durur; kod ikisini yan yana çizer. Burada birleştirmenin amacı **zamanlamayı görmek:** hangi karede ne olduğunu bir kez gözünle gördüğünde, aynı sırayı warrior'ın vuruşuna ve priest'in korumasına da uygulayabilirsin.

## Sınırlar

Tek karakter ve tek skill. İsabet karesi, hedef, hasar ve kodla bağlanma bu göreve girmiyor.

::: details İpucu 1 — Büyü mage ile birlikte kayboluyor
Son frame'de mage duruşuna dönerken büyüyü silme. İkisi ayrı şeyler; efekt devam eder.
:::

::: details İpucu 2 — Sıra ezberden ilerliyor gibi
Hazırlık frame'ini uzat, çıkış frame'ini kısalt. Ağırlığı 1.32'deki gibi süre kurar.
:::

::: details İpucu 3 — Tam yerleşim
Mage her frame'de 1–8. sütunlarda. Büyü üçüncü frame'de 9–13. sütunlarda, dördüncü frame'de 12–16. sütunlarda; ikisinde de elin bulunduğu satırda.
:::

## Birincil kaynak

[Aseprite — Layers](https://www.aseprite.org/docs/layers/).
`RESOURCES.md` içindeki bu belge, karakteri ve efekti ayrı katmanlarda tutup birlikte oynatmayı açıklar; [Frame Duration](https://www.aseprite.org/docs/frame-duration/) süre dağılımı içindir. Dört karelik sıra ve süreler bu dersin kurgusudur.

**Kazanım:** Karakter ile efekti hem yerde hem zamanda birleştirebiliyorsun. Bir skill artık tek bir olay.

**“Pixel Art 1.43 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.44 — Warrior'ı ve kılıç izini birleştir](/pixel-art/44-warrior-combine).
