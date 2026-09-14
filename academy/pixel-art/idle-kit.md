---
title: Idle RPG görsel seti
description: Çizdiğin parçaların gerçek bir idle oyun ekranında nasıl birleştiğini beş örnekle gör.
---

# Idle RPG görsel seti

İkinci fazın dersleri tek tek parçalar üretir. Bu sayfa o parçaların **gerçek
ekranlarda** nasıl birleştiğini gösterir: savaş, dükkân, envanter, kahramanlar
ve ödül. Hiçbiri ödev değil; bir sonraki küçük işi seçerken bakacağın örnekler.

Hepsi **160×96** — yani yirmi 8×8 sprite yan yana sığar. **Sprite'ların 8×8
olması ekranın da küçük olacağı anlamına gelmez.**

## 1 · Savaş ekranı

<div class="pixel-preview">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/screens/battle.svg" width="640" height="384" alt="Üstte can barı, XP barı, altın sayacı ve BATTLE düğmesi; ortada kamp, sandık, warrior, büyü yapan mage, bat ve iki slime; altta eşya kısayolları ile MAP ve SHOP düğmeleri." /></div>
    <figcaption><strong>Oyunun ana ekranı</strong><br />HUD üstte, oyun alanı ortada, kısayollar altta</figcaption>
  </figure>
</div>

| Bölge | Parça | Dersi |
| --- | --- | --- |
| HUD | Can barı | [1.57 — 32×8 can barı çiz](/pixel-art/57-health-bar) |
| HUD | XP barı | [1.58 — 32×4 XP barı çiz](/pixel-art/58-xp-bar) |
| HUD | Altın sayacı | [1.8 — 8×8 coin çiz](/pixel-art/08-coin) ve [1.21 — 3×5 rakam seti çiz](/pixel-art/21-digits) |
| Sahne | Tekrarlanan zemin | [1.19 — Tekrarlanabilir zemin tile'ı çiz](/pixel-art/19-tile) |
| Sahne | Ağaç ve çadır | [1.63 — 32×16 kamp alanı kur](/pixel-art/63-camp) |
| Sahne | Sandık | [1.7 — 8×8 sandık çiz](/pixel-art/07-chest) |
| Sahne | Warrior | [1.28 — 8×8 warrior çiz](/pixel-art/28-warrior) |
| Sahne | Büyü yapan mage ve büyüsü | [1.25 — Mage'in büyü yapma pozunu çiz](/pixel-art/25-mage-cast) ve [1.26 — Mage için büyü atışı çiz](/pixel-art/26-mage-bolt) |
| Sahne | Bat ve slime'lar | [1.51 — İki frame'lik bat çiz](/pixel-art/51-bat) ve [1.50 — Tek slime'dan üç tier üret](/pixel-art/50-slime-tiers) |
| Kısayol | Tier renkli slotlar | [1.60 — Eşya slotuna tier rengi ver](/pixel-art/60-tier-frames) |
| Düğmeler | 9-slice çerçeve ve yazı | [1.20 — 9-slice çerçeve kur](/pixel-art/20-nine-slice) ve [1.22 — 3×5 harf seti çiz](/pixel-art/22-letters) |

## 2 · Dükkân

<div class="pixel-preview">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/screens/shop.svg" width="640" height="384" alt="SHOP başlıklı panel: sağ üstte altın sayacı, altında üç satır — armor, helmet ve ring ikonları, adları, coin fiyatları ve BUY düğmeleri." /></div>
    <figcaption><strong>Dükkân</strong><br />Her satır aynı kalıp: ikon, ad, fiyat, düğme</figcaption>
  </figure>
</div>

Dükkânın tamamı **zaten çizdiğin parçalardan** oluşuyor: 9-slice panel, tier
renkli slotlar, harfler, rakamlar ve coin ikonu. Tek yeni şey yerleşim — üç
satırın aynı hizada tekrar etmesi.

Satırların hepsi aynı yüksekliği ve aynı sütun düzenini kullanır; göz bir kez
öğrendiği düzeni sonraki satırlarda aramaz. Fiyatın yanındaki coin ikonu, hangi
para biriminden söz edildiğini yazı olmadan söyler.

## 3 · Envanter

<div class="pixel-preview">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/screens/inventory.svg" width="640" height="384" alt="INVENTORY başlıklı panel: üstte kuşanılmış dört eşya, yanında warrior portresi ve seviyesi, altta sekizerli iki sıra çanta slotu." /></div>
    <figcaption><strong>Envanter</strong><br />Kuşanılanlar üstte, çanta altta, boş slotlar sönük</figcaption>
  </figure>
</div>

| Parça | Dersi |
| --- | --- |
| Eşya slotu | [1.59 — 12×12 eşya slotu çiz](/pixel-art/59-item-slot) |
| Tier renkleri | [1.60 — Eşya slotuna tier rengi ver](/pixel-art/60-tier-frames) |
| Boş ve kilitli slot | [1.61 — Kilitli slot ve artı düğmesi çiz](/pixel-art/61-slot-states) |
| Eşya ikonları | [1.47 — 8×8 armor ikonu çiz](/pixel-art/47-armor) ve [1.48 — 8×8 trinket çiz](/pixel-art/48-trinket) |

Kuşanılmış dört slot ile çantanın on altı slotu **aynı 12×12 çerçevedir.**
Fark yalnız kenar rengi ve içinin dolu olup olmaması. Boş slotlar sönük kalır;
ekranın en parlak yeri her zaman oyuncunun yapması gereken şey olmalı.

## 4 · Kahramanlar

<div class="pixel-preview">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/screens/heroes.svg" width="640" height="384" alt="HEROES başlıklı panel: mage, warrior, priest ve archer portreleri, adları, seviyeleri, can barları ve altlarında skill ikonları." /></div>
    <figcaption><strong>Kahramanlar</strong><br />Dört karakter, dört skill, aynı kalıpta dört sütun</figcaption>
  </figure>
</div>

Dört karakter yan yana konduğunda silüet testi kendiliğinden yapılır: şapka,
miğfer, cübbe ve yay birbirine benzemiyorsa kadro okunur. Her sütunun altındaki
skill ikonu karakteri kendi efektine bağlar — mage'in büyüsü, warrior'ın izi,
priest'in parıltısı, archer'ın oku.

Bu ekran [1.9 — Silüet testi yap](/pixel-art/09-silhouette-test) dersinin
doğrudan karşılığı.

## 5 · Ödül

<div class="pixel-preview">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/screens/loot.svg" width="640" height="384" alt="Açılmış sandık, çevresine saçılan coin ve ışık, solda rare helmet, sağda epic yüzük, üstte artı 250 GOLD bildirimi ve altta COLLECT düğmesi." /></div>
    <figcaption><strong>Ödül</strong><br />Açılan sandık, saçılan coin, iki eşya ve tek bir eylem</figcaption>
  </figure>
</div>

| Parça | Dersi |
| --- | --- |
| Açılan sandık | [1.15 — Sandığı iki frame ile aç](/pixel-art/15-chest-open) |
| Dönen ve düşen coin | [1.16 — Coin'i dört frame'de döndür](/pixel-art/16-coin-spin) ve [1.55 — Düşen coin'i çiz](/pixel-art/55-coin-drop) |
| Tier renkli ödüller | [1.60 — Eşya slotuna tier rengi ver](/pixel-art/60-tier-frames) |
| Bildirim ve düğme | [1.20 — 9-slice çerçeve kur](/pixel-art/20-nine-slice) |

Ödül ekranında tek bir eylem var: **COLLECT.** Ekranın en parlak öğesi o, geri
kalan her şey bilgi. Sandığın çevresine saçılan ışık gözü merkeze çeker;
çerçeve renkleri ise ne kazandığını yazı okumadan söyler.

## Her parça neden farklı ölçüde?

Ölçüyü stil değil, **parçanın işi** belirler.

| Parça | Ölçü | Neden bu ölçü? |
| --- | --- | --- |
| Karakter, monster, eşya ikonu | 8×8 | Ekranda çoğalan küçük parçalar; tek okunur işaret yeterli |
| Rakam ve harf | 3×5 | Sayı ve yazı bu setle kurulur |
| Can barı | 32×8 | Yatay bir miktarı gösterir; uzunluk farkı okunmalı |
| XP barı | 32×4 | Can barından ince, böylece ikisi karışmaz |
| Eşya slotu | 12×12 | 8×8 ikonun etrafında kenar payı bırakır |
| Panel ve düğme | 9-slice | Tek çizimden her boyda kutu çıkar |
| Kamp ve mağara | 32×16 | Birkaç büyük şekli aynı zeminde barındırır |
| Zemin tile'ı | 8×8 | Yan yana dizilerek ekranı boydan boya kaplar |
| Ekranın kendisi | 160×96 | Bütün bunları aynı anda barındıracak kadar |

## Beş ekranda ortak olan dört kural

- **UI kenarda, oyun ortada:** bilgi üst ve alt şeritlere, olay ortaya oturur.
- **Aynı kalıbı tekrarla:** dükkânın üç satırı, envanterin on altı slotu ve
  kahramanların dört sütunu hep aynı kalıptan çıkar.
- **Renk bir dil:** mor çerçeve, mor slime ve mor EPIC yazısı aynı şeyi söyler.
- **En parlak şey eylemdir:** BUY, COLLECT ve artı düğmesi paletteki en açık
  rengi kullanır; kilitli ve boş olan söner.

Renk oranı, ışık yönü ve sahne kompozisyonu bu mock'ların konusu değil. Burada
yalnız **ölçü, hizalama, tekrar ve okunurluk** var.

## Buradan çıkabilecek küçük işler

Bunlar **henüz ders olarak yazılmamış seçenekler**. Birini istediğinde tek bir
ders hazırlarız.

| İhtiyaç | Sonraki olası küçük çalışma |
| --- | --- |
| Envanter dolsun | Aynı 8×8 kalıptan ikinci bir silah veya zırh ikonu |
| Kadro çeşitlensin | Aynı gövdeden farklı göz veya renkle yeni bir monster |
| Sayı hareket etsin | Hasar sayısının yukarı süzülüp kaybolması |
| Ekran gece olsun | Aynı sahnenin gece paleti |
| Düğmeye basılsın | BUY ve COLLECT düğmelerinin basılı hâli |
| Türkçe yazılsın | Harf setine Ç, Ğ, İ, Ö, Ş ve Ü eklenmesi |

[Yol haritası](/pixel-art/roadmap) bu seçeneklerin tamamını gruplar;
[skill fikirleri rehberi](/pixel-art/skill-guide) VFX tarafında aynı işi görür.
Tam bir idle oyun UI'ı, tile sistemi veya asset pipeline bu aşamanın işi değil.

## Birincil kaynak

[Pedro Medeiros — Cluster Sketching and Painting](https://saint11.art/pixel_art_articles/article2/).
`RESOURCES.md` içindeki bu kaynak, ayrıntıdan önce büyük alanlarla yerleşim
kurma yaklaşımı için kullanıldı. Buradaki beş ekranın yerleşimi, ölçüleri ve
çalışma önerileri bu rehberin özgün seçimleridir.
