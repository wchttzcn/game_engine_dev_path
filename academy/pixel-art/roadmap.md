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

Bir dersi bitirdiğinde ortaya tek bir dosya çıkar; 1.29'da o dosyalar tek bir
kit olur. [Idle RPG görsel seti](/pixel-art/idle-kit) parçaların aynı ekranda
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
ve mevcut küçük iş tamamlandığında sıradaki tek dersi hazırlarız. Hepsi 8×8
veya işinin gerektirdiği küçük ölçüde kalır.

### Kopuk skill zincirleri

Bir skill dört halkadır: hazırlık → uçuş → isabet → bitiş. Her karakterde
farklı halka eksik.

| İhtiyaç | Sonraki olası küçük çalışma |
| --- | --- |
| Ok görünsün | 8×8 ok sprite'ı: yönü tek bakışta belli |
| Atışın hazırlığı görülsün | Archer'ın yay germe pozu |
| Okun yolu izlensin | İki frame'lik ok uçuşu |
| Büyü hedefe varsın | Mage için isabet efekti |
| Vuruş ağırlık kazansın | Warrior'ın kılıcı geri çeken hazırlık pozu |
| Priest korusun | Karakterin yanında kısa süre kalan koruma yayı |

### Tepki ve geri bildirim

Idle oyunda oyuncunun baktığı tek şey budur; pakette henüz hiç yok.

| İhtiyaç | Sonraki olası küçük çalışma |
| --- | --- |
| Vuruş hissedilsin | Tek frame'lik hasar flash'ı: siluetin tamamı tek renk |
| Monster ölsün | Üç frame'lik slime çöküşü |
| Loot görünsün | Zıplayıp yere düşen coin |
| İlerleme kutlansın | Karakterin üstünde kısa level up parıltısı |

### Monster kadrosu

| İhtiyaç | Sonraki olası küçük çalışma |
| --- | --- |
| Düşman güçlensin | Aynı sprite, farklı renk seti: tek çizimden üç tier |
| Kadro çeşitlensin | İki frame'lik kanat çırpan bat |
| Monster saldırsın | Slime'ın tek karelik saldırı pozu |

### Idle UI'ın eksikleri

| İhtiyaç | Sonraki olası küçük çalışma |
| --- | --- |
| Sayı gösterilsin | 3×5 rakam seti (0–9): idle oyunun en çok kullandığı çizim |
| Panel her boyda kurulsun | 9-slice çerçeve: tek küçük çizimden istediğin boyda kutu |
| İlerleme ayrı okunsun | Can barından ince, farklı renkte XP barı |
| Eşya değeri belli olsun | Slot kenarına renkli tier çerçevesi |
| Kilit ve yükseltme görünsün | Kilitli slot ve artı düğmesi |

### Çevre ilerlemesi

| İhtiyaç | Sonraki olası küçük çalışma |
| --- | --- |
| Zemin uzayabilsin | Yan yana dizilince eki görünmeyen 8×8 tile |
| Yeni bölge açılsın | Aynı kamp kalıbından farklı paletle mağara veya orman |

### Aynı çizimde derinleşme

Yeni nesne değil, aynı nesneye yeni karar. “8×8 basit kalıyor” hissinin
asıl cevabı burada.

| İhtiyaç | Sonraki olası küçük çalışma |
| --- | --- |
| Şekil güçlensin | Silüet testi: hepsini tek renge boya, hâlâ tanınıyor mu |
| Okunurluk artsın | Aynı sprite'ın outline'lı ve outline'sız hali yan yana |
| İki renk arası yumuşasın | 8×8 içinde dithering ile geçiş |
| Hareket farklı hissettirsin | Aynı iki frame, üç farklı süre |
| Vuruşta ağırlık olsun | İki frame yerine üç: geri çekil, sonra vur |

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
