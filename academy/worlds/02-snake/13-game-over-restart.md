---
title: "2.13 — Oyun sonu ve restart"
description: "Game_State'e Won ekle, R tuşuna tek bir game_reset bağla ve body ile occupied'i birlikte sıfırla."
section: Araç ve maç
next: false
---

# 2.13 — Oyun sonu ve restart

**Hedef:** Kazanma durumunu ekle ve `R` ile iki temsili de — `body`'yi de
`occupied`'i de — tutarlı biçimde sıfırdan kur.

## Görev

`Game_State`'e üçüncü bir üye ekle: `Won` (2.9'un bitiş koşulu — occupancy
grid'de boş hücre kalmadığında). `Dead` veya `Won` durumundayken ekranda hangi
durumda olduğunu söyleyen bir metin göster. 2.6'dan beri `R`'ye bağlı kaba bir
restart zaten var; bunu tek bir `game_reset(&game)` çağrısı altında topla ve
kapsamını genişlet: yılanı başlangıç uzunluğuna ve konumuna döndürsün,
`head`'i başa alsın, `occupied` grid'ini yılanın gerçek hücreleriyle yeniden
kursun, tick timer'ı sıfırlasın, yeni bir yem yerleştirsin ve state'i
`Playing`'e döndürsün.

## Ne zaman bitti?

- `R` sonrası yılan başlangıç uzunluğunda ve başlangıç yerinde.
- `head` index'i başa dönmüş.
- `occupied` grid'inde yılanın dışında hiç dolu hücre kalmamış.
- Tick timer sıfır; yem yeni bir hücrede.
- İkinci oyun birincisiyle birebir aynı davranıyor.
- `odin check games/snake` geçiyor.

## Bilmen gereken küçük parça

[1.12 — Maç sonu ve restart](/worlds/01-pong/12-match-over)'ta reset iki skoru
sıfırlayıp topu döndürmekti — düz ve tek parçaydı. 2.6'daki `R` de benzer
şekilde tekti, çünkü o an sıfırlanacak tek temsil `body`'ydi. O günden bu yana
`occupied` (2.7) ve ring buffer index'i `head` (2.10) eklendi; asıl iş artık
`R`'yi ilk kez var etmek değil, bu temsillerin hepsini **tek seferde ve
tutarlı** sıfırlayan bir `game_reset`'te toplamak. `body`'nin söylediği ile
`occupied`'in söylediği yeniden eşleşmeli. En sık kaçan bug tam burada:
`body` sıfırlanır, `occupied` unutulur. Sonuç, yeni yılanın görünmeyen
duvarlara çarpması ya da yemin hiç doğmamasıdır — eski oyundan kalan `true`
hücreler ortada kalır.

Bu bug sınıfını kapatmanın yolu grid'i elle, hücre hücre eski yılanın izini
sürerek temizlemek değil, `occupied`'i sıfırdan **yeniden türetmek**. Odin'de
bir array'i sıfır değerine döndürmek için composite literal kullanılır:

```odin
game.occupied = {}
```

Bu satır tüm grid'i `false` yapar. Ardından yeni yılanın hücrelerini işaretleyen
tek bir döngü — 2.7'de occupancy'yi ilk kurarken yazdığın döngünün aynı fikri —
`occupied`'i tekrar `body` ile tutarlı hale getirir. Reset yolu ile adım yolu
böylece aynı türetme kuralını paylaşır; grid'i güncelleyen ikinci, bağımsız bir
kod yolu olmaz.

## Sınırlar

- Menü, skor tablosu, seviye veya kayıt (save) sistemi yok.
- `R` kontrolünü [1.12 — Maç sonu ve restart](/worlds/01-pong/12-match-over)'ta
  olduğu gibi tek yerde topla; `switch game.state` satırından önce kontrol et
  ki hangi state'te olursan ol aynı reset çalışsın.

::: details İpucu 1 — R'nin yeri
1.12'deki gibi, `R` kontrolünü `switch game.state`'ten **önce** koy. Böylece
`Playing`, `Dead` veya `Won` — hangisinde olursan ol — aynı reset çağrısı çalışır.
:::

::: details İpucu 2 — Sıfırlanacakların listesi
`game_reset` şunların hepsini tek yerde toplamalı: `body`/`length`/`head`
başlangıç değerine, `occupied` tamamen `false`, `tick_timer` sıfır,
`direction`/`next_direction` başlangıç yönü, `food` yeni boş bir hücre, `state`
`Playing`. `main` içinde ilk oyunu kurarken de aynı `game_reset`'i çağırman iki
ayrı kurulum kodu yazmanı önler.
:::

::: details İpucu 3 — occupied'i gövdeden yeniden türetmek
```odin
game.occupied = {}
for i in 0..<game.length {
	cell := game.body[(game.head + i) % MAX_BODY]
	game.occupied[cell.row][cell.col] = true
}
```
Bu döngü 2.7'de occupancy'yi ilk kurduğun döngüyle aynı fikri taşıyor: `body`
tek doğruluk kaynağı, `occupied` ondan türetiliyor.
:::

::: details Deep Dive — Bu desen ring buffer'a özel değil
Türetilmiş herhangi bir state'i (cache, index, occupancy grid) sıfırlarken aynı
kural geçerli: sahibi olan veriyi sıfırla, türetilmiş veriyi elle düzeltme,
yeniden türet. Elle düzeltme kısa vadede çalışır ama ikinci bir güncelleme yolu
açar; o yol zamanla asıl türetme koduyla ayrışır.
:::

## Birincil kaynak

[Odin dil turu](https://odin-lang.org/docs/overview/). Composite literal'ların
bir tipin zero value'sunu nasıl ürettiğini anlatır; `game.occupied = {}` bu
genel kurala dayanıyor.

**Kazanım:** Snake artık baştan sona oynanabilir: ölüyor, kazanıyor, `R` ile
temiz bir oyuna dönüyor — ve iki temsili de aynı anda doğru tutuyorsun.

**“Snake 2.13 denememi değerlendir”** yaz; kodunu inceleyelim.
