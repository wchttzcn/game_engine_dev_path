---
title: Klavyeyle renk değiştir
description: Academy Color Keys kurulumu, WASD kullanımı ve shading için küçük bir deneme.
---

# Klavyeyle renk değiştir

Mouse veya stylus ile çiz; renk alanına gitmeden klavyeyle bir sonraki rengini
ayarla. **Academy Color Keys**, Aseprite için bu akışı sağlayan küçük bir
Lua extension. [Quick Color Hotkeys](https://carbscode.itch.io/quick-color-hotkeys)
örneğindeki HSV kontrolünü, derslerimize ait özgün kodla uyguluyor.

<a href="/downloads/academy-color-keys.aseprite-extension" download><strong>Academy Color Keys paketini indir</strong></a>

## Kurulum

1. Aseprite'te `Edit > Preferences > Extensions > Add Extension` açıp indirdiğin
   `.aseprite-extension` dosyasını seç.
2. `Edit > Keyboard Shortcuts` aç. Arama alanına **Academy Color** yaz;
   komutları Menus veya Commands bölümünde bulabilirsin.
3. Komutlara aşağıdaki tuşları ata. Paket kısayollarını otomatik değiştirmez.
4. Açık sprite'ın **RGB** modunda olsun; derslerimiz bu modda başlıyor.
   Komutlar `File > Scripts` menüsünde de bulunur.

| Tuş | Atanacak komut | Her basışta değişen |
| --- | --- | --- |
| W | Academy Color: Value + | V +5 yüzde puan |
| S | Academy Color: Value - | V −5 yüzde puan |
| A | Academy Color: Saturation - | S −5 yüzde puan |
| D | Academy Color: Saturation + | S +5 yüzde puan |
| Q, isteğe bağlı | Academy Color: Hue - | H −5° |
| E, isteğe bağlı | Academy Color: Hue + | H +5° |

**Tuş atamalarını kontrol et:** Aseprite'ın varsayılanlarında W Magic Wand,
A Palette Editor, S Stroke, D Contour aracına/komutuna bağlı. Q Lasso,
E Eraser için kullanılıyor. Renk kontrolüne verdiğin tuşun eski atamasını
kaldır veya ona başka bir tuş ver. Q/E'yi şimdilik atamadan yalnız WASD ile
başlayabilirsin. B Pencil, I Eyedropper olarak kullanılmaya devam eder.

## Örnekteki gibi şeritler çiz

Bu isteğe bağlı araç denemesi için 8×8 RGB canvas yeterli. Kaydetmek veya
inceleme raporu hazırlamak gerekmiyor.

1. Foreground color'u HSV görünümünde **H: 210°, S: %60, V: %35** yap.
2. **B** ile Pencil'i seç, brush size **1 px** olsun. Yukarıdan aşağıya kısa
   bir çizgi çiz ve mouse'u bırak.
3. **W'ye iki kez bas**: V %35'ten %45'e çıkar. Yanına yeni bir çizgi çiz.
4. Bu akışla birkaç şerit daha ekle. S ters yönde koyulaştırır; A/D renk
   ailesini sabit tutarken saturation'ı değiştirir.

![Her çizgiden sonra W'ye iki kez basılarak üretilen altı mavi tonun büyütülmüş örneği.](/pixel-art/color/keyboard-strokes.svg)

Çizgiyi elin çizer; tuşlar foreground rengini değiştirir. Arada palette veya
başka bir dialog'a tıklaman gerekmez. Buradaki akış **çizgiyi bitir → tuşa
bas → sonraki çizgiyi çiz**; mouse basılıyken tek bir stroke içinde renk
değiştirme davranışı doğrulanmadı.

## Shading için nasıl kullanacağım?

Önce [renk rampası dersinde](/pixel-art/12-color-ramp) birbirinden ayrılan
üç renk seç. Sonra [ışık yönü dersinde](/pixel-art/13-shading) o renkleri
şeklin üzerine yerleştir. Tuşa her basışta üretilen renk yeni bir adaydır;
hepsini bitmiş sprite'a eklemen gerekmez.

W/S yalnız HSV value'yu değiştirir. Tek başına ışık yönünü veya uygun gölge
rengini seçmez. [Renk rehberindeki görsel karşılaştırmalar](/pixel-art/color-guide)
bu kararları öğrenmek içindir.

## Bir tuş beklediğim gibi çalışmıyorsa

- Tool değişiyorsa Keyboard Shortcuts'ta aynı tuşun eski atamasına bak.
- Menü komutu griyse bir RGB sprite aç. Indexed/Grayscale'de bu araç çalışmaz.
- Hiç renk görünmüyorsa foreground alpha'yı kontrol et; script alpha'yı korur.
- Siyah veya gri renkte hue değişimini hemen göremeyebilirsin. Görmek için
  saturation ve value'yu sıfırın üzerine getir.
- Value veya saturation sınırına ulaştığında o yöndeki tuş artık ilerlemez;
  hue ise renk çemberinde dönmeye devam eder.

## Shading ink

İleride palette'inde kullanacağın koyu–orta–açık renkler hazırsa, Aseprite'in
yerleşik **Shading ink** aracı da işine yarayabilir:

1. Nesneyi temel renginle çiz.
2. Pencil'in ink seçeneğinde **Shading** seç; palette'te temel renk dahil
   kullanacağın renk sırasını seç.
3. Sol tık mevcut pixel rengini seçili sırada sola, sağ tık sağa taşır.
   Sol ve sağın açık/koyu anlamı, senin renkleri nasıl sıraladığına bağlıdır.

Bu araç mevcut renkler arasında çalışır; Academy Color Keys yeni foreground
renkleri üretir. İkisi için de önce küçük bir ramp kurmak işleri anlaşılır
kılar. [Aseprite'in resmî Shading rehberi](https://www.aseprite.org/docs/shading/)
bu adımları hareketli görsellerle gösteriyor.

## Kaynak ve kaldırma

Kaynak kod `tools/aseprite/academy-color-keys/` altında. Renk hesapları ve
extension komutlarının yüklenmesi kurulu Aseprite 1.3.18.3 ile kontrol edildi;
kişisel kısayol atamaları bu oturumda değiştirilmedi.

Extension'ı kaldırmak için Preferences > Extensions'tan kaldır; verdiğin
tuşları Keyboard Shortcuts'tan geri düzenle. Kurulum ve tuş atama adımları
[Aseprite Plugin](https://www.aseprite.org/api/plugin) ve
[Keyboard Shortcuts](https://www.aseprite.org/docs/keyboard-shortcuts/)
belgelerine dayanır; bu kaynaklar `RESOURCES.md` içinde kayıtlıdır.
