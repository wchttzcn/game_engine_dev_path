---
title: "3.4 — Tuğla duvarını kur"
description: "Sabit kapasiteli bir tuğla array'i kur, her tuğlanın konumunu index'inden türet ve duvarı ekranın üstüne çiz."
section: Tuğla duvarı
---

# 3.4 — Tuğla duvarını kur

**Hedef:** Ekranın üstüne sabit kapasiteli bir tuğla array'i yerleştir ve her
tuğlanın konumunu index'inden türet.

## Görev

`Game`'e sabit boyutlu bir tuğla array'i ekle. Her tuğla bir dikdörtgen ve
ayakta olup olmadığını söyleyen bir bayrak tutsun. Duvarı `game_reset` içinde
tek bir döngüde kur, her tuğlanın konumunu index'inden hesapla ve ayakta
olanları çiz.

## Ne zaman bitti?

- Ekranın üstünde satır ve sütun düzeninde bir tuğla duvarı görünüyor.
- Tuğlalar tek tek seçilebiliyor; duvar tek bir blok gibi görünmüyor.
- Tuğla sayısı satır ve sütun sabitlerinden türüyor; adet elle sayılmıyor.
- Her tuğlanın konumu tek bir formülden geliyor; koordinatlar tek tek
  yazılmıyor.
- Duvar `game_reset` içinde kuruluyor, `R` duvarı yeniden diziyor.
- `odin check games/breakout` geçiyor.

## Elindekiler

`Game`'e eklenecek alan: `bricks: [BRICK_ROWS * BRICK_COLS]Brick`.

```odin
BRICK_COLS   :: 10
BRICK_ROWS   :: 5
BRICK_WIDTH  :: SCREEN_WIDTH / BRICK_COLS
BRICK_HEIGHT :: 20
BRICK_TOP    :: 70
BRICK_PAD    :: 4

Brick :: struct {
	rect:  rl.Rectangle,
	alive: bool,
}
```

`BRICK_WIDTH`/`BRICK_HEIGHT` bir **hücrenin** boyutu; tuğla `BRICK_PAD` kadar
daralarak o hücrenin içine oturur. Sabit boyutlu array'de `len(game.bricks)`
derleme zamanı sabiti — ayrı bir sayaç tutmana gerek yok.

## Sınırlar

- Çarpışma yok. Top bu derste tuğlaların içinden geçiyor.
- Skor, seviye, farklı tuğla türü yok. Tek renk yeterli.
- Duvarın ekranı tam doldurması şart değil; kenarlarda boşluk kalabilir.

::: details İpucu 1 — Index'ten satır ve sütuna
Tek boyutlu array'i satır/sütun olarak okumak `/` ve `%` ile olur — Snake'te
wrap için kullandığın `%` burada sütunu verir: `row := i / BRICK_COLS`,
`col := i % BRICK_COLS`. Konumu bu ikisinden hesapla: `x` sütuna, `y` satıra
ve `BRICK_TOP` offsetine bağlı. Payı `rect`'in kendisine yaz.
:::

::: details İpucu 2 — Payı nereye yazdığın önemli
Tuğlayı tam hücre boyutunda çizip yalnız çizim sırasında küçültmek cazip ama
hatalı: 3.5'te çarpışma testi `rect`'in kendisini kullanacak, çizilen ile
çarpışan dikdörtgen ayrışırsa top görünmeyen bir kenara çarpar. Payı
`rect.width`/`rect.height`'in kendisinden düş, çizerken daraltma.
:::

::: details İpucu 3 — Tam çözüm
```odin
for i in 0 ..< len(game.bricks) {
	row := i / BRICK_COLS
	col := i % BRICK_COLS
	game.bricks[i] = Brick {
		alive = true,
		rect = {
			x      = f32(col) * BRICK_WIDTH + BRICK_PAD,
			y      = BRICK_TOP + f32(row) * BRICK_HEIGHT + BRICK_PAD,
			width  = BRICK_WIDTH - BRICK_PAD * 2,
			height = BRICK_HEIGHT - BRICK_PAD * 2,
		},
	}
}
```
Bu döngü `game_reset`'in içine, top ve raket kurulumundan sonra giriyor.
Çizim tarafında aynı array'i dolaşıp yalnız `alive` olanları
`rl.DrawRectangleRec` ile çiz; bu döngü çizim bölümünde topun ve raketin
çiziminden önce yer alıyor.
:::

## Kaynak

[Odin Overview — resmi dil rehberi](https://odin-lang.org/docs/overview/#fixed-arrays).
Sabit boyutlu array'in boyutunun tipin parçası olduğu ve `len`'in orada
derleme zamanı sabiti olduğu burada yazıyor; Snake'te kapasiteyi bu yüzden
sabitten türetmiştin.

## Daha derine

Kırılan tuğlayı array'den çıkarmanın iki yolu var: kalanları kaydırmak ya da
son elemanı boşalan yere taşımak. İkisi de elemanların index'ini değiştirir.
Bayrak yaklaşımında index ömür boyu sabit kalıyor — 3.5'te top bir tuğlaya
çarptığında elindeki tek şey o tuğlanın index'i olacak, ve bu index'in bir
sonraki frame'de başka bir tuğlayı göstermemesi işi kolaylaştırır. Bedeli:
ölü tuğlalar bellekte kalmaya ve her taramada atlanmaya devam ediyor; 50
elemanda bu bedel yok denecek kadar az.
[Game Programming Patterns — Object Pool](https://gameprogrammingpatterns.com/object-pool.html)
bu ödünleşimi genel olarak anlatıyor.

## Kazanım

Sahnede ilk kez tek tek elle yerleştirilmemiş, bir formülden doğan nesneler
var. Duvarın şeklini değiştirmek artık iki sabiti değiştirmek demek.
Sıradaki ders bu duvarı topla buluşturuyor.

**“Breakout 3.4 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım duvarı kırılabilir yapmak: [3.5 — Tuğlayı kır](/worlds/03-breakout/05-brick-collision).
