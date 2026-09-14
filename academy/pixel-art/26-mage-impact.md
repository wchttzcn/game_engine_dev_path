---
title: "1.26 — Mage için isabet efekti çiz"
description: "Büyü atışının bittiği anı, merkezden açılıp sönen dört frame'le çiz."
section: Idle oyun · mage
---

# {{ $frontmatter.title }}

**Hedef:** Bir büyünün varış anını, atışıyla aynı renkte ama farklı biçimde göster.

**Önce şu teknik:** [1.17 — Aynı frame'leri üç farklı süreyle dene](/pixel-art/17-timing) — Kısa patlama, uzun bitiş: süre dağılımı etkinin sertliğini kurar.

## Görev

8×8 transparent RGB dosyada dört frame'lik isabet çiz. Çekirdek için `#9de7f5`, açılan parıltı için `#cdf4fb` kullan. Frame süreleri 80, 70, 150 ve 400 ms olsun. `art/fx/mage-impact.aseprite` olarak kaydet.

## Ne zaman bitti?

- İlk frame'de küçük bir çekirdek var; ikinci frame'de dört yöne açılıyor.
- Üçüncü frame'de merkez boşalmış, yalnız dış halka kalmış; dördüncü frame boş.
- Renkler mage'in büyü atışıyla aynı aileden; kaynak 8×8 ve kaydedilmiş.

## Bilmen gereken küçük parça

1.24'te büyüyü elinde topladın, 1.25'te yola çıkardın. Büyünün nereye vardığı ise henüz çizilmedi. **Bir skill'in zinciri eksik halkadan kopar.**

Isabetin rengi atışın rengiyle aynı aileden olmalı; oyuncu ikisinin tek bir büyü olduğunu renkten anlar. Biçim ise değişir: yol boyunca uzayan bir şekil yerine, tek noktada toplanıp dışa açılan bir patlama.

<PixelAnimation title="Mage — büyü isabeti" :frames='[{"src":"/pixel-art/fx/mage-impact-1.svg","label":"Çekirdek","duration":80,"alt":"Merkezde iki pixel&#39;e iki pixel&#39;lik camgöbeği çekirdek."},{"src":"/pixel-art/fx/mage-impact-2.svg","label":"Açılma","duration":70,"alt":"Çekirdek dört yöne açılmış; uçlar daha açık tonda."},{"src":"/pixel-art/fx/mage-impact-3.svg","label":"Dış halka","duration":150,"alt":"Merkez boşalmış; yalnız dışa doğru dağılan halka kalmış."},{"src":"/pixel-art/fx/mage-impact-4.svg","label":"Efekt yok","duration":400,"alt":"Frame tamamen transparent."}]' />

Üçüncü frame'in merkezinin boşalması, şeklin küçülerek yok olmasından farklı bir his verir: enerji dağılır, sönmez. Dördüncü frame'in boş olması efektin bittiğini öğretir. Önizleme öğrenmek için döngüde oynar; oyunda bu görsel her isabette bir kez oynatılabilir.

## Sınırlar

Yalnız isabet anını çiziyoruz. Büyünün yolu, hedefin tepkisi ve hasar sayısı bu göreve girmiyor.

::: details İpucu 1 — Efekt bir topa benziyor
İkinci frame'den sonra merkezi boşalt. Dolu kalan bir şekil patlama değil, nesne gibi okunur.
:::

::: details İpucu 2 — Atışla isabet birbirine benzemiyor
Atıştaki camgöbeğini kullan. Biçim değişebilir, renk ailesi değişmemeli.
:::

::: details İpucu 3 — Tam yerleşim
Çekirdek 4–5. sütunlar ve 4–5. satırlar. Açılma frame'inde uçlar 2. ve 7. satır ile 2. ve 7. sütunda. Dış halka frame'inde yalnız köşegen uçlar dolu.
:::

## Birincil kaynak

[Aseprite — Animation](https://www.aseprite.org/docs/animation/).
`RESOURCES.md` içindeki bu belge, frame sırası ve playback için kullanıldı. Isabetin biçimi, süreleri ve renk eşleşmesi bu dersin özgün seçimidir.

**Kazanım:** Mage'in skill zinciri artık tam: hazırlık yerine atış, yol ve varış. Aynı kalıp her büyü için tekrar edilebilir.

**“Pixel Art 1.26 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.27 — 8×8 warrior çiz](/pixel-art/27-warrior).
