---
title: Pixel Art / Aseprite
description: 8×8 nesneler, karakterler, küçük hareketler ve skill efektleri çiz.
---

# Pixel Art / Aseprite

**Küçük çizimlerle başla; karakterde ve animasyonda da 8×8'de kal.**
Çizim deneyimi gerekmiyor. İlk örnekleri görsel adımlardan aynen
çizebilirsin; Aseprite ve fare yeterli.

<CurrentLesson track="pixel-art" />

## Neler çizeceğiz?

**29 kısa ders hazır.** Anahtar, kılıç, kalp ve şişenin yanına kalkan,
sandık ve dört karakter eklendi. Ardından iki frame ile hareket ve
küçük skill efektleri geliyor. Sonraki sekiz ders bir idle RPG'nin
parçalarını kurar: coin, armor, trinket, slime, can barı, eşya slotu,
düğme durumları ve küçük bir kamp. Sonuncusu hepsini oyunun tek seferde
yükleyebileceği bir sprite sheet'te toplar. Her çizim dersinde görünür adımlar;
animasyon derslerinde oynatılabilir örnek ve tek tek seçilebilir frame'ler var.

Karakter, eşya ve animasyonda **8×8'de kalıyoruz.** UI ve dış mekân
parçaları yalnız işleri gerektirdiği için büyür: can barı 32×8, eşya slotu
12×12, düğme 24×12, kamp 32×16. Bu, büyük canvas'a geçiş değil; ölçüyü
parçanın işine göre seçme kararı.

<div class="pixel-preview">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/characters/mage.svg" width="96" height="96" alt="Sivri şapkalı mor mage." /></div>
    <figcaption><strong>Mage</strong><br />Şapka → idle → büyü atışı</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/characters/warrior.svg" width="96" height="96" alt="Miğferli ve kalkanlı warrior." /></div>
    <figcaption><strong>Warrior</strong><br />Ekipman → adımlama → kılıç izi</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/characters/priest.svg" width="96" height="96" alt="Açık renk cübbeli, asalı priest." /></div>
    <figcaption><strong>Priest</strong><br />Cübbe ve asa → iyileştirme ışığı</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/characters/archer.svg" width="96" height="96" alt="Yeşil başlıklı, yay tutan archer." /></div>
    <figcaption><strong>Archer</strong><br />Yay → ok isabeti</figcaption>
  </figure>
</div>

**Önerilen akış:** 1.1–1.5 ile ilk nesneler → 1.9–1.14 ile yeni
nesneler ve karakterler → 1.15–1.16 ile hareket → 1.17–1.20 ile VFX →
1.21–1.28 ile idle RPG eşyaları, monster'ı, UI'ı ve kampı → 1.29 ile
hepsini tek dosyada topla.
1.6–1.8 renk çalışmaları, istediğinde dönebileceğin bir yan yol.
Karakterlerde hazır düz renkler kullanacağız; renk teorisi ön koşul değil.

Dört karakteri aynı oturuşta çizmen gerekmez. Birini seçip onunla hareket
çalışmak da mümkün; sohbette seçtiğin küçük iş üzerinden ilerleriz.

<LessonList track="pixel-art" />

## Küçük kalmak ilerlemeye engel değil

[Reventure'ın resmî görselleri](https://store.steampowered.com/app/900270/Reventure/)
sade oyun dünyası için ilhamımız. **8×8 bizim seçtiğimiz çalışma ölçüsü;**
oyunun bütün asset'lerinin bu ölçüde olduğu iddiası değil.

Yeni bir nesne, farklı bir poz veya daha okunur bir efekt, aynı 64 pixel
içinde yeni kararlar çıkarır. Bu pakette daha büyük canvas'a geçiş yok.
Büyük bir çizime ancak sen istediğinde ve çizim ona ihtiyaç duyduğunda bakarız.

## Rehberleri ihtiyacın olduğunda aç

- [Renk seçimi rehberi](/pixel-art/color-guide): renk ve shading merak ettiğinde seçilmiş sanatçı makaleleri.
- [Klavyeyle renk değiştir](/pixel-art/color-keys): Academy Color Keys, WASD ile yeni renk üretme ve çizgi denemesi.
- [Skill fikirleri](/pixel-art/skill-guide): büyü atışı, koruma, iyileştirme ve isabetten çıkabilecek küçük VFX denemeleri.
- [Idle RPG görsel seti](/pixel-art/idle-kit): 1.21–1.28 parçalarının aynı ekranda buluştuğu örnek yerleşim ve sonraki küçük iş fikirleri.

Script kurulumu veya bir makale listesini bitirmek, çizime başlamanın koşulu değil.

## Nasıl çalışacağız?

Kısa ders → Aseprite'te tek çizim → küçük görünümde deneme → sohbette inceleme.
Görseldeki adımları kopyalayabilirsin. Takılırsan **İpucu 1** iste;
gerekirse **İpucu 2** ve **İpucu 3** ile açarız. Ayrı journal, tahmin
veya gözlem raporu gerekmiyor.

Çizimlerini `art/` altında sen oluşturursun. Ders sonundaki inceleme
cümlesini yazdığında dosyana bakarız; dosyanın kaydedilmiş olması ile şeklin
ve hareketin okunurluğunu ayrı değerlendiririz. Art ve oyun hattının
güncel dersleri bağımsızdır.

## Samurai Jack ilgisi sonraya

Büyük sade şekiller, boşluk ve güçlü odak ilgimizi koruyor. **60–30–10 ve
sahne kompozisyonu bu başlangıcın konusu değil.** Önce nesne, karakter ve
küçük hareket üreteceğiz; ileride bir sahne istediğinde bu referansa döneriz.

## Yanında açabileceğin görsel kaynaklar

| Kaynak | Hangi küçük ihtiyaç için? |
| --- | --- |
| [Saint11 — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/) | İlk Aseprite araçları ve küçük nesne. Onun ilk örneği 16×16; bizim derslerimiz 8×8. |
| [Saint11 — A Basic Aseprite Animation](https://saint11.art/pixel_art_articles/article3/) | Frame sırası ve timing. Onun 32×32 topunu yapmadan buradaki 8×8 karakterle çalışabilirsin. |
| [Aseprite — Animation](https://www.aseprite.org/docs/animation/) | Frame ekleme, playback ve ilgili araçların resmî belgesi. |
| [Jason Lee — Slash Shape Fundamentals](https://jasontomlee.itch.io/slashfx/devlog/629732/tutorial-2-slash-shape-fundamentals) | Kılıç izinin hareket yoluyla ilişkisini görsel olarak incelemek için. |

[Pixel Art yol haritası](/pixel-art/roadmap), hazır dersleri ve daha sonra
ihtiyaçla açılabilecek konuları ayırır. Sonraki küçük işi denemelerine göre seçeriz.
