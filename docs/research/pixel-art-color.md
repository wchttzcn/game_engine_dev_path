# Pixel Art: renk ve gölge kaynak haritası

Bu not, 8×8 nesnelerin yanındaki isteğe bağlı renk/gölge dersleri için seçilmiş
kaynakların kısa haritasıdır. Kaynaklar dersin kendisi değildir: bir derste tek
bir gözle görünür karar çalışılır.

## İlk renk dersi: üç value ile okunurluk

- **Pedro Medeiros, [Basic Color Theory](https://saint11.art/pixel_art_articles/article6/), “Understanding Colors” ve “Value”.** Hue, saturation ve value'yu
  küçük palette ayırmak için en doğrudan başlangıç. Aynı sayısal value'daki
  mavi/mor ile sarının eşit parlak görünmeyebileceği uyarısı, grayscale kontrolü
  gerektiren bir ders iddiasını destekler.
- **Arne Niklas Jansson, [Pixel Art Tutorial WIP](https://www.androidarts.com/pixtut/pixelart.htm), “Hardware restrictions”.** Üç value ile çok şey yapılabileceği
  ve az palette gürültünün azalabileceği gözlemi. 8×8 iksir ya da kalpte
  “önce üç tonla şekil okunuyor mu?” çalışmasına kaynak olur.
- **Arne Niklas Jansson, [PSG Art tutorial](https://androidarts.com/art_tut.htm), “Values”, “Color relativity” ve “Color identity”.** Önce büyük şekil ve
  value ilişkisi, sonra renk kararını kontrol etme sırası. Her parçaya otomatik
  shadow–midtone–highlight eklememe uyarısı, başlangıç gölgeleme hatasını
  doğrudan hedefler.

## Işık yönü ve küçük hacim

- **Pedro Medeiros, [Basic Shading](https://saint11.art/pixel_art_articles/article4/), “Identifying Faces” ve “Working with a photo reference”.** Bir ışık
  yönü belirleme, düz yüzlerde düz ton kullanma ve projected shadow fikri.
  8×8 nesnede tek ışık yönü seçip yalnızca gerekli pixel'leri değiştirme dersi
  için en uygun kaynak.
- **Pedro Medeiros, [An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/), “Step 3: Shading”.** Kısıtlı palette yakın hue yerine
  başka bir hue'nun ışık ya da gölge rolünü üstlenebileceği ilk örnek. Bu,
  hue shift'e giriş olur; zorunlu bir stil kuralı değildir.

## Renk rampası ve vurgu

- **Pedro Medeiros, [Basic Color Theory](https://saint11.art/pixel_art_articles/article6/), “Shading” ve “Color Schemes”.** Sıcak ışık/soğuk gölge örneği,
  hue ve saturation değişen bir rampayı tanıtır. Complementary renk, büyük
  alanı doldurmak yerine küçük bir vurgu için denenir.
- **James Gurney, [Peak Saturation Value](https://gurneyjourney.blogspot.com/2010/03/peak-saturation-value.html).** Hue'ların maksimum chroma'ya ulaştığı
  value farklıdır: sarı yüksek value'da, mavi düşük value'da daha yoğun görünür.
  Bu yüzden renk seçimini HSV slider'daki tek sayıdan ibaret saymama dersi için
  destekleyici kaynaktır.

## Ders sırası için kararlar

1. Kullanıcının yeni önceliği, hazır düz renklerle 8×8 nesne, karakter ve
   animasyon üretmek. Renk/gölge dersleri bir ön koşul değildir.
2. Renk ihtiyacı çıktığında aynı nesnede üç value, ramp veya tek ışık yönünden
   yalnız biri çalışılır. Hue shift kapalı, isteğe bağlı bir referanstır.
3. 60–30–10 ve sahne kompozisyonu sonraya bırakıldı; daha büyük canvas'a
   otomatik geçiş yok. Samurai Jack ekibinin üretim kuralı iddiası hâlâ
   `RESOURCES.md` “Boşluklar” bölümünde doğrulanmamış olarak durur.

## Şimdilik dışarıda bırakılanlar

Anti-alias, banding, dither ve indexed palette sonraki ihtiyaçlardır.
Animasyon ise yeni istekle 8×8 içinde işlendi; ayrı kaynak haritası
`pixel-art-animation.md` dosyasındadır.
