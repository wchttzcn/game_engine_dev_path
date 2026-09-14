---
title: "1.77 — Asset'lerini tek sprite sheet'e topla"
description: "Ayrı ayrı çizdiğin 8×8 asset'leri tag'li tek bir sheet'te birleştir."
section: Idle oyun · oyuna bağlan
next: false
---

# {{ $frontmatter.title }}

**Hedef:** Tek tek çizdiğin 8×8 asset'leri, oyunun tek seferde yükleyebileceği bir görüntüde topla.

**Önce şu teknik:** [1.2 — 8×8 PNG çıkar](/pixel-art/02-export) — Tek nesne için öğrendiğin export, burada bütün pakete uygulanır.

## Görev

8×8 yeni bir dosya aç ve çizdiğin 8×8 asset'lerden **en az altısını** sırayla frame olarak içine taşı. Frame aralıklarını `items`, `monsters` ve `heroes` gibi tag'lerle adlandır. `File > Export Sprite Sheet` ile matrix düzeninde `idle-kit.png` çıkar. Kaynağı `art/idle-kit/idle-kit.aseprite` olarak kaydet.

## Ne zaman bitti?

- Tek `.aseprite` dosyasında bütün 8×8 asset'lerin sırayla frame olarak duruyor.
- En az iki tag var ve her tag kendi frame aralığını kapsıyor.
- `idle-kit.png` %100 ölçüde; satır ve sütun sayısı belli, frame'ler arasında boşluk yok.
- Kaynak dosya ile PNG ayrı duruyor; kaynak hâlâ düzenlenebilir.

## Bilmen gereken küçük parça

1.2'de tek bir nesne için PNG çıkardın. Yirmi asset'i yirmi ayrı dosyadan açmak ise oyunun istemediği bir iş. **Sprite sheet tek bir görüntüdür;** oyun her sprite'ı, sheet üzerindeki konumundan — yani bir kaynak dikdörtgeninden — çizer.

Tag, bir frame aralığına isim verir. `heroes` dediğinde hangi dört frame'in karakter olduğu dosyanın içinde yazılı kalır; bu isim daha sonra kodun arayacağı şeydir.

Bir kural var: **aynı ölçüdekiler birlikte gider.** 8×8 eşyalar, monster'lar ve karakterler aynı sheet'e girer. 32×8 can barı, 12×12 eşya slotu ve 32×16 kamp kendi dosyalarında kalır; farklı ölçüleri aynı ızgaraya zorlamak gerekmiyor.

<div class="pixel-steps pixel-steps-wide">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/kit/kit-frames.svg" width="384" height="32" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:32px 32px;outline:1px solid #486452" alt="On iki 8×8 asset tek dosyada yan yana frame olarak sıralanmış." /></div>
    <figcaption><strong>1 · Frame sırası</strong><br />Her asset kendi frame'inde. Izgara çizgileri frame sınırlarını gösterir; sıra senin seçtiğin gruplamadır.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/kit/kit-tags.svg" width="384" height="48" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:32px 32px;outline:1px solid #486452" alt="Frame şeridinin üstünde items, monsters ve heroes tag bantları." /></div>
    <figcaption><strong>2 · Tag'ler</strong><br />Üstteki üç bant sırasıyla <code>items</code>, <code>monsters</code> ve <code>heroes</code>. Her bant kendi frame aralığı kadar uzun.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/kit/kit-sheet.svg" width="256" height="192" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:64px 64px;outline:1px solid #486452" alt="Dört sütun üç satırlık 32×24 sprite sheet." /></div>
    <figcaption><strong>3 · Çıkan sheet</strong><br />On iki frame, 4 sütun × 3 satır olarak 32×24 tek PNG. Şeritteki sıra satır satır devam eder.</figcaption>
  </figure>
</div>

Frame eklemek için `Frame > New Frame`, tag için frame aralığını seçip `Frame > Tags > New Tag` kullan. Export penceresinde **Sheet Type** olarak matrix düzenini seç ve Resize'ı %100 bırak. Çıkan PNG'yi açıp satır sayısını ve frame sınırlarını kontrol et.

## Sınırlar

Bu ders asset'leri **tek dosyada toplamakla** sınırlı. Atlas paketleme, texture yükleme, animasyon durum makinesi ve çizim ölçeği oyunun işleridir; Snake'ten sonra idle oyununa geçtiğinde onları oyunun kendi ihtiyacıyla ele alacağız.

::: details İpucu 1 — Asset'i yeni dosyaya nasıl taşırım?
Eski dosyada `Edit > Select All` ve `Edit > Copy`; yeni dosyada doğru frame'e geçip `Edit > Paste`. İki dosya da 8×8 olduğu için yapıştırma yerinde oturur.
:::

::: details İpucu 2 — Tag bütün frame'leri kaplıyor
Tag oluşturmadan önce Timeline'da yalnız o gruba ait frame aralığını seç. Var olan bir tag'in sınırını sonradan kenarından sürükleyerek de değiştirebilirsin.
:::

::: details İpucu 3 — PNG'de frame'ler üst üste binmiş
Export penceresinde Padding ve Resize alanlarına bak: Padding 0, Resize %100 olmalı. Sheet Type matrix ise sütun sayısını da orada görürsün.
:::

::: details Deep Dive — Oyun bu dosyayı nasıl okur?
Export penceresinin Output bölümünde bir veri dosyası da çıkarabilirsin. Bu dosya her frame'in sheet üzerindeki kutusunu ve tag isimlerini yazar; yani konumları koda elle yazmak zorunda kalmazsın. Şimdilik çıkarman şart değil — idle oyununda asset yüklemeye geldiğimizde hangi biçime ihtiyacın olduğuna birlikte bakarız.
:::

## Birincil kaynak

[Aseprite — Sprite Sheets](https://www.aseprite.org/docs/sprite-sheet/).
`RESOURCES.md` içindeki bu belge, `File > Export Sprite Sheet` ile dışa aktarmayı, sheet düzenlerini ve frame'lerin tag'e göre seçilebilmesini açıklar; [Tags](https://www.aseprite.org/docs/tags/) tag oluşturmayı anlatır. Buradaki kit içeriği ve gruplama bu dersin seçimidir.

**Kazanım:** Ayrı ayrı çizdiğin asset'ler artık tek bir oyun dosyası. Yeni bir asset çizdiğinde sheet'e bir frame eklemen yeterli.

**“Pixel Art 1.77 denememi değerlendir”** yaz; çizimini inceleyelim.
