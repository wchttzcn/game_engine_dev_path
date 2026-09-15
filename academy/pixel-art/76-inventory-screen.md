---
title: "1.76 — Envanter ekranını kur"
description: "Çizdiğin UI parçalarını tek bir ekranda yerleştir."
section: Idle oyun · UI
---

# {{ $frontmatter.title }}

**Hedef:** Tek tek çizdiğin parçaları bir araya getirip çalışan bir ekran kur.

**Önce şu teknik:** [1.21 — 9-slice çerçeve kur](/pixel-art/21-nine-slice) — Ekranın paneli ve çerçeveleri hep aynı kuralla büyür.

## Görev

160×96 bir dosyada envanter ekranı kur: 9-slice panel, `INVENTORY` başlığı, kuşanılmış dört slot, karakter portresi ve seviyesi, altta sekizerli iki sıra çanta slotu. Boş slotlar sönük kalsın. `art/idle-ui/inventory-screen.aseprite` olarak kaydet.

## Ne zaman bitti?

- Ekranda başlık, kuşanılanlar, portre ve çanta bölgeleri ayrı ayrı okunuyor.
- Bütün slotlar aynı 12×12 çerçeveden; dolu olanlar parlak, boşlar sönük.
- Hiçbir bölge diğerine değmiyor; kaynak 160×96.

## Bilmen gereken küçük parça

Şimdiye kadar parçaları tek tek çizdin: slot, çerçeve, rakam, harf, panel. Bu ders yeni bir parça çizmiyor — **var olanları yerleştiriyor.** Bir oyunun ekranı, iyi parçaların toplamı değil, iyi yerleştirilmiş parçaların toplamıdır.

Yerleşimin üç kuralı var. **Bölgele:** başlık, kuşanılanlar ve çanta ayrı alanlarda dursun; aralarında boşluk veya ince bir çizgi olsun. **Tekrarla:** on altı slotun hepsi aynı çerçeveden çıksın, değişen yalnız kenar rengi ve içerik olsun. **Söndür:** boş slotlar görünür ama sönük kalsın, çünkü oyuncunun kaç yerinin boş olduğunu görmesi gerekir.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/inv-grid.svg" width="650" height="160" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:5px 5px;outline:1px solid #486452" alt="Sekizerli iki sıra envanter slotu; sondakiler sönük." /></div>
    <figcaption><strong>1 · Izgara</strong><br />Aynı slot on altı kez. Aralar eşit; dolu ve boş olanlar farklı parlaklıkta.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/screens/inventory.svg" width="640" height="384" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:4px 4px;outline:1px solid #486452" alt="INVENTORY başlıklı tam envanter ekranı." /></div>
    <figcaption><strong>2 · Ekran</strong><br />Başlık, kuşanılanlar, portre ve çanta. Dört bölge, tek panel.</figcaption>
  </figure>
</div>

Aynı yerleşim kuralları dükkân, kahraman listesi ve ödül ekranı için de geçerli. Bir ekranı kurduğunda diğerleri kolaylaşır: aynı panel, aynı başlık yüksekliği, aynı slot aralığı. Ekranlar arasında ölçü değiştirmek oyuncuyu her seferinde yeniden öğrenmeye zorlar.

## Sınırlar

Tek ekran ve durağan görüntü. Kaydırma, sürükle bırak, eşya bilgisi kutusu ve sıralama bu göreve girmiyor.

::: details İpucu 1 — Ekran kalabalık duruyor
Bölgeler arasında boşluk yok olabilir. Başlıktan sonra ince bir çizgi, bölgeler arasında en az dört pixel bırak.
:::

::: details İpucu 2 — Slotlar düzensiz görünüyor
Aralar eşit olmalı. Bir slot 12 pixel ise adım 16 olsun; her satırda aynı.
:::

::: details İpucu 3 — Tam yerleşim
Panel 5–156. sütunlar. Başlık 10. satırda, kuşanılanlar 30. satırda, çanta 57. ve 73. satırlarda başlar.
:::

## Birincil kaynak

[Aseprite — Slices](https://www.aseprite.org/docs/slices/).
`RESOURCES.md` içindeki bu belge, Slice aracıyla bölge işaretlemeyi ve 9-slice ile paneli istediğin boyda kurmayı açıklar. Ekranın bölgeleri ve aralıkları bu dersin seçimidir.

**Kazanım:** Parçaları bir araya getirip çalışan bir ekran kurabiliyorsun.

**“Pixel Art 1.76 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.77 — İkinci para birimini çiz](/pixel-art/77-prestige-currency).
