---
title: "2.1 — Grid'i çiz"
description: "Grid coordinate'ten pixel coordinate'e giden tek bir dönüşüm yaz ve grid'i çiz."
section: Grid ve hareket
---

# 2.1 — Grid'i çiz

**Hedef:** Grid coordinate ile pixel coordinate'i birbirinden ayır; aralarındaki
dönüşümü tek bir yerde topla.

## Görev

`col, row: i32` alıp o hücrenin ekran üzerindeki `rl.Rectangle`'ını döndüren bir
`cell_rect :: proc(col, row: i32) -> rl.Rectangle` procedure'ı yaz. Ardından
`main` içindeki `// TODO: 2.1` yorumunun yerine, `GRID_COLS` x `GRID_ROWS`
hücrenin tamamını `cell_rect` üzerinden `rl.DrawRectangleLinesEx` ile outline
olarak çiz.

## Ne zaman bitti?

- Pencerede 20x20 hücrelik bir grid görünüyor, kenarları pencereye tam oturuyor.
- `CELL_SIZE` sabitine dokunan tek yer `cell_rect`'in içi; başka hiçbir satırda
  `col` veya `row` doğrudan `CELL_SIZE` ile çarpılmıyor.
- `odin check games/snake` geçiyor.

## Bilmen gereken küçük parça

Snake'in bütün mantığı `col`/`row` gibi grid coordinate'leri üzerinde çalışacak
— bunlar `i32`, yani tam sayı hücre index'leri. Pixel coordinate ise yalnızca
çizim anında, `cell_rect` çağrıldığında doğar. Bu ayrım Pong 1.16'daki
tek-kaynak fikrinin aynısı: dönüşüm ikinci bir yere kopyalanırsa, birileri
`CELL_SIZE`'ı değiştirdiğinde oyun mantığı ile çizim ayrışır.

`for col in 0..<GRID_COLS` yazdığında döngü değişkeni `col`'ün tipi `int`'tir —
`cell_rect`'in parametreleri ise `i32`. Odin bu ikisi arasında örtük dönüşüm
yapmaz; `cell_rect(col, row)` yazarsan `Cannot assign value 'col' of type
'int' to 'i32' in a procedure argument` hatasıyla derleme durur. Dönüşümü
açıkça yaz: `cell_rect(i32(col), i32(row))`.

`cell_rect` zaten bir `rl.Rectangle` döndürüyor; Pong 1.16'da kullandığın
`rl.DrawRectangleLinesEx(rec: rl.Rectangle, lineThick: f32, color: rl.Color)`
tam olarak bunu bekliyor, yani döndürdüğü rectangle'ı doğrudan geçebilirsin —
`x`, `y`, `width`, `height` field'larını tek tek `i32()` ile çevirmene gerek
yok:

```odin
rl.DrawRectangleLinesEx(cell_rect(i32(col), i32(row)), 1, rl.WHITE)
```

## Sınırlar

- Yılan, yem veya hareket yok — bu ders yalnızca grid'i çizer.
- Grid çizgisi için ayrı bir “grid renderer” struct'ı veya abstraction kurma;
  bir `for` döngüsü içinde `cell_rect` çağırmak yeterli.

::: details İpucu 1 — İki döngü
İki iç içe `for` ile `row` 0..<GRID_ROWS ve `col` 0..<GRID_COLS üzerinde gez;
her ikilide `cell_rect`'i çağırırken `col` ve `row`'u `i32()` ile çevir.
:::

::: details İpucu 2 — Tek çarpım noktası
`cell_rect`'in gövdesinde `x = f32(col) * CELL_SIZE`, `y = f32(row) * CELL_SIZE`
olacak. Bu iki satır dışında dosyanın hiçbir yerinde `CELL_SIZE` ile bir
coordinate çarpılmamalı.
:::

::: details İpucu 3 — Tam döngü
```odin
cell_rect :: proc(col, row: i32) -> rl.Rectangle {
	return rl.Rectangle{f32(col) * CELL_SIZE, f32(row) * CELL_SIZE, CELL_SIZE, CELL_SIZE}
}

for row in 0..<GRID_ROWS {
	for col in 0..<GRID_COLS {
		rl.DrawRectangleLinesEx(cell_rect(i32(col), i32(row)), 1, rl.WHITE)
	}
}
```
:::

## Birincil kaynak

[Odin vendor:raylib — `DrawRectangleLinesEx`](https://pkg.odin-lang.org/vendor/raylib/#DrawRectangleLinesEx).
Bu derste çizim için kullandığın imza tam olarak burada, parametre tipleriyle
birlikte tanımlı.

**Kazanım:** Grid coordinate ile pixel coordinate arasındaki dönüşüm artık tek
bir procedure'da yaşıyor; oynanış kodun hiç pixel görmeyecek.

**“Snake 2.1 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu grid üzerinde bir şey tutmak: [2.2 — Yılanın gövdesi bir array](/worlds/02-snake/02-snake-body).
