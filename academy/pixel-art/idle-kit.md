---
title: Idle RPG görsel seti
description: 8×8 eşya, monster, UI ve dış mekân parçalarının aynı ekranda nasıl buluştuğunu gör.
---

# Idle RPG görsel seti

1.21–1.28 dersleri tek tek çizilen parçalar üretir. Bu sayfa o parçaların
**aynı ekranda yan yana** geldiğinde nasıl göründüğünü gösterir. Ayrı bir ödev
değil; bir sonraki küçük işi seçerken bakacağın örnek yerleşim.

<div class="pixel-preview">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/idle-kit.svg" width="256" height="256" alt="64×64 örnek yerleşim: üstte can barı ve coin, ortada kamp ile mage ve slime, altta eşya slotları ve düğme durumları." /></div>
    <figcaption><strong>Örnek yerleşim</strong><br />64×64 mock: can barı, coin, kamp, mage, slime, slotlar ve düğme</figcaption>
  </figure>
</div>

Bu görüntü bir ders çıktısı değil, **mock**: hazır parçaları bir araya koyup
ölçülerin birlikte çalışıp çalışmadığına bakmak için hazırlandı.

## Her parça neden farklı ölçüde?

Ölçüyü stil değil, **parçanın işi** belirler. Karakter ve eşyada 8×8'de
kalıyoruz; bir UI göstergesinin veya dış mekânın işi daha geniş olduğu için
ölçüsü de büyür.

| Parça | Ölçü | Neden bu ölçü? |
| --- | --- | --- |
| Coin, armor, trinket, slime | 8×8 | Envanterde ve ekranda çoğalan küçük ikonlar; tek okunur işaret yeterli. |
| Can barı | 32×8 | Yatay bir miktarı gösterir; uzunluk farkı okunmalı. |
| Eşya slotu | 12×12 | 8×8 ikonun etrafında kenar payı bırakır. |
| Düğme | 24×12 | İçine yazı veya ikon alacak kadar geniş, iki durumu ayırt edilir. |
| Kamp | 32×16 | Birkaç büyük şekli aynı zeminde barındırır. |

8×8 karakter, 32×16 kampın önünde durabilir. Aynı dosyada olmaları veya aynı
canvas'a sığmaları gerekmiyor; oyunda hangi ölçekte çizileceği ayrı bir karar.

## Hazır parçalar nereden geliyor?

| Ekranda gördüğün | Ders |
| --- | --- |
| Coin | [1.21 — 8×8 coin çiz](/pixel-art/21-coin) |
| Armor ikonu | [1.22 — 8×8 armor ikonu çiz](/pixel-art/22-armor) |
| Trinket | [1.23 — 8×8 trinket çiz](/pixel-art/23-trinket) |
| Slime | [1.24 — 8×8 slime çiz](/pixel-art/24-slime) |
| Can barı | [1.25 — 32×8 can barı çiz](/pixel-art/25-health-bar) |
| Eşya slotları | [1.26 — 12×12 eşya slotu çiz](/pixel-art/26-item-slot) |
| Düğme durumları | [1.27 — 24×12 düğme durumları çiz](/pixel-art/27-button-states) |
| Kamp | [1.28 — 32×16 kamp alanı kur](/pixel-art/28-camp) |

Hepsini tek bir oyun dosyasında toplamak
[1.29 — Asset'lerini tek sprite sheet'e topla](/pixel-art/29-sprite-sheet)
dersinin işi.

Mage, [1.11 — 8×8 mage çiz](/pixel-art/11-mage) dersinden geliyor. Karakter
paketi ile idle paketi aynı ekranda buluşur; ders sırası bir zorunluluk değil.

## Yerleşimde ne öğreniyoruz?

- **UI kenarda durur:** can barı ve coin sayacı üst şeride oturur; oyun alanı ortada kalır.
- **Aynı zemin çizgisi:** mage ve slime kampın zeminine oturur, havada durmaz.
- **Tekrar eden çerçeve:** slotlar aynı 12×12 çerçeveyi kullanır; içindeki ikon değişir.
- **Durum farkı görünür:** düğmenin normal ve basılı hali yan yana konunca fark okunur.

Renk oranı, ışık yönü veya sahne kompozisyonu bu mock'un konusu değil.
Burada yalnız **ölçü, hizalama ve tekrar** var.

## Bu parçalar hangi derslerde büyüdü?

Setin ilk hâli 1.21–1.28'de kuruldu. Sonraki dersler aynı parçaları tamamladı:

| Eksik | Tamamlandığı ders |
| --- | --- |
| Vuruş görünmüyordu | [1.36 — Hasar flash'ı çiz](/pixel-art/36-hit-flash) |
| Monster ölmüyordu | [1.37 — Slime'ın ölüşünü çiz](/pixel-art/37-slime-death) |
| Loot düşmüyordu | [1.38 — Düşen coin'i çiz](/pixel-art/38-coin-drop) |
| Kadro tek monster'dı | [1.40 — Tek slime'dan üç tier üret](/pixel-art/40-slime-tiers) ve [1.41 — İki frame'lik bat çiz](/pixel-art/41-bat) |
| Sayı gösterilemiyordu | [1.43 — 3×5 rakam seti çiz](/pixel-art/43-digits) |
| Panel tek boyda kalıyordu | [1.44 — 9-slice çerçeve kur](/pixel-art/44-nine-slice) |
| Eşyanın değeri belli değildi | [1.46 — Eşya slotuna tier rengi ver](/pixel-art/46-tier-frames) |
| Tek bölge vardı | [1.49 — 32×16 mağara kur](/pixel-art/49-cave) |

[Yol haritası](/pixel-art/roadmap) hâlâ yazılmamış seçenekleri gruplar;
[skill fikirleri rehberi](/pixel-art/skill-guide) VFX tarafında aynı işi görür.
Tam bir idle oyun UI'ı, tile sistemi veya asset pipeline bu aşamanın işi değil.

## Birincil kaynak

[Pedro Medeiros — Cluster Sketching and Painting](https://saint11.art/pixel_art_articles/article2/).
`RESOURCES.md` içindeki bu kaynak, ayrıntıdan önce büyük alanlarla yerleşim
kurma yaklaşımı için kullanıldı. Buradaki ölçüler, mock yerleşimi ve çalışma
önerileri bu rehberin özgün seçimleridir.
