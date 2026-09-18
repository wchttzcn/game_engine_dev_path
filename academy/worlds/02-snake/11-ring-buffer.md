---
title: "2.11 — Ring buffer"
description: "Sabit body array'ini kaydırmak yerine head index'iyle dairesel kullanacak şekilde yeniden yaz."
section: Veri temsili
---

# 2.11 — Ring buffer

**Hedef:** Gövdeyi her adımda baştan sona kaydırmak yerine, sabit array üzerinde
`head` index'iyle dairesel (ring buffer) kullan.

## Görev

`Game` içine `head: int` field'ı ekle. Adımda `body`'yi artık kaydırma:
`head`'i bir slot geri kaydır, yeni head hücresini `body[head]`'e yaz; kuyruk
`head` ve `length`'ten hesaplanır. 2.4'teki kaydırma döngüsünü sil. Gövdeyi
okuyan altı kod yolunu tek tek bu kurala geçir; index hesabını henüz ortak bir
yerde toplama, altısını elle yaz.

## Ne zaman bitti?

- Oynanış 2.9'dakiyle birebir aynı: hareket, yem, büyüme, kendine çarpma
  davranışı değişmedi.
- Adım başına `body` array'inde yalnızca bir hücre yazılıyor (yeni head);
  kaydırma döngüsü kodda kalmadı.
- Kuruluş, `occupied`'in gövdeden türetilmesi, eski head okuma, kuyruk okuma,
  yeni head yazma ve çizim — altı yolun hepsi `head`/`length`'ten hesaplanan
  index okuyor, hiçbiri `body[0]`'ı sabit baş saymıyor.
- `odin check games/snake` geçiyor.

## Elindekiler

Kural: gövdenin `i`'inci hücresi `body[(head + i) % MAX_BODY]` (`i` `0`'dan
`length - 1`'e, `i = 0` baş, `i = length - 1` kuyruk). Bu kural altı yerde
geçerli olmalı: (1) başlangıç kurulumu, (2) `occupied`'in gövdeden ilk
türetilmesi, (3) adımda eski head okuma, (4) kuyruk okuma, (5) yeni head
yazma, (6) çizim döngüsü. `Game`'e eklenecek alan:

```odin
head: int
```

Head'i geri kaydıran satır hazır — neden `-1`, neden `+ MAX_BODY` sorusu
2.12'nin konusu, burada kural olarak kullan:

```odin
game.head = (game.head - 1 + MAX_BODY) % MAX_BODY
```

## Sınırlar

- `[dynamic]Cell`, `append`, `make` veya `core:container` kullanma; kapasite
  hâlâ `MAX_BODY` sabit array.
- Index formülünü tek bir yardımcı procedure'da toplama; altı yere elle
  yazman bu dersin parçası, birleştirme 2.12'de.
- Yön, tick süresi, yem ve büyüme kuralları 2.9'daki gibi kalıyor; bu ders
  yalnız temsili değiştiriyor.
- `head` `0`'da başladığı için altı yoldaki bir hata bugün ekranda
  görünmeyebilir; sınaması 2.12'de.

::: details İpucu 1 — Sırayı doğru kur
Adımda önce yeni head hücresini hesapla, sonra büyüyüp büyümeyeceğine bak.
Büyümüyorsan kuyruk hücresini oku ve `occupied`'de boşalt — bunu `head`'i
oynatmadan önce yap. Ardından `head`'i bir slot geri kaydır, yeni head'i
`body[head]`'e yaz ve `occupied`'de doldur. Kuruluşta da aynı kural geçerli:
ilk gövdeyi `body[(head + i) % MAX_BODY]`'e yazarken `occupied`'i aynı
hücrelerden doldur; çizim döngüsü aynı formülü `i = 0..length-1` için okur.
:::

::: details İpucu 2 — Kuyruğu head hareket etmeden önce oku
Kuyruğun index'i `(head + length - 1) % MAX_BODY` — formülün içinde `head`
var, yani `head`'i oynattığın anda cevap değişir. `head`'i kaydırdıktan sonra
bu formülü okursan elde ettiğin hücre gerçek kuyruk değil, onun bir önceki
komşusudur — yani yılanın hâlâ üstünde durduğu hücre. Kural: çıkan hücreyi,
onu çıkaran işlemden önce oku.
:::

::: details İpucu 3 — Altı yolun tam hâli
```odin
// (1) kuruluş — game_reset içinde:
idx := (game.head + i) % MAX_BODY
game.body[idx] = cell
game.occupied[cell.row][cell.col] = true

// (3) eski head okuma — tick'in başında:
old_head := game.body[game.head]

// (4) kuyruk okuma — head hareket etmeden önce:
tail := game.body[(game.head + game.length - 1) % MAX_BODY]
game.occupied[tail.row][tail.col] = false

// (5) head'i kaydır, yeni head'i yaz:
game.head = (game.head - 1 + MAX_BODY) % MAX_BODY
game.body[game.head] = new_head

// (6) çizim döngüsü:
cell := game.body[(game.head + i) % MAX_BODY]
```
(2) `occupied`'in ilk türetilmesi (1) ile aynı döngüde olur, ayrı bir yol
değildir. Kaydırma döngüsü artık hiçbir yerde yok; gövde array'de olduğu
yerde duruyor, hangi hücrelerin gövdeye dahil sayıldığını `head` ve `length`
belirliyor.
:::

## Kaynak

[Odin dil turu — `#fixed-arrays`](https://odin-lang.org/docs/overview/#fixed-arrays).
Sabit boyutlu array'lerin `[N]T` biçiminde compile-time boyutlu, value-type
olduğunu anlatır; ring buffer'ın index aritmetiği tam olarak bu semantiğin
üstüne kurulu.

## Kazanım

Gövdenin adım başına maliyeti artık sabit; bir temsili değiştirdiğinde
gövdeye dokunan kaç yerin değiştiğini elinle saydın. `head`'i geri kaydıran
satırı hazır kural olarak kullandın — o satırın neden böyle yazıldığını
2.12'de kendin çıkaracaksın.

**“Snake 2.11 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu kuralın altı yere dağılmış hâlini tek bir yardımcı
procedure'da toplamak: [2.12 — İndex'i tek yerde topla](/worlds/02-snake/12-index-single-source).
