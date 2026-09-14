---
title: "1.45 — 32×4 XP barı çiz"
description: "Can barından ince ve farklı renkte ikinci bir göstergeyi ayırt edilir kıl."
section: Idle UI'ı tamamla
---

# {{ $frontmatter.title }}

**Hedef:** İki göstergeyi, aynı ekranda karışmayacak biçimde ayır.

## Görev

32×4 transparent RGB dosyada XP barının boş, yarı dolu ve dolu durumlarını üç frame olarak çiz. Çerçeve `#637980`, kanal `#354b50`, dolum `#81cfb3` olsun. `art/idle-ui/xp-bar.aseprite` olarak kaydet.

## Ne zaman bitti?

- Bar 1.25'teki can barından belirgin biçimde ince.
- Dolum rengi can barının yeşilinden farklı; üç durumda da çerçeve aynı yerde.
- Yarı dolu durumda dolum iç kanalın yarısını kaplıyor; kaynak 32×4.

## Bilmen gereken küçük parça

Idle oyunda iki bar aynı anda görünür: can ve deneyim. İkisi de yatay, ikisi de soldan dolar. Oyuncunun hangisine baktığını karıştırmaması için **birbirinden iki yönde ayrılmaları** gerekir.

Birinci ayrım kalınlık: XP barı can barının yarısı kadar ince. İkinci ayrım renk: can yeşil, XP turkuaz. Tek bir ayrım yeterli olmaz; küçük ekranda renk körü bir oyuncu için kalınlık, hızlı bakan bir oyuncu için renk çalışır.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/xp-empty.svg" width="256" height="32" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Boş XP barı: ince çerçeve ve koyu kanal." /></div>
    <figcaption><strong>1 · Çerçeve</strong><br />Dış kenarı tek pixel çerçeveyle kur; içinde 30×2'lik koyu kanal kalsın.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/xp-half.svg" width="256" height="32" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Yarıya kadar turkuaz dolmuş XP barı." /></div>
    <figcaption><strong>2 · Yarı dolu</strong><br />Kanalı soldan yarıya kadar doldur. Sağ yarı kanal renginde kalır.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/xp-full.svg" width="256" height="32" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Tamamen dolmuş XP barı." /></div>
    <figcaption><strong>3 · Dolu</strong><br />Kanalın tamamını doldur. Çerçeve hiçbir durumda değişmez.</figcaption>
  </figure>
</div>

Barın 4 pixel yüksekliğinde olması, can barının altına sıkışabilmesi için. Gerçek oyunda dolum miktarını deneyim puanı belirler; seviye sayısı barın yanında 1.43'teki rakamlarla yazılabilir.

## Sınırlar

Yalnız üç durum. Animasyonlu dolum, parlama, seviye yazısı ve bölme çizgileri bu göreve girmiyor.

::: details İpucu 1 — İki bar birbirine benziyor
Yalnız rengi değiştirmek yetmez. Kalınlığı da düşür; iki ayrım birlikte çalışır.
:::

::: details İpucu 2 — Dolum çerçeveye yapışıyor
Çerçeveden sonra dolum başlamalı; kanal soldan 2. sütunda, üstten 2. satırda başlar.
:::

::: details İpucu 3 — Tam yerleşim
Kanal 2–31. sütunlar ve 2–3. satırlar arasında. Yarı dolumda 2–16. sütunlar dolu.
:::

## Birincil kaynak

[Aseprite — Drawing](https://www.aseprite.org/docs/drawing/).
`RESOURCES.md` içindeki bu belge, dikdörtgen alanlarla çizmeyi açıklar; [New Frame](https://www.aseprite.org/docs/new-frame/) durum kopyaları içindir. Barın ölçüsü ve renk ayrımı bu dersin seçimidir.

**Kazanım:** Aynı ekranda iki göstergeyi karıştırmadan gösterebiliyorsun.

**“Pixel Art 1.45 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.46 — Eşya slotuna tier rengi ver](/pixel-art/46-tier-frames).
