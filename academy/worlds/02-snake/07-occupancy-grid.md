---
title: "2.7 — Occupancy grid"
description: "İkinci bir temsil ekleyerek hücre doluluğunu sabit sürede cevapla, gövdeden türet ve kendine çarpma taramasını bununla değiştir."
section: Veri temsili
---

# 2.7 — Occupancy grid

**Hedef:** İkinci bir temsil ekleyerek “bu hücre dolu mu?” sorusunu sabit sürede
cevapla.

## Görev

`occupied: [GRID_ROWS][GRID_COLS]bool` ekle. Oyun kurulurken — daha ilk tick
gelmeden önce — 2.6'daki 5 hücrelik başlangıç gövdesinin her hücresini
`occupied`'de `true` yap; grid ilk frame'den itibaren gövdeyle tutarlı
başlasın. Sonra her adımda yeni head hücresini `true`, kuyruktan çıkan hücreyi
`false` yap. 2.6'daki baştan sona taramayı tek bir `occupied[row][col]`
okumasıyla değiştir.

Son olarak `occupied`'in dolu dediği her hücreyi, 2.1'deki `cell_rect` ve
`rl.DrawRectangleLinesEx` ile sürekli açık bir outline olarak çiz (F1 toggle'ı
gerekmiyor — bu görsel her an açık kalabilir). Bu, `body`'nin çizdiği yılanla
`occupied`'in dolu dediği hücreleri gözle karşılaştırmanı sağlar.

## Ne zaman bitti?

- Program başladığında, ilk tick gelmeden önce bile, `occupied` başlangıç
  gövdesiyle uyumlu — `false` dolu bir grid değil.
- Kendine çarpma tespiti hâlâ doğru çalışıyor.
- Tespit artık gövde uzunluğundan bağımsız: `length` ne olursa olsun tek okuma.
- `occupied` grid'i ile `body` array'i her adımdan sonra tutarlı — biri
  diğerini yalanlamıyor.
- Ekranda dolu hücrelerin outline'ı yılanın gövdesiyle birebir çakışıyor;
  aralarında boşluk veya fazlalık yok.
- `odin check games/snake` geçiyor.

## Bilmen gereken küçük parça

Artık aynı gerçeğin iki temsili var: sıra bilgisi `body`'de, doluluk bilgisi
`occupied`'de. Bu, [1.15 — Collision shape'lerini
çiz](/worlds/01-pong/15-collision-shapes) dersindeki tek-kaynak kuralının
ihlali değil — orada debug çizimini collision'ın okuduğu değerden türetmiştin
çünkü tek kaynak yeterliydi. Burada iki temsil bilinçli bir takas: `occupied`,
`body`'den türetilir ve bu türetme tek bir adım procedure'ında toplanır.

Bedeli var: gövdeyi değiştiren her kod yolu grid'i de güncellemek zorunda. İki
ayrı yerde güncellersen ayrışma kaçınılmaz — grid'in dolu dediği bir hücre
gövdede yok, ya da tam tersi. 20x20'lik bir grid 400 bool demek, yani 400 byte;
`Game` struct'ının içinde, contiguous bir alan.

Kurulumda unutulan bir başlangıç işaretlemesi tam bu ayrışmanın ilk örneği:
adım koduna dokunmadan, `occupied` yalnızca “başlangıçta tamamen boş” zero
value'sunda kalır ve gövdeyle hiç eşleşmez. 2.13'teki restart da aynı
kurulumu tekrar çalıştırmak zorunda kalacak — burada yazdığın döngü, oyunu
`R` ile yeniden başlatırken de aynen kullanılacak.

Bu görsel doğrulama bir debug aracı değil — F1'in arkasına gizlenmiyor, çünkü
henüz kanıtlaman gereken şey basit: iki temsilin aynı şeyi söylediği. Tam
overlay (F1 toggle'lı, allocation sayaçlı, ring index'li) 2.12'de geliyor; o
zamana kadar bu sürekli açık outline yeterli.

## Sınırlar

- `occupied`'i bağımsız bir doğruluk kaynağı yapma. Sıra bilgisinin sahibi
  hâlâ `body`; `occupied` yalnızca ondan türeyen bir önbellek.
- Bitfield veya bitset optimizasyonu yok; `bool` array'i bu boyutta yeterli.
- F1 toggle'ı, ayrı bir “debug renderer” veya panel abstraction'ı kurma; outline
  çizimi `draw_game` içindeki bir döngüden ibaret ve sürekli görünür.

::: details İpucu 1 — Kurulumda unutma
`Game`'i ilk kurduğun yerde (`main`'in başında veya bir `game_init`
benzerinde), 2.6'daki başlangıç gövdesini yazdıktan hemen sonra `body`'nin
ilk `length` hücresinin her birini `occupied`'de `true` yap. Bu, adım
kodundan tamamen ayrı, tek seferlik bir döngü.

Adımda ise iki şey oluyor: yeni head hücresi doluyor, kuyruktan çıkan hücre
boşalıyor. İkisini de gövdeyi kaydırdığın koda bitişik yap — grid güncellemesi
adımın bir parçası, ayrı bir geçiş değil.
:::

::: details İpucu 2 — Kontrol artık ne okuyor
2.6'daki döngü yerine tek satır: `if game.occupied[new_row][new_col]`. Bu satır
çalışmadan önce yeni head'in henüz grid'e işaretlenmemiş olması gerekir —
yoksa yılan kendi yeni hücresine çarpar.
:::

::: details İpucu 3 — Sıra önemli
Önce eski kuyruk hücresini `occupied`'de `false` yap, sonra çarpışmayı kontrol
et, sonra yeni head hücresini `true` yap. Kuyruktan çıkan hücreyle yeni head
aynı hücre olabilir (kısa yılanlarda); sırayı karıştırırsan geçerli bir
hareketi çarpışma sanabilirsin.

Outline çizimi için iki iç içe `for` ile `occupied`'in tamamını dolaş; `true`
olan her hücrede aşağıdaki çağrıyı yap. Bu döngü `draw_game` içinde, her
frame, koşulsuz çalışır.

```odin
rl.DrawRectangleLinesEx(cell_rect(i32(col), i32(row)), 1, rl.GREEN)
```
:::

## Birincil kaynak

[Odin dil turu — diziler](https://odin-lang.org/docs/overview/#arrays). Çok
boyutlu sabit boyutlu array tanımı — `[GRID_ROWS][GRID_COLS]bool` — burada
aynı sözdizimiyle.

**Kazanım:** “Bu hücre dolu mu?” sorusu artık `length`'ten bağımsız, sabit
sürede cevaplanıyor; ilk frame'den itibaren gövdeyle tutarlı kuruluyor ve bunu
gözle doğrulayabiliyorsun — bedelini de, iki temsili senkron tutma
sorumluluğunu da görüyorsun.

**“Snake 2.7 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu iki temsili bir tick'in içindeki gerçek bir karara bağlamak:
[2.8 — Yemi ye ve büyü](/worlds/02-snake/08-food-and-growth).
