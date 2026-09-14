---
title: "1.22 — 3×5 harf seti çiz"
description: "Rakamlarla aynı kutuya A'dan Z'ye harfleri sığdır."
section: Teknik · tekrar eden parçalar
---

# {{ $frontmatter.title }}

**Hedef:** Ekrandaki düğmeleri ve eşya adlarını kendi harflerinle yaz.

## Görev

103×5 transparent RGB dosyada A'dan Z'ye yirmi altı harf çiz. Her harf 3 pixel genişliğinde, 5 pixel yüksekliğinde olsun ve aralarında birer pixel boşluk kalsın. Renk için `#e9dfc2` kullan. `art/idle-ui/letters.aseprite` olarak kaydet.

## Ne zaman bitti?

- Yirmi altı harfin hepsi var ve hepsi 3×5 kutuya sığıyor.
- Harfler arasında birer pixel boşluk var; hiçbiri komşusuna değmiyor.
- M ile N, O ile Q, E ile F birbirinden ayırt edilebiliyor.

## Bilmen gereken küçük parça

1.21'de rakamları çizdin; artık altın miktarını yazabiliyorsun. Ama bir düğmenin üstünde `SHOP`, bir eşyanın yanında `RING` yazması için **harflere** ihtiyacın var.

3 pixel genişlik yirmi altı harf için dar görünür ama yeter. Zor olanlar birbirine benzeyenlerdir: M ile N, O ile Q, E ile F, P ile R. Bu çiftleri çizer çizmez yan yana koyup %100 görünümde bak. Bir harf komşusuna benziyorsa o harfi değiştir, bütün seti değil.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/letters-abc.svg" width="176" height="80" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="3×5 ölçüsünde A, B ve C harfleri yan yana." /></div>
    <figcaption><strong>1 · Üç örnek</strong><br />A ortadan bölünmüş bir kutu, B sağ tarafı iki kez giren bir kutu, C açık bir kutu.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/letters.svg" width="618" height="30" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:6px 6px;outline:1px solid #486452" alt="A harfinden Z harfine yirmi altı harfin tamamı." /></div>
    <figcaption><strong>2 · Bütün set</strong><br />Kalan yirmi üç harfi aynı kutuya sığdır. Aralarda birer pixel boşluk bırak.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/letters-use.svg" width="456" height="168" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="İçinde SHOP yazan düğme." /></div>
    <figcaption><strong>3 · Kullanımda</strong><br />Harfler bir düğmenin ortasında. Yazı düğmeden en az iki pixel içeride durur.</figcaption>
  </figure>
</div>

Harfleri rakamlarla aynı dosyada tutmak işini kolaylaştırır: tek bir metin seti olur ve 1.65'teki kit'e tek grup olarak girer. Küçük harf çizmene gerek yok; bu ölçüde büyük harf hem daha okunur hem daha az iş.

## Sınırlar

Yalnız büyük harfler. Küçük harfler, Türkçe karakterler, noktalama ve değişken genişlikli yazı bu göreve girmiyor.

::: details İpucu 1 — M ile N karışıyor
M'nin ortası üstte dolu, N'nin sol sütunu boydan boya dolu olsun. İkisini yan yana yazıp bak.
:::

::: details İpucu 2 — Harfler çok sıkışık görünüyor
Her harf dört pixel'lik adımla başlar: üç pixel çizim, bir pixel boşluk. Boşluğu yeme.
:::

::: details İpucu 3 — O ile Q ayrılmıyor
Q'nun sağ alt köşesine kutunun dışına taşan tek bir pixel ekle.
:::

## Birincil kaynak

[Aseprite — Drawing](https://www.aseprite.org/docs/drawing/).
`RESOURCES.md` içindeki bu belge, tek pixel ve çizgi araçlarıyla küçük şekiller kurmayı açıklar. Harflerin biçimi ve 3×5 ölçüsü bu dersin seçimidir.

**Kazanım:** Ekranda yazı yazabilirsin. Düğme, eşya adı ve bölüm başlığı artık senin çizimin.

**“Pixel Art 1.22 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.23 — 8×8 mage çiz](/pixel-art/23-mage).
