---
title: Pixel Art yol haritası
description: 8×8 içinde nesne, karakter, hareket ve skill VFX üretmeye devam et.
---

# Pixel Art yol haritası

İlk hedef, oyunun için küçük asset'leri kendin üretebilmek.
**Nesnede, karakterde ve animasyonda 8×8'de kalıyoruz.**
UI ve dış mekân parçaları yalnız işleri gerektirdiği kadar büyür.
Bir aşamayı bitirmek, canvas'ı büyütme zorunluluğu doğurmuyor.

<CurrentLesson track="pixel-art" />

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
| 1.6–1.8 · İsteğe bağlı renk | Üç value, ramp ve tek ışık yönü | Renk ihtiyacı hissettiğinde döneceğin kısa çalışmalar |

[Derslerin tamamı](/pixel-art/) görsel örneklerle hazır. Liste bir oturuşta
bitirilecek ödevler dizisi değil. Aynı karakterde kalmak, bir başka nesne
çizmek veya beğendiğin skill'i tekrar çalışmak mümkün.

1.21–1.28 bir idle RPG'nin görsel parçalarını kurar. Ölçüyü stil değil,
parçanın işi belirler: eşya ve monster 8×8 kalır; can barı 32×8, eşya slotu
12×12, düğme 24×12, kamp 32×16 olur. [Idle RPG görsel seti](/pixel-art/idle-kit)
bu parçaların aynı ekranda nasıl buluştuğunu gösterir.

Karakter ve efekt **ayrı ayrı 8×8 sprite** olabilir. Bir büyünün hem
karakterini hem bütün yolunu aynı canvas'a sığdırman gerekmiyor.
İlk VFX dosyaları görsel çalışmalardır; gameplay davranışına bağlamak
ilgili oyunda somut ihtiyaç çıktığında ele alınır.

## Öğrenme döngüsü

Küçük görsel ihtiyaç → tek fikir → çizim → kullanılacağı boyutta oynatma
veya bakma → inceleme → başka bir asset'te uygulama.

İlk örneği kopyalamak serbest. Sonra aynı kararı yeni bir nesne veya pozda
kendi başına kullandığında bağımsızlık görünür olur. Gerekli bilgi derste
açıkça bulunur; zorunlu rapor veya anatomi/renk teorisi sınavı yok.

## Buradan daha nereye gidebiliriz?

Bunlar **henüz ders olarak yazılmamış seçenekler**. Birini istediğinde
ve mevcut küçük iş tamamlandığında sıradaki tek dersi hazırlarız.

| İhtiyaç | Sonraki olası küçük çalışma |
| --- | --- |
| Karakter başka yöne baksın | Aynı karakterin tek bir yan pozu |
| Monster tepki versin | Slime'a değen kısa bir hasar parıltısı |
| Envanter dolsun | Aynı 8×8 kalıptan ikinci bir armor veya silah ikonu |
| Saldırının hazırlığı görülsün | Silahı geri çeken bir hazırlık pozu |
| Bir nesne tepki versin | Açılan sandık veya kırılan küçük taş |
| Aynı karakter daha canlı olsun | Cübbe ucu, yay kolu veya küçük zıplama |
| Skill farklı hissettirsin | Şekli ve süresi değişen tek bir VFX varyasyonu |
| Asset oyunda görünsün | İlgili oyunun ihtiyacıyla export ve animasyon bağlantısı |

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
olarak sunmuyoruz. 8×8'de çalışma süresini bir ders sayısı veya takvimle sınırlamıyoruz.

## Game Development ile buluşma

Art hattı oyun geliştirme derslerini bekletmez. Bir oyunda kendi asset'ini
kullanmak istediğinde önce doğru görüntüyü ve gerekli animasyonu bağlarız;
texture ownership/lifetime ve asset data'sı o ihtiyaçla gelir.

Uzun vadede hedef, yeni bir oyun ihtiyacına uygun ve tutarlı çizimler,
hareketler ve küçük bitmiş işler üretebilmek. Profesyonelleşme yönünü
uygulama ve geri bildirim belirleyecek; bir tutorial listesi tek başına
bunu garanti etmez.
