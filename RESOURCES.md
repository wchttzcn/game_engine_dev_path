# Kaynaklar

Derslerdeki açıklamalar buradaki kaynaklara dayanır; hafızadan API veya davranış
iddia edilmez. Her ders sonunda **Birincil kaynak** bölümü bu listeden bir
girdiye işaret eder.

Yeni bir kaynak eklenirken tek satırlık "ne için kullanılır" notu zorunludur.
Yanlış çıkan veya yüzeysel kalan kaynak listede tutulmaz, silinir.

## Bilgi

### Odin

- [Odin Overview — resmi dil rehberi](https://odin-lang.org/docs/overview/)
  Dilin tamamının tek sayfalık referansı. Şunun için: `struct`, `enum`,
  `switch`, procedure, fixed array gibi dil yapılarının doğru sözdizimi ve
  semantiği. Bölüm anchor'ları: `#structs`, `#enumerations`,
  `#switch-statement`, `#procedures`, `#fixed-arrays`, `#array-programming`,
  `#constant-declarations`.
- [Odin builtin procedure'ları](https://pkg.odin-lang.org/base/builtin/)
  `clamp`, `min`, `max`, `abs` gibi import gerektirmeyen builtin'ler. Şunun
  için: sınır içinde tutma ve hız sınırlama hesapları.
- [Odin adlandırma konvansiyonu — `base/runtime/core.odin`](https://github.com/odin-lang/Odin/blob/master/base/runtime/core.odin)
  Dosyanın başındaki yorum bloğu dilin kendi adlandırma kuralını sayar: tip ve
  enum üyesi Ada_Case, procedure ve değişken snake_case, constant
  SCREAMING_SNAKE_CASE. Şunun için: derslerde yazılan adların core paketlerle aynı
  biçimde olması. Kurulu derleyicideki kopyayla doğrulandı.
- [Odin vendor:raylib binding referansı](https://pkg.odin-lang.org/vendor/raylib/)
  Odin'in kendi raylib binding'inin üretilmiş dokümantasyonu — C değil, gerçekte
  çağırdığın imzalar. Şunun için: her raylib çağrısının parametre sırası ve
  tipleri. Anchor biçimi `#DrawRectangle`, `#IsKeyDown` şeklindedir. Kurulu
  derleyicideki karşılığı `$ODIN_ROOT/vendor/raylib/raylib.odin`; bir imza
  tartışmalıysa asıl doğrulama oradan yapılır.
- `string` ile `cstring` ayrımı — kurulu derleyicideki
  `vendor/raylib/raylib.odin` (`DrawText`, `TextFormat` gövdesi) ve
  `core/strings/strings.odin` (`clone_to_cstring`). Şunun için: raylib'e metin
  verirken hangi temsilin beklendiği, `TextFormat`'in sabit buffer davranışı ve
  `fmt.bprintf` üzerinden Odin verb'lerini kullanması. 1.10 bu iki dosyadan
  doğrulandı.
- `vendor:raylib/easings.odin` — kurulu derleyicideki easing procedure'ları.
  Hepsi `proc(t, b, c, d: f32) -> f32` imzasını paylaşır: `t` geçen süre, `b`
  başlangıç değeri, `c` toplam değişim, `d` toplam süre. Şunun için:
  `EaseQuadOut`, `EaseBackOut`, `EaseElasticOut` gibi eğrilerin doğru parametre
  sırası. Dosya raylib'in `easings.h` çevirisidir; kurulu derleyiciyle
  doğrulandı.
- `vendor:raylib` audio modülü — `InitAudioDevice`, `LoadSoundFromWave`,
  `SetSoundPitch`, `PlaySound` ve `Wave` struct'ı (`frameCount`, `sampleRate`,
  `sampleSize`, `channels`, `data`). Şunun için: dosyaya bağlı kalmadan, kendi
  sample buffer'ından ses üretmek. `Wave`'i elle doldurup `LoadSoundFromWave`'e
  vermenin çalıştığı kurulu derleyicide çalıştırılarak doğrulandı.
- [Odin vendor:raylib README — çalışan başlangıç örneği](https://github.com/odin-lang/Odin/blob/master/vendor/raylib/README.md#basic-example)
  Pencere açan en küçük tam program. Şunun için: game loop iskeletinin
  doğrulanması.
- [Odin standart kütüphanesi — core:math/rand](https://pkg.odin-lang.org/core/math/rand/)
  Şunun için: `int_max` gibi rastgele sayı üreten procedure'ların imzaları ve
  aralık davranışı (`0..<n`, `n <= 0` için panic). Snake'te yem yerleştirme bu
  pakete dayanıyor.
- [Odin standart kütüphanesi — core:mem](https://pkg.odin-lang.org/core/mem/)
  Şunun için: `Tracking_Allocator` ve `context.allocator` ile ilgili
  procedure'lar (`tracking_allocator_init`, `tracking_allocator`,
  `tracking_allocator_destroy`). Snake'te oynanış sırasındaki allocation'ları
  ölçmek bu pakete dayanıyor; ölçümün yalnızca `context.allocator`'dan geçen
  istekleri kapsadığını unutma — raylib'in kendi C allocator'ı bunun dışında
  kalır.

### raylib

- [raylib cheatsheet (v6.0)](https://www.raylib.com/cheatsheet/cheatsheet.html)
  C tarafındaki tüm API'nin modül modül listesi. Şunun için: "böyle bir çağrı
  var mı?" taraması. Kesin imza için Odin binding referansına bak; isimler
  eşleşir, tipler Odin'de farklıdır.

- [raygui — raysan5'in immediate-mode GUI kütüphanesi](https://github.com/raysan5/raygui)
  Yazarının kendi deposu; kütüphaneyi “a simple and easy-to-use immediate-mode-gui
  library” diye tanımlıyor ve control listesini verir. Şunun için: runtime ayar
  paneli. Odin tarafında ayrı bir paket değil — binding `vendor:raylib` içinde,
  `$ODIN_ROOT/vendor/raylib/raygui.odin` dosyasında ve aynı `package raylib`
  altında; yani `rl.GuiSlider` mevcut `import rl "vendor:raylib"` ile çağrılır,
  ek kurulum yok. Kurulu derleyiciyle derlenip link edildiği doğrulandı.

### Oyun sistemleri

- [Game Programming Patterns — Robert Nystrom](https://gameprogrammingpatterns.com/)
  Ücretsiz, tam metin okunabilen kitap. Şunun için:
  [Game Loop](https://gameprogrammingpatterns.com/game-loop.html) (update/render
  ayrımı), [State](https://gameprogrammingpatterns.com/state.html) (match state,
  FSM), [Update Method](https://gameprogrammingpatterns.com/update-method.html)
  (entity başına davranış) ve
  [Object Pool](https://gameprogrammingpatterns.com/object-pool.html) (sabit
  kapasiteli havuz, boş slot arama ve slot yeniden kullanımının getirdiği
  tehlikeler).
- [Gaffer On Games — Glenn Fiedler](https://gafferongames.com/)
  Şunun için:
  [Integration Basics](https://gafferongames.com/post/integration_basics/)
  (position/velocity entegrasyonu, semi-implicit Euler) ve
  [Fix Your Timestep!](https://gafferongames.com/post/fix_your_timestep/)
  (delta time, sabit timestep, accumulator). İkincisi Pong'un ihtiyacından
  derindir; delta time sorusu büyüdüğünde dönülecek kaynak.
- [Squirrel Eiserloh — Math for Game Programmers: Juicing Your Cameras With Math (GDC 2016)](https://archive.org/details/GDC2016Eiserloh)
  Konuşmanın serbest erişilebilir arşivi. Şunun için: kamera sarsıntısını ayrı
  ayrı efektler yerine `trauma` adlı tek bir değerden türetmek, trauma'nın zamanla
  sönmesi ve sarsıntı büyüklüğünün trauma'nın karesi/küpü olarak alınması.
- [Jan Willem Nijman (Vlambeer) — The Art of Screenshake](https://archive.org/details/the-art-of-screenshake)
  INDIGO Classes 2013 konuşmasının serbest arşivi. Şunun için: aynı oyuna tek tek
  eklenen küçük geri bildirim katmanlarının (vuruşta duraklama, sarsıntı, parçacık,
  ses) hissi nasıl değiştirdiği; efektleri ayrı ayrı açıp kapatarak karşılaştırma
  fikri buradan geliyor.
- [MDN — 2D collision detection](https://developer.mozilla.org/en-US/docs/Games/Techniques/2D_collision_detection)
  AABB ve circle-circle testleri, broad/narrow phase ayrımı. Şunun için:
  collision mantığının JavaScript arka planından okunması. Circle-rectangle
  durumunu kapsamaz; onu raylib `CheckCollisionCircleRec` üstlenir.

### Aseprite ve pixel art

- [Aseprite — New Sprite](https://www.aseprite.org/docs/new-sprite/)
  Şunun için: yeni canvas'ın ölçüsü, color mode ve transparent başlangıç seçimi.
- [Aseprite — Drawing ve araçlar](https://www.aseprite.org/docs/drawing/)
  Şunun için: Pencil, Rectangle, Eraser ve Zoom ile ilk çizimi yapmak;
  [araç varyantları](https://www.aseprite.org/docs/keyboard-shortcuts/) Filled Rectangle'ı da listeler.
- [Aseprite — Workflow](https://www.aseprite.org/docs/workflow/)
  Şunun için: çizim, zoom ve `.aseprite` kaynak dosyasını kaydetme akışı.
- [Aseprite — Zoom](https://www.aseprite.org/docs/zoom/)
  Şunun için: küçük canvas üzerinde görünümü büyütmek; zoom tool, status bar slider ve mouse wheel seçenekleri.
- [Aseprite — Brushes](https://www.aseprite.org/docs/brushes/)
  Şunun için: painting tool'un context bar'ındaki brush type seçimi; ilk 8×8 çizimde Pencil'in tek-pixel yaklaşımına dönmek.
- [Aseprite — Layers](https://www.aseprite.org/docs/layers/)
  Şunun için: nesneyi deneme zemininden ayrı tutmak ve layer görünürlüğünü değiştirmek.
- [Aseprite — Color Bar](https://www.aseprite.org/docs/color-bar/)
  Şunun için: foreground color seçimi ve RGB modunda palette ile çizim arasındaki ilişki;
  [Color Bar tutorial](https://www.aseprite.org/docs/tutorial/color-bar-tutorial/) görsel kullanım rehberidir.
- [Aseprite — Exporting](https://www.aseprite.org/docs/exporting/)
  Şunun için: düzenlenebilir kaynaktan PNG çıkarma ve export ölçeğini seçme.
- [Aseprite — Animation](https://www.aseprite.org/docs/animation/)
  Şunun için: frame sırası ve playback; [Timeline](https://www.aseprite.org/docs/timeline/) layer/frame görünümünü açıklar.
- [Aseprite — New Frame](https://www.aseprite.org/docs/new-frame/)
  Şunun için: yeni, boş veya kopyalanmış frame oluşturmak; [Linked Cels](https://www.aseprite.org/docs/linked-cels/) aynı görüntüyü paylaşan kopyaların davranışını açıklar.
- [Aseprite — FX](https://www.aseprite.org/docs/fx/)
  Şunun için: `Edit > FX > Outline` ile dış kenarlık eklemek, kenarlık rengi ve Inside/Outside seçeneği.
- [Aseprite — Replace Color](https://www.aseprite.org/docs/replace-color/)
  Şunun için: From/To alanlarıyla bir rengi seçili alanda veya bütün frame'lerde değiştirmek; Tolerance yakın tonları kapsar.
- [Aseprite — Slices](https://www.aseprite.org/docs/slices/)
  Şunun için: Slice aracıyla bölge işaretlemek ve Slice Properties içindeki 9-slices alanını kullanmak.
- [Aseprite — Tiled Mode](https://www.aseprite.org/docs/tiled-mode/)
  Şunun için: `View > Tiled Mode` ile deseni tekrarlayarak çizmek ve ek yerini kontrol etmek.
- [Aseprite — Flip](https://www.aseprite.org/docs/flip/)
  Şunun için: `Edit > Flip Horizontal` (`Shift+H`) ve `Flip Vertical` (`Shift+V`) ile sprite'ı veya seçimi çevirmek; [Transformations](https://www.aseprite.org/docs/transformations/) Edit menüsündeki dönüşümleri listeler.
- [Aseprite — Sprite Sheets](https://www.aseprite.org/docs/sprite-sheet/)
  Şunun için: `File > Export Sprite Sheet` ile tek görüntüye aktarma, sheet düzenleri ve frame'lerin tag'e göre seçilmesi; [Tags](https://www.aseprite.org/docs/tags/) tag oluşturmayı ve yön seçeneklerini açıklar.
- [Aseprite — Frame Duration](https://www.aseprite.org/docs/frame-duration/)
  Şunun için: Frame Properties ile her pozun ekranda kalma süresini ayarlamak.
- [Aseprite — Onion Skinning](https://www.aseprite.org/docs/onion-skinning/)
  Şunun için: komşu frame'leri yalnız çizim referansı olarak görmek.
- [Aseprite — Keyboard Shortcuts](https://www.aseprite.org/docs/keyboard-shortcuts/)
  Şunun için: native komutlara tuş atamak ve mevcut tool atamalarını kontrol etmek.
- [Aseprite — Shading ink](https://www.aseprite.org/docs/shading/)
  Şunun için: seçili renk sırası üzerinde mevcut pixel renklerini sol/sağ tıkla değiştirmek.
- [Aseprite — Plugin API](https://www.aseprite.org/api/plugin)
  Şunun için: Lua komutlarını menüye kaydetmek, tuş atanabilir hale getirmek ve extension paketlemek.
- [Aseprite — Color API](https://www.aseprite.org/api/color)
  Şunun için: HSV bileşenlerini ve alpha'yı koruyan foreground renk dönüşümleri.
- [Aseprite — app API](https://www.aseprite.org/api/app)
  Şunun için: aktif sprite, foreground color ve batch/UI ayrımını doğrulamak.
- [CarbsCode — Quick Color Hotkeys](https://carbscode.itch.io/quick-color-hotkeys)
  Şunun için: kullanıcının istediği klavyeyle HSV değiştirme akışının yaratıcıya ait demosu; Academy aracı özgün kodla uygulanır.
- [Pedro Medeiros — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/)
  Şunun için: küçük canvas, az renk ve okunabilir bir ilk sprite; sanatçının kendi başlangıç dersi.
- [Pedro Medeiros — Cluster Sketching and Painting](https://saint11.art/pixel_art_articles/article2/)
  Şunun için: ayrıntıdan önce büyük renk alanlarıyla şekil ve sahne kurmak.
- [Pedro Medeiros — A Basic Aseprite Animation](https://saint11.art/pixel_art_articles/article3/)
  Şunun için: az ayrıntılı pozları sıraya koymak, timing ve basit hareket; yazının 32×32 top örneği yerine derslerde özgün 8×8 karakterler kullanılır.
- [Jason Lee — Slash Shape Fundamentals](https://jasontomlee.itch.io/slashfx/devlog/629732/tutorial-2-slash-shape-fundamentals)
  Şunun için: kılıcın hareketini izleyen yay, ince kuyruk ve kısa süre görünen ana vuruş şekli; örnek asset'ler kopyalanmaz.
- [Pedro Medeiros — Basic Shading](https://saint11.art/pixel_art_articles/article4/)
  Şunun için: tek ışık yönüyle nesnenin kendi gölgesini ve başka yüzeye düşen gölgeyi ayırmak.
- [Pedro Medeiros — Basic Color Theory](https://saint11.art/pixel_art_articles/article6/)
  Şunun için: hue, saturation ve value ile küçük palette renk rampası kurmak; aynı sayısal value'nun her hue'da eşit parlak görünmediğini denemek.
- [Arne Niklas Jansson — PSG Art tutorial](https://androidarts.com/art_tut.htm)
  Şunun için: value ve contrast ile formun okunurluğu; ilgili bölüm okunur, bütün rehber ön koşul değildir.
- [Arne Niklas Jansson — Pixel Art Tutorial WIP](https://www.androidarts.com/pixtut/pixelart.htm)
  Şunun için: sınırlı palette üç value ile okunurluk ve gereksiz gürültüyü azaltma; tamamlanmamış bölümler kural olarak alınmaz.
- [James Gurney — Peak Saturation Value](https://gurneyjourney.blogspot.com/2010/03/peak-saturation-value.html)
  Şunun için: farklı hue'ların en yoğun göründüğü value seviyesinin değiştiğini görmek; sarı ışık ve koyu mavi gölge seçimini mekanik rampaya bağlamamak.
- [Scott Wills — Museum of the Moving Image röportajı](https://scienceandfilm.org/articles/3346/genndy-tartakovskys-primal-art-director-scott-wills)
  Şunun için: Samurai Jack ve Primal'ın art director'ünden stilize renk ve görsel anlatım kararları;
  Samurai Jack'in 60–30–10 formülü kullandığına kanıt olarak kullanılmaz.
- [Reventure — Pixelatto'nun Steam sayfası](https://store.steampowered.com/app/900270/Reventure/)
  Şunun için: Pixelatto'nun geliştirdiği pixel-graphics oyunu, sade oyun nesneleri için görsel referans; 8×8 asset ölçüsü veya üretim kuralı kanıtı değildir.

## Bilgelik (topluluklar)

- [Odin topluluk kanalları](https://odin-lang.org/community/)
  Resmi Discord ve forum burada listelenir. Şunun için: idiomatic Odin
  tartışmaları, compiler davranışı, binding sorunları.
- [raylib GitHub Discussions](https://github.com/raysan5/raylib/discussions)
  Şunun için: raylib API kararları ve platform davranışı; cevabı doğrudan
  kütüphane yazarından gelen sorular.
- [Handmade Network](https://handmade.network/)
  Sıfırdan, düşük seviye yazılım yazan geliştirici topluluğu. Şunun için: engine
  mimarisi, araç geliştirme ve zanaat tarafı — rotanın uzun vadeli hedefiyle
  aynı hizada.

Topluluk kullanımı isteğe bağlıdır. Tercih belirtilirse bu bölüme not düşülür.

## Boşluklar

Aşağıdaki konularda henüz doğrulanmış birincil kaynak seçilmedi; ilgili ders
yazılmadan önce araştırılacak.

- **Collision response** (penetrasyon çözme, sekme açısı): Pong seviyesinde
  güvenilir tek bir kaynak yok. 1.8 şimdilik raylib referansı ve MDN'in
  narrow-phase bölümüne dayanıyor.
- **Dead zone / hysteresis** (sabit adımlı controller'ın hedef etrafında
  titremesi ve eşikle bastırılması): 1.9 bunu dersin kendi aritmetiğinden
  türetiyor — `speed * dt` adımı hedefe kalan mesafeden büyükse salınım
  kaçınılmazdır — ama control theory tarafında doğrulanmış bir birincil kaynak
  henüz seçilmedi.
- **Dear ImGui Odin binding'i**: çözüldü, boşluk değil. Kurulu derleyicinin
  `vendor/` koleksiyonunda Dear ImGui yok; `microui` ve `raylib/raygui.odin` var.
  Dünya 3'ün ayar paneli raygui ile yazılıyor: oyun zaten raylib'e bağlı, binding
  aynı paketin içinde ve ek kurulum gerektirmiyor. Dear ImGui'ye dönme kararı,
  raygui'nin yetmediği somut bir araç ihtiyacı çıkarsa verilir.
- **macOS grafik API'si / kendi renderer'ın**: Dünya 1-2 kapsamı dışında.
- **Cache locality ve AoS/SoA ölçümü**: Snake'te (Dünya 2) gerekecek; ölçüm
  yöntemi için kaynak henüz seçilmedi.
- **Samurai Jack ve 60–30–10**: Ekibin bu oranı bir üretim kuralı olarak
  kullandığı doğrulanmadı. Pixel Art dersindeki oran, yaklaşık renk alanlarını
  denemek için seçilmiş esnek bir çalışma kılavuzudur; evrensel bir sanat kuralı değildir.
- **Oyun asset entegrasyonu**: Sprite sheet ve Odin texture yükleme,
  ilgili oyunda ihtiyaç çıktığında kurulu araç sürümüyle doğrulanacak.
  İlk 8×8 frame ve timing çalışmaları için kaynaklar yukarıda mevcut;
  skill örnekleri bu aşamada yalnız görsel asset üretir.
