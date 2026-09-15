---
title: "1.53 — Dört frame'lik yürüyüş döngüsü kur"
description: "İki pozluk adımlamayı, gövdenin alçalıp yükseldiği gerçek bir döngüye çevir."
section: Idle oyun · kadroyu tamamla
---

# {{ $frontmatter.title }}

**Hedef:** Yerinde adımlamayı, ilerleyen bir yürüyüş hissine çevir.

**Önce şu teknik:** [1.18 — Hazırlık karesiyle ağırlık ver](/pixel-art/18-chest-weight) — Gövdenin alçalması, hareketin ağırlığını kuran şeydir.

## Görev

1.31'deki iki pozlu adımlamayı dört frame'e çıkar. Bacaklar sırayla açık, normal, kapalı ve normal olsun; kapalı frame'de gövde bir pixel alçalsın. Frame süreleri 110, 110, 110 ve 110 ms olsun. `art/characters/warrior-walk.aseprite` olarak kaydet.

## Ne zaman bitti?

- Dört frame'de bacak açıklığı geniş, normal, kapalı, normal sırasını izliyor.
- Yalnız bacakların kapalı olduğu frame'de gövde bir pixel alçak.
- Gövde yatayda hiç kaymıyor; kaynak 8×8.

## Bilmen gereken küçük parça

İki frame bir karakterin adım attığını söyler. Dört frame **nasıl** adım attığını söyler.

Gerçek bir yürüyüşte gövde sabit yükseklikte kalmaz: bacaklar açıkken alçalır, bir bacağın üstünden geçerken yükselir. Bu iniş çıkış, yürüyüşü kayan bir figürden yürüyen bir figüre çevirir. 8×8'de tek pixel'lik bir alçalma bunu anlatmaya yeter — daha fazlası zıplama olur.

<PixelAnimation title="Warrior — dört frame'lik yürüyüş" :frames='[{"src":"/pixel-art/craft/walk4-1.svg","label":"Açık","duration":110,"alt":"Bacaklar en geniş açıklıkta."},{"src":"/pixel-art/craft/walk4-2.svg","label":"Geçiş","duration":110,"alt":"Bacaklar normal aralıkta."},{"src":"/pixel-art/craft/walk4-3.svg","label":"Kapalı","duration":110,"alt":"Bacaklar bitişik ve gövde bir pixel alçalmış."},{"src":"/pixel-art/craft/walk4-4.svg","label":"Geçiş","duration":110,"alt":"Bacaklar yeniden normal aralıkta."}]' />

Dört frame'in eşit süreli olması yürüyüşü düzenli tutar; koşu istiyorsan süreleri kısalt, ağır bir yürüyüş istiyorsan uzat — 1.17'de öğrendiğin şey burada da geçerli. İkinci ve dördüncü frame aynı çizimdir; timeline'da aynı cel'i iki kez kullanabilirsin.

## Sınırlar

Tek karakter ve yerinde döngü. Kol sallanması, yön değiştirme ve ilerleme bu göreve girmiyor.

::: details İpucu 1 — Karakter kayıyor gibi duruyor
Gövde hiç alçalmıyor olabilir. Bacakların kapalı olduğu frame'de bir pixel indir.
:::

::: details İpucu 2 — Yürüyüş zıplama gibi
Alçalma bir pixel'i geçmemeli. İki pixel 8×8'de sıçrama okunur.
:::

::: details İpucu 3 — Tam yerleşim
Bacaklar 8. satırda: açıkta 2. ve 6. sütun, normalde 3. ve 6., kapalıda 4. ve 5. sütun.
:::

## Birincil kaynak

[Aseprite — Animation](https://www.aseprite.org/docs/animation/).
`RESOURCES.md` içindeki bu belge, frame sırası ve playback için kullanıldı; [Linked Cels](https://www.aseprite.org/docs/linked-cels/) aynı görüntüyü paylaşan frame'ler içindir. Dört kademe ve alçalma miktarı bu dersin seçimidir.

**Kazanım:** Karakterin artık gerçekten yürüyor; gövdesi adımlarla birlikte iniyor ve çıkıyor.

**“Pixel Art 1.53 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.54 — 8×8 armor ikonu çiz](/pixel-art/54-armor).
