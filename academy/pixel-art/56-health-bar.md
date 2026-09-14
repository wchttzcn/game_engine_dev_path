---
title: "1.56 — 32×8 can barı çiz"
description: "Dolu alanın uzunluğuyla can miktarını gösteren küçük bir bar kur."
section: Idle oyun · UI
---

# {{ $frontmatter.title }}

**Hedef:** Can barının çerçevesini sabit tutup dolum uzunluğunu değiştir.

**Önce şu teknik:** [1.9 — Silüet testi yap](/pixel-art/09-silhouette-test) — Bar ile dolumun sınırı tek bakışta okunmalı.

## Görev

32×8 transparent RGB dosyada aynı can barının boş, dolu ve yarım durumlarını üç frame olarak çiz. `art/idle-ui/health-bar.aseprite` olarak kaydet. Bunlar UI durum örnekleri; döngüde oynatılan bir animasyon değil.

## Ne zaman bitti?

- Üç durumda da dış çerçeve aynı yerde ve 32×8 içinde.
- İç dolum alanı 28×4: dolu durumda 28, yarım durumda 14 pixel uzunluğunda.
- Boş durumda renkli dolum yok; üç durum aynı kaynakta kaydedilmiş.

## Bilmen gereken küçük parça

Can barı yatay bir miktarı göstermeye ihtiyaç duyduğu için daha geniş. Karakterlerin 8×8 olması, UI'ın da 8×8'e sıkışması anlamına gelmez. Örnekte çerçeve ve içerideki boş kanal sabit kalıyor; yalnız soldan başlayan dolum uzayıp kısalıyor.

<div class="pixel-steps pixel-steps-wide">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/health-empty.svg" width="256" height="64" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Boş can barı — 32×8, dolum alanı 28×4" /></div>
    <figcaption><strong>1 · Çerçeve ve kanal</strong><br />Dış çerçeveyi #92AFC3 ile kur; dört köşe transparent kalsın. İçini #182E33, ortadaki 28×4 kanalı #354B50 yap.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/health-full.svg" width="256" height="64" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Dolu can barı — 28 pixel dolum" /></div>
    <figcaption><strong>2 · Tam dolu</strong><br />Bağımsız kopyada kanalı #8AC982 ile doldur. Çerçeve ve dolum arasında bir pixel boşluk kalır.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/health-half.svg" width="256" height="64" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Yarı dolu can barı — 14 pixel dolum" /></div>
    <figcaption><strong>3 · Yarım dolu</strong><br />İkinci kopyada kanalın yalnız soldaki 14 pixel'ini doldur; sağ yarı boş kanal renginde kalsın.</figcaption>
  </figure>
</div>

Frame > Duplicate Cels ile çerçeveyi yeniden çizmeden durum kopyası oluşturabilirsin. Süre ayarlamak gerekmiyor; frame'leri tek tek seç. Gerçek oyunda dolum miktarını can değeri belirler; HP sayısı istenirse barın dışında normal UI metni olur.

## Sınırlar

32×8 ölçüsü uzunluk farkını göstermek için. Şekil ve miktar çalışıyoruz; 60–30–10, karmaşık çerçeve süsleri veya font çizimi gerekmiyor.

::: details İpucu 1 — Yarım bar tam yarıya gelmiyor
32 pixel'in yarısını değil, 28 pixel'lik iç kanalın yarısını doldur.
:::

::: details İpucu 2 — Dolum kenara yapışıyor
Dış çerçeveden sonra bir pixel boşluk bırak. Kanal soldan 3. sütunda, üstten 3. satırda başlar.
:::

::: details İpucu 3 — Ölçüleri nasıl yerleştiririm?
1'den sayarak kanal 3–30. sütunlar ve 3–6. satırlar arasında. Yarım dolum 3–16. sütunları kaplar. Diğer alanlar aynı kalır.
:::

## Birincil kaynak

[Aseprite — Drawing](https://www.aseprite.org/docs/drawing/).
`RESOURCES.md` içindeki bu kaynak, pixel ve dikdörtgen alanlarla çizim araçları için;
[New Frame](https://www.aseprite.org/docs/new-frame/) durum kopyaları için kullanıldı.
UI ölçüleri ve görünüşü bu dersin tasarım seçimleridir.

**Kazanım:** Bir UI göstergesini, okunabilir miktar farkına göre uygun ölçüde çizdin.

**“Pixel Art 1.56 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.57 — 32×4 XP barı çiz](/pixel-art/57-xp-bar).
