---
title: "1.53 — Dört frame'lik yürüyüş döngüsü kur"
description: "Gövdenin ne zaman alçalıp ne zaman yükseldiğini doğru kurarak kadroyu gerçekten yürüt."
section: Idle oyun · kadroyu tamamla
---

# {{ $frontmatter.title }}

**Hedef:** Yerinde adımlamayı, gövdesi adımla birlikte inip çıkan bir yürüyüşe çevir.

**Önce şu teknik:** [1.18 — Hazırlık karesiyle ağırlık ver](/pixel-art/18-chest-weight) — Gövdenin alçalması, hareketin ağırlığını kuran şeydir.

## Görev

1.31'deki iki pozlu adımlamayı dört frame'e çıkar ve dört karakterin hepsine uygula. Sıra şu: **açık** (ayaklar en geniş, gövde bir pixel alçak), **geçiş** (bacaklar paralel, gövde normal), **kapalı** (bacaklar bitişik, gövde bir pixel yüksek), **geçiş** (aynı çizim). Frame süreleri 110, 110, 110 ve 110 ms olsun. `art/characters/` altına `<karakter>-walk` olarak kaydet.

## Ne zaman bitti?

- Dört dosyada da bacak açıklığı geniş, paralel, bitişik, paralel sırasını izliyor.
- Gövde en alçak olduğu frame, bacakların en açık olduğu frame; en yüksek olduğu frame, bacakların bitişik olduğu frame.
- Komşu iki frame arasındaki dikey fark hiçbir yerde bir pixel'i geçmiyor.
- Gövde yatayda hiç kaymıyor; kaynaklar 8×8.

## Bilmen gereken küçük parça

İki frame bir karakterin adım attığını söyler. Dört frame **nasıl** adım attığını söyler — ama yalnız alçalma doğru yere konursa.

Burada tek bir kural var ve her şey ona bağlı: **bacaklar açıldıkça gövde alçalır.** Sebebi geometri. İki bacak makas gibi açıldığında kalçanın yere olan mesafesi kısalır; aynı bacaklar üst üste gelip dikleştiğinde o mesafe en uzun hâline döner. Yani en geniş adım en alçak gövdedir, bitişik bacak en yüksek gövdedir.

Bu kuralı ters çevirirsen ortaya yürüyüş değil **oturma** çıkar: bacaklar toplanırken gövde de aşağı inerse figür bir anlığına tabureye çökmüş gibi görünür ve göz bunu hemen yakalar. Aynı anda hem kısalan bacak hem alçalan gövde, tek bir hareketin iki adıdır — çömelmenin.

<PixelAnimation title="Warrior — dört frame'lik yürüyüş" :frames='[{"src":"/pixel-art/craft/walk4-1.svg","label":"Açık","duration":110,"alt":"Ayaklar en geniş açıklıkta, gövde bir pixel alçalmış."},{"src":"/pixel-art/craft/walk4-2.svg","label":"Geçiş","duration":110,"alt":"Bacaklar paralel, gövde normal yükseklikte."},{"src":"/pixel-art/craft/walk4-3.svg","label":"Kapalı","duration":110,"alt":"Bacaklar bitişik ve dik, gövde bir pixel yükselmiş."},{"src":"/pixel-art/craft/walk4-4.svg","label":"Geçiş","duration":110,"alt":"Bacaklar yeniden paralel, gövde normal yükseklikte."}]' />

Dört frame boyunca başın bulunduğu satırı takip et: alçak, normal, yüksek, normal. Bu, tek bir adımın yay çizgisidir ve döngü başa döndüğünde kesintisiz devam eder. Her komşu frame arasında yalnız bir pixel fark olması da bunun için önemli — iki pixel'lik bir sıçrama 8×8'de yürüyüş değil zıplama okunur.

Aynı dört kademe dört karakterde de değişmez. Silüetler farklıdır, bacak rengi farklıdır, mage'in cübbesi ile archer'ın yayı farklı yer kaplar; kademelerin sırası ve alçalmanın yönü aynıdır.

<PixelAnimation title="Bütün kadro yürüyor" :columns="32" :frames='[{"src":"/pixel-art/craft/walk-row-1.svg","label":"Açık","duration":110,"alt":"Dört karakterin de ayakları en geniş açıklıkta ve gövdeleri bir pixel alçak."},{"src":"/pixel-art/craft/walk-row-2.svg","label":"Geçiş","duration":110,"alt":"Dördünün de bacakları paralel ve gövdeleri normal yükseklikte."},{"src":"/pixel-art/craft/walk-row-3.svg","label":"Kapalı","duration":110,"alt":"Dördünün de bacakları bitişik ve gövdeleri bir pixel yüksek."},{"src":"/pixel-art/craft/walk-row-4.svg","label":"Geçiş","duration":110,"alt":"Dördünün de bacakları yeniden paralel."}]' />

Dört frame'in eşit süreli olması yürüyüşü düzenli tutar; koşu istiyorsan süreleri kısalt, ağır bir yürüyüş istiyorsan uzat — 1.17'de öğrendiğin şey burada da geçerli. İkinci ve dördüncü frame aynı çizimdir; timeline'da aynı cel'i iki kez kullanabilirsin.

## Sınırlar

Yerinde döngü. Kol sallanması, yön değiştirme ve ilerleme bu göreve girmiyor.

::: details İpucu 1 — Karakter bir anlığına oturuyor gibi
Alçalmayı yanlış frame'e koymuşsun. Bacakların bitişik olduğu frame'de gövdeyi indirme, tam tersine kaldır.
:::

::: details İpucu 2 — Yürüyüş zıplama gibi
Komşu iki frame arasındaki fark bir pixel'i geçmemeli. Açıktan kapalıya doğrudan atlarsan aradaki geçiş frame'i eksik demektir.
:::

::: details İpucu 3 — Tam yerleşim
Gövde beş satırdır. Açık frame'inde 3–7. satırlarda durur, ayaklar 8. satırda 2. ve 6. sütuna açılır. Geçiş frame'inde 2–6. satırlara çıkar, bacaklar 7–8. satırlarda 3. ve 5. sütunda paralel iner. Kapalı frame'inde 1–5. satırlara çıkar, bacak 6–8. satırlarda tek sütuna, 4. sütuna toplanır ve en altta ayak öne bir pixel taşar.
:::

## Birincil kaynak

[Aseprite — Animation](https://www.aseprite.org/docs/animation/).
`RESOURCES.md` içindeki bu belge, frame sırası ve playback için kullanıldı; [Linked Cels](https://www.aseprite.org/docs/linked-cels/) aynı görüntüyü paylaşan frame'ler içindir. Dört kademe ve alçalmanın hangi frame'e düştüğü bu dersin seçimidir.

**Kazanım:** Kadronun tamamı yürüyor; gövdeler adımla birlikte iniyor ve çıkıyor, kimse oturmuyor.

**“Pixel Art 1.53 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.54 — 8×8 armor ikonu çiz](/pixel-art/54-armor).
