---
title: "1.50 — Kadronun tamamına idle ver"
description: "1.26'daki iki frame kuralını dört karakterin hepsine uygula."
section: Idle oyun · kadroyu tamamla
---

# {{ $frontmatter.title }}

**Hedef:** Bir tekniği tek karakterde bırakmayıp bütün kadroya taşı.

**Önce şu teknik:** [1.15 — Sandığı iki frame ile aç](/pixel-art/15-chest-open) — Sabit ayak, hareketli gövde — sandıkla aynı kural.

## Görev

1.30, 1.35 ve 1.39'daki warrior, priest ve archer için 8×8 birer idle dosyası kur. Her birinde üst gövde bir pixel alçalsın, ayaklar yerinde kalsın. Frame süreleri 400 ve 400 ms olsun. `art/characters/` altına `warrior-idle`, `priest-idle` ve `archer-idle` olarak kaydet.

## Ne zaman bitti?

- Üç karakterin de iki frame'lik idle dosyası var.
- Her birinde ayaklar iki frame'de de aynı satırda duruyor.
- Alçalan parça gövde ve baş; kimse yana kaymıyor.

## Bilmen gereken küçük parça

1.26'da mage'e nefes aldırdın. Ama warrior, priest ve archer hâlâ taş gibi duruyor. Ekranda yan yana durduklarında **biri canlı üçü ölü** görünür; bu, hiçbirinin canlı olmamasından kötüdür.

İyi haber: yeni bir karar yok. Kural aynı — sabit parça ayaklar, hareket eden parça üst gövde. Bu ders bir teknik öğretmiyor, bir tekniği **tamamlıyor.** Karşılaştırılabilir 8×8 paketlerde her karakterin idle'ı bulunur; tek karakterde kalan bir animasyon eksik sayılır.

<PixelAnimation title="Bütün kadro nefes alıyor" :columns="32" :frames='[{"src":"/pixel-art/craft/idle-row-1.svg","label":"Yukarı","duration":400,"alt":"Dört karakter de dik duruyor."},{"src":"/pixel-art/craft/idle-row-2.svg","label":"Aşağı","duration":400,"alt":"Dördünün de üst gövdesi bir pixel alçalmış."}]' />

Dördünü aynı anda oynatmak kadronun ritmini gösterir. Gerçek oyunda her karakterin süresi biraz farklı olursa daha doğal durur; şimdilik aynı süreyle başla, sonra birinin süresini değiştirip farkı gör.

## Sınırlar

Yalnız iki frame ve dikey hareket. Kol sallama, cübbe dalgalanması ve yön değiştirme bu göreve girmiyor.

::: details İpucu 1 — Karakter yerinde zıplıyor gibi
Ayak satırına dokunma. Yalnız 1–5. satırlar bir aşağı iner.
:::

::: details İpucu 2 — Hareket görünmüyor
Bir pixel az geliyorsa alçalan parçanın üst sınırını kontrol et; baş da inmeli.
:::

::: details İpucu 3 — Tam yerleşim
İkinci frame'de 1–5. satırların içeriği bir satır aşağı taşınır, 6. satır silinir, 7–8. satırlar aynı kalır.
:::

## Birincil kaynak

[Aseprite — Onion Skinning](https://www.aseprite.org/docs/onion-skinning/).
`RESOURCES.md` içindeki bu belge, önceki kareyi soluk görerek ikinci kareyi kurmayı açıklar. Kuralın dört karaktere uygulanışı bu dersin seçimidir.

**Kazanım:** Kadronun tamamı nefes alıyor. Bir teknik, ancak bütün kadroda çalıştığında bitmiş sayılır.

**“Pixel Art 1.50 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.51 — Hurt ve death'i kadroya taşı](/pixel-art/51-hero-hurt).
