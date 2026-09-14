# Aseprite pixel art: 8×8 anahtar başlangıcı

**Amaç:** Çizim deneyimi olmadan, Reventure benzeri sade oyun nesneleriyle
başlamak. 8×8, kullanıcı tarafından seçilmiş öğrenme ölçeğidir; Reventure'ın
bütün asset'lerinin 8×8 olduğu iddia edilmez.

## İlk iki ders

| Ders | Tek fikir | Küçük asset | Kabul ölçütü |
| --- | --- | --- | --- |
| 1 | Az pixel'le tanınır şekil kurulur. | 8×8 canvas'ta tek renk anahtar: halka → sap → iki diş. | Halka, sap ve dişler bağlı; halka boş, kaynak `.aseprite` olarak kaydedilmiş. |
| 2 | Oyun için kaynak dosyası ile şeffaf PNG ayrı çıktılardır. | Aynı 8×8 anahtarı `File > Export > Export As` ile PNG çıkar. | Export penceresinde `Resize: 100%`; PNG'de arka plan yoktur. |

Kullanıcının isteğiyle bu başlangıç, kılıç/kalp/şişe ve value/ramp/shading
derslerine genişletildi. Sonraki açık istekle kalkan/sandık, dört karakter,
iki frame'lik hareketler ve skill VFX eklendi; hepsi 8×8'de kalır. Renk
dersleri isteğe bağlıdır; büyük canvas ve sahne kompozisyonu ertelenmiştir.
Animasyon kaynakları `pixel-art-animation.md`, renk kaynaklarının gerekçesi
`pixel-art-color.md` notunda, araç kullanımı `academy/pixel-art/color-keys.md`
sayfasında yer alır.

## Görsel ve araç kaynakları

- Pedro Medeiros'un [Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/)
  görsel rehberdir: küçük canvas, az renk ve okunurlukla başlar; kendi örneği
  16×16 kupadır. 8×8 anahtar bu track'in özgün ilk örneğidir.
- [Aseprite New Sprite](https://www.aseprite.org/docs/new-sprite/) yeni canvas
  ölçüsü ve başlangıç ayarları içindir. [Drawing](https://www.aseprite.org/docs/drawing/)
  Pencil ile tek pixel çizimini açıklar.
- [Aseprite Zoom](https://www.aseprite.org/docs/zoom/) zoom tool, status bar
  slider ve mouse wheel seçeneklerini doğrular. 8×8 çalışırken sadece görünümü
  büyütür; canvas ölçüsünü değiştirmez.
- [Aseprite Brushes](https://www.aseprite.org/docs/brushes/) painting tool'un
  context bar'ından brush type seçildiğini doğrular. İlk anahtar için Pencil
  ve 1 px brush size yeterlidir; özel brush öğretimi ertelenir.
- [Aseprite Exporting](https://www.aseprite.org/docs/exporting/) PNG üretimini,
  hatırlanan export ayarlarını ve `Resize: 100%` ile kaynak ölçüsünü korumayı doğrular.
- [Aseprite Workflow](https://www.aseprite.org/docs/workflow/) `.aseprite` ile
  layer/frame bilgisini koruyan `File > Save` akışını ve `File > Export > Export As`
  ile PNG export'u doğrular.
- [Reventure'ın Steam sayfası](https://store.steampowered.com/app/900270/Reventure/),
  oyunun developer ve publisher'ını Pixelatto olarak listeler ve pixel graphics
  etiketini gösterir. Sade oyun nesneleri için görsel referanstır; pixel ölçüsü
  veya asset üretim kuralı kaynağı değildir.

## Gelecek renk çalışması için sınır

60–30–10, dominant/secondary/accent alanlarını düşünmeye yarayan esnek bir
çalışma kılavuzu olabilir. Samurai Jack üretim kuralı olarak doğrulanmamıştır;
gelecekte bir renk deneyi gerektiğinde ancak bu sınırla kullanılmalıdır.
