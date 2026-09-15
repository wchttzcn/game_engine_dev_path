---
title: "1.92 — Stat satırını hizala"
description: "Beş stat satırını tek bir sütunda biten sayılarla oku."
section: Idle oyun · stat ve ekipman
---

# {{ $frontmatter.title }}

**Hedef:** Beş stat satırını, göz her seferinde aynı sütunu tarayacak şekilde diz.

**Önce şu teknik:** [1.22 — 3×5 rakam seti çiz](/pixel-art/22-digits) — Ad ve değeri bu 3×5 setle yazacaksın.

## Görev

64×8 bir stat satırı kur: solda 8×8 ikon, iki pixel boşluk, 3×5 harflerle üç harfli ad, sağ kenara dayalı 3×5 rakamlarla değer. Sonra beş satırı 9 pixel aralıkla alt alta diz. Ad rengi `#637980`, değer rengi `#e9dfc2` olsun. `art/idle-ui/stat-panel.aseprite` olarak kaydet.

## Ne zaman bitti?

- Tek satırda ikon solda, ad ortada, değer sağda; ad ve değer arasında boşluk var.
- Beş satır da 9 pixel aralıkla alt alta duruyor.
- Beş değerin de son rakamı aynı sütunda bitiyor.
- Ad `#637980`, değer `#e9dfc2` renginde.
- `art/idle-ui/stat-panel.aseprite` beş satır olarak kaydedildi.

## Bilmen gereken küçük parça

Beş stat alt alta gelince asıl iş çizim değil **hizalama** olur. Tek satırda ikon, ad ve değeri yan yana koymak kolay; zorluk beş satırı üst üste getirdiğinde başlıyor.

Sayılar sola dayanırsa `9` ile `260` farklı sütunda başlar ve göz her satırda sayıyı yeniden arar — kaç basamaklı olduğunu önce anlaman gerekir. Sağa dayarsan sayıların sonu tek bir sütunda biter; göz tek bir dikey çizgiyi tarar, basamak sayısı fark etmez.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/stats/line-atk.svg" width="512" height="64" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Tek stat satırı: ikon, ad, sağa dayalı değer." /></div>
    <figcaption><strong>1 · Tek satır</strong><br />İkon solda, ad ondan iki pixel sonra, değer sağ kenara dayalı.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/stats/panel.svg" width="384" height="264" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:6px 6px;outline:1px solid #486452" alt="Beş satır, doğru hiza: bütün değerler aynı sütunda bitiyor." /></div>
    <figcaption><strong>2 · Doğru hiza</strong><br />Beş satırın değeri de aynı sağ sütunda bitiyor; göz tek bir dikey çizgiyi tarar.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/stats/panel-bad.svg" width="384" height="264" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:6px 6px;outline:1px solid #486452" alt="Aynı beş satır, bozuk hiza: değerler farklı sütunlarda başlıyor." /></div>
    <figcaption><strong>3 · Bozuk hiza</strong><br />Aynı beş satır, ama değerler sola dayalı; her satırda göz sayının sonunu yeniden bulmak zorunda.</figcaption>
  </figure>
</div>

İki paneli yan yana koy: doğru hizada tek bir dikey çizgi çiz gözünle, ATK'den CRIT'e kadar hiç kaymadan iner. Bozuk hizada aynı çizgiyi çizemezsin, çünkü her satırın değeri kendi basamak sayısına göre farklı sütunda başlıyor. Bu, pixel art kararı değil okuma kararıdır — ama pixel'le uygulanır: sağa dayamak, en sağdaki basamağı sabit sütuna koyup geri kalan basamakları soldan eklemek demektir.

## Sınırlar

Yalnız beş statın tek satırlık hizası bu görevde. Panel çerçevesi, arka plan ve stat farkı okları sonraki derslere giriyor.

::: details İpucu 1 — İkon ile ad birbirine yapışıyor
İkon 8 pixel genişliğinde; ad ondan en az iki pixel sonra başlasın. Boşluk azsa göz ikonu adın bir parçası sanır.
:::

::: details İpucu 2 — Satırlar birbirine değiyor
Her satır 8 pixel yüksekliğinde bir kutu kaplıyor. Bir sonraki satırın üst kenarını bir öncekinin üst kenarından dokuz pixel aşağı koy; aradaki tek pixel boşluk satırları birbirinden ayırır.
:::

::: details İpucu 3 — Tam yerleşim
İkon 1–8. sütunlar. Ad 10–20. sütunlarda üç harf, her harf üç pixel ve aralarında bir pixel boşlukla (10–12, 14–16, 18–20). Değer 64. sütunda biter, basamak sayısı kaç olursa olsun sağdan sola doğru yazılır. Satır başlangıçları sırasıyla 0, 9, 18, 27, 36. satırlar; her satır kendi 8 pixel'lik yüksekliğini kaplar.
:::

## Birincil kaynak

[Aseprite — Layers](https://www.aseprite.org/docs/layers/).
`RESOURCES.md` içindeki bu belge, nesneyi deneme zemininden ayrı tutmayı ve layer görünürlüğünü değiştirmeyi anlatır. İkonu, adı ve değeri ayrı layer'larda tutup üst üste kaydırarak hizalamak bu dersin seçimidir.

**Kazanım:** Beş stat satırını, basamak sayısı ne olursa olsun tek bir dikey çizgide biten değerlerle okunur hâle getirdin.

**“Pixel Art 1.92 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.93 — Stat farkını okla göster](/pixel-art/93-stat-delta).
