---
title: "1.47 — Kilitli slot ve artı düğmesi çiz"
description: "Aynı slot kalıbından kapalı ve eyleme çağıran iki durum üret."
section: Idle UI'ı tamamla
---

# {{ $frontmatter.title }}

**Hedef:** Bir UI parçasının kullanılabilir olup olmadığını tek bakışta göster.

## Görev

1.26'daki slotu iki kez çoğalt. Birincisinde çerçeveyi soluklaştır ve ortasına kilit işareti koy; ikincisinde ortasına `#ffe5a3` renginde artı koy. `art/idle-ui/slot-states.aseprite` olarak kaydet.

## Ne zaman bitti?

- Kilitli slot diğerlerinden belirgin biçimde sönük.
- Artılı slot parlak; artı kollarının uzunluğu eşit.
- İki slotun da dış ölçüsü 12×12 ve çerçeve yeri aynı.

## Bilmen gereken küçük parça

Idle oyunun UI'ında her kutu tıklanabilir değildir. Bazıları henüz açılmamıştır, bazıları oyuncuyu bir şey yapmaya çağırır. Bu ikisini ayıran şey **parlaklık.**

Kapalı olan söner: renk doygunluğu düşer, çerçeve zemine yaklaşır. Eyleme çağıran parlar: en açık rengi o kullanır. Aynı kural bütün UI için geçerli; ekrandaki en parlak şey, oyuncunun yapmasını istediğin şey olmalı.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/slot-locked.svg" width="144" height="144" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Sönük çerçeveli, ortasında kilit olan slot." /></div>
    <figcaption><strong>1 · Kilitli</strong><br />Çerçeveyi zemine yaklaştır. Kilit işareti de aynı sönük tonda kalsın.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/slot-plus.svg" width="144" height="144" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Normal çerçeveli, ortasında açık renk artı olan slot." /></div>
    <figcaption><strong>2 · Yükseltme</strong><br />Çerçeve normal kalsın; artıyı paletteki en açık renkle çiz.</figcaption>
  </figure>
</div>

İki durum yan yana konduğunda hangisinin tıklanabileceği anlaşılıyorsa iş bitmiştir. Aynı sönükleştirme, parası yetmeyen bir satın alma düğmesi veya bekleyen bir yetenek için de kullanılabilir.

## Sınırlar

İki durum ve tek boyut. Basılı hâli, üzerine gelme efekti ve kilidin açılma animasyonu bu göreve girmiyor.

::: details İpucu 1 — Kilitli slot yeterince sönük değil
Çerçeve rengini zeminin rengine yaklaştır. Fark azaldıkça kapalılık artar.
:::

::: details İpucu 2 — Artı çarpı gibi duruyor
Kollar dik ve yatay olmalı, köşegen değil. Dört kol da eşit uzunlukta.
:::

::: details İpucu 3 — Tam yerleşim
Kilit gövdesi 7–10. satırlarda 4–9. sütunlar, kolu 5–6. satırlarda 5. ve 8. sütunlar. Artının dikey kolu 6–7. sütunlarda 4–9. satırlar, yatay kolu 6–7. satırlarda 4–9. sütunlar.
:::

## Birincil kaynak

[Aseprite — Drawing](https://www.aseprite.org/docs/drawing/).
`RESOURCES.md` içindeki bu belge, küçük işaretleri pixel ve dikdörtgen araçlarıyla kurmayı açıklar; [Color Bar](https://www.aseprite.org/docs/color-bar/) renk seçimi içindir. Durum ayrımının parlaklıkla yapılması bu dersin seçimidir.

**Kazanım:** UI'daki bir kutunun açık mı kapalı mı olduğunu yazı kullanmadan anlatabiliyorsun.

**“Pixel Art 1.47 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.48 — Tekrarlanabilir zemin tile'ı çiz](/pixel-art/48-tile).
