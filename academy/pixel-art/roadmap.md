---
title: Pixel Art yol haritası
description: 8×8 asset'lerden kendi idle oyununun görsel setine giden yol.
---

# Pixel Art yol haritası

Hedef, **kendi küçük oyununun asset'lerini kendin üretebilmek.** Idle oyun bu
hedefin en sade hali: az sayıda nesne, birkaç karakter, küçük bir UI ve
tekrar eden kısa hareketler. Bu yüzden pakette idle bir oyunun ihtiyaç
duyduğu parçaları çiziyoruz.

**Nesnede, karakterde ve animasyonda 8×8'de kalıyoruz.** UI ve dış mekân
parçaları yalnız işleri gerektirdiği kadar büyür. Bir aşamayı bitirmek,
canvas'ı büyütme zorunluluğu doğurmuyor.

<CurrentLesson track="pixel-art" />

## Dersler küçük, çıktı tek

Her ders tek bir karar öğretir; bu yüzden kısadır. Ama dersler birbirinden
bağımsız çizimler yığını değil, **üç çıktıda toplanır:**

| Çıktı | Hangi dersler | Elinde ne kalır? |
| --- | --- | --- |
| Tek tek asset'ler | 1.1–1.20 | Nesne, karakter, iki frame'lik hareket ve skill efekti |
| Idle oyunun görsel seti | 1.21–1.28 | Eşya, monster, can barı, slot, düğme ve dış mekân |
| Oyunun yükleyeceği tek dosya | 1.29 | Tag'lenmiş tek sprite sheet |
| Tam skill zincirleri ve tepkiler | 1.30–1.42 | Ok, pozlar, isabet, flash, ölüm, loot, level up ve monster kadrosu |
| Tamamlanmış UI ve ikinci bölge | 1.43–1.49 | Rakamlar, 9-slice panel, XP barı, tier çerçeveleri, tile ve mağara |
| Aynı çizimi geliştiren teknikler | 1.50–1.54 | Silüet testi, kenarlık, dithering, süre ve ağırlık |

Bir dersi bitirdiğinde ortaya tek bir dosya çıkar; 1.29'da o dosyalar tek bir
kit olur. 1.30'dan sonrası aynı kit'i büyütür: yeni bir asset çizdiğinde
sheet'e bir frame eklemen yeterli. [Idle RPG görsel seti](/pixel-art/idle-kit) parçaların aynı ekranda
nasıl durduğunu şimdiden gösterir.

## Hazır olan yol

| Aşama | Küçük sonuç | Tek tek çalışacağımız kararlar |
| --- | --- | --- |
| 1.1–1.5 · İlk nesneler | Anahtar, kılıç, kalp, şişe ve PNG | Dış şekil, boşluk, dar/geniş parçalar |
| 1.9–1.10 · Nesnelerle devam | Kalkan ve sandık | Daralan alt kenar, kapak/gövde ayrımı |
| 1.11–1.14 · Karakterler | Mage, warrior, priest, archer | Şapka, ekipman, cübbe ve yay gibi rol işaretleri |
| 1.15–1.16 · İlk hareket | İki frame'lik idle ve yerinde adımlama | Sabit parça, değişen poz, sırayla kalkan ayaklar |
| 1.17–1.20 · İlk skill VFX | Büyü atışı, kılıç izi, iyileştirme ve isabet | Yön, yay, yükseliş, merkezden dağılma ve bitiş |
| 1.21–1.24 · Idle eşya ve monster | Coin, armor, trinket ve slime | Tek işaretle tanınma, bağımsız ikon, gövdeden monster çıkarma |
| 1.25–1.28 · Idle UI ve çevre | Can barı, eşya slotu, düğme durumları ve kamp | Miktar uzunluğu, kenar payı, durum farkı, aynı zemine oturan şekiller |
| 1.29 · Oyuna bağlanma | Tag'li tek sprite sheet | Frame sırası, tag ile gruplama, aynı ölçüdekileri birlikte tutma |
| 1.30–1.35 · Skill zincirini tamamla | Ok, yay germe, uçuş, mage isabeti, hazırlık pozu, koruma kubbesi | Yönü taşıyan uç, sabit gövde, hareket için boşluk, yerinde duran efekt |
| 1.36–1.39 · Tepki ve geri bildirim | Hasar flash'ı, ölüm, düşen coin, level up | Şekli bozmadan renk değiştirme, çöküş kademeleri, zıplama, yukarı açılma |
| 1.40–1.42 · Monster kadrosu | Üç tier, iki frame'lik bat, saldırı pozu | Palette swap, sabit gövde ile değişen kanat, hacmi koruyarak uzama |
| 1.43–1.47 · Idle UI'ı tamamla | Rakamlar, 9-slice panel, XP barı, tier çerçeveleri, slot durumları | 3×5 okunurluk, köşe payı, iki yönlü ayrım, tek renk dili, parlaklıkla durum |
| 1.48–1.49 · Çevre ilerlemesi | Zemin tile'ı ve mağara | Ek yerini gizleme, aynı kalıbı farklı paletle tekrarlama |
| 1.50–1.54 · Aynı çizimde derinleşme | Silüet testi, kenarlık, dithering, süre, ağırlık | Renkten bağımsız okunurluk, zeminden ayrılma, ara ton, ritim, hazırlık |
| 1.6–1.8 · İsteğe bağlı renk | Üç value, ramp ve tek ışık yönü | Renk ihtiyacı hissettiğinde döneceğin kısa çalışmalar |

[Derslerin tamamı](/pixel-art/) görsel örneklerle hazır. Liste bir oturuşta
bitirilecek ödevler dizisi değil. Aynı karakterde kalmak, bir başka nesne
çizmek veya beğendiğin skill'i tekrar çalışmak mümkün.

Ölçüyü stil değil, parçanın işi belirler: eşya ve monster 8×8 kalır; can barı
32×8, eşya slotu 12×12, düğme 24×12, kamp 32×16 olur. Karakter ve efekt de
**ayrı ayrı 8×8 sprite** olabilir; bir büyünün hem karakterini hem bütün
yolunu aynı canvas'a sığdırman gerekmiyor.

## Oyun hattıyla nasıl birleşiyor?

Art hattı oyun geliştirme derslerini bekletmez, onlar da bunu bekletmez.
Sıra sende: Snake'te ilerlerken buraya istediğin aralıkta girebilir, Snake'i
bitirdikten sonra bir süre yalnız pixel art çalışabilirsin.

Birleşme noktası 1.29'daki kit. Idle oyunu yazacak kadar ilerlediğinde
elinde yükleyeceğin hazır bir dosya olur; o noktada texture ownership,
asset data'sı ve animasyonun kodla bağlanması **oyunun kendi ihtiyacıyla**
gelir. İlk VFX ve hareket dosyaları o güne kadar görsel çalışmalardır.

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
| Karakter başka yöne baksın | Aynı karakterin tek bir yan veya arka pozu |
| Yürüyüş gerçekten yürüsün | İki frame yerine dört frame'lik yürüyüş döngüsü |
| Nesne tepki versin | Açılan sandık veya kırılan küçük taş |
| Yazı da çizilebilsin | Rakamların yanına 3×5 harf seti |
| Kritik vuruş ayrı hissettirsin | Normal vuruştan farklı renk ve süredeki ikinci flash |
| Skill çeşitlensin | Aynı efektin ateş, buz ve zehir varyantı |
| Bölge saat başı değişsin | Aynı sahnenin gece paleti |
| Envanter ekranı kurulsun | Slot, çerçeve ve barların tek bir ekranda yerleşimi |
| Daha büyük bir düşman gerekirse | 16×16 tek istisna olarak boss; ancak sen istediğinde |
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
