---
title: Alan Sırası ve Padding
---

# 0.2 — Sıra değişince ne değişir?

## Hedef

**Ön koşul:** [0.1 ölçümlerin](/worlds/00-systems/01-memory-layout) hazır olsun. Şimdi verinin anlamını değiştirmeden yalnızca bildirim sırasını değiştirip padding’in nasıl hareket ettiğini göreceksin.

Küçük bir oyun optimizasyonu bazen yeni algoritma değil, veri tanımındaki birkaç satırdır. Fakat doğru sonuç önce tahmin, sonra ölçüm ister.

## Challenge

`labs/00-memory-layout/main.odin` içinde özgün `Bullet` tanımını koru. Yanına `Bullet_Reordered` adında ikinci bir `struct` ekle. Altı alanın adı ve türü tamamen aynı kalmalı:

`active`, `position`, `damage`, `owner`, `velocity`, `lifetime`.

Yalnızca alanların bildirim sırasını değiştir. Yeni tür için önce journal’a toplam boyut ve her alanın ofset tahminini yaz. Ardından programın hem `Bullet` hem `Bullet_Reordered` için boyut, hizalama ve tüm alan ofsetlerini yazdırmasını sağla.

Yeni tahminini **Yeniden sıralama** başlığı altına ekle; mevcut tablolara iki ölçümü kaydet. Sonra bir çizimle padding’in ilk düzende nerede olduğunu, yeni düzende nereye gittiğini veya kaybolduğunu açıkla. Amaç derleyicinin yerleşim kararını alan sırasıyla ilişkilendirmek; tüm olası sıralar arasındaki en küçüğünü bulman gerekmiyor.

## Sınırlar

- `Bullet` tanımını değiştirme.
- `Bullet_Reordered` içindeki altı alanın türünü, adını veya sayısını değiştirme.
- `#packed`, `#align` ya da benzeri bir direktif kullanma. Böylece yalnızca alan sırasını incelersin.
- Yorumunu ölçtüğün boyutla sınırla; bu deney hız farkını ölçmüyor.

## Kabul kanıtı

- Tahmin, ölçümden önce journal’da duruyor.
- Program iki türün `size_of`, `align_of` ve alan ofsetlerini yazdırıyor.
- Journal iki ölçümü ve padding açıklamanı içeriyor.
- Derleme geçiyor: `npm run lab:check`.

Repo kökünden ölçmek için:

```sh
odin run labs/00-memory-layout -out:labs/00-memory-layout/lab
```

Compiler başarısı yalnızca kodun derlendiğini gösterir. Mentor incelemesinde ofsetlerden padding açıklamanı bekleyeceğiz.

::: details İpucu 1 — tahmin yöntemi
Her alanı mevcut ofsetten başlatmayı dene. Alanın hizalamasına uymuyorsa, bir sonraki uygun ofsete geçip aradaki boşluğu not et.
:::

::: details İpucu 2 — iki türü birlikte ölç
Çıktı satırlarını tür adıyla etiketle. Aynı isimli alanın iki türdeki ofsetini
yan yana yazınca boşluğun hangi aralıkta değiştiğini görebilirsin.
:::

::: details İpucu 3 — açıklama kontrolü
Toplam boyut farkını yalnızca “daha az” diye bırakma. Alanların önceki ve yeni ofsetlerini karşılaştırıp hangi boşluğun değiştiğini göster.
:::

::: details Deep Dive — neden direktif yok?
`#packed` ve özel hizalama kuralları binary formatlar veya donanım arayüzleri için gerekli olabilir. Bu derste bunlar alan sırası etkisini gizler. Önce doğal yerleşimi oku; özel yerleşim kararlarını ihtiyaç doğduğunda tartışacağız. Odin’in [size_of](https://pkg.odin-lang.org/base/builtin/#size_of), [align_of](https://pkg.odin-lang.org/base/builtin/#align_of) ve [offset_of](https://pkg.odin-lang.org/base/builtin/#offset_of) yerleşik yordamları ölçüm için yeterli.
:::

## Sonraki

Ölçümlerin journal’da hazır olduğunda [0.3 — Bellek bütçesi](/worlds/00-systems/03-memory-budget) dersine geç.
