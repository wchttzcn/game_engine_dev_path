---
title: "1.53 — Dört frame'lik yürüyüş döngüsü kur"
description: "Ayak tabanını sabit tutarak, tek pixel'lik bir alçalmayla kadroyu gerçekten yürüt."
section: Idle oyun · kadroyu tamamla
---

# {{ $frontmatter.title }}

**Hedef:** Yerinde adımlamayı, gövdesi adımla birlikte inip çıkan bir yürüyüşe çevir.

**Önce şu teknik:** [1.18 — Hazırlık karesiyle ağırlık ver](/pixel-art/18-chest-weight) — Gövdenin alçalması, hareketin ağırlığını kuran şeydir.

## Görev

1.31'deki iki pozlu adımlamayı dört frame'e çıkar ve dört karakterin hepsine uygula. Sıra şu: **açık** (ayaklar en geniş, gövde bir pixel alçak), **geçiş** (ayaklar idle'daki yerinde, gövde normal yükseklikte), **kapalı** (ayaklar bitişik, gövde yine normal yükseklikte), **geçiş** (aynı çizim). Ayaklar 1.30'daki gibi tek pixel kalsın: bacak çizmiyoruz, gövdeyi de yeniden çizmiyoruz. Ayak tabanı dört frame'de de 8. satırda kalsın. Frame süreleri 110, 110, 110 ve 110 ms olsun. `art/characters/` altına `<karakter>-walk` olarak kaydet.

## Ne zaman bitti?

- Dört dosyada da ayak açıklığı geniş, normal, bitişik, normal sırasını izliyor.
- Ayaklar her frame'de tek pixel; hiçbir yerde iki satırlık bacak yok.
- Geçiş ve kapalı frame'lerinde gövde idle çiziminin birebir aynısı; yalnız ayak sütunları değişiyor.
- Ayak tabanı dört frame'de de aynı satırda; karakter yerden kopmuyor.
- Silüetin toplam boyu en fazla **bir pixel** değişiyor.
- Gövdenin alçaldığı tek frame, ayakların en açık olduğu frame.
- Gövde yatayda hiç kaymıyor; kaynaklar 8×8.

## Bilmen gereken küçük parça

İki frame bir karakterin adım attığını söyler. Dört frame **nasıl** adım attığını söyler — ama yalnız alçalma doğru yere konursa.

Üç kural var ve üçü de aynı yere bakıyor: ayağın bastığı satır.

**Birinci kural: ayak tabanı hiç kıpırdamaz.** Dört frame'de de en alttaki pixel aynı satırda durur. Karakter yerinde yürür; yerden kopmaz, zemine gömülmez.

**İkinci kural: ayaklar açıldıkça gövde bir pixel alçalır.** Sebebi geometri — iki ayak makas gibi açıldığında kalçanın yere olan mesafesi kısalır. Ama bu alçalma **bir pixel'i geçmez.** Geçerse silüetin toplam boyu iki pixel oynar ve o an gördüğün şey yürüyüş değil **esneme** olur: karakter her adımda uzayıp kısalan bir yay gibi görünür. 8×8'de bir pixel bir karakterin boyunun yedide biridir; iki pixel başka bir karakter demektir.

Bu yüzden kapalı frame'de gövdeyi yukarı **kaldırmazsın.** Ayaklar bitişirken gövde normal yüksekliğine döner, o kadar. Yukarı çıkarmak ayağı uzatmak olur ve boy değişir.

**Üçüncü kural: gövdeyi yeniden çizmezsin.** 8×8'de bacak için yer yoktur. 1.30'da tek pixel olan ayak, yürürken de tek pixel kalır; geçiş ve kapalı frame'leri idle çiziminin aynısıdır ve yalnız ayak pixel'leri sütun değiştirir. Ayağın altına ikinci bir satır eklersen gövde bir satır kısalmak zorunda kalır — ekranda gördüğün şey yürüyen aynı karakter değil, her adımda başka bir çizim olur.

Alçalmayı da ekleyerek değil, **çıkararak** yaparsın: açık frame'de gövdeden bir satır siler, üstünde kalan her şeyi bir pixel aşağı alırsın. Hangi satırı sildiğin karakteri belli eder. Mage ile priest'te en alttaki geniş etek satırı kalır, onun üstündeki dar gövde satırı gider. Warrior'da en alttaki zırh satırı gider; kalkan o frame'de alt çıkıntısını kaybedip iki-iki bir bloğa döner. Archer'da yay aşağıdan değil, ortadan bir pixel kısalır ki uç kıvrımı bozulmasın.

<PixelAnimation title="Warrior — dört frame'lik yürüyüş" :frames='[{"src":"/pixel-art/craft/walk4-1.svg","label":"Açık","duration":110,"alt":"Ayaklar en geniş açıklıkta, gövde bir pixel alçalmış."},{"src":"/pixel-art/craft/walk4-2.svg","label":"Geçiş","duration":110,"alt":"Ayaklar idle&#39;daki yerinde, gövde normal yükseklikte."},{"src":"/pixel-art/craft/walk4-3.svg","label":"Kapalı","duration":110,"alt":"Ayaklar bitişik, gövde normal yükseklikte."},{"src":"/pixel-art/craft/walk4-4.svg","label":"Geçiş","duration":110,"alt":"Ayaklar yeniden idle&#39;daki yerinde, gövde normal yükseklikte."}]' />

Dört frame boyunca iki satırı birlikte takip et: **alt satır yalnız sütun değiştirir, üst satır bir kez bir pixel iner.** Bir adımın bütün ağırlığı bu tek pixel'de taşınır. Fazlası yürüyüşü bozar, azı kayan bir figür bırakır.

Aynı dört kademe dört karakterde de değişmez. Silüetler farklıdır, ayak rengi farklıdır, mage'in cübbesi ile archer'ın yayı farklı yer kaplar; kademelerin sırası ve alçalmanın yönü aynıdır.

<PixelAnimation title="Bütün kadro yürüyor" :columns="32" :frames='[{"src":"/pixel-art/craft/walk-row-1.svg","label":"Açık","duration":110,"alt":"Dört karakterin de ayakları en geniş açıklıkta ve gövdeleri bir pixel alçak."},{"src":"/pixel-art/craft/walk-row-2.svg","label":"Geçiş","duration":110,"alt":"Dördünün de ayakları idle&#39;daki yerinde ve gövdeleri normal yükseklikte."},{"src":"/pixel-art/craft/walk-row-3.svg","label":"Kapalı","duration":110,"alt":"Dördünün de ayakları bitişik ve gövdeleri normal yükseklikte."},{"src":"/pixel-art/craft/walk-row-4.svg","label":"Geçiş","duration":110,"alt":"Dördünün de ayakları yeniden idle&#39;daki yerinde."}]' />

Dört frame'in eşit süreli olması yürüyüşü düzenli tutar; koşu istiyorsan süreleri kısalt, ağır bir yürüyüş istiyorsan uzat — 1.17'de öğrendiğin şey burada da geçerli. İkinci ve dördüncü frame aynı çizimdir; timeline'da aynı cel'i iki kez kullanabilirsin.

## Sınırlar

Yerinde döngü. Kol sallanması, bacak çizimi, yön değiştirme ve ilerleme bu göreve girmiyor.

::: details İpucu 1 — Karakter her adımda uzayıp kısalıyor
Silüetin toplam boyu bir pixel'den fazla değişiyor. Dört frame'i üst üste koy: en üstteki dolu satır en fazla bir satır oynamalı, en alttaki hiç oynamamalı.
:::

::: details İpucu 2 — Karakter bir anlığına oturuyor gibi
Alçalmayı yanlış frame'e koymuşsun. Gövde yalnız ayakların **en açık** olduğu frame'de iner; ayaklar toplanırken inerse figür çömelmiş okunur.
:::

::: details İpucu 3 — Ayak iki satır oldu
Ayağı yukarı taşırken eskisini silmemişsin ya da gövdeyi kısaltıp altına bacak eklemişsin. Geçiş ve kapalı frame'lerini idle dosyasından kopyalayarak baştan kur; o iki frame'de idle'a göre yalnız ayak pixel'lerinin sütunu değişir.
:::

::: details İpucu 4 — Tam yerleşim
Ayak tabanı hep 8. satırdadır ve ayaklar hep tek pixel'dir. Sütunlar: açık frame'inde 2. ve 6., geçiş frame'lerinde 3. ve 5., kapalı frame'inde 4. ve 5. sütun. Warrior'ın gövdesi geçiş ve kapalı frame'lerinde idle'daki gibi 2–7. satırlardadır. Açık frame'inde en alttaki zırh satırı silinir, kalan gövde 3–7. satırlara iner ve kalkan 6–7. satırlarda 6–7. sütunlarda iki-iki blok olur.
:::

## Birincil kaynak

[Aseprite — Animation](https://www.aseprite.org/docs/animation/).
`RESOURCES.md` içindeki bu belge, frame sırası ve playback için kullanıldı; [Linked Cels](https://www.aseprite.org/docs/linked-cels/) aynı görüntüyü paylaşan frame'ler içindir. Dört kademe, alçalmanın hangi frame'e düştüğü, boyun bir pixel'le sınırlanması ve tek pixel ayağın korunması bu dersin seçimidir.

**Kazanım:** Kadronun tamamı yürüyor; ayaklar tek pixel kalıyor, yerden kopmuyor, boylar sabit kalıyor ve kimse oturmuyor.

**“Pixel Art 1.53 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.54 — 8×8 armor ikonu çiz](/pixel-art/54-armor).
