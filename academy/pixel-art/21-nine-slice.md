---
title: "1.21 — 9-slice çerçeve kur"
description: "Tek küçük çizimden istediğin boyda panel üretmeyi öğren."
section: Teknik · tekrar eden parçalar
---

# {{ $frontmatter.title }}

**Hedef:** Bir çerçeveyi, köşelerini bozmadan büyütebilir hâle getir.

## Görev

12×12 transparent RGB dosyada bir panel çerçevesi çiz: köşeler `#92afc3`, kenarlar `#637980`, iç alan `#182e33`. Slice aracıyla çerçeveye 9-slice bilgisi ekle ve köşe payını 3 pixel yap. `art/idle-ui/panel.aseprite` olarak kaydet.

## Ne zaman bitti?

- Dört köşe birbirinin aynası; kenarlar köşeler arasında tekrar eden düz bir desen.
- Slice tanımlı ve iç dikdörtgen köşelerden 3 pixel içeride başlıyor.
- Kaynak 12×12 ve kaydedilmiş.

## Bilmen gereken küçük parça

UI'da panel, tooltip ve kutu her yerde farklı boyda olur. Her boy için ayrı çizim yapmak imkânsız. Çözüm **9-slice:** çizimi dokuz parçaya bölersin.

Kural şu: dört köşe hiç esnemez, dört kenar yalnız kendi yönünde tekrar eder, ortadaki alan her yöne yayılır. Bu yüzden kenarların deseni tekrar edebilir olmalı; köşelerde ne varsa o kadar kalır.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/frame-12.svg" width="144" height="144" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="12×12 çerçeve; köşeleri açık, kenarları orta tonda." /></div>
    <figcaption><strong>1 · Temel çerçeve</strong><br />Köşeleri kenarlardan açık renkte çiz. İç alan koyu kalsın.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/frame-slice.svg" width="144" height="144" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Aynı çerçeve, üstünde dokuz parçaya bölen sarı çizgiler." /></div>
    <figcaption><strong>2 · Dokuz parça</strong><br />Sarı çizgiler kesim yerleri. Köşeler 3×3; aradaki şeritler tekrar edecek alanlar.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/frame-24.svg" width="192" height="160" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Aynı kurallarla kurulmuş 24×20 çerçeve." /></div>
    <figcaption><strong>3 · Büyütülmüş hâli</strong><br />Köşeler aynı kaldı, kenarlar uzadı. Tek çizimden ikinci bir boy çıktı.</figcaption>
  </figure>
</div>

Slice aracına `Shift+C` ile geçip çerçevenin tamamını işaretle, sonra slice'a çift tıklayıp 9-slices alanını doldur. Aseprite içinde çerçeveyi yeniden boyutlandırdığında köşelerin bozulmadığını görürsün. Oyunda aynı bilgi, paneli istediğin boyda çizmeni sağlar.

## Sınırlar

Tek çerçeve ve tek slice tanımı. Gölge, köşe süsü, başlık çubuğu ve kaydırma çubuğu bu göreve girmiyor.

::: details İpucu 1 — Büyütünce köşeler bozuluyor
Köşe payı çok küçük olabilir. 3 pixel'lik köşe, 1 pixel'lik kenardan daha dayanıklıdır.
:::

::: details İpucu 2 — Kenarlar tekrar edince deseni bozuluyor
Kenar şeridi tek renk olsun. Kenara koyduğun her ayrıntı tekrar ederken göze çarpar.
:::

::: details İpucu 3 — Tam yerleşim
Köşeler 1–3. ve 10–12. sütun ile satırlarda. Kesim çizgileri 3. ve 8. sütun ile satırlarda; iç alan 4–9. aralıkta kalır.
:::

## Birincil kaynak

[Aseprite — Slices](https://www.aseprite.org/docs/slices/).
`RESOURCES.md` içindeki bu belge, Slice aracıyla bölge işaretlemeyi ve Slice Properties içindeki 9-slices alanını açıklar. Çerçevenin renkleri ve 3 pixel'lik köşe payı bu dersin seçimidir.

**Kazanım:** Artık tek bir küçük çizimden her boyda panel çıkarabilirsin. Canvas büyümedi, kullanım alanı büyüdü.

**“Pixel Art 1.21 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.22 — 3×5 rakam seti çiz](/pixel-art/22-digits).
