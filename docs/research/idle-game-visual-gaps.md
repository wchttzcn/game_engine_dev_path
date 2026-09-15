# Idle oyun görsel ihtiyaçları — boşluk analizi

Bu not, mevcut 65 derslik Pixel Art paketini iki dış ölçüte karşı denetler:
bir idle oyunu **idle yapan sistemler** ve karşılaştırılabilir bir **8×8 asset
paketinin içeriği**. Amaç, ders sayısını büyütmek değil; hangi boşlukların
oyunun çalışması için gerçekten gerekli olduğunu ayırmak.

## Ölçüt 1 — Idle oyunun tekrar eden sistemleri

Anthony Pecorella'nın Kongregate verisine dayanan GDC serisi ve türün genel
tanımı aynı çekirdek parçaları sayıyor:

- **Birincil para birimi ve üreticiler.** "Primary Currency: This is the main
  number that is being incremented" ve üreticilerin çıktısı "currency per
  second" olarak ölçülür.
- **Çarpan yükseltmeleri.** "upgrades that multiplies your generator power" —
  maliyet eğrisi üstel büyürken üretimi ayakta tutan şey bunlar.
- **Prestige.** "A reset of most elements of the game... but gaining currency
  (prestige currency) and/or persistent multipliers." Yani **ikinci bir para
  birimi** demek.
- **Offline ilerleme.** "offline earning system which tracks a player's
  progress while the game is not running."
- **Otomasyon.** "automating the process and reducing the need for direct
  interaction."
- **Başarımlar.** "systems of achievements, offering small, frequent rewards
  throughout gameplay."
- **Çoklu para birimi.** "meta-currencies" ve "event currencies" birincil
  paranın yanında yer alır.

Kaynaklar: [The Math of Idle Games, Part I](https://www.gamedeveloper.com/design/the-math-of-idle-games-part-i),
[GDC Europe 2016 — Quest for Progress: The Math and Design of Idle Games](https://www.gdcvault.com/play/1023876/Quest-for-Progress-The-Math),
[GDC 2015 — Idle Games: The Mechanics and Monetization of Self-Playing Games](https://www.gdcvault.com/play/1022065/Idle-Games-The-Mechanics-and),
[Wikipedia — Incremental game](https://en.wikipedia.org/wiki/Incremental_game).

### Bu sistemlerin görsel karşılığı pakette var mı?

| Sistem | Görsel karşılığı | Pakette |
| --- | --- | --- |
| Birincil para | Coin ikonu ve rakamlar | **Var** (1.8, 1.21) |
| Üretici | Gelir üreten karakter veya yapı | Karakterler var, yapı yok |
| Çarpan yükseltmesi | `×2` rozeti, yükseltme kartı | **Yok** |
| Prestige | İkinci para birimi ikonu, reset ekranı | **Yok** |
| Offline ilerleme | Saat ikonu, süre yazısı, karşılama kutusu | **Yok** |
| Otomasyon | AUTO rozeti, açık/kapalı anahtar | **Yok** |
| Başarım | Rozet, yıldız derecesi, tik işareti | **Yok** |

En büyük boşluk burada: pakette bir RPG'nin görselleri var, ama bir idle
oyunun **ilerleme sistemlerini** gösteren hiçbir parça yok.

## Ölçüt 2 — Karşılaştırılabilir bir 8×8 paket

[Pixeltier's Tiny RPG Assets](https://pixeltier.itch.io/pixeltiers-tiny-rpg-assets)
aynı ölçüde çalışan yaygın bir pakettir. İçeriği: "490+ tiny icons (90+ unique
designs), 26 animated character and monster sprites" ve kritik satır — "Idle,
hurt and death animation sprites for **every** character."

| Kategori | Pixeltier | Bizim paket |
| --- | --- | --- |
| Eşya ikonu çeşidi | 90+ özgün | ~12 (kılıç, kalkan, kalp, iksir, anahtar, sandık, coin, armor, helmet, boots, ring, trinket) |
| Her karakterde idle | Var | Yalnız mage (1.24) |
| Her karakterde hurt | Var | Yalnız slime (1.53) |
| Her karakterde death | Var | Yalnız slime (1.54) |
| Durum etkisi ikonları | Var | Yok |
| Düğmeler | Var | Var (1.62) |

Buradaki açık, ders eksikliği değil **uygulama** eksikliği: hurt ve death
teknikleri 1.53 ve 1.54'te zaten öğretiliyor, ama yalnız slime üzerinde
uygulanıyor. Aynı şekilde idle tekniği 1.24'te var, yalnız mage'de kullanılıyor.

## Durum

Bu notta önerilen on iki dersin tamamı 2026-09 itibarıyla yazıldı:
1.47–1.49 (kadroyu tamamla), 1.52–1.53 (silah ailesi ve durum ikonları),
1.61 (süzülen hasar sayısı), 1.69–1.73 (ilerleme sistemleri) ve 1.76
(gelir üreten yapı). Aşağıdaki bölüm, hangi boşluğun hangi derse
dönüştüğünün kaydı olarak duruyor.

## Önerilen ekler

Ders sayısını ikiye katlamaya gerek yok. Aşağıdaki on ders iki ölçütteki
boşlukların tamamını kapatır.

### A · Idle sistemleri görselleşsin (5 ders)

En yüksek öncelik: bunlar olmadan ekran bir idle oyun gibi davranmaz.

| Ders adayı | Ne çizilir | Neden |
| --- | --- | --- |
| İkinci para birimini çiz | 8×8 gem veya ruh ikonu; coin'den renk ve biçimle ayrılır | Prestige bir para birimi ister |
| Çarpan rozetini çiz | `×2` rozeti ve yükseltme kartı | Çarpanlar türün ana yükseltmesi |
| AUTO anahtarını çiz | Açık ve kapalı iki durumlu toggle | Otomasyon oyuncuya gösterilmeli |
| Başarım rozetini çiz | Rozet ve üç yıldızlı derece | Başarımlar ilerlemeyi parçalar |
| Yokken kazandıkların ekranı | Saat ikonu, `2H 14M` süre yazısı, ödül kutusu | Offline ilerleme türün tanımı |

### B · Kadro tamamlansın (3 ders)

| Ders adayı | Ne çizilir | Neden |
| --- | --- | --- |
| Kendi karakterine idle ver | Dört karakterin de iki frame'lik idle'ı | Karşılaştırma paketinde her karakterde var |
| Hurt ve death'i karaktere taşı | 1.53 ve 1.54'ün karakterlerde uygulanışı | Teknik var, uygulama yok |
| Karakteri sola çevir | Flip ve asimetrik parçanın (yay, kalkan) kararı | Hiç yok; her oyunda gerekir |

### C · İkon kadrosu genişlesin (2 ders)

| Ders adayı | Ne çizilir | Neden |
| --- | --- | --- |
| Bir silahtan üç silah çıkar | Aynı sap, farklı baş: kılıç, balta, mızrak | 12 ikon envanter için az; kalıptan çoğaltmak doğru yöntem |
| Durum etkisi ikonlarını çiz | Zehir, yanma ve kalkan işareti | Karşılaştırma paketinde var, bizde yok |

### Ayrıca değerlendirilebilir

- **Süzülen hasar sayısı.** Idle oyunun ekranında en çok hareket eden şey
  sayıdır; 1.21'deki rakamların yukarı süzülüp kaybolması tek derslik bir iş.
- **Gelir üreten yapı.** Tür genellikle geliri "buildings like factories or
  farms" ile temsil eder; bizde kamp var ama üretim yapısı yok.

## Kapsam dışı kalmaya devam edenler

Particle sistemi, shader, uzun animasyon setleri, büyük canvas, boss sprite'ı
ve tam bir asset pipeline bu paketin hedefi değil. Monetizasyon görselleri
(reklam düğmesi, premium paket) de kapsam dışı: türün parçası olsalar da
öğrenme hedefine katkıları yok.

## Kaynaklar

- [The Math of Idle Games, Part I — Game Developer](https://www.gamedeveloper.com/design/the-math-of-idle-games-part-i)
- [Quest for Progress: The Math and Design of Idle Games — GDC Europe 2016](https://www.gdcvault.com/play/1023876/Quest-for-Progress-The-Math)
- [Idle Games: The Mechanics and Monetization of Self-Playing Games — GDC 2015](https://www.gdcvault.com/play/1022065/Idle-Games-The-Mechanics-and)
- [Incremental game — Wikipedia](https://en.wikipedia.org/wiki/Incremental_game)
- [Pixeltier's Tiny RPG Assets (8×8) — itch.io](https://pixeltier.itch.io/pixeltiers-tiny-rpg-assets)
