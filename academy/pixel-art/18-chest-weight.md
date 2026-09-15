---
title: "1.18 — Hazırlık karesiyle ağırlık ver"
description: "Hareketin tersine giden bir kare ekleyerek açılışa ağırlık kazandır."
section: Teknik · hareket
---

# {{ $frontmatter.title }}

**Hedef:** Bir hareketi, öncesine bir kare ekleyerek ağırlaştır.

## Görev

1.15'teki sandık açılışına bir hazırlık karesi ekle: kapak açılmadan önce bir pixel bastırılsın. Üç frame kur — bastırma, açılış, yerleşme — ve süreleri 200, 70 ve 500 ms yap. `art/craft/chest-weight.aseprite` olarak kaydet.

## Ne zaman bitti?

- İlk frame'de sandık normalden basık; kapak bir pixel aşağıda.
- İkinci frame en kısa süreli ve kapak en yukarıda.
- Üçüncü frame açılışın yerleştiği ara konum; kaynak 8×8.

## Bilmen gereken küçük parça

1.15'te sandık açıldı ama açılış hafif kaldı. Eksik olan şey **hazırlık:** bir hareket başlamadan önce kısa bir an ters yöne gider.

Zıplamadan önce çömelirsin, vurmadan önce kolu geri çekersin, kapak açılmadan önce bir an bastırılır. Süre dağılımı da kuralın parçası: hazırlık uzun, asıl hareket kısa, yerleşme orta. Hareketin kısa olması onu hızlı gösterir; hazırlığın uzun olması o hızı hissettirir.

<PixelAnimation title="Sandık — hazırlık, açılış, yerleşme" :frames='[{"src":"/pixel-art/craft/chest-press.svg","label":"Hazırlık","duration":200,"alt":"Sandık basık; kapak bir pixel aşağı bastırılmış."},{"src":"/pixel-art/craft/chest-open.svg","label":"Açılış","duration":70,"alt":"Kapak en yukarıda; içerideki karanlık iki satır."},{"src":"/pixel-art/craft/chest-mid.svg","label":"Yerleşme","duration":500,"alt":"Kapak bir satır geri inmiş ve orada duruyor."}]' />

Üç kare artık başı, ortası ve sonu olan tam bir hareket. Aynı yapıyı ileride warrior'ın kılıç vuruşunda ve mage'in büyü yapmasında aynen kullanacaksın: önce geri çekil, sonra hızlıca yap, sonra yerleş.

## Sınırlar

Üç kare ve tek hareket. Sallanma, sekme ve ikinci bir geri tepme karesi bu göreve girmiyor.

::: details İpucu 1 — Hazırlık fark edilmiyor
Bastırma karesinin süresini uzat. Ağırlığı veren şey hareket değil, öncesindeki bekleyiş.
:::

::: details İpucu 2 — Sandık zıplıyor gibi
Gövde sabit kalmalı. Bastırma yalnız kapakta olur; bütün sandığı aşağı taşıma.
:::

::: details İpucu 3 — Tam yerleşim
Bastırmada kapak 3–4. satırlar. Açılışta kapak 2. satır ve koyu boşluk 3–4. satırlar. Yerleşmede kapak 2–3. satırlar ve koyu boşluk 4. satır.
:::

## Birincil kaynak

[Aseprite — Onion Skinning](https://www.aseprite.org/docs/onion-skinning/).
`RESOURCES.md` içindeki bu belge, önceki kareyi soluk görerek yeni kareyi kurmayı açıklar; [Frame Duration](https://www.aseprite.org/docs/frame-duration/) süre dağılımı içindir. Hazırlık, açılış ve yerleşme kurgusu bu dersin seçimidir.

**Kazanım:** Bir hareketi ağırlaştırmanın en ucuz yolunu biliyorsun: bir kare geri çekil.

**“Pixel Art 1.18 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.19 — Bir nesneyi parçalara ayır](/pixel-art/19-rock-break).
