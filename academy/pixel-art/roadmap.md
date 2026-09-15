---
title: Pixel Art yol haritası
description: Önce teknikleri öğren, sonra aynı teknikleri kullanarak idle oyununun görsellerini üret.
---

# Pixel Art yol haritası

Hedef, **kendi küçük oyununun asset'lerini kendin üretebilmek.** Idle oyun bu
hedefin en sade hali: az sayıda nesne, birkaç karakter, küçük bir UI ve
tekrar eden kısa hareketler.

Pakette iki faz var ve sıraları önemli:

1. **Teknik (1.1–1.24).** Her ders tek bir tekniği, küçük bir nesne üzerinde
   öğretir. Anahtar, kılıç, sandık, coin. Burada oyun yok — yalnız beceri var.
2. **Idle oyun (1.25–1.108).** Aynı teknikleri bu kez oyunun gerçek
   parçalarında kullanırsın: karakterler, monster, UI, ilerleme sistemleri ve dünya. Her dersin
   başında **hangi tekniği kullandığın** yazılı ve o derse link veriyor.

**Nesnede, karakterde ve animasyonda 8×8'de kalıyoruz.** UI ve dış mekân
parçaları yalnız işleri gerektirdiği kadar büyür.

<CurrentLesson track="pixel-art" />

## Faz 1 · Teknikler

| Aşama | Neyi öğretir | Hangi nesneyle |
| --- | --- | --- |
| 1.1–1.8 · İlk şekiller | Dış şekil, boşluk, dar/geniş parçalar, PNG çıkarma | Anahtar, kılıç, kalp, şişe, kalkan, sandık, coin |
| 1.9–1.10 · Okunurluk | Silüet testi ve kenarlığın ne zaman gerektiği | Yedi nesne ve sandık |
| 1.11–1.14 · Renk ve hacim | Üç value, renk rampası, tek ışık yönü, dithering | Şişe, kalp, zemin |
| 1.15–1.19 · Hareket | Sabit/hareketli parça, döngü, frame süresi, hazırlık, kırılma | Sandık, coin ve taş |
| 1.20–1.24 · Tekrar eden parçalar | Ek yerini gizleme, 9-slice, rakam, harf ve Türkçe harf seti | Zemin tile'ı, çerçeve, 3×5 metin |

Bu fazda karakter yok. Amaç, bir şeyin **nasıl** çizildiğini ve
canlandırıldığını küçük, tek amaçlı örneklerle öğrenmek.

## Faz 2 · Idle oyunu kur

| Aşama | Küçük sonuç | Hangi tekniğe dayanır |
| --- | --- | --- |
| 1.25–1.29 · Mage | Çiz, idle, büyü pozu, atış, isabet | Silüet testi, sabit parça, hazırlık, süre |
| 1.30–1.34 · Warrior | Çiz, adımlama, hazırlık pozu, kılıç izi, üç frame ağırlık | Aynı teknikler, bu kez bir vuruşta |
| 1.35–1.38 · Priest | Çiz, dua pozu, iyileştirme, koruma kubbesi | Hazırlık, süre dağılımı ve yön |
| 1.39–1.43 · Archer | Çiz, yay germe, ok, uçuş, isabet | Hazırlık, sabit sprite, süre |
| 1.44–1.49 · Skilleri bağla | Çıkış noktası, dört karakterin zaman çizgisi ve üç element varyantı | Kenarlık, hazırlık, süre ve biçim |
| 1.50–1.53 · Kadroyu tamamla | Dört karakterin hepsine idle, hurt ve kimliğe göre ayrışan death; kadroyu sola çevirme ve dört frame'lik yürüyüş | Sabit parça, süre, silüet, ağırlık |
| 1.54–1.69 · Eşya ve monster | Silah ailesi, durum ikonları, slime, tier, bat, mimic, boss, tepkiler, kritik ve hasar sayısı | Silüet, renk, hareket, rakamlar |
| 1.70–1.76 · UI | Can barı, XP barı, slot, tier çerçevesi, düğme ve envanter ekranı | Rakam, harf ve 9-slice |
| 1.77–1.81 · İlerleme | Prestige parası, çarpan rozeti, AUTO anahtarı, başarım, karşılama ekranı | Value, 9-slice, harf ve rakam |
| 1.82–1.85 · Dünya | Kamp, mağara, gelir üreten yapı ve gece paleti | Value ayrımı ve dithering |
| 1.86–1.90 · Guild ve parti | Karakter kartı, kilitli üye ve fiyatı, guild rozeti, parti slotları ve kadro ekranı | 9-slice, rakam, kenarlık |
| 1.91–1.95 · Stat ve ekipman | Beş stat ikonu, hizalanmış stat satırı, fark oku, ekipman slotları ve kuşanınca değişen sprite | Silüet, rakam, value, renk rampası |
| 1.96–1.100 · Skill ve auto | Karakter sayfası, skill ikonları, dolan skill barı, cooldown ve AUTO tetiklenmesi | Silüet, süre, hazırlık karesi |
| 1.101–1.103 · Skill tree | Düğümün dört hâli, bağlantı hatları ve ağaç ekranı | Kenarlık, tile, 9-slice |
| 1.104–1.107 · Durum etkileri | Zehir tiki, yanma/donma/stun, buff aurası ve kalkan, portre rozetleri | Sabit parça, renk rampası, silüet |
| 1.108 · Oyuna bağlan | Tag'li tek sprite sheet | 1.2'deki export |

[Derslerin tamamı](/pixel-art/) görsel örneklerle hazır. Liste bir oturuşta
bitirilecek ödevler dizisi değil. Bir karakterde kalmak, bir nesneyi tekrar
çizmek veya beğendiğin bir tekniği başka bir şeyde denemek mümkün.

[Idle RPG görsel seti](/pixel-art/idle-kit) ikinci fazın parçalarının aynı
ekranda nasıl durduğunu gösterir.

## Ölçüler

Ölçüyü stil değil, parçanın işi belirler: nesne, karakter ve monster 8×8
kalır; can barı 32×8, eşya slotu 12×12, düğme 24×12, kamp 32×16 olur.
Karakter ve efekt de **ayrı ayrı 8×8 sprite** olabilir; bir büyünün hem
karakterini hem bütün yolunu aynı canvas'a sığdırman gerekmiyor.

## Oyun hattıyla nasıl birleşiyor?

Art hattı oyun geliştirme derslerini bekletmez, onlar da bunu bekletmez.
Snake'te ilerlerken buraya istediğin aralıkta girebilir, Snake'i bitirdikten
sonra bir süre yalnız pixel art çalışabilirsin.

Birleşme noktası 1.108'deki kit. Idle oyunu yazacak kadar ilerlediğinde elinde
yükleyeceğin hazır bir dosya olur; o noktada texture ownership, asset data'sı
ve animasyonun kodla bağlanması **oyunun kendi ihtiyacıyla** gelir.

## Öğrenme döngüsü

Küçük görsel ihtiyaç → tek fikir → çizim → kullanılacağı boyutta oynatma
veya bakma → inceleme → başka bir asset'te uygulama.

İlk örneği kopyalamak serbest. Sonra aynı kararı yeni bir nesne veya pozda
kendi başına kullandığında bağımsızlık görünür olur. Gerekli bilgi derste
açıkça bulunur; zorunlu rapor veya anatomi/renk teorisi sınavı yok.

## Buradan daha nereye gidebiliriz?

Aşağıdakiler **henüz ders olarak yazılmamış seçenekler**. Birini istediğinde
ve mevcut küçük iş tamamlandığında sıradaki tek dersi hazırlarız.

| İhtiyaç | Sonraki olası küçük çalışma |
| --- | --- |
| Bölge çeşitlensin | Orman veya çöl: kamp kalıbı, yeni palet |
| Kadro geceye uysun | Karakterlerin gece paleti |
| Boss dövüşü uzasın | Boss'un saldırı pozu ve ikinci faz rengi |
| Yazı zenginleşsin | Küçük harfler ve noktalama işaretleri |
| Eşya açıklansın | Üzerine gelince açılan bilgi kutusu |
| Ağaç büyüsün | İkinci karakterin skill tree'si ve düğüm maliyetleri |
| Dört yöne bakılsın | Yukarı ve aşağı bakan karakter pozları |
| Asset oyunda görünsün | İlgili oyunun ihtiyacıyla yükleme ve animasyon bağlantısı |

[Skill fikirleri rehberi](/pixel-art/skill-guide) ve
[Idle RPG görsel seti](/pixel-art/idle-kit) bir sonraki küçük fikri
seçmeye yardım eder. Particle sistemi, shader, uzun animasyon seti veya
büyük bir asset pipeline başlangıç ödevi değil.

## Renk, sahne ve daha büyük canvas

Hazır renkleri kullanarak nesne ve karakter çizmek yeterli.
[Renk rehberi](/pixel-art/color-guide) ile [WASD renk aracı](/pixel-art/color-keys)
isteğe bağlı destekler olarak kalıyor.

**60–30–10, sahne kompozisyonu ve büyük canvas sonraya bırakıldı.**
Samurai Jack ilgisini ileride büyük şekil, boşluk ve odak gibi sahne
kararlarında ele alabiliriz. Oranı ekibin doğrulanmış üretim kuralı
olarak sunmuyoruz. 8×8'de çalışma süresini bir ders sayısı veya takvimle
sınırlamıyoruz.

Uzun vadede hedef, yeni bir oyun ihtiyacına uygun ve tutarlı çizimler,
hareketler ve küçük bitmiş işler üretebilmek. Profesyonelleşme yönünü
uygulama ve geri bildirim belirleyecek; bir tutorial listesi tek başına
bunu garanti etmez.
