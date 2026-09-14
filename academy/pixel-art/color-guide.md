---
title: Renk seçimi rehberi
description: Küçük oyun asset'lerinde hue, saturation, value ve palette kararlarını görerek öğren.
---

# Renk seçimi rehberi

Bir nesne için bütün renk teorisini aynı anda kullanman gerekmez. İlk kararın
şu olabilir: **temel renk ne, ondan ayrılan koyu ve açık renkler hangileri?**
Buradaki bilgiler derslerin yanında açabileceğin bir başvuru; ayrı bir ödev yok.

**Şimdilik nesne ve karakter çizmeye odaklanabilirsin.** Derslerde verilen
hazır renkler yeterli. Bu rehber ve 1.11–1.13 çalışmaları, renk seçimini merak
ettiğinde dönebileceğin bir yan yol; animasyon veya VFX için ön koşul değil.

## İlk rengimi nasıl seçeceğim?

Nesnenin oyundaki rolünden başla. Örneğin sağlık pickup'ını çevresinden
kolayca seçmek istiyorsan önce sade bir şekil ve çevresiyle ayrılan bir renk
dene. Kırmızı tek doğru cevap değildir; oyunundaki background ve diğer
pickup'larla birlikte nasıl okunduğuna bakacağız.

İlk denemede [renk rampası dersinin](/pixel-art/12-color-ramp) orta mavisini
kullanabilirsin. Üç renk seçmek, bütün bir palette oluşturmayı daha küçük
bir karara indirir. Beğendiğin bir fotoğraf veya oyun karesinden renk alırken
tek swatch kadar, yanındaki renkleri ve kapladığı alanı da incele.

## HSV kontrollerinde ne değişiyor?

**Hue**, kırmızıdan turuncuya veya maviden yeşile gitmek gibi renk ailesini
değiştirir. **Saturation** azalırken renk griye yaklaşır; bu, gölge çizmekle
aynı karar değildir. **Value** kontrolü ise HSV modelinde rengi koyulaştırır
veya açar. V'nin %100 olması tek başına beyaz üretmez; doygun bir mavi de
V %100 olabilir.

![Hue, saturation ve value ayrı ayrı değiştirilmiş üç renk şeridi. Her satırda diğer iki kontrol sabit.](/pixel-art/color/hsv-controls.svg)

Bu panoda farkları görünür yapmak için büyük aralıklar kullanıldı.
[Academy Color Keys](/pixel-art/color-keys) her basışta saturation/value'yu
5 yüzde puan, hue'yu 5° değiştirir. Bir seferde tek kontrolü değiştirmek,
sonucu hangi kararın oluşturduğunu görmeni kolaylaştırır.

## Sayı ile gördüğüm açıklık aynı şey mi?

Sarı ve mavi, HSV'de aynı V'ye sahipken göze farklı açıklıkta görünebilir.
Bu yüzden iki farklı hue'yu yalnız slider değerleri eşit diye dengeli sayma.
Arne'nin [Values ve Color relativity bölümleri](https://androidarts.com/art_tut.htm)
çevredeki renklerin bu değerlendirmeyi nasıl değiştirdiğini gösterir.

James Gurney'nin [Peak Saturation Value](https://gurneyjourney.blogspot.com/2010/03/peak-saturation-value.html)
yazısı da yoğun sarı ile yoğun mavinin aynı açık–koyu bölgede bulunmadığını
resimli örnekle açıklar. İki kaynağı da tek bir ihtiyaç için aç: seçtiğin
renklerin yan yana nasıl göründüğünü kontrol etmek.

## Palette ve ramp

Palette, çizimde kullanmak için ayırdığın renklerin bütünü. Ramp ise o renkler
arasında kurduğun bir sıra olabilir: örneğin aynı nesnenin koyu, temel ve açık
renkleri. Her palette rengi tek bir ramp'a ait olmak zorunda değil.

![Aynı mavi ailesinden üç renkli bir başlangıç rampası.](/pixel-art/color/blue-palette.svg)

Önce bu üç rengin ayrılması yeterli. Birbirine çok yakın beş yeni renk eklemek
yerine, gerçekten ihtiyacın olan farkı aç. 8×8 bir nesnede aynı renkten
bitişik birkaç pixel, okunur bir alan kurmak için yeterli olabilir.

::: details Deep Dive — Hue shift

Işığı açarken veya gölgeyi koyulaştırırken hue'yu da biraz değiştirebilirsin.
Örneğin pembe bir nesnenin gölgesini mora, aydınlığını şeftaliye yaklaştırmak
bir deneme olabilir. Bu, her gölgenin mavi ve her ışığın sarı olması gerektiği
anlamına gelmez; ışık ortamı ve istediğin görsel etki karar verir.

İlk rampan çalıştıktan sonra yalnız bir rengini değiştirip aynı şeklin üzerinde
bakmak yeterli. Saint11'in [Basic Color Theory](https://saint11.art/pixel_art_articles/article6/)
yazısındaki **Shading** karşılaştırması, bu karar için görsel bir eşlikçi.
:::

::: details Deep Dive — Renk uyumu düzenleri

| Düzen | Küçük oyun örneği | Bakacağın ilişki |
| --- | --- | --- |
| Monochromatic | Tek mavi ailesinden iksir | Açık–koyu farkı şekli taşıyor mu? |
| Analogous | Mavi–camgöbeği–yeşil ortam | Komşu hue'lar içinde etkileşimli nesne seçiliyor mu? |
| Complementary | Mavi ortamda küçük turuncu pickup | Küçük accent yeterince dikkat çekiyor mu? |

Bu düzenler bir palette'e başlamak için seçeneklerdir. Hazır bir uyum şeması,
oyuncunun önemli nesneyi göreceğini tek başına garanti etmez. İlk derslerde
monochromatic bir ramp kullanılabilir; sahne istediğinde diğer seçeneklere bakarız.
:::

::: details Deep Dive — 60–30–10 ne zaman gelecek?

Bu konu sonraya bırakıldı; önce 8×8 nesne, karakter ve hareket çizeceğiz.
İleride sahne istediğinde yaklaşık %60 baskın alan, %30 destek alanı ve %10 accent ile
başlayabiliriz: büyük sakin background, destekleyen ortam şekilleri ve küçük
bir odak. Bu oran hue seçme formülü değildir; bütün pixel'leri saymana da gerek
yok. Samurai Jack ilgini büyük şekil, boşluk ve odak kararlarıyla birlikte
orada çalışacağız. Oranı ekibin belgelenmiş üretim kuralı olarak kullanmıyoruz.
:::

## Hangi makaleyi ne için okuyacağım?

| Kaynak | İhtiyaç duyduğunda bakılacak bölüm | Bizdeki karşılığı |
| --- | --- | --- |
| [Saint11 — Basic Color Theory](https://saint11.art/pixel_art_articles/article6/) | Understanding Colors; sonra Shading | HSV ve renk rampası |
| [Saint11 — Basic Shading](https://saint11.art/pixel_art_articles/article4/) | Identifying Faces ve Pillow shading | Tek ışık yönü |
| [Arne — PSG Art tutorial](https://androidarts.com/art_tut.htm) | Values ve Color relativity | Açık–koyu ayrımı |
| [James Gurney — Peak Saturation Value](https://gurneyjourney.blogspot.com/2010/03/peak-saturation-value.html) | Kısa yazı ve renk örnekleri | Hue ile algılanan açıklık ilişkisi |

Kaynaklar sanatçıların kendi anlatımlarıdır; `RESOURCES.md` içinde de kayıtlı.
Saint11 görsel başlangıç, Arne ve Gurney ise belirli bir renk kararında
derinleşmek için kullanılabilir. Şimdi uygulamaya geçmek için
[1.11 — Üç value ile ayır](/pixel-art/11-value) dersini açabilirsin.
