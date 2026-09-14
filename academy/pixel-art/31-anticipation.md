---
title: "1.31 — Üç frame ile vuruşa ağırlık ver"
description: "Hazırlık, vuruş ve duruşu birleştirerek iki frame'in veremediği ağırlığı kur."
section: Idle oyun · warrior
---

# {{ $frontmatter.title }}

**Hedef:** Bir hareketin ağırlığını, araya tek bir kare ekleyerek üret.

**Önce şu teknik:** [1.18 — Hazırlık karesiyle ağırlık ver](/pixel-art/18-chest-weight) — Bu ders, sandıkta öğrendiğin hazırlığı bir karaktere uygular.

## Görev

1.29'daki hazırlık pozunu, yeni çizeceğin vuruş karesini ve 1.27'deki duruşu 8×8 tek dosyada üç frame olarak birleştir. Frame süreleri 220, 80 ve 400 ms olsun. `art/craft/anticipation.aseprite` olarak kaydet.

## Ne zaman bitti?

- Üç frame sırayla hazırlık, vuruş ve duruş gösteriyor.
- Hazırlık frame'i vuruştan belirgin biçimde uzun, vuruş en kısa.
- Kılıç hazırlıkta solda, vuruşta sağda; kaynak 8×8 ve kaydedilmiş.

## Bilmen gereken küçük parça

İki frame bir hareketi gösterir, üç frame ona **ağırlık** verir. Eklenen kare hareketin kendisi değil, öncesidir.

Kural şu: hazırlık uzun, vuruş kısa, dönüş orta. Vuruşun kısa olması onu hızlı gösterir; hazırlığın uzun olması o hızı hissettirir. Aynı üç kare eşit sürelerle oynatılırsa hareket yine görünür ama darbe kaybolur. Bu dersle 1.29'daki poz ve 1.17'deki süre bilgisi tek bir işte birleşir.

<PixelAnimation title="Warrior — hazırlık, vuruş, duruş" :frames='[{"src":"/pixel-art/craft/anticip-1.svg","label":"Hazırlık","duration":220,"alt":"Kılıç sola çekilmiş, gövde sağa yüklenmiş."},{"src":"/pixel-art/craft/anticip-2.svg","label":"Vuruş","duration":80,"alt":"Kılıç sağa savrulmuş; arkasında kısa bir iz var."},{"src":"/pixel-art/craft/anticip-3.svg","label":"Duruş","duration":400,"alt":"Warrior duran pozuna dönmüş."}]' />

Vuruş karesinde kılıcın arkasına bir iz eklemek, tek karede kat edilen yolu anlatır; 1.30'daki kılıç izi dersinin aynı fikri. Üç kare artık başı, ortası ve sonu olan tam bir hareket. Bu yapı yürüyüş, zıplama ve büyü yapma için de aynen kullanılabilir.

## Sınırlar

Üç kare ve tek hareket. Geri tepme karesi, ayak hareketi, kamera sarsıntısı ve hasar sayısı bu göreve girmiyor.

::: details İpucu 1 — Vuruş ağır değil hızlı görünüyor
Hazırlık karesinin süresini uzat. Ağırlığı veren şey darbe değil, öncesindeki bekleyiş.
:::

::: details İpucu 2 — Üç kare bir hareket gibi durmuyor
Gövde üç karede de aynı yükseklikte olmalı. Yalnız kılıç ve gövdenin yatay kayması değişir.
:::

::: details İpucu 3 — Tam yerleşim
Hazırlıkta kılıç 1. sütunda 1–4. satırlar. Vuruşta kılıç 8. sütunda 2–4. satırlar ve iz 6–7. sütunlarda. Duruş 1.27'deki warrior ile birebir aynı.
:::

::: details Deep Dive — Buradan sonra ne var?
Pakette yazılı ders bitti ama yol bitmedi. [Yol haritası](/pixel-art/roadmap) hangi konuların ders olarak yazılabileceğini gruplar; [Idle RPG görsel seti](/pixel-art/idle-kit) parçaların bir arada nasıl durduğunu gösterir. Yeni bir asset çizdiğinde [1.60 — Asset'lerini tek sprite sheet'e topla](/pixel-art/60-sprite-sheet) dersindeki kit'e bir frame eklemen yeterli.
:::

## Birincil kaynak

[Aseprite — Animation](https://www.aseprite.org/docs/animation/).
`RESOURCES.md` içindeki bu belge, frame sırası ve playback için kullanıldı; [Frame Duration](https://www.aseprite.org/docs/frame-duration/) süre dağılımı içindir. Hazırlık, vuruş ve duruş kurgusu bu dersin özgün seçimidir.

**Kazanım:** Bir hareketi başı, ortası ve sonu olan bir olaya dönüştürebiliyorsun. Bundan sonrası, çizdiklerini 1.60'taki kit'e eklemek ve idle oyununda kullanmak.

**“Pixel Art 1.31 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.32 — 8×8 priest çiz](/pixel-art/32-priest).
