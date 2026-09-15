---
title: "2.2 — Yılanın gövdesi bir array"
description: "Yılanın gövdesini sabit kapasiteli bir array ve canlı uzunlukla tut."
section: Grid ve hareket
---

# 2.2 — Yılanın gövdesi bir array

**Hedef:** Yılanın gövdesini sabit kapasiteli bir array'de tut; kapasite ile
o anki uzunluğu ayrı iki şey olarak düşün.

## Görev

`Cell :: struct { col, row: i32 }` tanımla. `MAX_BODY :: GRID_COLS * GRID_ROWS`
sabitini ekle. Yılanın gövdesini tutacak bir `Game` (veya benzeri) struct'a
`body: [MAX_BODY]Cell` ve `length: int` field'larını koy. Başlangıçta 3
hücrelik bir yılanı grid'in ortasına yerleştir, `body`'nin yalnız `length`
kadarlık kısmını 2.1'deki `cell_rect` ile çiz.

## Ne zaman bitti?

- Ekranda 3 hücrelik bir yılan görünüyor, grid'in ortasında duruyor.
- `body` array'inin kapasitesi `MAX_BODY`, ama çizim yalnızca `length` kadar
  hücreye bakıyor — beş hücrelik bir deney yapmak istersen önce `body`'nin ilk
  beş elemanının hepsine geçerli birer hücre yazıp `length`'i 5 yapman gerekir;
  yalnızca `length`'i değiştirmek yetmez, çünkü 4. ve 5. eleman henüz hiç
  atanmadı.
- `odin check games/snake` geçiyor.

## Bilmen gereken küçük parça

Odin'de `[N]T` bir array'dir; `N` compile-time'da bilinen sabit bir sayı, ve
array struct'ın içinde yaşar — ayrı bir allocation değil. `[dynamic]Cell`
yazsaydın bu heap'e giden, `append` ile kapasitesi dolduğunda yeniden allocate
eden başka bir tiptir; bu ders ona hiç dokunmuyor.

Odin bir array'i tanımlandığı anda zero-initialize eder — `body`'nin henüz
atamadığın elemanları çöp değer taşımaz, hepsi `Cell{col: 0, row: 0}`'dır. Bu
iyi haber gibi görünse de kapasite ile canlı veri ayrımını değiştirmez: sıfır
değeri de grid üzerinde geçerli bir hücre, yani `length`'in ötesine bakan bir
çizim döngüsü çökmez, ama sol üst köşede olmayan hücreleri var gibi çizer.
“Çöp” değil, “henüz senin doldurmadığın, ama geçerli görünen” veri — asıl
tehlike de bu.

`MAX_BODY`'nin `GRID_COLS * GRID_ROWS` olması rastgele değil: yılan en fazla
grid'in tüm hücrelerini kaplayacak kadar büyüyebilir, yani en kötü durum zaten
biliniyor. Bilinen en kötü duruma göre kapasite ayırmak, oynanış sırasında hiç
allocation yapmamanın en ucuz yolu — `length` küçükken bile `body` her zaman
`MAX_BODY` kadar yer kaplar, ama bu yer stack'te veya struct'ın içinde, tek
seferde ayrılmış durumda.

```odin
Cell :: struct { col, row: i32 }
MAX_BODY :: GRID_COLS * GRID_ROWS
```

## Sınırlar

- `[dynamic]Cell`, `append`, `make` veya herhangi bir slice allocation'ı kurma;
  gövde tamamen sabit boyutlu bir array.
- Hareket yok — yılan bu derste hâlâ duruyor, yalnızca doğru şekilde görünüyor.

::: details İpucu 1 — Ortayı hesapla
Grid'in ortası `GRID_COLS / 2`, `GRID_ROWS / 2` civarında bir `col`/`row`
çifti. 3 hücreyi yan yana, aynı `row`'da, ardışık `col` değerleriyle yerleştir.
:::

::: details İpucu 2 — Çizim `length`'e bağlı kalsın
Çizim döngüsü `for i in 0..<length` biçiminde olmalı, `for i in 0..<MAX_BODY`
değil — aksi halde array'in henüz atanmamış kısmındaki zero value `Cell{0, 0}`
hücreleri de, sanki gövdenin parçasıymış gibi, sol üst köşede çizilir.
:::

::: details İpucu 3 — Başlangıç ataması
```odin
game.body[0] = Cell{GRID_COLS / 2, GRID_ROWS / 2}
game.body[1] = Cell{GRID_COLS / 2 - 1, GRID_ROWS / 2}
game.body[2] = Cell{GRID_COLS / 2 - 2, GRID_ROWS / 2}
game.length = 3
```
Çizerken her `body[i]`'yi (`i < length`) `cell_rect(body[i].col, body[i].row)`
ile geçir.
:::

## Birincil kaynak

[Odin dil turu — Arrays](https://odin-lang.org/docs/overview/#arrays). `[N]T`
sabit boyutlu array'in `[dynamic]T` ile farkı ve array'in değer semantiği bu
sayfada anlatılıyor; bu derste `body`'nin neden struct'ın içinde yaşadığının
kaynağı burası.

**Kazanım:** Yılanın gövdesi artık sabit kapasiteli bir array ve canlı bir
uzunlukla temsil ediliyor; bu ayrım sonraki her ders için taban.

**“Snake 2.2 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu duran yılanı zamana bağlamak: [2.3 — Tick'li zaman](/worlds/02-snake/03-tick-timer).
