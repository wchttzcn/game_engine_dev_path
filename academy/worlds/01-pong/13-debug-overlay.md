---
title: "1.13 — Debug overlay"
description: "F1 ile açılan bir overlay üzerinden Pong'un sayısal state'ini görünür yap."
---

# 1.13 — Debug overlay

**Hedef:** F1 ile açılıp kapanan bir overlay ile oyunun görünmeyen sayısal
state'ini oynarken oku.

## Görev

`Game` içine `debug_visible: bool` ekle. F1'e bir kez basıldığında bu değeri
tersine çevir. `draw_game` içinde overlay açıksa FPS'i, topun position ve
velocity değerlerini ve match state'in adını ekrana yaz. Overlay kapalıyken
bu metinler görünmesin.

## Bilmen gereken küçük parça

Bir oyun bug'ında ekrandaki görüntü çoğu zaman yetmez. Top yanlış yönde
sekiyorsa position mı hatalı, velocity mi? Bu overlay aynı frame'in simulation
state'ini sayı olarak gösterir; böylece gördüğün davranışla o anki state'i yan
yana koyarsın. Oyuncuya sunulan UI değildir: bilgi yoğun, çirkin ve geçici
olabilir.

F1 toggle bir "basılı mı?" kontrolü değil, tek seferlik input olmalıdır.
`rl.IsKeyPressed(.F1)` yalnızca tuşun basıldığı frame'de `true` döner;
`IsKeyDown` kullanırsan tuş tutulduğu sürece overlay her frame açılıp kapanır ve
bıraktığın yerde kalması tamamen şansa bağlı olur.

## Sınırlar

- Overlay yalnızca state gösterir; position, velocity, skor veya match state
  değiştirmez. 1.12'de kurduğun sınır burada işe yarıyor: `draw_game` okur.
- Metinleri mevcut raylib fontuyla `rl.DrawText` kullanarak çiz. Dear ImGui bu
  Pong'un ihtiyacı değil; Breakout'ta runtime tuning problemiyle gelecek.
- Overlay için ayrı bir procedure, panel abstraction'ı veya satır listesi kurma.
  `draw_game` içindeki bir `if` bloğu bu kadar bilgi için yeterli.

## Ne zaman bitti?

- F1, overlay'i her basışta bir kez açıp kapatıyor; tuşu basılı tutmak yanıp
  sönmeye yol açmıyor.
- Açık overlay FPS, top position/velocity ve match state adını gösteriyor.
- Overlay kapalıyken ekranda normal maç görüntüsünden başka bir şey yok.
- Normal maç akışı değişmiyor.
- `odin check games/pong` geçiyor.

::: details İpucu 1 — Toggle formülü
F1 basıldıysa `game.debug_visible = !game.debug_visible` ataması yap. Bunu
`update_game` içinde yapman input ve state değişimini aynı yerde tutar; çizim
tarafı yalnızca sonucu okur.
:::

::: details İpucu 2 — Sayıyı metne dönüştürme
`rl.DrawText` bir `cstring` bekler.
`rl.TextFormat("ball %.1f, %.1f", game.ball.x, game.ball.y)` sayıları o
`cstring` içine formatlar. Bu binding'in `TextFormat`'ı Odin'in `fmt`
verb'lerini kullanır, yani enum'u `%v` ile doğrudan adıyla yazdırabilirsin. FPS
için ayrıca `rl.DrawFPS(x, y)` hazır çağrısı var.
:::

::: details İpucu 3 — Satırları yerleştir
Her metni bir öncekinden sabit bir miktar aşağıya koy: örneğin `10, 10`,
`10, 32`, `10, 54`. `DrawText`in `posX`, `posY` ve `fontSize` parametreleri
`c.int`'tir; buraya sabit sayılar yazdığın için dönüşüm gerekmez.
:::

::: details Deep Dive — FPS neyi söyler?
`rl.GetFPS()` son frame'lerin ölçümünden türetilen anlık bir göstergedir; tek
başına performans teşhisi değildir. Overlay'deki asıl değeri, bir davranışın
hangi state ile aynı anda oluştuğunu göstermesidir. Snake'te bu fikir grid ve
allocation sayaçlarına, Breakout'ta runtime tuning paneline genişleyecek.
:::

## Birincil kaynak

[Odin vendor:raylib — `DrawFPS`](https://pkg.odin-lang.org/vendor/raylib/#DrawFPS).
Overlay'in kullandığı `DrawFPS`, `DrawText` ve `IsKeyPressed` imzaları aynı
binding sayfasında; `TextFormat`in Odin tarafındaki gövdesi de orada.

**Kazanım:** Oyunun sayısal state'ini oynarken okuyabiliyorsun. Sonraki adım
görünmeyen shape'leri de çizmek:
[1.14 — Collision shape'lerini çiz](/worlds/01-pong/14-collision-shapes).
