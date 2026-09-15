---
title: "1.98 — Skill barını dört karede doldur"
description: "Bekleyişi görünür kıl: dolan bir bar ve dolduğunda değişen bir renk."
section: Idle oyun · skill ve auto
---

# {{ $frontmatter.title }}

**Hedef:** Bir sonraki skill'e ne kadar kaldığını, sayı vermeden göster.

**Önce şu teknik:** [1.17 — Aynı frame'leri üç farklı süreyle dene](/pixel-art/17-timing) — Barın dolma hızı frame süresiyle kurulur.

## Görev

32×6 bir skill barı çiz ve dört doluluk hâli üret: boş, üçte bir, üçte iki ve dolu. Çerçeve `#637980`, kanal `#354b50`, dolum `#81cfb3` olsun. Dolu frame'de çerçeveyi `#e3ab52`, dolumu `#ffe5a3` yap. Frame süreleri 300, 300, 300 ve 500 ms olsun. `art/idle-ui/skill-bar.aseprite` olarak dört frame kaydet.

## Ne zaman bitti?

- Dört frame'de de bar 32×6 ve çerçeve kalınlığı bir pixel.
- Dolum hep sol kenardan başlıyor ve sağa doğru büyüyor.
- Dolu frame'de hem çerçeve hem dolum rengi değişmiş.
- Boş frame'de kanal görünüyor; bar kaybolmuyor.

## Bilmen gereken küçük parça

Idle oyunun kalbi beklemektir. Ama beklemenin görünmez olması sıkıcıdır; **dolan** bir şeye bakmak sıkıcı değildir. Skill barı tam olarak bu işi yapar: hiçbir şey olmayan saniyeleri, her an biraz ilerleyen bir çizgiye çevirir.

Barın can barından ince olması da bir karar. 1.70'teki can barı 32×8, XP barı 32×4 idi; skill barı 32×6 ile ikisinin arasında durur. Üç bar aynı ekranda bulunabildiği için, kalınlık tek başına hangi barın hangisi olduğunu söyler.

<PixelAnimation title="Skill barı doluyor" :columns="32" :rows="6" :frames='[{"src":"/pixel-art/skills/bar-1.svg","label":"Boş","duration":300,"alt":"Bar tamamen boş; yalnız koyu kanal ve çerçeve görünüyor."},{"src":"/pixel-art/skills/bar-2.svg","label":"Üçte bir","duration":300,"alt":"Soldan başlayan dolum barın üçte birini kaplamış."},{"src":"/pixel-art/skills/bar-3.svg","label":"Üçte iki","duration":300,"alt":"Dolum barın üçte ikisine ulaşmış."},{"src":"/pixel-art/skills/bar-4.svg","label":"Dolu","duration":500,"alt":"Bar tamamen dolu; çerçeve ve dolum altın rengine dönmüş."}]' />

Asıl ders son karede. Bar dolduğunda yalnız uzunluk değil **renk** de değişiyor. Sebebi şu: dolmakta olan bir bar ile dolmuş bir bar arasındaki fark yalnız birkaç pixel'lik uzunluktur, ve o fark hızlı bakışta okunmaz. Renk değişimi ise kaçırılmaz. Bir durum eşiği geçildiğinde miktarı değil, **rengi** değiştir.

Dördüncü frame'in daha uzun sürmesi de bilinçli: dolu hâl bir sonuçtur, gözün üstünde bir an durması gerekir. 1.17'de öğrendiğin şey burada da geçerli — eşit süreler düzenli, eşit olmayan süreler anlamlı olur.

## Sınırlar

Dört doluluk hâli ve tek bar ölçüsü. Barın üstünde sayı, kalan saniye ve dolarken parlayan uç bu göreve girmiyor.

::: details İpucu 1 — Dolu bar dolmakta olandan ayırt edilmiyor
Yalnız uzunluğu değiştirmişsin. Dolduğu anda çerçeve rengini de değiştir; eşik bir renk olayıdır.
:::

::: details İpucu 2 — Boş bar kayboluyor
Kanal rengi zemine fazla yakın. Kanal `#354b50`, panel içi `#182e33` olmalı; ikisi arasında bir value basamağı bulunsun.
:::

::: details İpucu 3 — Tam yerleşim
Bar 32 geniş, 6 yüksek. Çerçeve dış bir pixel, kanal içteki 30×4 alan. Dolum 2. sütundan başlar; üçte bir 10 pixel, üçte iki 20 pixel, dolu 30 pixel tutar.
:::

## Birincil kaynak

[Aseprite — Frame Duration](https://www.aseprite.org/docs/frame-duration/).
`RESOURCES.md` içindeki bu belge, her frame'e ayrı süre vermeyi açıklar; dolu karenin diğerlerinden uzun tutulması için kullanıldı. Doluluk eşiğinde rengin değişmesi bu dersin seçimidir.

**Kazanım:** Bir bekleyişi görünür, ilerleyen ve bittiği anlaşılan bir şeye çevirebiliyorsun.

**“Pixel Art 1.98 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.99 — Cooldown'ı ve hazır hâlini ayır](/pixel-art/99-skill-cooldown).
