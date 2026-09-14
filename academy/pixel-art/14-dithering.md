---
title: "1.14 — Dithering ile geçiş yap"
description: "İki rengi dama deseniyle karıştırarak ara ton üretmeden yumuşak geçiş kur."
section: Teknik · renk ve hacim
---

# {{ $frontmatter.title }}

**Hedef:** Üçüncü bir renk eklemeden iki renk arasını yumuşat.

## Görev

32×16 RGB dosyada iki yeşil alan çiz: üstte `#3b6149`, altta `#557447`. İkisinin arasına iki satırlık dama deseni koy. `art/craft/dither-test.aseprite` olarak kaydet.

## Ne zaman bitti?

- İki alan arasındaki sınırda dama deseni var; sert çizgi kalmamış.
- Desenin üst satırında alt rengin, alt satırında üst rengin pixel'leri var.
- Üçüncü bir renk kullanılmamış; kaynak 32×16.

## Bilmen gereken küçük parça

İki renk yan yana geldiğinde aralarında keskin bir çizgi oluşur. Ara ton eklemek çözümdür ama her ara ton palete yeni bir renk sokar. **Dithering** bu bedeli ödemeden aynı işi yapar: iki rengi dama deseninde karıştırırsın, göz uzaktan ara ton görür.

Geçişin kalınlığı da bir karar. İki satırlık bir dama bandı 32×16'da yeterli; daha kalın bir geçiş, zemini kirli gösterir. 8×8'lik bir sprite'ta ise dithering'e neredeyse hiç yer yoktur — bu teknik büyüdükçe işe yarar.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/world/dither-hard.svg" width="256" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="İki yeşilin sert bir çizgiyle ayrıldığı zemin." /></div>
    <figcaption><strong>1 · Sert sınır</strong><br />İki alanı düz bir çizgiyle ayır. Sınır belirgin bir çizgi olarak okunuyor.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/world/dither-soft.svg" width="256" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Aynı iki yeşil, aralarında iki satırlık dama deseniyle." /></div>
    <figcaption><strong>2 · Dama geçişi</strong><br />Sınıra iki satırlık dama koy. Aynı iki renkle geçiş yumuşadı.</figcaption>
  </figure>
</div>

Deseni elle koymak yerine iki renk arasında seçim yapıp tek tek pixel koymak da olur; önemli olan desenin düzenli olması. Aynı yöntemi ileride bir dış mekânda zemin ile duvar arasında da kullanacaksın.

## Sınırlar

Yalnız iki renk ve tek geçiş bandı. Gradient araçları, çok renkli rampalar ve doku çalışması bu göreve girmiyor.

::: details İpucu 1 — Geçiş kirli görünüyor
Bant çok kalın olabilir. İki satırla başla; gerekirse tek satıra indir.
:::

::: details İpucu 2 — Dama deseni düzensiz
Her satırda bir atlayarak ilerle ve iki satırı birbirinin tersi yap.
:::

::: details İpucu 3 — Tam yerleşim
Üst renk 1–8. satırlar, alt renk 11–16. satırlar. 9. satırda çift sütunlar alt renkte, 10. satırda tek sütunlar alt renkte.
:::

## Birincil kaynak

[Pedro Medeiros — Basic Shading](https://saint11.art/pixel_art_articles/article4/).
`RESOURCES.md` içindeki bu kaynak, bir geçişi yumuşatmak için dither kullanımına değinir. Buradaki iki renkli geçiş, bant kalınlığı ve 32×16 uygulaması bu dersin seçimidir.

**Kazanım:** Palete yeni renk eklemeden geçiş üretebiliyorsun.

**“Pixel Art 1.14 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.15 — Sandığı iki frame ile aç](/pixel-art/15-chest-open).
