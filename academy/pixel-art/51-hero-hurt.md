---
title: "1.51 — Hurt ve death'i kadroya taşı"
description: "Vuruş tepkisini bütün kadroya ver, ölümü her karakterin kimliğine göre ayır."
section: Idle oyun · kadroyu tamamla
---

# {{ $frontmatter.title }}

**Hedef:** Bütün kadronun vurulduğunu aynı kuralla, öldüğünü kendi kimliğiyle göster.

**Önce şu teknik:** [1.17 — Aynı frame'leri üç farklı süreyle dene](/pixel-art/17-timing) — Flash bir kare sürer; ölüm kademeleri süreyle kurulur.

## Görev

Dört karakterin hepsi için 8×8 iki frame'lik birer hurt dosyası kur: normal ve siluetin tamamı `#ffe5a3` flash. Sonra dört ayrı death dosyası çiz — warrior ile archer aynı dört kademeyi paylaşır, mage puff ile yok olur, priest ışığa karışır. `art/characters/` altına `<karakter>-hurt` ve `<karakter>-death` olarak kaydet.

## Ne zaman bitti?

- Dört hurt dosyasında da silüet birebir aynı; yalnız renk değişmiş.
- Warrior ve archer death'i aynı kademeleri izliyor: ayakta, çöküş, yığılma, dağılma.
- Mage'in son iki frame'inde gövde yok; kalan pixel'ler merkezden dışa açılıyor ve alt kenarda kütle kalmıyor.
- Priest'in son iki frame'inde kalan pixel'ler yukarı gidiyor; yere hiçbir şey yığılmıyor.
- Dört death dosyası da dört frame; kaynaklar 8×8.

## Bilmen gereken küçük parça

Vuruş tepkisi bütün kadroda aynıdır. Flash bir kare sürer, siluete dokunmaz, karakteri değiştirmez — bu yüzden dört karaktere de tek kuralla uygulanır.

<PixelAnimation title="Kadro vuruluyor" :columns="32" :frames='[{"src":"/pixel-art/craft/hurt-row-1.svg","label":"Normal","duration":320,"alt":"Dört karakter kendi renkleriyle duruyor."},{"src":"/pixel-art/craft/hurt-row-2.svg","label":"Flash","duration":80,"alt":"Dördünün de silueti tek açık renge dönmüş."}]' />

Ölüm öyle değil. Ölüm, karakterin **neyden yapıldığını** söyleyen tek andır. Warrior ile archer et ve kemiktir: dizleri bükülür, yerçekimi onları aşağı çeker, geriye yerde bir kütle kalır. İkisinin kademeleri birebir aynıdır; yalnız silüet değişir, yeni bir karar gerekmez.

<PixelAnimation title="Warrior ve archer — aynı çöküş" :columns="16" :frames='[{"src":"/pixel-art/craft/death-shared-1.svg","label":"Ayakta","duration":120,"alt":"Warrior ve archer normal duruyor."},{"src":"/pixel-art/craft/death-shared-2.svg","label":"Çöküş","duration":120,"alt":"İkisinin de gövdesi alçalmış, bacakları kaybolmuş."},{"src":"/pixel-art/craft/death-shared-3.svg","label":"Yığılma","duration":140,"alt":"İkisi de yere yayılmış iki satırlık kütleye dönmüş."},{"src":"/pixel-art/craft/death-shared-4.svg","label":"Dağılma","duration":300,"alt":"Alt satırda her ikisinden birkaç ayrı pixel kalmış."}]' />

Mage büyüden yapılmıştır. Büyü yere yığılmaz; **bağı kopar ve dağılır.** Bu yüzden mage aşağı değil, kendi içine çöker: gövde küçülür, sonra yerinde bir puff bulutu açılır ve o bulut dışa doğru seyrelir. Son iki frame'de zeminde tek pixel kalmaması bu farkın tamamıdır — yere bakan göz kütle arar, bulamayınca karakterin düştüğüne değil yok olduğuna karar verir.

<PixelAnimation title="Mage — puff ile yok oluş" :frames='[{"src":"/pixel-art/craft/death-mage-1.svg","label":"Ayakta","duration":120,"alt":"Mage normal duruyor."},{"src":"/pixel-art/craft/death-mage-2.svg","label":"Büzülme","duration":110,"alt":"Gövde küçülüp yerden kesilmiş; üstünde iki soluk pixel belirmiş."},{"src":"/pixel-art/craft/death-mage-3.svg","label":"Puff","duration":130,"alt":"Gövde gitmiş; yerinde açık mor bir bulut halkası var."},{"src":"/pixel-art/craft/death-mage-4.svg","label":"Dağılma","duration":300,"alt":"Dışa doğru açılmış birkaç soluk pixel kalmış."}]' />

Priest ışıkla çalışır. Onun ölümü de **yukarı** gider: gövdenin alt ucundan başlayarak ışığa dönüşür, kalan kütle her frame'de bir satır yükselir ve küçülür, en sonda tepede birkaç kıvılcım söner. Mage ile priest'in ortak yanı geriye ceset bırakmamaları; ayrıldıkları yer yön. Mage dışa açılır, priest yukarı çıkar.

<PixelAnimation title="Priest — ışığa karışma" :frames='[{"src":"/pixel-art/craft/death-priest-1.svg","label":"Ayakta","duration":120,"alt":"Priest normal duruyor."},{"src":"/pixel-art/craft/death-priest-2.svg","label":"Işığa dönüş","duration":110,"alt":"Gövde bir satır yükselmiş, ayakların yerinde açık sarı ışık var."},{"src":"/pixel-art/craft/death-priest-3.svg","label":"Yükselme","duration":130,"alt":"Geriye yukarı doğru giden bir ışık kütlesi kalmış."},{"src":"/pixel-art/craft/death-priest-4.svg","label":"Sönme","duration":300,"alt":"Üst satırlarda sönmek üzere birkaç kıvılcım var."}]' />

Dört ölümü yan yana koyduğunda kadro artık tek bir kuralı paylaşan dört kopya değil; iki et ve kemik, bir büyü, bir ışık. Oyuncu bunu kimse söylemeden anlar.

## Sınırlar

Hurt iki frame, death dört frame. Geri savrulma, kan, yeniden doğma ve hasar sayısı bu göreve girmiyor.

::: details İpucu 1 — Mage puff yerine yığılıyor
Gövdeyi aşağı değil içe çek. Son iki frame'de alt satırda hiç pixel kalmamalı; kalan her pixel zemine ceset okutur.
:::

::: details İpucu 2 — Priest'in ışığı aşağı düşüyor
Işık kütlesini her frame'de bir satır yukarı taşı ve aynı anda küçült. Yukarı giden ama büyüyen bir kütle patlama okunur, sönme değil.
:::

::: details İpucu 3 — Tam yerleşim
Warrior ve archer: çöküşte gövde 4–8. satırlar, yığılmada 7–8, dağılmada yalnız 8. satırda üç pixel. Mage: büzülmede gövde 4–6. satırlar ve 3. satırda iki soluk pixel; 7. ve 8. satırlar boş, puff frame'inde 2–7. satırlara yayılmış içi boş bir halka, son frame'de 2., 4. ve 6. satırlarda ikişer pixel. Priest: ışığa dönüşte gövde 1–5. satırlara çıkar ve 6–7. satırlar ışık olur, yükselmede kütle 1–6. satırlar, sönmede yalnız 1–3. satırlarda dört kıvılcım.
:::

## Birincil kaynak

[Aseprite — Replace Color](https://www.aseprite.org/docs/replace-color/).
`RESOURCES.md` içindeki bu belge, bütün renkleri tek seferde değiştirmeyi açıklar; [Animation](https://www.aseprite.org/docs/animation/) frame sırası içindir. Ölümün üç ayrı kimliğe bölünmesi bu dersin seçimidir.

**Kazanım:** Kadronun tamamı hasar alıyor ve her karakter kendi kimliğine göre ölüyor.

**“Pixel Art 1.51 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.52 — Karakteri sola çevir](/pixel-art/52-hero-flip).
