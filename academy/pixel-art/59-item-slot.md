---
title: "1.59 — 12×12 eşya slotu çiz"
description: "8×8 eşya ikonuna kenar payı bırakan bir UI slotu çiz."
section: Idle oyun · UI
---

# {{ $frontmatter.title }}

**Hedef:** Eşya ikonunu çerçeveden ayıracak boşluk bırak.

**Önce şu teknik:** [1.20 — 9-slice çerçeve kur](/pixel-art/20-nine-slice) — Slot, 9-slice kuralının en küçük uygulaması.

## Görev

12×12 transparent RGB dosyada bir eşya slotu çiz. Önceki armor ikonunu aynı 8×8 ölçüsünü koruyarak ortasına kopyala veya örnekten yeniden çiz. `art/idle-ui/item-slot.aseprite` olarak kaydet.

## Ne zaman bitti?

- 8×8 ikon, 12×12 alanın ortasında; dört yönde ikişer pixel pay var.
- En dışta bir pixel çerçeve, onun içinde ikona kadar bir pixel boşluk var.
- İkonun biçimi korunmuş ve dosya kaydedilmiş.

## Bilmen gereken küçük parça

Slot, içine konan eşyanın kendisi değil; onu tutan UI alanı. İkon 8×8 kalırken slotu 12×12 seçiyoruz: iki yanda ikişer pixel yer açılıyor. Böylece çerçeve, omuz veya takı zinciri gibi ince işaretleri örtmez.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/slot-empty.svg" width="120" height="120" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:10px 10px;outline:1px solid #486452" alt="Boş eşya slotu — 12×12" /></div>
    <figcaption><strong>1 · Boş yuva</strong><br />12×12 kareyi #637980 ile çiz. İçteki 10×10 alanı #182E33 yap; bir pixel kalınlığında kenar kalsın.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/slot-armor.svg" width="120" height="120" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:10px 10px;outline:1px solid #486452" alt="Ortalanmış 8×8 armor içeren 12×12 slot" /></div>
    <figcaption><strong>2 · İkonu yerleştir</strong><br />Armor'un 8×8 alanı soldan ve üstten üçüncü pixel'de başlasın. Kaynak ikonun boş pixel'leri de bu alanın parçası.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/slot-selected.svg" width="120" height="120" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:10px 10px;outline:1px solid #486452" alt="Seçili slot — altın çerçeve ve dolu köşe" /></div>
    <figcaption><strong>3 · Seçili görünüm örneği</strong><br />Aynı ikonun etrafındaki kenarı altın renge çevirip sol üst köşeye küçük dolu bir işaret eklemek seçim gösterebilir. Bu üçüncü örneği çizmek isteğe bağlı.</figcaption>
  </figure>
</div>

Görev için ortalanmış tek slot yeterli. Seçim durumunda ikonu büyütüp kenara taşırmak yerine slotun çevresi değişebilir. Ring, boots veya trinket için aynı boş alanı kullanabilirsin.

## Sınırlar

12×12 ölçüsü 8×8 ikon ile UI çerçevesini ayırmak için. İkonu yeniden ölçeklendirme; yerleşim payını büyütüyoruz.

::: details İpucu 1 — İkon çerçeveye değiyor
Slotun kenarı değil, ikonun bütün 8×8 alanı ortalanmalı. İkon içindeki boş pixel'leri hesaba kat.
:::

::: details İpucu 2 — Göz kararı kayıyor
Soldan iki, üstten iki pixel pay bırak; aynı pay sağda ve altta kalır.
:::

::: details İpucu 3 — Tam sınır nedir?
1'den sayarak ikon alanı 3–10. sütunlar ve 3–10. satırlar. Çerçeve 1. ve 12. satır/sütunda; aradaki 2. ve 11. satır/sütun paydır.
:::

## Birincil kaynak

[Aseprite — Drawing](https://www.aseprite.org/docs/drawing/).
`RESOURCES.md` içindeki bu kaynak, pixel ve dikdörtgen alanlarla çizim araçları için;
[New Frame](https://www.aseprite.org/docs/new-frame/) durum kopyaları için kullanıldı.
UI ölçüleri ve görünüşü bu dersin tasarım seçimleridir.

**Kazanım:** Küçük ikonları ezmeden kullanabilecek bir inventory veya equipment slotu çizdin.

**“Pixel Art 1.59 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.60 — Eşya slotuna tier rengi ver](/pixel-art/60-tier-frames).
