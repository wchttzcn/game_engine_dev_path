---
title: "1.28 — Mage için büyü atışı çiz"
description: "Küçük bir büyünün sağa gidişini, kuyruk ve uç biçimiyle anlat."
section: Idle oyun · mage
---

# {{ $frontmatter.title }}

**Hedef:** Bir efektin hareket yönünü kısa kuyruk ve belirgin uçla anlat.

**Önce şu teknik:** [1.17 — Aynı frame'leri üç farklı süreyle dene](/pixel-art/17-timing) — Büyünün hızını çizim değil, frame süreleri belirler.

## Görev

Yeni bir 8×8 transparent RGB dosyada mage'in büyü atışını dört frame olarak çiz. Tek renk `#9DE7F5` kullan ve `art/fx/mage-bolt.aseprite` adıyla kaydet.

## Ne zaman bitti?

- Küçük toplanma, sağa uzanan atış, ayrılan parçalar ve boş frame sırayla görünüyor.
- Atışın ince kuyruğu solda, belirgin ucu sağda; hiçbir pixel canvas dışında değil.
- Frame süreleri sırayla 180, 90, 120, 450 ms; dosya 8×8 ve kaydedilmiş.

## Bilmen gereken küçük parça

Mage'e ilk skill olarak kısa bir büyü atışı seçiyoruz. Oyuncuya göstermek istediğimiz olay, enerjinin sağa doğru çıkması. VFX bunun görünür izi: büyük ucu sağa, dar kuyruğu sola koymak yönü destekler. Şimdilik tek renkle bu şekli kurmak yeterli.

<PixelAnimation title="Mage — büyü atışı" :frames='[{"src":"/pixel-art/animation/bolt-1.svg","label":"Toplanma","duration":180,"alt":"Solda küçük, iki pixel yüksekliğinde bir büyü noktası."},{"src":"/pixel-art/animation/bolt-2.svg","label":"Atış","duration":90,"alt":"Sağa uzayan büyü: sivri uç sağda, ince kuyruk solda."},{"src":"/pixel-art/animation/bolt-3.svg","label":"Sönme","duration":120,"alt":"Sağ kenara yaklaşmış iki ayrı büyü parçacığı."},{"src":"/pixel-art/animation/bolt-4.svg","label":"Efekt yok","duration":450,"alt":"Efekt bitmiş; frame tamamen transparent."}]' />

Bu dosyada yalnız efekt var. Mage çizimin kendi 8×8 dosyasında kalır; oyunda bu efekt karakterin önünde gösterilebilir. Şimdi hasar veya mana kodlamıyoruz, skill'in görsel parçasını üretiyoruz.

1. İlk frame'de soldaki iki pixel'i çiz. `Frame > New Empty Frame` ile her sonraki poz için boş frame ekle; bütün dosya tek transparent layer olabilir.
2. İkinci frame'de sağdaki uçtan başla, soldaki ince kuyruğu ekle. Üçüncü frame'de yalnız sağdaki iki parçacığı çiz. Dördüncü frame tamamen boş kalsın; bu, efektin bittiği an.
3. `Frame > Frame Properties` ile önizlemedeki süreleri gir. `Enter` ile oynat ve kaydet. Döngüdeki boş bekleme, atışları birbirinden ayırır.

## Sınırlar

Tek renk ve üç görünür şekil, ilk VFX'te yönü okumayı kolaylaştırmak için. Glow, blur, shader veya daha büyük canvas gerekmiyor.

::: details İpucu 1 — Yönü belli değil
İkinci frame'de en belirgin bölüm sağda, daha ince bölüm solda olmalı.
:::

::: details İpucu 2 — Efekt silinmiyor
Dördüncü frame'in gerçekten boş olduğuna bak. New Frame çizimi kopyalar; boş frame için New Empty Frame kullan.
:::

::: details İpucu 3 — Atış şeklini kuramıyorum
İkinci frame'de dördüncü satırın 3–7. sütunlarını boya. Altıncı sütunun üçüncü ve beşinci satırlarına birer pixel ekle.
:::

## Birincil kaynak

[Aseprite — Animation](https://www.aseprite.org/docs/animation/).
`RESOURCES.md` içindeki bu kaynak, çizimleri sıraya koyup oynatmak için;
[New Frame](https://www.aseprite.org/docs/new-frame/) ise boş frame oluşturmak
için kullanıldı. Büyünün şekli, yönü ve süreleri bu dersin özgün tasarımıdır.

**Kazanım:** Küçük bir VFX'in yönünü, az pixel'le kurulan uç ve kuyruk ilişkisinden ürettin.

**“Pixel Art 1.28 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.29 — Mage için isabet efekti çiz](/pixel-art/29-mage-impact).

