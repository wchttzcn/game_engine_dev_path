---
title: "1.17 — Aynı frame'leri üç farklı süreyle dene"
description: "Tek pixel değiştirmeden, yalnız süreyle üç farklı his üret."
section: Teknik · hareket
---

# {{ $frontmatter.title }}

**Hedef:** Bir animasyonun karakterini belirleyen şeyin yalnız çizim olmadığını gör.

## Görev

1.16'daki coin dönüşünü aç ve üç kopyasını üret. Birincide bütün frame'ler 40 ms, ikincide 300 ms olsun; üçüncüde ilk frame 600, diğerleri 80, 60 ve 80 ms olsun. Üçünü de oynat ve hangisinin bir oyun ekranında işe yarayacağını not et. `art/craft/timing-test.aseprite` olarak kaydet.

## Ne zaman bitti?

- Üç denemede de çizimler birebir aynı; tek bir pixel değişmemiş.
- Üç farklı süre ayarı kaydedilmiş ve oynatıldığında farklı hissettiriyor.
- Hangi ayarın hangi durum için uygun olduğuna dair bir seçim yapılmış.

## Bilmen gereken küçük parça

Animasyonun yarısı çizim, yarısı süredir. Aynı dört kare saniyede altı kez oynarsa titreme, saniyede bir kez oynarsa **ağır bir dönüş** olur. Aradaki fark tek bir sayıda.

Eşit süreler mekanik bir his verir; makineler böyle hareket eder. Üçüncü denemedeki dengesiz süre ise coin'i bir süre durdurup sonra hızlıca çevirir — canlı olan budur. Bundan sonra bir animasyon yavan geldiğinde ilk bakacağın yer çizim değil, süreler olsun.

<PixelAnimation title="Hızlı — her frame 40 ms" :frames='[{"src":"/pixel-art/craft/coin-spin-1.svg","label":"Tam yüz","duration":40,"alt":"Coin tam yüzüyle."},{"src":"/pixel-art/craft/coin-spin-2.svg","label":"Yarı","duration":40,"alt":"Coin dört pixel genişliğinde."},{"src":"/pixel-art/craft/coin-spin-3.svg","label":"Kenar","duration":40,"alt":"Coin iki pixel genişliğinde."},{"src":"/pixel-art/craft/coin-spin-4.svg","label":"Diğer yarı","duration":40,"alt":"Coin yeniden dört pixel."}]' />

<PixelAnimation title="Yavaş — her frame 300 ms" :frames='[{"src":"/pixel-art/craft/coin-spin-1.svg","label":"Tam yüz","duration":300,"alt":"Coin tam yüzüyle."},{"src":"/pixel-art/craft/coin-spin-2.svg","label":"Yarı","duration":300,"alt":"Coin dört pixel genişliğinde."},{"src":"/pixel-art/craft/coin-spin-3.svg","label":"Kenar","duration":300,"alt":"Coin iki pixel genişliğinde."},{"src":"/pixel-art/craft/coin-spin-4.svg","label":"Diğer yarı","duration":300,"alt":"Coin yeniden dört pixel."}]' />

<PixelAnimation title="Dengesiz — 600, 80, 60, 80 ms" :frames='[{"src":"/pixel-art/craft/coin-spin-1.svg","label":"Uzun duruş","duration":600,"alt":"Coin tam yüzüyle duruyor ve bekliyor."},{"src":"/pixel-art/craft/coin-spin-2.svg","label":"Yarı","duration":80,"alt":"Coin dört pixel genişliğinde."},{"src":"/pixel-art/craft/coin-spin-3.svg","label":"Kenar","duration":60,"alt":"Coin iki pixel genişliğinde."},{"src":"/pixel-art/craft/coin-spin-4.svg","label":"Diğer yarı","duration":80,"alt":"Coin yeniden dört pixel."}]' />

Üç örnek de aynı dört dosyayı kullanıyor. Frame süresini `Frame > Frame Properties` ile veya timeline'da frame'e çift tıklayarak değiştirebilirsin. Aynı soruyu ileride karakter idle'ında, yürüyüşünde ve efektlerinde tekrar soracaksın.

## Sınırlar

Yalnız süre denemesi. Yeni frame eklemek, çizim düzeltmek ve easing bu göreve girmiyor.

::: details İpucu 1 — Üç deneme de aynı geliyor
Süre farkları yeterince büyük değil. 40 ile 300 arasındaki fark yedi kattan fazla olmalı.
:::

::: details İpucu 2 — Hızlı olan titriyor
Bu beklenen sonuç. Titreme bir hata değil; o hızın bu iş için yanlış olduğunu gösteren bir bilgi.
:::

::: details İpucu 3 — Hangisini seçeceğimi bilmiyorum
Nesnenin ne yaptığına bak: dikkat çekmesi gerekiyorsa dengesiz, arka planda duracaksa yavaş ve eşit.
:::

## Birincil kaynak

[Aseprite — Frame Duration](https://www.aseprite.org/docs/frame-duration/).
`RESOURCES.md` içindeki bu belge, her frame'e ayrı süre vermeyi açıklar; [Animation](https://www.aseprite.org/docs/animation/) playback içindir. Üç süre ayarı ve karşılaştırma bu dersin kurgusudur.

**Kazanım:** Bir animasyonu çizimi değiştirmeden düzeltebileceğini biliyorsun.

**“Pixel Art 1.17 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.18 — Hazırlık karesiyle ağırlık ver](/pixel-art/18-chest-weight).
