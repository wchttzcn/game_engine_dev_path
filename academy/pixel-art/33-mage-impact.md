---
title: "1.33 — Mage için isabet efekti çiz"
description: "Büyü atışının bittiği anı, merkezden açılıp sönen dört frame'le çiz."
section: Skill zincirini tamamla
---

# {{ $frontmatter.title }}

**Hedef:** Bir büyünün varış anını, atışıyla aynı renkte ama farklı biçimde göster.

## Görev

8×8 transparent RGB dosyada dört frame'lik isabet çiz. Çekirdek için `#9874d3`, açılan parıltı için `#c9aef0` kullan. Frame süreleri 80, 70, 150 ve 400 ms olsun. `art/fx/mage-impact.aseprite` olarak kaydet.

## Ne zaman bitti?

- İlk frame'de küçük bir çekirdek var; ikinci frame'de dört yöne açılıyor.
- Üçüncü frame'de merkez boşalmış, yalnız dış halka kalmış; dördüncü frame boş.
- Renkler mage'in büyü atışıyla aynı aileden; kaynak 8×8 ve kaydedilmiş.

## Bilmen gereken küçük parça

1.17'de mage'in büyüsünü yola çıkardın, 1.20'de archer'ın oku hedefe vardı. Mage'in büyüsünün nereye vardığı ise hiç çizilmedi. **Bir skill'in zinciri eksik halkadan kopar.**

Archer'ın impact'inden farkı renk ve biçim: burada çekirdek önce toplanır, sonra dışa açılır. Aynı mor, atışla isabeti birbirine bağlar; oyuncu ikisinin aynı büyü olduğunu renkten anlar.

<PixelAnimation title="Mage — büyü isabeti" :frames='[{"src":"/pixel-art/fx/mage-impact-1.svg","label":"Çekirdek","duration":80,"alt":"Merkezde iki pixel&#39;e iki pixel&#39;lik mor çekirdek."},{"src":"/pixel-art/fx/mage-impact-2.svg","label":"Açılma","duration":70,"alt":"Çekirdek dört yöne açılmış; uçlar açık mor."},{"src":"/pixel-art/fx/mage-impact-3.svg","label":"Dış halka","duration":150,"alt":"Merkez boşalmış; yalnız dışa doğru dağılan halka kalmış."},{"src":"/pixel-art/fx/mage-impact-4.svg","label":"Efekt yok","duration":400,"alt":"Frame tamamen transparent."}]' />

Üçüncü frame'in merkezinin boşalması, şeklin küçülerek yok olmasından farklı bir his verir: enerji dağılır, sönmez. Dördüncü frame'in boş olması efektin bittiğini öğretir. Önizleme öğrenmek için döngüde oynar; oyunda bu görsel her isabette bir kez oynatılabilir.

## Sınırlar

Yalnız isabet anını çiziyoruz. Büyünün yolu, hedefin tepkisi ve hasar sayısı bu göreve girmiyor.

::: details İpucu 1 — Efekt bir topa benziyor
İkinci frame'den sonra merkezi boşalt. Dolu kalan bir şekil patlama değil, nesne gibi okunur.
:::

::: details İpucu 2 — Atışla isabet birbirine benzemiyor
Aynı iki moru kullan. Biçim değişebilir, renk ailesi değişmemeli.
:::

::: details İpucu 3 — Tam yerleşim
Çekirdek 4–5. sütunlar ve 4–5. satırlar. Açılma frame'inde uçlar 2. ve 7. satır ile 2. ve 7. sütunda. Dış halka frame'inde yalnız köşegen uçlar dolu.
:::

## Birincil kaynak

[Aseprite — Animation](https://www.aseprite.org/docs/animation/).
`RESOURCES.md` içindeki bu belge, frame sırası ve playback için kullanıldı. Isabetin biçimi, süreleri ve renk eşleşmesi bu dersin özgün seçimidir.

**Kazanım:** Mage'in skill zinciri artık tam: hazırlık yerine atış, yol ve varış. Aynı kalıp her büyü için tekrar edilebilir.

**“Pixel Art 1.33 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.34 — Warrior'ın hazırlık pozunu çiz](/pixel-art/34-warrior-windup).
