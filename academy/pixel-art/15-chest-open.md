---
title: "1.15 — Sandığı iki frame ile aç"
description: "Kapağı kaldırıp altında karanlık açarak bir nesneye hareket kazandır."
section: Teknik · hareket
---

# {{ $frontmatter.title }}

**Hedef:** Bir nesnenin durum değiştirdiğini iki çizimle anlat.

## Görev

1.7'deki sandığı 8×8 yeni bir dosyaya kopyala ve üç frame kur: kapalı, aralık ve açık. Kapağın altında açılan boşluğu `#593c35` ile doldur. Frame süreleri 500, 90 ve 600 ms olsun. `art/craft/chest-open.aseprite` olarak kaydet.

## Ne zaman bitti?

- Üç frame'de de sandığın gövdesi ve kilidi aynı yerde duruyor.
- Kapak her frame'de bir satır yukarı çıkıyor; altında koyu boşluk büyüyor.
- Ortadaki frame en kısa süreli; kaynak 8×8 ve kaydedilmiş.

## Bilmen gereken küçük parça

Şimdiye kadar çizdiğin her şey duruyordu. Bir nesneyi canlandırmanın en küçük yolu **durum değiştirmektir:** kapalı ve açık.

İki durumun arasına bir ara kare koymak hareketi yumuşatır. Ama esas kural şu: **değişmeyen parçayı sabit tut.** Gövde ve kilit yerinde kalır, yalnız kapak hareket eder. Gövde de oynarsa sandık açılmaz, titrer. Bu kural bu paketteki bütün animasyonlarda geçerli olacak.

<PixelAnimation title="Sandık açılıyor" :frames='[{"src":"/pixel-art/craft/chest-closed.svg","label":"Kapalı","duration":500,"alt":"Sandık kapalı; kapak gövdenin üstüne oturuyor."},{"src":"/pixel-art/craft/chest-mid.svg","label":"Aralık","duration":90,"alt":"Kapak bir satır kalkmış; altında koyu bir çizgi açılmış."},{"src":"/pixel-art/craft/chest-open.svg","label":"Açık","duration":600,"alt":"Kapak arkaya yatmış; içerideki karanlık iki satır."}]' />

Kapağı yeniden çizmek yerine seçip ok tuşuyla kaydırmak daha hızlı ve daha güvenli: parça birebir aynı kalır. Açılan boşluğun koyu olması derinlik verir; aynı numarayı bir kapı, bir çekmece veya bir ağız için de kullanabilirsin.

## Sınırlar

Üç frame ve tek yön. Sandığın içindeki eşya, parıltı ve kapanma animasyonu bu göreve girmiyor.

::: details İpucu 1 — Sandık açılmıyor, kayıyor
Gövde de yukarı taşınmış olabilir. Yalnız kapağı seç ve taşı.
:::

::: details İpucu 2 — Boşluk görünmüyor
Kapağın altında kalan satırı koyu renkle doldur. Transparent bırakırsan sandık delik görünür.
:::

::: details İpucu 3 — Tam yerleşim
Kapalıda kapak 2–4. satırlar. Aralıkta kapak 2–3. satırlar, koyu boşluk 4. satır. Açıkta kapak 2. satır, koyu boşluk 3–4. satırlar. Gövde her üçünde 5–7. satırlarda.
:::

## Birincil kaynak

[Aseprite — New Frame](https://www.aseprite.org/docs/new-frame/).
`RESOURCES.md` içindeki bu belge, kopyalanmış frame eklemeyi açıklar; [Move Tool](https://www.aseprite.org/docs/move-tool/) seçili parçayı taşımak içindir. Kapağın kademeleri ve süreler bu dersin seçimidir.

**Kazanım:** İlk animasyonun hazır. Sabit parça ile hareket eden parçayı ayırmayı biliyorsun.

**“Pixel Art 1.15 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.16 — Coin'i dört frame'de döndür](/pixel-art/16-coin-spin).
