---
title: "2.7 — Occupancy grid"
description: "Gövdeden türeyen bir occupied grid kur, her tick'te tutarlı tut ve tutarlılığı ekranda görünür kıl."
section: Veri temsili
---

# 2.7 — Occupancy grid

**Hedef:** “Bu hücre dolu mu?” sorusunu gövdeyi taramadan tek dizi okumasıyla
cevaplayacak ikinci bir temsil kur, tutarlılığını ekranda görünür kıl.

## Görev

Bu ders bir refactor; oynanış değişmez, yalnız aynı sorunun içeriden cevabı
değişir. Çarpışma tespitine dokunma; 2.6'daki tarama döngüsü yerinde kalsın. `Game`'e
`occupied` ekle; `game_reset`'te gövdenin ilk `length` hücresinden türet. Her
tick'te iki hücre güncelle: kuyruktan çıkan `false`, yeni head `true`. Dolu
hücreleri gövdeden farklı renkte outline çiz.

## Ne zaman bitti?

- Program açılır açılmaz, ilk tick gelmeden, `occupied` başlangıç gövdesiyle
  uyumlu — boş bir grid değil.
- Her gövde karesinin üstünde farklı renkte bir outline var; boş hücrede
  outline yok.
- Kendine çarpma hâlâ 2.6'daki taramayla çalışıyor; aynı dönüşler, aynı ölüm.
- Tick başında yalnız iki hücre değişiyor: kuyruğun eski hücresi `false`, yeni
  head hücresi `true`.
- `R` sonrası `occupied` yeniden başlangıç gövdesiyle uyumlu; önceki oyundan
  kalan dolu hücre yok.
- `odin check games/snake` geçiyor.

## Elindekiler

`body` sıra bilgisini taşır: kim baş, kim kuyruk. “Bu hücre dolu mu?” farklı
bir soru; `occupied` bu soruyu hazır tutar — hücrenin kendi indexi, cevabın
adresi.

```odin
// Game'e eklenecek alan:
//   occupied: [GRID_ROWS][GRID_COLS]bool,
```

Bir array'i zero value'suna döndürmenin sözdizimi:

```odin
game.occupied = {}
```

Dolu hücreleri çizerken `cell_rect` ve `rl.DrawRectangleLinesEx` zaten
tanıdık — 2.1'den beri kullandığın çizim çağrısı, burada yeni bir renkle.

## Sınırlar

- `occupied`'i bağımsız bir doğruluk kaynağı yapma. Sıra bilgisinin sahibi
  hâlâ `body`; `occupied` ondan türeyen bir önbellek.
- Bitfield veya bitset optimizasyonu yok; bu boyutta `bool` array'i yeterli.
- F1 toggle'ı veya ayrı bir debug panel kurma; outline çizimi sürekli görünür
  kalsın. Tam overlay 2.14'te geliyor.
- Yem veya büyüme yok.

::: details İpucu 1 — Tur'un iki yeri
Grid'e dokunulan yalnız iki yer var: kurulum ve tick. Kurulumda (`game_reset`)
sıra önemli: önce `occupied`'i sıfırla, sonra başlangıç gövdesini ve
`game.length`'i ata, en sonra gövdenin ilk `length` hücresinden `occupied`'i
türet — başlangıç koordinatlarını ikinci kez elle yazmadan. Tick'te iki
yazma var: kaydırmadan önce kuyruk hücresini `occupied`'de `false` yap; yeni
head hesaplandığında onun hücresini `true` yap. `body` her tick bütün
slotlarına yeniden yazar ama kaplanan hücre kümesi yalnız bu iki elemanla
değişir — index'in kayması hücrenin el değiştirmesi değil.
:::

::: details İpucu 2 — Kuyruk kaydırmada kaybolur
Kaydırma `body[length - 1]`'in üstüne bir önceki hücreyi yazar; kaydırma
bitince kuyruğun eski hücresi artık okunamaz durumdadır. Onu kaydırmadan
önce bir yere almadıysan, sonrasında elindeki `body[length - 1]` çıkan
hücre değil, yılanın hâlâ üstünde durduğu yeni kuyruktur. Aynı sorun head
için de geçerli: `body[0]` kaydırmadan sonra zaten yeni head'i taşır.
İkisini de kaydırma döngüsüne girmeden önce, yan yana yakala.
:::

::: details İpucu 3 — Tam çözüm
```odin
// game_reset içinde, gövde ve length atandıktan sonra:
game.occupied = {}
for i in 0 ..< game.length {
	cell := game.body[i]
	game.occupied[cell.row][cell.col] = true
}
```
Tick içinde, kaydırma döngüsünün dışında, kaydırmadan önce kuyruk ve head'i
yan yana yakala:

```odin
tail := game.body[game.length - 1]
head := game.body[0]
// ... kaydırma döngüsü, sonra body[0] = new_head ...
game.occupied[tail.row][tail.col] = false
game.occupied[new_head.row][new_head.col] = true
```

Çizim tarafında `occupied`'in tamamını iki iç içe `for` ile dolaş, `true`
olan her hücrede:

```odin
rl.DrawRectangleLinesEx(cell_rect(i32(col), i32(row)), 1, rl.YELLOW)
```

Bu çağrı mevcut grid çizim döngüsünün yanına, `draw` bölümüne gidiyor.
:::

## Kaynak

[Odin Overview — resmi dil rehberi](https://odin-lang.org/docs/overview/#fixed-arrays).
`[GRID_ROWS][GRID_COLS]bool` çok boyutlu sabit array tanımı ve indexleme
sözdizimi burada; `occupied`'in kendisi bu sayfadaki temel array yapısına
dayanıyor.

## Kazanım

Aynı gerçeğin iki temsilini elle senkron tuttun. `occupied` bozulduğunda
oyun normal görünür — cache kendi hatasını haykırmaz; onu ekranda çizmek
uyumsuzluğu gözüne batırır. Sıradaki ders bu ikinci temsili gerçek bir
karara bağlayacak.

**“Snake 2.7 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu grid'i çarpışma tespitinin kendisine bağlamak:
[2.8 — Occupancy lookup](/worlds/02-snake/08-occupancy-lookup).
