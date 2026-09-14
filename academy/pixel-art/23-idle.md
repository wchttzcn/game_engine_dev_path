---
title: "1.23 — İki frame ile idle yap"
description: "Mage'in ayaklarını sabit tutup iki poz arasında küçük bir idle hareketi oluştur."
section: Idle oyun · mage
---

# {{ $frontmatter.title }}

**Hedef:** Bir parça sabit kalırken diğerini değiştirerek küçük bir idle hareketi oluştur.

**Önce şu teknik:** [1.15 — Sandığı iki frame ile aç](/pixel-art/15-chest-open) — Sandıkta olduğu gibi: bir parça sabit kalır, biri hareket eder.

## Görev

Mage dosyanı aç. `File > Save As` ile `art/characters/mage-idle.aseprite` olarak kaydet. İki frame oluştur: ilkinde çizdiğin mage, ikincisinde şapkası ve yüzü bir pixel alçalmış mage olsun.

## Ne zaman bitti?

- Tam iki frame var; her ikisinin canvas'ı 8×8.
- Ayaklar iki frame'de aynı yerde; şapka ve yüz ikinci frame'de bir pixel aşağıda.
- İki frame de 400 ms; playback'te küçük alçalma ve geri dönüş görülüyor, kaynak kaydedilmiş.

## Bilmen gereken küçük parça

Animasyon, sırayla gösterilen çizimlerden oluşur. Her çizime frame diyoruz. İlk denemede bütün karakteri taşımıyoruz: ayaklar yerde kalırken üst bölüm küçükçe alçalıyor. Bu örnekteki iki poz, sakin bir idle için seçtiğimiz sade bir başlangıç; gerçekçi nefes anatomisi çizmen gerekmiyor.

<PixelAnimation title="Mage idle" :frames='[{"src":"/pixel-art/animation/idle-1.svg","label":"Dinlenme","duration":400,"alt":"Mage dik duruyor; şapka tepesi ikinci satırda, ayaklar en alt satırda."},{"src":"/pixel-art/animation/idle-2.svg","label":"Küçük alçalma","duration":400,"alt":"Mage&#39;in şapkası ve yüzü bir pixel alçalmış; ayaklar aynı yerde."}]' />

**Oynat** ile iki pozu sırayla gör. Alttaki bir frame'e basınca örnek durur ve o pozu büyütür. Önizleme çizgileri yalnız öğretim grid'i; onları Aseprite çizimine ekleme.

1. `View > Timeline` ile alt paneli aç. Timeline'da ilk frame'in, çizimin bulunan hücresini seç. Bu hücre o layer'ın o frame'deki çizimini taşır.
2. `Frame > Duplicate Cels` ile bağımsız bir kopya oluştur. İkinci frame'i seç. Şapkanın eski tepesini sil; şapka ve yüzü görseldeki gibi bir satır aşağı kur. Yüz eski gövde satırının yerini alır; etek ve ayaklar sabit kalır.
3. Her frame'i seçip `Frame > Frame Properties` içindeki süreyi **400 ms** yap. `Enter` ile oynat, tekrar `Enter` ile durdur. Sonra kaydet.

## Sınırlar

İki frame, tek değişen bölge ve hazır renkler, ilk animasyon kararını küçük tutmak için. Canvas büyütme veya yeni palette gerekmiyor.

::: details İpucu 1 — Animasyon zıplıyor
Ayakların iki frame'de aynı pixel'lerde kaldığına bak; tüm karakteri aşağı taşıma.
:::

::: details İpucu 2 — İlk çizim de değişiyor
İki frame aynı görüntüyü paylaşan linked cel olabilir. Değişikliği geri alıp Frame > Duplicate Cels ile bağımsız kopya oluştur; Duplicate Linked Cels seçme.
:::

::: details İpucu 3 — İkinci pozu kuramıyorum
İlk iki satır boş. Sonra şapkanın 1, 3, 5 pixel'lik satırları, iki pixel'lik yüz, beş pixel'lik etek ve en altta iki ayak gelir.
:::

::: details Deep Dive — GIF olarak görmek istersen
`.aseprite` kaynağı animasyonunu saklar. Paylaşılabilir bir önizleme için
`File > Export > Export As` ile `.gif` seçebilirsin. İki frame'i de export et.
Büyük önizleme istiyorsan Export içindeki Resize'ı 800% yapman yalnız bu çıktıyı
64×64 yapar; kaynak canvas 8×8 kalır. Bu export, dersi bitirmenin koşulu değil.
[Aseprite — Exporting](https://www.aseprite.org/docs/exporting/) bu işlemin kaynağıdır.
:::

## Birincil kaynak

[Aseprite — Animation](https://www.aseprite.org/docs/animation/).
`RESOURCES.md` içindeki bu kaynak frame sırası ve playback için kullanıldı;
[New Frame](https://www.aseprite.org/docs/new-frame/) bağımsız kopyayı,
[Frame Duration](https://www.aseprite.org/docs/frame-duration/) süre ayarını doğrular.
İki poz ve 400 ms bu dersin çalışma seçimidir.

**Kazanım:** İlk karakterini, sabit kalan ve değişen parçaları ayırarak hareketlendirdin.

**“Pixel Art 1.23 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.24 — Mage'in büyü yapma pozunu çiz](/pixel-art/24-mage-cast).

