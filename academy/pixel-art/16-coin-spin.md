---
title: "1.16 — Coin'i dört frame'de döndür"
description: "Genişliği daraltıp açarak düz bir ikona dönme illüzyonu ver."
section: Teknik · hareket
---

# {{ $frontmatter.title }}

**Hedef:** Derinlik çizmeden, yalnız genişlik değiştirerek dönme hissi üret.

## Görev

1.8'deki coin'i 8×8 yeni bir dosyaya kopyala ve dört frame kur: tam yüz, yarı dönük, tam kenar, diğer yarı. Frame süreleri 120, 80, 60 ve 80 ms olsun. `art/craft/coin-spin.aseprite` olarak kaydet.

## Ne zaman bitti?

- Dört frame'de de coin'in yüksekliği aynı; yalnız genişliği değişiyor.
- Kenar frame'i en dar ve en kısa süreli.
- İki yarı frame'de açık renk işaret farklı taraflarda; kaynak 8×8.

## Bilmen gereken küçük parça

Bir madeni para dönerken aslında üç boyutlu döner. 8×8'de bunu çizemezsin — ama **çizmen de gerekmez.** Göz için dönme, genişliğin daralıp açılmasıdır.

Sırayı kurmak kolay: geniş, dar, en dar, dar. Kenar frame'inin kısa kalması önemli; gerçekte de bir para kenarına en az süre bakar. Işık işaretini iki yarıda farklı tarafa koymak ise dönüşün yönünü belli eder.

<PixelAnimation title="Coin dönüyor" :frames='[{"src":"/pixel-art/craft/coin-spin-1.svg","label":"Tam yüz","duration":120,"alt":"Coin altı pixel genişliğinde, tam yüzüyle duruyor."},{"src":"/pixel-art/craft/coin-spin-2.svg","label":"Yarı dönük","duration":80,"alt":"Coin dört pixel genişliğinde; açık işaret solda."},{"src":"/pixel-art/craft/coin-spin-3.svg","label":"Kenar","duration":60,"alt":"Coin iki pixel genişliğinde; yalnız kenarı görünüyor."},{"src":"/pixel-art/craft/coin-spin-4.svg","label":"Diğer yarı","duration":80,"alt":"Coin yeniden dört pixel; açık işaret sağda."}]' />

Yükseklik hiç değişmemeli. Bir frame'de coin bir pixel kısalırsa dönme değil zıplama okunur. Aynı yöntem bir anahtar, bir kart veya bir yaprak için de çalışır: düz bir şeyi döndürmek, onu daraltıp açmaktır.

## Sınırlar

Yalnız yatay dönme. Eğik dönüş, gölge, parlama ve yere düşme bu göreve girmiyor.

::: details İpucu 1 — Dönme yerine zıplama görünüyor
Frame'lerden birinde yükseklik değişmiş. Dört frame'de de üst ve alt satır aynı olmalı.
:::

::: details İpucu 2 — Kenar frame'i kayboluyor
İki pixel genişlik yeterli; tek pixel'e inersen coin bir an yok olur.
:::

::: details İpucu 3 — Tam yerleşim
Tam yüz 2–7. sütunlar, yarı dönük 3–6. sütunlar, kenar 4–5. sütunlar. Dört frame'de de çizim 2–7. satırlar arasında.
:::

## Birincil kaynak

[Aseprite — Frame Duration](https://www.aseprite.org/docs/frame-duration/).
`RESOURCES.md` içindeki bu belge, her frame'e ayrı süre vermeyi açıklar; [Animation](https://www.aseprite.org/docs/animation/) frame sırası ve playback içindir. Dönme kademeleri ve süre dağılımı bu dersin seçimidir.

**Kazanım:** Dört frame ile tekrar eden bir döngü kurdun. Bir sonraki derste aynı frame'lerle sürenin gücünü göreceksin.

**“Pixel Art 1.16 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.17 — Aynı frame'leri üç farklı süreyle dene](/pixel-art/17-timing).
