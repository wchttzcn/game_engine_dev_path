---
title: "1.53 — Slime'ın ölüşünü çiz"
description: "Gövdeyi kademe kademe yassılaştırarak bir monster'ın yok oluşunu çiz."
section: Idle oyun · eşya ve monster
---

# {{ $frontmatter.title }}

**Hedef:** Bir şeklin yok oluşunu, silmek yerine çökerterek anlat.

**Önce şu teknik:** [1.15 — Sandığı iki frame ile aç](/pixel-art/15-chest-open) — Değişen tek şey gövdenin yüksekliği.

## Görev

8×8 transparent RGB dosyada dört frame'lik slime ölümü çiz. Gövde için `#7dbd72`, göz için `#182e33` kullan. Frame süreleri 100, 100, 120 ve 300 ms olsun. `art/fx/slime-death.aseprite` olarak kaydet.

## Ne zaman bitti?

- İlk frame duran slime; ikinci frame'de gövde alçalmış ve göz kaybolmuş.
- Üçüncü frame yere yayılmış ince bir kütle; dördüncü frame birkaç dağınık pixel.
- Gövde her frame'de alt kenara yaslı; kaynak 8×8 ve kaydedilmiş.

## Bilmen gereken küçük parça

Bir monster'ı ekrandan silmek yeterli görünür ama boş bir kare, oyuncuya ne olduğunu anlatmaz. **Yok oluşun da bir biçimi olmalı.**

Slime yumuşak bir kütle olduğu için en doğal çözüm çökmek: gövde alçalır, yayılır, dağılır. Gözün önce kaybolması küçük ama güçlü bir işaret; artık bakan bir şey yok. Her frame'de gövdenin alt kenara yaslı kalması, çöküşün yerçekimine uyduğunu gösterir.

<PixelAnimation title="Slime — ölüm" :frames='[{"src":"/pixel-art/fx/slime-death-1.svg","label":"Duruyor","duration":100,"alt":"Slime normal hâliyle; gözü görünüyor."},{"src":"/pixel-art/fx/slime-death-2.svg","label":"Çöküş","duration":100,"alt":"Gövde bir satır alçalmış, göz kaybolmuş."},{"src":"/pixel-art/fx/slime-death-3.svg","label":"Yayılma","duration":120,"alt":"Kütle yere yayılmış, iki satır kalınlığında."},{"src":"/pixel-art/fx/slime-death-4.svg","label":"Dağılma","duration":300,"alt":"Alt satırda birbirinden ayrı birkaç pixel kalmış."}]' />

Son frame'i tamamen boşaltmak yerine birkaç pixel bırakmak, dağılmanın hâlâ sürdüğünü anlatır. Oyunda bu animasyon bittikten sonra sprite ekrandan kaldırılır; çizimin işi o ana kadar geçen süreyi doldurmak.

## Sınırlar

Yalnız çöküş çiziliyor. Parçalanma, kan, düşen loot ve ses bu göreve girmiyor.

::: details İpucu 1 — Slime yok olmuyor, küçülüyor
Gövdeyi her yönden daraltma. Yalnız yüksekliği azalsın, genişliği korunsun.
:::

::: details İpucu 2 — Ölüm ani duruyor
Aradaki frame'i atlamış olabilirsin. Dört kademe, iki kademeden çok daha okunur.
:::

::: details İpucu 3 — Tam yerleşim
İkinci frame'de gövde 4–7. satırlar. Üçüncü frame'de 6–7. satırlar; yedinci satır kenardan kenara dolu. Dördüncü frame'de yalnız 7. satırda 2., 4., 5. ve 7. sütunlar dolu.
:::

## Birincil kaynak

[Aseprite — Animation](https://www.aseprite.org/docs/animation/).
`RESOURCES.md` içindeki bu belge, frame sırası ve playback için kullanıldı. Çöküşün kademeleri ve süreleri bu dersin özgün seçimidir.

**Kazanım:** Bir monster'ın öldüğü, ekrandan silinmeden önce görünür oluyor.

**“Pixel Art 1.53 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.54 — Düşen coin'i çiz](/pixel-art/54-coin-drop).
