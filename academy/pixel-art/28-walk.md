---
title: "1.28 — İki pozla yerinde adımla"
description: "Warrior'ın ayaklarını sırayla kaldırarak iki pozlu yerinde adımlama çiz."
section: Idle oyun · warrior
---

# {{ $frontmatter.title }}

**Hedef:** Ayakların sırayla yer değiştirmesiyle adımlama ritmi oluştur.

**Önce şu teknik:** [1.15 — Sandığı iki frame ile aç](/pixel-art/15-chest-open) — Gövde sabit, ayaklar hareketli: sandık kuralının aynısı.

## Görev

Warrior dosyanı `art/characters/warrior-walk.aseprite` adıyla ayrı kaydet. İki bağımsız frame'de yalnız ayakların sırasını değiştir; miğfer, yüz ve kalkan sabit kalsın.

## Ne zaman bitti?

- Bir frame'de soldaki, diğerinde sağdaki ayak bir pixel yukarıda.
- İki frame 180'er ms; üst gövde ve kalkan oynamıyor.
- Karakter 8×8 içinde kalıyor ve kaydedilmiş animasyonda yerinde adımlıyor.

## Bilmen gereken küçük parça

Bu ilk adımlama örneğinde biri yükselirken öteki yerde duran iki ayak kullanıyoruz. Ekranda ilerleme ile sprite'ın yerinde hareketi ayrı kararlar olabilir; bugün yalnız pozların sırasını çiziyoruz. Daha uzun bir walk cycle, yan görünüş ve bütün yönler daha sonraki küçük ihtiyaçlar olabilir.

<PixelAnimation title="Warrior yerinde adımlama" :frames='[{"src":"/pixel-art/animation/walk-1.svg","label":"Sol ayak yukarıda","duration":180,"alt":"Warrior&#39;ın soldaki ayağı bir pixel yukarıda, sağdaki ayağı yerde."},{"src":"/pixel-art/animation/walk-2.svg","label":"Sağ ayak yukarıda","duration":180,"alt":"Warrior&#39;ın sağdaki ayağı bir pixel yukarıda, soldaki ayağı yerde."}]' />

Frame'lere tek tek bas. Değişiklik yalnız en alt iki satırda: bir ayak gövdenin alt satırına yükselir, diğeri yerde kalır. Hangi ayağın yükseldiğini, yukarı taşınan koyu pixel gösteriyor.

1. Warrior'ın çizimi bulunan hücreden `Frame > Duplicate Cels` ile ikinci frame'i oluştur. Birinci frame'de soldaki ayağı bir pixel yukarı al: alttaki eski pixel'i sil, üstündeki zırh pixel'ini ayak rengine boya.
2. İkinci frame'de aynı işlemi sağdaki ayak için yap. Bu kez soldaki ayak yerde kalsın. Yükselmemiş ayağın üstünde zırh rengi devam eder.
3. `Frame > Frame Properties` ile iki frame'i **180 ms** yap. `Enter` ile yerinde adımlamayı izle ve kaydet.

## Sınırlar

Yalnız iki poz ve en alt iki satır değişiyor; hareketin hangi pixel kararından doğduğunu görmek için. Karakteri canvas içinde sağa taşımak bu görevin parçası değil.

::: details İpucu 1 — İki ayak birlikte zıplıyor
Her frame'de yalnız bir ayağı yükselt; öteki ayak en alt satırda kalır.
:::

::: details İpucu 2 — Ayak uzuyor
Yukarı yeni pixel eklerken aşağıdaki eski pixel'i silmelisin. İki pixel'lik dikey çizgi bırakma.
:::

::: details İpucu 3 — İki alt satır nasıl olmalı?
Sütunları soldan say: ilk frame'de sol ayak (3. sütun, 7. satır), sağ ayak (5. sütun, 8. satır). İkinci frame'de bu yükseklikler tersine döner.
:::

::: details Deep Dive — Diğer karakterlere uygulamak
Aynı ayak yerleşimini mage, priest veya archer üzerinde deneyebilirsin;
bu ek bir ödev değil. Cübbenin ayakları ne kadar örttüğü veya ekipmanın sabit
kalıp kalmadığı yeni bir hareket ihtiyacı çıkarırsa onu ayrı ele alırız.
:::

## Birincil kaynak

[Pedro Medeiros — A Basic Aseprite Animation](https://saint11.art/pixel_art_articles/article3/).
`RESOURCES.md` içindeki bu kaynak, az ayrıntılı pozları sıraya koyup sürelerini
ayarlama yaklaşımı için kullanıldı. Buradaki iki pozlu warrior özgün bir
başlangıç örneğidir; kaynaktaki 32×32 topu yapman gerekmiyor.

**Kazanım:** İki ayağın sırasını değiştirerek küçük bir karakterin adımlama ritmini kurdun.

**“Pixel Art 1.28 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.29 — Warrior'ın hazırlık pozunu çiz](/pixel-art/29-warrior-windup).

