# Academy Color Keys

Aseprite'te foreground rengini küçük HSV adımlarıyla değiştirir. Çizgiyi mouse
veya stylus ile çizersin; yeni çizgiden önce klavyeyle rengi ayarlarsın.

| Komut adı | Önerilen tuş | Her basış |
| --- | --- | --- |
| Academy Color: Value + | W | HSV value +5 yüzde puan |
| Academy Color: Value - | S | HSV value −5 yüzde puan |
| Academy Color: Saturation - | A | Saturation −5 yüzde puan |
| Academy Color: Saturation + | D | Saturation +5 yüzde puan |
| Academy Color: Hue - | Q, isteğe bağlı | Hue −5° |
| Academy Color: Hue + | E, isteğe bağlı | Hue +5° |

Value/saturation %0–100 aralığında kalır; hue renk çemberinde döner.
Alpha korunur. RGB sprite açıkken çalışır; Indexed ve Grayscale'de komutlar
devre dışıdır. Canvas, palette, background rengi ve aktif tool değişmez.

## Kurulum

Academy'de `/pixel-art/color-keys` sayfasını aç; indirilebilir paket ve
görsel kullanım örneği orada. Repo içindeki paket:
`academy/public/downloads/academy-color-keys.aseprite-extension`.

1. Aseprite'te `Edit > Preferences > Extensions > Add Extension` ile paketi seç.
2. `Edit > Keyboard Shortcuts` aç; aramada `Academy Color` yaz.
3. Tablodaki komutlara istediğin tuşları ata. Varsayılanlarda W Magic Wand,
   A Palette Editor, S Stroke, D Contour; Q Lasso ve E Eraser'dır.
   Aynı tuşun eski tool/command atamasını kaldır veya ona başka bir tuş ver.
4. Bir RGB sprite aç; B ile Pencil seç. Bir çizgi çizip mouse'u bırak,
   W'ye bas, yanına yeni çizgi çiz. İkinci rengin HSV value'su daha yüksek olur.

Kurulum tuşlarını otomatik değiştirmez. Kaldırmak için Extensions'tan bu
extension'ı kaldır; Keyboard Shortcuts'ta değiştirdiğin atamaları geri ver.
Mouse basılıyken tek bir stroke içinde renk değiştirme bu aracın doğrulanmış
akışı değildir; şeritleri ayrı stroke'larla çiz.

## Doğrulama ve paketleme

Renk işlemleri kurulu Aseprite 1.3.18.3 üzerinde gerçek Color/Sprite nesneleriyle
test edilir. `test.lua`, kayıtlı callback'leri yakalayarak HSV sınırlarını,
hue döngüsünü, alpha'yı, RGB dışı davranışı ve çizime dokunulmadığını sınar.

Repo kökünden:

```sh
python3 tools/aseprite/academy-color-keys/package.py
```

Testi, kullanıcı ayarlarından ayrı bir geçici profil ile çalıştır:

```sh
ASEPRITE_USER_FOLDER=/private/tmp/academy-color-keys-profile aseprite \
  --batch --noinapp \
  --script-param source="$PWD/tools/aseprite/academy-color-keys" \
  --script tools/aseprite/academy-color-keys/test.lua
```

`aseprite` PATH'te yoksa kurulu binary'nin tam yolunu kullan. Bu komut
pencere açmaz; test kendi geçici sprite'ını oluşturup kapatır.

## Kaynak

Özgün uygulama, Aseprite'ın [Plugin](https://www.aseprite.org/api/plugin),
[Color](https://www.aseprite.org/api/color) ve [app.fgColor](https://www.aseprite.org/api/app#appfgcolor)
API'lerini kullanır. Kullanıcının gösterdiği
[Quick Color Hotkeys](https://carbscode.itch.io/quick-color-hotkeys), bu çalışma
için davranış referansıdır; pakete o ürünün kodu veya görselleri dahil edilmez.
