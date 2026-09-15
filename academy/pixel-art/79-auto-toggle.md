---
title: "1.79 — AUTO anahtarını çiz"
description: "Açık ve kapalı iki durumu olan bir anahtar kur."
section: Idle oyun · ilerleme
---

# {{ $frontmatter.title }}

**Hedef:** Otomasyonun açık mı kapalı mı olduğunu tek bakışta göster.

**Önce şu teknik:** [1.11 — Üç value ile ayır](/pixel-art/11-value) — Açık ve kapalı durumu value farkı kurar.

## Görev

16×8 transparent RGB dosyada bir anahtarın iki durumunu çiz: kapalıda topuz solda ve raylı alan sönük (`#354b50`), açıkta topuz sağda ve alan yeşil (`#6a9b80`). Yanına `AUTO` yaz. `art/idle-ui/toggle.aseprite` olarak iki frame kaydet.

## Ne zaman bitti?

- İki durumda da anahtarın dış ölçüsü aynı.
- Topuz bir durumda solda, diğerinde sağda; ray rengi de değişiyor.
- Kapalı durum ekranın geri kalanından sönük; kaynak 16×8.

## Bilmen gereken küçük parça

Idle oyunun tanımı otomasyondur: oyuncu bırakır, oyun devam eder. Ama oyuncunun **neyin otomatik olduğunu** görmesi gerekir; yoksa oyunun çalışıp çalışmadığını bilemez.

Anahtar bu bilgiyi iki yönde verir. Topuzun yeri **durumu**, rayın rengi **anlamı** söyler: sönük gri kapalı, yeşil açık. 1.74'teki kilitli slotta da aynı kuralı kullandın — sönük olan çalışmıyor demektir. Aynı dili her yerde tekrar etmek, oyuncunun her ekranı yeniden öğrenmesini önler.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/toggle-off.svg" width="224" height="112" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:14px 14px;outline:1px solid #486452" alt="Topuzu solda, rayı sönük anahtar." /></div>
    <figcaption><strong>1 · Kapalı</strong><br />Topuz solda, ray sönük gri. Hiçbir şey çalışmıyor.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/toggle-on.svg" width="224" height="112" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:14px 14px;outline:1px solid #486452" alt="Topuzu sağda, rayı yeşil anahtar." /></div>
    <figcaption><strong>2 · Açık</strong><br />Topuz sağa geçti, ray yeşile döndü. İki işaret aynı anda değişti.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/auto-row.svg" width="360" height="80" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:10px 10px;outline:1px solid #486452" alt="AUTO yazısı ve yanında açık anahtar." /></div>
    <figcaption><strong>3 · Etiketiyle</strong><br />Anahtarın yanına ne olduğunu yazmadan bir anahtar tek başına anlamsızdır.</figcaption>
  </figure>
</div>

Aynı anahtar otomatik saldırı, otomatik toplama veya sesi kapatma için de kullanılır; değişen tek şey yanındaki yazı. Ekranda birden çok anahtar olduğunda hepsinin aynı ölçüde ve aynı renkte olması, oyuncunun tek bir kuralı öğrenmesi için yeter.

## Sınırlar

İki durum ve tek ölçü. Geçiş animasyonu, üç durumlu anahtar ve basılı hâl bu göreve girmiyor.

::: details İpucu 1 — İki durum birbirine benziyor
Yalnız topuzu taşımak yetmez. Ray rengini de değiştir; iki işaret birlikte çalışsın.
:::

::: details İpucu 2 — Anahtar düğmeye benziyor
Düğme basılır ve geri döner; anahtar konumda kalır. Topuz kenara yaslı durmalı.
:::

::: details İpucu 3 — Tam yerleşim
Ray 2–15. sütunlar, 3–6. satırlar. Topuz 5 pixel genişliğinde: kapalıda 2–6., açıkta 11–15. sütunlarda.
:::

## Birincil kaynak

[Aseprite — Drawing](https://www.aseprite.org/docs/drawing/).
`RESOURCES.md` içindeki bu belge, dikdörtgen alanlarla çizmeyi açıklar; [New Frame](https://www.aseprite.org/docs/new-frame/) durum kopyaları içindir. Anahtarın ölçüleri ve iki yönlü ayrım bu dersin seçimidir.

**Kazanım:** Oyuncu neyin otomatik çalıştığını görebiliyor.

**“Pixel Art 1.79 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.80 — Başarım rozetini çiz](/pixel-art/80-achievement).
