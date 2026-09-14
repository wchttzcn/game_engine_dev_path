---
title: "1.36 — 8×8 archer çiz"
description: "Birkaç pixel'lik kıvrımla karakterin yayını tanınır hale getir."
section: Idle oyun · archer
---

# {{ $frontmatter.title }}

**Hedef:** Bir çizginin kıvrımını, yayı düz bir asadan ayırmak için kullan.

**Önce şu teknik:** [1.9 — Silüet testi yap](/pixel-art/09-silhouette-test) — Yay silüette görünmüyorsa archer tanınmaz.

## Görev

8×8 transparent RGB canvas'ta archer çiz. Başlık ve giysi `#6EAE72`, yüz ve el `#F3C68D`, yay ve ayaklar `#9B6B43` olsun. `art/characters/archer.aseprite` olarak kaydet.

## Ne zaman bitti?

- Yay sağda dışarı kıvrılıyor; uçları merkeze göre bir pixel içeride.
- Yay ile gövde arasında boşluk var; el beşinci satırda yayı tutuyor.
- Canvas 8×8, en fazla üç renk ve kaynak dosya kaydedilmiş.

## Bilmen gereken küçük parça

Priest'in asası dik bir çizgiydi. Archer'ın yayında uçları içeri alarak kıvrım gösteriyoruz. Yayı tanıtmak için şimdilik kiriş, ok ve parmakları aynı çizime sığdırmaya çalışmak gerekmiyor.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/characters/archer-1.svg" width="128" height="128" alt="Geniş yeşil başlık ve üç pixel'lik yüz." /></div>
    <figcaption><strong>1 · Başlık ve yüz</strong><br />İlk satırı boş bırak. Üç, sonra beş yeşil pixel'lik başlık çiz. Altına üç ten rengi pixel yerleştir.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/characters/archer-2.svg" width="128" height="128" alt="Yeşil giysili, iki ayrı ayaklı archer." /></div>
    <figcaption><strong>2 · Gövde ve ayak</strong><br />Üç satır boyunca üçer yeşil pixel'le gövdeyi kur. En alta aralıklı iki kahverengi ayak koy.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas pixel-grid"><img src="/pixel-art/characters/archer.svg" width="128" height="128" alt="Dışarı kıvrılan kahverengi yay ve ona uzanan el." /></div>
    <figcaption><strong>3 · Kıvrılan yay</strong><br />Yayın uçlarını 7. sütuna, ortadaki üç pixel'i 8. sütuna koy. Gövdeden sağa iki ten rengi pixel'le elini uzat.</figcaption>
  </figure>
</div>

Yayı aynı ölçüdeki asayla karşılaştırabilirsin: yalnız bir sütunluk kıvrım farklı bir ekipman okutur. Örneğin kopyası yeterli; %100 görünümde bak ve kaydet.

## Sınırlar

Tek duruş ve tek ekipman, yay biçimini net görmek için. Okun uçuşunu veya isabetini bu çizime eklemiyoruz.

::: details İpucu 1 — Yay asa gibi düz
Orta üç pixel uçlardan bir sütun daha sağda olmalı.
:::

::: details İpucu 2 — Karakter ve yay birleşti
Elin dışındaki satırlarda yay ile gövde arasındaki boşlukları koru.
:::

::: details İpucu 3 — Yayı tamamlayamıyorum
Uçlar: 7. sütunun 3. ve 7. satırları. Orta: 8. sütunun 4–6. satırları. El: 5. satırın 6–7. sütunları.
:::

## Birincil kaynak

[Pedro Medeiros — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/).
`RESOURCES.md` içindeki bu kaynak, az araç ve küçük nesneyle görerek başlamayı destekler. Buradaki 8×8 çizim ve adımlar bu ders için özgün hazırlandı.

**Kazanım:** Aynı 8×8 ölçüde, küçük şekil farklarıyla dört farklı karakter rolü kurabilecek örneklerin oldu.

**“Pixel Art 1.36 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.37 — Archer'ın yay germe pozunu çiz](/pixel-art/37-archer-draw).

