---
title: Idle RPG görsel seti
description: Çizdiğin bütün parçaların tek bir idle oyun ekranında nasıl birleştiğini gör.
---

# Idle RPG görsel seti

İkinci fazın dersleri tek tek parçalar üretir. Bu sayfa o parçaların **tek bir
ekranda** nasıl birleştiğini gösterir. Ayrı bir ödev değil; bir sonraki küçük
işi seçerken bakacağın örnek yerleşim.

<div class="pixel-preview">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/idle-kit.svg" width="640" height="384" alt="160×96 idle oyun ekranı: üstte can barı, XP barı ve altın sayacı; ortada kamp, sandık, warrior, büyü yapan mage, bat ve iki slime; altta envanter slotları, kilitli slot, yükseltme düğmesi ve SHOP düğmesi." /></div>
    <figcaption><strong>Örnek ekran</strong><br />160×96 mock — sprite'lar 8×8 kalır, ekran gerektiği kadar büyür</figcaption>
  </figure>
</div>

Bu görüntü bir ders çıktısı değil, **mock**: hazır parçaları bir araya koyup
ölçülerin birlikte çalışıp çalışmadığına bakmak için hazırlandı. Kendi
çizimlerini aynı şekilde yan yana koyup deneyebilirsin.

## 8×8 sprite, 160×96 ekran

**Sprite'ların 8×8 olması ekranın da küçük olacağı anlamına gelmez.** Karakter,
monster ve eşya 8×8 kalır; bar, panel, dünya ve ekranın kendisi işlerinin
gerektirdiği kadar büyür. Yukarıdaki mock 160×96 — yani yirmi 8×8 sprite yan
yana sığar.

| Parça | Ölçü | Neden bu ölçü? |
| --- | --- | --- |
| Coin, armor, trinket, slime, karakterler | 8×8 | Ekranda çoğalan küçük parçalar; tek okunur işaret yeterli |
| Can barı | 32×8 | Yatay bir miktarı gösterir; uzunluk farkı okunmalı |
| XP barı | 32×4 | Can barından ince, böylece ikisi karışmaz |
| Rakamlar | 3×5 | Altın miktarı ve seviye bu setle yazılır |
| Eşya slotu | 12×12 | 8×8 ikonun etrafında kenar payı bırakır |
| Düğme ve panel | 9-slice | Tek çizimden her boyda kutu çıkar |
| Kamp ve mağara | 32×16 | Birkaç büyük şekli aynı zeminde barındırır |
| Zemin tile'ı | 8×8 | Yan yana dizilerek ekranı boydan boya kaplar |

## Ekranda ne var?

| Bölge | İçindekiler | Dersi |
| --- | --- | --- |
| Üst HUD | Can barı | [1.56 — 32×8 can barı çiz](/pixel-art/56-health-bar) |
| Üst HUD | XP barı | [1.57 — 32×4 XP barı çiz](/pixel-art/57-xp-bar) |
| Üst HUD | Altın sayacı: coin ikonu ve rakamlar | [1.8 — 8×8 coin çiz](/pixel-art/08-coin) ve [1.21 — 3×5 rakam seti çiz](/pixel-art/21-digits) |
| Sahne | Tekrarlanan zemin | [1.19 — Tekrarlanabilir zemin tile'ı çiz](/pixel-art/19-tile) |
| Sahne | Ağaç ve çadır | [1.62 — 32×16 kamp alanı kur](/pixel-art/62-camp) |
| Sahne | Sandık ve düşen coin | [1.7 — 8×8 sandık çiz](/pixel-art/07-chest) ve [1.54 — Düşen coin'i çiz](/pixel-art/54-coin-drop) |
| Sahne | Warrior | [1.27 — 8×8 warrior çiz](/pixel-art/27-warrior) |
| Sahne | Büyü yapan mage ve büyüsü | [1.24 — Mage'in büyü yapma pozunu çiz](/pixel-art/24-mage-cast) ve [1.25 — Mage için büyü atışı çiz](/pixel-art/25-mage-bolt) |
| Sahne | Bat | [1.50 — İki frame'lik bat çiz](/pixel-art/50-bat) |
| Sahne | Yeşil ve mavi slime | [1.48 — 8×8 slime çiz](/pixel-art/48-slime) ve [1.49 — Tek slime'dan üç tier üret](/pixel-art/49-slime-tiers) |
| Envanter | Tier renkli slotlar | [1.58 — 12×12 eşya slotu çiz](/pixel-art/58-item-slot) ve [1.59 — Eşya slotuna tier rengi ver](/pixel-art/59-tier-frames) |
| Envanter | Kilitli slot ve artı düğmesi | [1.60 — Kilitli slot ve artı düğmesi çiz](/pixel-art/60-slot-states) |
| Alt panel ve SHOP | 9-slice çerçeve | [1.20 — 9-slice çerçeve kur](/pixel-art/20-nine-slice) |

Mock'taki **SHOP** yazısı için gereken harfler henüz ders olarak yazılmadı.
Rakamlarla aynı 3×5 kutuya sığıyorlar; harf seti istediğinde tek bir ders
olarak hazırlarız.

## Yerleşimde ne öğreniyoruz?

- **UI kenarda durur:** can barı, XP barı ve altın üst şeride; envanter alt panele oturur. Oyun alanı ortada kalır.
- **Aynı zemin çizgisi:** ağaç, çadır, sandık, karakterler ve monster'lar aynı satıra basar; hiçbiri havada durmaz.
- **Tekrar eden çerçeve:** bütün slotlar aynı 12×12 çerçeveyi kullanır; değişen yalnız kenar rengi ve içindeki ikon.
- **Renk bir dil:** slotun mor kenarı ile mavi slime aynı tier dilini konuşur.
- **En parlak şey eylemdir:** SHOP ve artı düğmesi paletteki en açık rengi kullanır; kilitli slot söner.

Renk oranı, ışık yönü ve sahne kompozisyonu bu mock'un konusu değil. Burada
yalnız **ölçü, hizalama, tekrar ve okunurluk** var.

## Buradan çıkabilecek küçük işler

Bunlar **henüz ders olarak yazılmamış seçenekler**. Birini istediğinde tek bir
ders hazırlarız.

| İhtiyaç | Sonraki olası küçük çalışma |
| --- | --- |
| Yazı da çizilebilsin | Rakamların yanına 3×5 harf seti |
| Envanter dolsun | Aynı 8×8 kalıptan ikinci bir silah veya zırh ikonu |
| Dükkân açılsın | SHOP düğmesine basınca açılan panel yerleşimi |
| Kadro çeşitlensin | Aynı gövdeden farklı göz veya renkle yeni bir monster |
| Ekran gece olsun | Aynı sahnenin gece paleti |
| Sayı hareket etsin | Hasar sayısının yukarı süzülüp kaybolması |

[Yol haritası](/pixel-art/roadmap) bu seçeneklerin tamamını gruplar;
[skill fikirleri rehberi](/pixel-art/skill-guide) VFX tarafında aynı işi görür.
Tam bir idle oyun UI'ı, tile sistemi veya asset pipeline bu aşamanın işi değil.

## Birincil kaynak

[Pedro Medeiros — Cluster Sketching and Painting](https://saint11.art/pixel_art_articles/article2/).
`RESOURCES.md` içindeki bu kaynak, ayrıntıdan önce büyük alanlarla yerleşim
kurma yaklaşımı için kullanıldı. Buradaki ölçüler, mock yerleşimi ve çalışma
önerileri bu rehberin özgün seçimleridir.
