---
title: "1.32 — Okun uçuşunu iki frame'de göster"
description: "Dar bir oku canvas içinde taşıyarak uçuş hissi kur."
section: Skill zincirini tamamla
---

# {{ $frontmatter.title }}

**Hedef:** Küçük canvas'ta hareket için gereken boşluğu, sprite'ı daraltarak aç.

## Görev

8×8 transparent RGB dosyada iki frame çiz. Okun dar bir hâlini önce solda, sonra üç pixel sağda göster. Frame süreleri 70 ve 70 ms olsun. `art/fx/arrow-flight.aseprite` olarak kaydet.

## Ne zaman bitti?

- Aynı ok iki frame'de de bütün hâlde görünüyor; hiçbir ucu kırpılmamış.
- İki frame arasında ok yatayda yer değiştirmiş.
- Süreler eşit ve kısa; kaynak 8×8 ve kaydedilmiş.

## Bilmen gereken küçük parça

1.30'daki ok kenardan kenara sekiz pixel kaplıyor. O sprite'ı hareket ettirmeye kalkarsan bir ucu canvas dışında kalır. **8×8'de hareket, boşluk ister.**

Çözüm sprite'ı küçültmek: uçuş için tüyü at, gövdeyi kısalt. Beş pixel'lik ok, üç pixel yer değiştirebilir. Bu, küçük canvas'ta sürekli karşına çıkacak bir takas: ayrıntı mı, hareket alanı mı.

<PixelAnimation title="Ok uçuşu" :frames='[{"src":"/pixel-art/fx/arrow-fly-1.svg","label":"Sol","duration":70,"alt":"Beş pixel&#39;lik dar ok canvas&#39;ın solunda duruyor."},{"src":"/pixel-art/fx/arrow-fly-2.svg","label":"Sağ","duration":70,"alt":"Aynı ok üç pixel sağa taşınmış; ucu sağ kenara yakın."}]' />

Okun iki frame'de aynı biçimde kalması önemli: değişen tek şey konumu. Gerçek oyunda mermiyi kod da taşıyabilir; o zaman bu iki frame titreşim gibi küçük bir canlılık katar. Şimdilik hareketi çizimle anlatıyoruz.

## Sınırlar

Uçuş yalnız yatay ve iki frame. İz bırakma, hızlanma ve okun hedefe saplanması bu göreve eklenmiyor.

::: details İpucu 1 — Okun ucu kayboluyor
Sprite çok geniş. Tüyü çıkar ve gövdeyi üç pixel'e indir; sonra taşı.
:::

::: details İpucu 2 — Hareket görünmüyor
İki frame arasındaki fark bir pixel'den fazla olmalı. Üç pixel bu ölçüde rahat okunur.
:::

::: details İpucu 3 — Tam yerleşim
İlk frame: gövde 5. satırda 1–3. sütunlar, uç 4. sütunda 4–6. satırlar ve 5. sütunda 5. satır. İkinci frame aynı şeklin üç sütun sağa taşınmış hâli.
:::

## Birincil kaynak

[Aseprite — Frame Duration](https://www.aseprite.org/docs/frame-duration/).
`RESOURCES.md` içindeki bu belge, frame sürelerini ayarlamayı açıklar; [Animation](https://www.aseprite.org/docs/animation/) frame sırası ve playback içindir. Dar ok tasarımı ve mesafe bu dersin seçimidir.

**Kazanım:** Küçük canvas'ta hareket için ayrıntıdan ne kadar vazgeçmen gerektiğini bir kez ölçtün.

**“Pixel Art 1.32 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.33 — Mage için isabet efekti çiz](/pixel-art/33-mage-impact).
