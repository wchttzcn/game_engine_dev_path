---
title: "1.72 — Başarım rozetini çiz"
description: "Kazanılmış ve kazanılmamış iki hâli olan bir rozet ile üç yıldızlı derece kur."
section: Idle oyun · ilerleme
---

# {{ $frontmatter.title }}

**Hedef:** İlerlemeyi küçük, sık ödüllerle işaretle.

**Önce şu teknik:** [1.11 — Üç value ile ayır](/pixel-art/11-value) — Kazanılan parlar, kazanılmayan söner.

## Görev

12×12 bir başarım rozeti çiz: altın çerçeve ve ortasında yıldız. Sönük bir kopyasını da üret. Ayrıca 5×5 yıldızlardan üç yıldızlı bir derece satırı kur; ikisi altın, biri sönük olsun. `art/idle-ui/achievement.aseprite` olarak kaydet.

## Ne zaman bitti?

- Kazanılmış ve kazanılmamış rozetin ölçüsü aynı, yalnız renkleri farklı.
- Yıldız 5×5 içinde beş uçlu olarak okunuyor.
- Derece satırında dolu ve boş yıldız tek bakışta ayrılıyor; kaynak 12×12.

## Bilmen gereken küçük parça

Idle oyunlar ilerlemeyi **küçük, sık ödüllerle** parçalar. Başarımlar bunun en ucuz biçimidir: oyuncuya nereye gittiğini ve nereden geldiğini gösterirler.

Rozetin iki hâli olmak zorunda. Kazanılmış olan parlar, kazanılmamış olan söner — ama **ikisi de aynı yerde durur.** Sönük rozeti ekrandan kaldırırsan oyuncu neyi kaçırdığını bilemez; asıl motivasyon boş duran kutuları görmektir. Aynı kural derece yıldızlarında da geçerli: üç yıldızlık yerin hep üçü görünür, ikisi doludur.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/badge.svg" width="144" height="144" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Altın çerçeveli, ortasında yıldız olan rozet." /></div>
    <figcaption><strong>1 · Kazanılmış</strong><br />Altın çerçeve, koyu iç alan, açık renk yıldız.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/badge-locked.svg" width="144" height="144" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Aynı rozetin sönük, kazanılmamış hâli." /></div>
    <figcaption><strong>2 · Kazanılmamış</strong><br />Aynı biçim, sönük renkler. Yeri boş bırakılmıyor.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/stars-3.svg" width="238" height="70" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:14px 14px;outline:1px solid #486452" alt="İki dolu, bir sönük yıldızdan oluşan derece satırı." /></div>
    <figcaption><strong>3 · Derece</strong><br />Üç yıldızın üçü de görünür; ikisi dolu. Eksik olan görünmeli.</figcaption>
  </figure>
</div>

Yıldız 5×5'te beş uç ister: tepe bir pixel, ortada en geniş satır, altta iki ayak. Daha küçüğü yıldız değil nokta olur. Aynı yıldızı eşya nadirliği veya bölüm zorluğu için de kullanabilirsin.

## Sınırlar

Tek rozet, iki durum ve bir derece satırı. Başarım listesi ekranı, ilerleme çubuğu ve ödül kutusu bu göreve girmiyor.

::: details İpucu 1 — Yıldız yıldıza benzemiyor
Ortadaki satır en geniş olmalı ve altta iki ayrı ayak kalmalı. Dolu bir beşgen yıldız değildir.
:::

::: details İpucu 2 — Sönük rozet görünmüyor
Zeminden biraz ayrılmalı. Tamamen kaybolursa oyuncu boş yeri fark etmez.
:::

::: details İpucu 3 — Tam yerleşim
Rozet 12×12; yıldız 4–8. sütunlar ve 4–8. satırlar arasında ortalanır.
:::

## Birincil kaynak

[Aseprite — Drawing](https://www.aseprite.org/docs/drawing/).
`RESOURCES.md` içindeki bu belge, küçük şekilleri pixel aracıyla kurmayı açıklar; [Replace Color](https://www.aseprite.org/docs/replace-color/) sönük kopya üretmek içindir. Rozetin ölçüsü ve iki durumlu kurgu bu dersin seçimidir.

**Kazanım:** İlerleme artık ekranda işaretlenebiliyor; kazanılan da kazanılmayan da görünüyor.

**“Pixel Art 1.72 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.73 — Yokken kazandıkların ekranını kur](/pixel-art/73-offline-screen).
