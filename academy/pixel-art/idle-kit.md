---
title: Idle RPG görsel seti
description: 8×8 eşya, monster, UI ve dış mekân parçalarının aynı ekranda nasıl buluştuğunu gör.
---

# Idle RPG görsel seti

İkinci fazın dersleri tek tek çizilen parçalar üretir. Bu sayfa o parçaların
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
| Coin | [1.8 — 8×8 coin çiz](/pixel-art/08-coin) |
| Armor ikonu | [1.42 — 8×8 armor ikonu çiz](/pixel-art/42-armor) |
| Trinket | [1.43 — 8×8 trinket çiz](/pixel-art/43-trinket) |
| Slime | [1.44 — 8×8 slime çiz](/pixel-art/44-slime) |
| Can barı | [1.52 — 32×8 can barı çiz](/pixel-art/52-health-bar) |
| Eşya slotları | [1.54 — 12×12 eşya slotu çiz](/pixel-art/54-item-slot) |
| Düğme durumları | [1.57 — 24×12 düğme durumları çiz](/pixel-art/57-button-states) |
| Kamp | [1.58 — 32×16 kamp alanı kur](/pixel-art/58-camp) |

Hepsini tek bir oyun dosyasında toplamak
[1.60 — Asset'lerini tek sprite sheet'e topla](/pixel-art/60-sprite-sheet)
dersinin işi.

Mage, [1.22 — 8×8 mage çiz](/pixel-art/22-mage) dersinden geliyor. Karakter
paketi ile idle paketi aynı ekranda buluşur; ders sırası bir zorunluluk değil.

## Yerleşimde ne öğreniyoruz?

- **UI kenarda durur:** can barı ve coin sayacı üst şeride oturur; oyun alanı ortada kalır.
- **Aynı zemin çizgisi:** mage ve slime kampın zeminine oturur, havada durmaz.
- **Tekrar eden çerçeve:** slotlar aynı 12×12 çerçeveyi kullanır; içindeki ikon değişir.
- **Durum farkı görünür:** düğmenin normal ve basılı hali yan yana konunca fark okunur.

Renk oranı, ışık yönü veya sahne kompozisyonu bu mock'un konusu değil.
Burada yalnız **ölçü, hizalama ve tekrar** var.

## Hangi parça hangi derste?

Setin eşya, monster, UI ve dünya parçaları ikinci fazda çizildi; rakamlar ve
panel çerçevesi gibi bazı parçalar ise teknik fazından geliyor:

| Eksik | Tamamlandığı ders |
| --- | --- |
| Vuruş görünmüyordu | [1.48 — Hasar flash'ı çiz](/pixel-art/48-hit-flash) |
| Monster ölmüyordu | [1.49 — Slime'ın ölüşünü çiz](/pixel-art/49-slime-death) |
| Loot düşmüyordu | [1.50 — Düşen coin'i çiz](/pixel-art/50-coin-drop) |
| Kadro tek monster'dı | [1.45 — Tek slime'dan üç tier üret](/pixel-art/45-slime-tiers) ve [1.46 — İki frame'lik bat çiz](/pixel-art/46-bat) |
| Sayı gösterilemiyordu | [1.21 — 3×5 rakam seti çiz](/pixel-art/21-digits) |
| Panel tek boyda kalıyordu | [1.20 — 9-slice çerçeve kur](/pixel-art/20-nine-slice) |
| Eşyanın değeri belli değildi | [1.55 — Eşya slotuna tier rengi ver](/pixel-art/55-tier-frames) |
| Tek bölge vardı | [1.59 — 32×16 mağara kur](/pixel-art/59-cave) |

[Yol haritası](/pixel-art/roadmap) hâlâ yazılmamış seçenekleri gruplar;
[skill fikirleri rehberi](/pixel-art/skill-guide) VFX tarafında aynı işi görür.
Tam bir idle oyun UI'ı, tile sistemi veya asset pipeline bu aşamanın işi değil.

## Birincil kaynak

[Pedro Medeiros — Cluster Sketching and Painting](https://saint11.art/pixel_art_articles/article2/).
`RESOURCES.md` içindeki bu kaynak, ayrıntıdan önce büyük alanlarla yerleşim
kurma yaklaşımı için kullanıldı. Buradaki ölçüler, mock yerleşimi ve çalışma
önerileri bu rehberin özgün seçimleridir.
