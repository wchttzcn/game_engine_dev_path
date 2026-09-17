---
title: "3.4 — Tuğla duvarını kur"
description: "Sabit kapasiteli bir tuğla array'i kur, her tuğlanın konumunu index'inden türet ve duvarı ekranın üstüne çiz."
section: Tuğla duvarı
---

# 3.4 — Tuğla duvarını kur

**Hedef:** Ekranın üstüne sabit kapasiteli bir tuğla array'i yerleştir ve her
tuğlanın konumunu index'inden türet.

## Görev

`Game` içine sabit boyutlu bir tuğla array'i ekle. Her tuğla bir dikdörtgen ve
hâlâ ayakta olup olmadığını söyleyen bir bayrak tutsun. Duvarı `game_reset`
içinde tek bir döngüde kur, her tuğlanın konumunu index'inden hesapla ve ayakta
olanları çiz.

## Ne zaman bitti?

- Ekranın üstünde satır ve sütun düzeninde bir tuğla duvarı görünüyor.
- Tuğla sayısı satır ve sütun sabitlerinden türüyor; adet elle sayılmıyor.
- Her tuğlanın konumu tek bir formülden geliyor; koordinatlar tek tek yazılmıyor.
- Duvar `game_reset` içinde kuruluyor, `R` duvarı yeniden diziyor.
- `odin check games/breakout` geçiyor.

## Bilmen gereken küçük parça

Snake'in gövdesi `[MAX_BODY]Cell` artı bir `length` idi: kapasite sabit, canlı
uzunluk değişken. Duvar ikinci kalıp — kapasite sabit, uzunluk **hiç
değişmiyor**. Bir tuğla kırıldığında array'den çıkmıyor, yalnız bayrağı düşüyor:

```odin
Brick :: struct {
	rect:  rl.Rectangle,
	alive: bool,
}
```

Duvarın büyüklüğü iki sabitten türer, array de o iki sabitten:

```odin
BRICK_COLS :: 10
BRICK_ROWS :: 5

Game :: struct {
	// ...
	bricks: [BRICK_ROWS * BRICK_COLS]Brick,
}
```

Tek boyutlu array'i satır/sütun olarak okumak `/` ve `%` ile oluyor — 2.4'te
wrap için kullandığın `%` burada sütunu veriyor:

```odin
for i in 0 ..< len(game.bricks) {
	row := i / BRICK_COLS
	col := i % BRICK_COLS
	// ...
}
```

`len` sabit boyutlu array'de derleme zamanı bir sabit; ayrı bir sayaç tutmana
gerek yok.

Bir ayrıntı: `i`, `row` ve `col` birer `int`, `rl.Rectangle`'ın alanları ise
`f32`. Dönüşümü çarpımdan **önce** yaz — `f32(col) * BRICK_WIDTH`, `f32(col *
BRICK_WIDTH)` değil. Bu duvarda ikisi de aynı sayıyı verir, ama cast'i sınırın
neresine koyduğun büyüyen sayılarda sonucu değiştirir.

## Sınırlar

- Çarpışma yok. Top bu derste tuğlaların içinden geçiyor.
- Skor, seviye, farklı tuğla türü yok. Tek renk yeterli.
- Duvarın ekranı tam doldurması şart değil; kenarlarda boşluk kalabilir.

::: details İpucu 1 — Ne tutman gerekiyor
Bir tuğlanın çizilmesi ve ileride kırılması için gereken en küçük veri: nerede
olduğu ve ayakta olup olmadığı. Konum zaten bir `rl.Rectangle`; 3.1'de raket
için de böyle yapmıştın.
:::

::: details İpucu 2 — Duvarı ekrana sığdırmak
Tuğla genişliğini elle seçmek yerine ekran genişliğinden türetebilirsin:
`BRICK_WIDTH :: SCREEN_WIDTH / BRICK_COLS`. O zaman sütun sayısını değiştirdiğinde
duvar kendiliğinden yeniden sığar. Üstte biraz boşluk bırakmak için satır
hesabına sabit bir offset ekle.
:::

::: details İpucu 3 — Kurulum döngüsü
```odin
for i in 0 ..< len(game.bricks) {
	row := i / BRICK_COLS
	col := i % BRICK_COLS
	game.bricks[i] = Brick {
		alive = true,
		rect = {
			x = f32(col) * BRICK_WIDTH,
			y = BRICK_TOP + f32(row) * BRICK_HEIGHT,
			width = BRICK_WIDTH,
			height = BRICK_HEIGHT,
		},
	}
}
```
Çizim tarafında aynı array'i dolaşıp `alive` olanları çiz.
:::

::: details Deep Dive — Neden bayrak, neden array'den silmek değil?
Kırılan tuğlayı array'den çıkarmanın iki yolu var: kalanları kaydırmak, ya da
son elemanı boşalan yere taşımak. İkisi de elemanların index'ini değiştirir.
Bayrak yaklaşımında index ömür boyu sabit kalıyor — 3.5'te top bir tuğlaya
çarptığında elindeki tek şey o tuğlanın index'i olacak, ve o index'in bir sonraki
frame'de başka bir tuğlayı göstermemesi işini kolaylaştırıyor.

Bedeli: ölü tuğlalar bellekte kalmaya ve her taramada atlanmaya devam ediyor. 50
elemanda bu bedel yok denecek kadar az. 50.000 mermi olsaydı soru tersine
dönerdi; o zaman ölüleri sona toplamak taramayı canlı olanlarla sınırlar.
:::

## Birincil kaynak

[Odin Overview — resmi dil rehberi](https://odin-lang.org/docs/overview/#fixed-arrays).
Sabit boyutlu array'in boyutunun tipin parçası olduğu ve `len`'in orada derleme
zamanı sabiti olduğu burada yazıyor; Snake'te kapasiteyi bu yüzden sabitten
türetmiştin.

**Kazanım:** Sahnede ilk kez tek tek elle yerleştirilmemiş, bir formülden doğan
nesneler var. Duvarın şeklini değiştirmek artık iki sabiti değiştirmek demek.
Sıradaki ders bu duvarı topla buluşturuyor.

**“Breakout 3.4 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım duvarı kırılabilir yapmak: [3.5 — Tuğlayı kır](/worlds/03-breakout/05-brick-collision).
