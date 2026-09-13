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
  tipleri. Anchor biçimi `#DrawRectangle`, `#IsKeyDown` şeklindedir.
- [Odin vendor:raylib README — çalışan başlangıç örneği](https://github.com/odin-lang/Odin/blob/master/vendor/raylib/README.md#basic-example)
  Pencere açan en küçük tam program. Şunun için: game loop iskeletinin
  doğrulanması.

### raylib

- [raylib cheatsheet (v6.0)](https://www.raylib.com/cheatsheet/cheatsheet.html)
  C tarafındaki tüm API'nin modül modül listesi. Şunun için: "böyle bir çağrı
  var mı?" taraması. Kesin imza için Odin binding referansına bak; isimler
  eşleşir, tipler Odin'de farklıdır.

### Oyun sistemleri

- [Game Programming Patterns — Robert Nystrom](https://gameprogrammingpatterns.com/)
  Ücretsiz, tam metin okunabilen kitap. Şunun için:
  [Game Loop](https://gameprogrammingpatterns.com/game-loop.html) (update/render
  ayrımı), [State](https://gameprogrammingpatterns.com/state.html) (match state,
  FSM), [Update Method](https://gameprogrammingpatterns.com/update-method.html)
  (entity başına davranış).
- [Gaffer On Games — Glenn Fiedler](https://gafferongames.com/)
  Şunun için:
  [Integration Basics](https://gafferongames.com/post/integration_basics/)
  (position/velocity entegrasyonu, semi-implicit Euler) ve
  [Fix Your Timestep!](https://gafferongames.com/post/fix_your_timestep/)
  (delta time, sabit timestep, accumulator). İkincisi Pong'un ihtiyacından
  derindir; delta time sorusu büyüdüğünde dönülecek kaynak.
- [MDN — 2D collision detection](https://developer.mozilla.org/en-US/docs/Games/Techniques/2D_collision_detection)
  AABB ve circle-circle testleri, broad/narrow phase ayrımı. Şunun için:
  collision mantığının JavaScript arka planından okunması. Circle-rectangle
  durumunu kapsamaz; onu raylib `CheckCollisionCircleRec` üstlenir.

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
- **Dear ImGui Odin binding'i**: Breakout'ta (Dünya 3) gerekecek; kurulum ve
  binding seçimi o ders yazılırken güncel kaynaklarla doğrulanacak.
- **macOS grafik API'si / kendi renderer'ın**: Dünya 1-2 kapsamı dışında.
- **Cache locality ve AoS/SoA ölçümü**: Snake'te (Dünya 2) gerekecek; ölçüm
  yöntemi için kaynak henüz seçilmedi.
