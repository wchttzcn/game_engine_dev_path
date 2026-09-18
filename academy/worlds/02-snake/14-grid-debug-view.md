---
title: "2.14 — Grid debug görünümü"
description: "F1 ile açılan bir overlay'de occupied grid'i, ring index'lerini ve allocation sayaçlarını göster."
section: Araç ve maç
---

# 2.14 — Grid debug görünümü

**Hedef:** F1 ile açılan bir overlay'de Snake'in görünmeyen temsilini —
occupancy grid'i, ring index'lerini, allocation sayaçlarını — oynarken oku.

## Görev

[1.15 — Debug overlay](/worlds/01-pong/15-debug-overlay)'deki kalıbı Snake'e
taşı: `Game` içine `debug_visible: bool` ekle, `F1`'e her basışta tersine çevir.
Overlay açıkken şunları göster: `occupied` grid'ini dolu hücrelerin outline'ı
olarak, `head` index'ini, `length`/`MAX_BODY`'yi, tick sayacını, `direction` ile
`next_direction`'ı ve 2.13'teki allocation sayaçlarını. Overlay kapalıyken bu
çizim ve metinlerin hiçbiri görünmesin.

## Ne zaman bitti?

- F1 overlay'i her basışta bir kez açıp kapatıyor.
- Açık overlay dolu hücreleri `occupied`'den okuyup outline olarak çiziyor —
  `body`'yi değil.
- `head`, `length`/`MAX_BODY`, tick sayacı, `direction`/`next_direction` ve
  allocation sayaçları ekranda okunuyor.
- Overlay kapalıyken normal oyundan başka hiçbir şey görünmüyor.
- `odin check games/snake` geçiyor.

## Bilmen gereken küçük parça

[1.16 — Collision shape'lerini çiz](/worlds/01-pong/16-collision-shapes)'te
outline'ları collision'ın okuduğu değerden türetmiştin, çünkü tek doğruluk
kaynağı vardı. Burada bilerek iki kaynak var: sıra bilgisi `body`'de, doluluk
bilgisi `occupied`'de duruyor (2.7). Bu yüzden overlay'i `occupied`'den çizmek
doğru olan seçim — gövdenin olmadığı bir yerde dolu hücre görürsen, iki temsil
ayrışmış demektir.

2.7'deki sürekli açık outline zaten bu ayrışmayı gösteriyordu. Bu ders onu
kapatılabilir hale getirip yanına sayıları koyuyor: outline sana iki temsilin
uyuşmadığını söyler, `head` ile `length` hangi index'in kaydığını söyler. Biri
sorunun varlığını, diğeri yerini verir.

## Sınırlar

- Dear ImGui yok, panel abstraction'ı yok, ayrı bir “debug renderer” satır
  listesi kurma. `draw_game` içindeki bir `if debug_visible` bloğu yeterli.
- Overlay yalnızca okur; hiçbir field'ı değiştirmez.

::: details İpucu 1 — Toggle ve yer
F1 formülü 1.15'teki gibi: `game.debug_visible = !game.debug_visible`,
`update_game` içinde `rl.IsKeyPressed(.F1)` ile. Çizim tarafı yalnızca sonucu
okusun.
:::

::: details İpucu 2 — occupied'i outline'a çevirmek
İki iç içe döngüyle `occupied`'in tamamını dolaş. `true` olan her `[row][col]`
için 2.1'deki `cell_rect(col, row)` çağrısını bir outline çizim çağrısına ver.
Dolaştığın array `body` değil, `occupied`.
:::

::: details İpucu 3 — Outline çağrısı
```odin
for row in 0..<GRID_ROWS {
	for col in 0..<GRID_COLS {
		if game.occupied[row][col] do rl.DrawRectangleLinesEx(cell_rect(i32(col), i32(row)), 1, rl.GREEN)
	}
}
```
`head`, `length`/`MAX_BODY`, tick sayacı ve yönler için zaten bildiğin
`rl.DrawText`/`rl.TextFormat` yeter; enum değerlerini `%v` ile adlarıyla
yazdırabilirsin.
:::

::: details Deep Dive — İki kaynak neden burada bilinçli bir tercih?
1.16'da tek kaynak vardı çünkü Pong'un collision shape'i zaten `Game`'in tek
alanıydı; overlay onu türetmekten başka bir şey yapmıyordu. Snake'te `occupied`
performans için eklenmiş **ikinci** bir temsil (2.7); bu overlay o takasın
bedelini görünür kılıyor. İki temsil senkron kalmazsa bunu ilk fark edeceğin
yer bir crash değil, bu ekran olacak.
:::

## Birincil kaynak

[Odin vendor:raylib — `DrawRectangleLinesEx`](https://pkg.odin-lang.org/vendor/raylib/#DrawRectangleLinesEx).
Occupied grid'ini outline'a çevirirken kullandığın imza ve parametre sırası
burada; 1.16'da aynı çağrıyı raket dikdörtgenleri için kullanmıştın.

**Kazanım:** Artık `body` ile `occupied`'in aynı gerçeği söylediğini gözle
doğrulayabiliyorsun; ayrıştıklarında bunu ilk overlay'de görürsün.

**“Snake 2.14 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu görünür temsili maç bitişine ve yeniden başlatmaya bağlamak:
[2.15 — Oyun sonu ve restart](/worlds/02-snake/15-game-over-restart).
