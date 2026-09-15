---
title: "1.53 — Dört frame'lik yürüyüş döngüsü kur"
description: "Ayak tabanını sabit tutarak, tek pixel'lik bir alçalmayla kadroyu gerçekten yürüt."
section: Idle oyun · kadroyu tamamla
---

# {{ $frontmatter.title }}

**Hedef:** Yerinde adımlamayı, gövdesi adımla birlikte inip çıkan bir yürüyüşe çevir.

**Önce şu teknik:** [1.18 — Hazırlık karesiyle ağırlık ver](/pixel-art/18-chest-weight) — Gövdenin alçalması, hareketin ağırlığını kuran şeydir.

## Görev

1.31'deki iki pozlu adımlamayı dört frame'e çıkar ve dört karakterin hepsine uygula. Sıra şu: **açık** (ayaklar en geniş, gövde bir pixel alçak), **geçiş** (bacaklar paralel, gövde normal yükseklikte), **kapalı** (bacaklar bitişik, gövde yine normal yükseklikte), **geçiş** (aynı çizim). Ayak tabanı dört frame'de de 8. satırda kalsın. Frame süreleri 110, 110, 110 ve 110 ms olsun. `art/characters/` altına `<karakter>-walk` olarak kaydet.

## Ne zaman bitti?

- Dört dosyada da bacak açıklığı geniş, paralel, bitişik, paralel sırasını izliyor.
- Ayak tabanı dört frame'de de aynı satırda; karakter yerden kopmuyor.
- Silüetin toplam boyu en fazla **bir pixel** değişiyor.
- Gövdenin alçaldığı tek frame, bacakların en açık olduğu frame.
- Gövde yatayda hiç kaymıyor; kaynaklar 8×8.

## Bilmen gereken küçük parça

İki frame bir karakterin adım attığını söyler. Dört frame **nasıl** adım attığını söyler — ama yalnız alçalma doğru yere konursa.

İki kural var ve ikisi de aynı yere bakıyor: ayağın bastığı satır.

**Birinci kural: ayak tabanı hiç kıpırdamaz.** Dört frame'de de en alttaki pixel aynı satırda durur. Karakter yerinde yürür; yerden kopmaz, zemine gömülmez.

**İkinci kural: bacaklar açıldıkça gövde bir pixel alçalır.** Sebebi geometri — iki bacak makas gibi açıldığında kalçanın yere olan mesafesi kısalır. Ama bu alçalma **bir pixel'i geçmez.** Geçerse silüetin toplam boyu iki pixel oynar ve o an gördüğün şey yürüyüş değil **esneme** olur: karakter her adımda uzayıp kısalan bir yay gibi görünür. 8×8'de bir pixel bir karakterin boyunun yedide biridir; iki pixel başka bir karakter demektir.

Bu yüzden kapalı frame'de gövdeyi yukarı **kaldırmazsın.** Bacaklar bitişirken gövde normal yüksekliğine döner, o kadar. Yukarı çıkarmak bacağı uzatmak olur ve boy değişir.

<PixelAnimation title="Warrior — dört frame'lik yürüyüş" :frames='[{"src":"/pixel-art/craft/walk4-1.svg","label":"Açık","duration":110,"alt":"Ayaklar en geniş açıklıkta, gövde bir pixel alçalmış."},{"src":"/pixel-art/craft/walk4-2.svg","label":"Geçiş","duration":110,"alt":"Bacaklar paralel, gövde normal yükseklikte."},{"src":"/pixel-art/craft/walk4-3.svg","label":"Kapalı","duration":110,"alt":"Bacaklar bitişik ve dik, gövde normal yükseklikte."},{"src":"/pixel-art/craft/walk4-4.svg","label":"Geçiş","duration":110,"alt":"Bacaklar yeniden paralel, gövde normal yükseklikte."}]' />

Dört frame boyunca iki satırı birlikte takip et: **alt satır hiç değişmez, üst satır bir kez bir pixel iner.** Bir adımın bütün ağırlığı bu tek pixel'de taşınır. Fazlası yürüyüşü bozar, azı kayan bir figür bırakır.

Aynı dört kademe dört karakterde de değişmez. Silüetler farklıdır, bacak rengi farklıdır, mage'in cübbesi ile archer'ın yayı farklı yer kaplar; kademelerin sırası ve alçalmanın yönü aynıdır.

<PixelAnimation title="Bütün kadro yürüyor" :columns="32" :frames='[{"src":"/pixel-art/craft/walk-row-1.svg","label":"Açık","duration":110,"alt":"Dört karakterin de ayakları en geniş açıklıkta ve gövdeleri bir pixel alçak."},{"src":"/pixel-art/craft/walk-row-2.svg","label":"Geçiş","duration":110,"alt":"Dördünün de bacakları paralel ve gövdeleri normal yükseklikte."},{"src":"/pixel-art/craft/walk-row-3.svg","label":"Kapalı","duration":110,"alt":"Dördünün de bacakları bitişik ve gövdeleri normal yükseklikte."},{"src":"/pixel-art/craft/walk-row-4.svg","label":"Geçiş","duration":110,"alt":"Dördünün de bacakları yeniden paralel."}]' />

Dört frame'in eşit süreli olması yürüyüşü düzenli tutar; koşu istiyorsan süreleri kısalt, ağır bir yürüyüş istiyorsan uzat — 1.17'de öğrendiğin şey burada da geçerli. İkinci ve dördüncü frame aynı çizimdir; timeline'da aynı cel'i iki kez kullanabilirsin.

## Sınırlar

Yerinde döngü. Kol sallanması, yön değiştirme ve ilerleme bu göreve girmiyor.

::: details İpucu 1 — Karakter her adımda uzayıp kısalıyor
Silüetin toplam boyu bir pixel'den fazla değişiyor. Dört frame'i üst üste koy: en üstteki dolu satır en fazla bir satır oynamalı, en alttaki hiç oynamamalı.
:::

::: details İpucu 2 — Karakter bir anlığına oturuyor gibi
Alçalmayı yanlış frame'e koymuşsun. Gövde yalnız bacakların **en açık** olduğu frame'de iner; bacaklar toplanırken inerse figür çömelmiş okunur.
:::

::: details İpucu 3 — Tam yerleşim
Gövde beş satırdır ve ayak tabanı hep 8. satırdadır. Açık frame'inde gövde 3–7. satırlarda durur, ayaklar 8. satırda 2. ve 6. sütuna açılır. Geçiş frame'inde gövde 2–6. satırlara çıkar, bacaklar 7–8. satırlarda 3. ve 5. sütunda paralel iner. Kapalı frame'inde gövde yine 2–6. satırlardadır, bacak 7. satırda 4. sütuna toplanır ve 8. satırda ayak 4–5. sütunlara basar.
:::

## Birincil kaynak

[Aseprite — Animation](https://www.aseprite.org/docs/animation/).
`RESOURCES.md` içindeki bu belge, frame sırası ve playback için kullanıldı; [Linked Cels](https://www.aseprite.org/docs/linked-cels/) aynı görüntüyü paylaşan frame'ler içindir. Dört kademe, alçalmanın hangi frame'e düştüğü ve boyun bir pixel'le sınırlanması bu dersin seçimidir.

**Kazanım:** Kadronun tamamı yürüyor; ayaklar yerden kopmuyor, boylar sabit kalıyor ve kimse oturmuyor.

**“Pixel Art 1.53 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.54 — 8×8 armor ikonu çiz](/pixel-art/54-armor).
