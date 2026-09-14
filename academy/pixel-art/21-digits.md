---
title: "1.21 — 3×5 rakam seti çiz"
description: "Idle oyunun en çok kullanacağı çizimi, on küçük rakamı üret."
section: Teknik · tekrar eden parçalar
---

# {{ $frontmatter.title }}

**Hedef:** Sayıları ekranda gösterebilmek için kendi küçük rakamlarını çiz.

## Görev

39×5 transparent RGB dosyada sıfırdan dokuza on rakam çiz. Her rakam 3 pixel genişliğinde, 5 pixel yüksekliğinde olsun ve aralarında birer pixel boşluk kalsın. Renk için `#e9dfc2` kullan. `art/idle-ui/digits.aseprite` olarak kaydet.

## Ne zaman bitti?

- On rakamın hepsi var ve hepsi 3×5 kutuya sığıyor.
- Rakamlar arasında birer pixel boşluk var; hiçbiri komşusuna değmiyor.
- Altı ile sekiz, üç ile dokuz birbirinden ayırt edilebiliyor.

## Bilmen gereken küçük parça

Bir idle oyun ekranında en çok görünen şey sayıdır: altın, hasar, seviye, süre. Buna rağmen pakette şimdiye kadar tek bir rakam çizmedik.

3×5 bir rakamın okunur kalabildiği en küçük ölçüdür. Üç pixel genişlikte her rakam iki dikey çizgi ve aralarındaki boşluktan oluşur; hangi satırların dolu olduğu rakamı belirler. Altı ile sekizin farkı tek bir pixel'dir, o yüzden her rakamı yazdıktan sonra %100 görünümde okuyup kontrol et.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/digits-034.svg" width="176" height="80" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="3×5 ölçüsünde sıfır, üç ve dört rakamları yan yana." /></div>
    <figcaption><strong>1 · Üç örnek</strong><br />Sıfır kapalı bir kutu, üç sağa dayalı, dört sol üstte açık. Kalıbı bu üçünden çıkar.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/digits.svg" width="312" height="40" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Sıfırdan dokuza kadar on rakamın tamamı." /></div>
    <figcaption><strong>2 · Bütün set</strong><br />Kalan yedi rakamı aynı kutuya sığdır. Aralarda birer pixel boşluk bırak.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/digits-use.svg" width="216" height="96" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Coin ikonunun yanında 12 sayısı." /></div>
    <figcaption><strong>3 · Kullanımda</strong><br />Rakamlar bir ikonun yanında dursun. Sayıyı ikonun içine yazmak gerekmiyor.</figcaption>
  </figure>
</div>

Rakamları tek dosyada yan yana tutmak, oyunun her birini konumundan kesip alabilmesi için yeterli. Aynı kutuya artı, eksi ve yüzde işareti de ekleyebilirsin; aynı 3×5 kuralına uydukları sürece set büyür.

## Sınırlar

Yalnız rakamlar. Harfler, noktalama, farklı yazı kalınlıkları ve hazır font kullanımı bu göreve girmiyor.

::: details İpucu 1 — Altı ile sekiz karışıyor
Altının sağ üst köşesi boş kalmalı. Sekizde dört köşe de dolu.
:::

::: details İpucu 2 — Rakamlar birbirine yapışıyor
Her rakam dört pixel'lik bir adımla başlar: üç pixel çizim, bir pixel boşluk.
:::

::: details İpucu 3 — Tam yerleşim
Bir rakam 1., 3. ve 5. satırlarda yatay çizgi, 2. ve 4. satırlarda dikey pixel'ler kullanır. Birinci rakam 1–3. sütunlarda, ikincisi 5–7. sütunlarda ve böyle devam eder.
:::

## Birincil kaynak

[Aseprite — Drawing](https://www.aseprite.org/docs/drawing/).
`RESOURCES.md` içindeki bu belge, tek pixel ve çizgi araçlarıyla küçük şekiller kurmayı açıklar. Rakamların biçimi ve 3×5 ölçüsü bu dersin seçimidir.

**Kazanım:** Artık ekranda sayı gösterebilirsin. Idle oyunun en çok tekrar eden görseli elinde.

**“Pixel Art 1.21 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.22 — 8×8 mage çiz](/pixel-art/22-mage).
