---
title: "1.13 — Debug overlay"
description: "F1 ile açılan küçük bir overlay üzerinden Pong state'ini görünür yap."
next: false
---

# 1.13 — Debug overlay

**Hedef:** F1 ile açılıp kapanan bir debug overlay ile görünmeyen oyun state'ini
oynarken incele.

## Görev

`Game` içine `debug_visible: bool` ekle. F1'e bir kez basıldığında bu değeri
tersine çevir. `draw_game` içinde overlay açıksa FPS'i, topun position ve
velocity değerlerini, match state'in adını çiz. Ayrıca topun circle collision
shape'ini ve iki raketin rectangle collision shape'lerini outline olarak, saha
merkez çizgisini de ekrana çiz. Overlay kapalıyken bu debug çizimleri görünmesin.

## Bilmen gereken küçük parça

Bir oyun bug'ında yalnızca görüntü yeterli olmayabilir. Topun yanlış yönde
sekmesi position hatası mı, velocity hatası mı, yoksa collision shape'in yanlış
yerde olması mı? Bu overlay aynı frame'deki simulation state'ini görünür yapar.
Oyuncuya sunulan UI değildir; bu yüzden bilgi yoğun ve geçici olabilir.

F1 toggle bir "basılı mı?" kontrolü değil, tek seferlik input olmalıdır.
`rl.IsKeyPressed(.F1)` anahtarın basıldığı frame'de true döner; `IsKeyDown`
kullanırsan tuş tutulurken overlay her frame açılıp kapanır.

## Sınırlar

- Overlay yalnızca debug state gösterir; position, velocity, skor veya match
  state değiştirmez.
- Metinleri mevcut raylib fontuyla `rl.DrawText` kullanarak çiz. Dear ImGui
  bu Pong'un ihtiyacı değil; Breakout'ta runtime tuning problemiyle gelecek.
- Collision outline'larını gerçek collision hesaplarında kullandığın circle ve
  rectangle değerlerinden üret. Ayrı "debug hitbox" sayılarını kopyalama.

## Ne zaman bitti?

- F1, overlay'i birer basışta güvenilir biçimde açıp kapatıyor.
- Açık overlay FPS, top position/velocity ve match state'i gösteriyor.
- Top/raket collision shape'leri ile center line görünür; kapalıyken debug çizimleri yok.
- Normal maç akışı değişmiyor.
- `odin check games/pong` geçiyor.

::: details İpucu 1 — Toggle formülü
F1 basıldıysa `game.debug_visible = !game.debug_visible` ataması yap. Bunu
update tarafında yapman input ve state değişimlerini aynı yerde tutar.
:::

::: details İpucu 2 — Sayıyı metne dönüştürme
`rl.TextFormat` sayıları `rl.DrawText`in beklediği `cstring` içine formatlar.
FPS için doğrudan `rl.DrawFPS` de kullanabilirsin. Overlay'in amacı doğru
state'i göstermek; text helper'ı ortak API'ye dönüştürme.
:::

::: details İpucu 3 — Outline çizimi
Paddle'lar için `rl.DrawRectangleLinesEx`, top için `rl.DrawCircleLinesV`
kullanabilirsin. `DrawRectangleLinesEx` de `DrawRectangleRec` gibi bir
`rl.Rectangle` alır; 1.7'de collision testine verdiğin `player_rect` ve
`opponent_rect` değişkenlerini olduğu gibi ona da ver, ikinci argüman çizgi
kalınlığıdır. Top için de collision hesabındaki merkez ve radius değerlerini
kullan.
:::

::: details Deep Dive — FPS neyi söyler?
`rl.GetFPS()` son frame'lerin ölçümünden türetilen anlık bir göstergedir; tek
başına performans teşhisi değildir. Overlay'de asıl değeri, bir davranışın hangi
state ve collision shape ile aynı anda oluştuğunu göstermesidir. Snake'te bu
fikir grid ve allocation sayaçlarına, Breakout'ta ise runtime tuning paneline
genişleyecek.
:::

## Birincil kaynak

[Odin vendor:raylib — `DrawFPS`](https://pkg.odin-lang.org/vendor/raylib/#DrawFPS).
Overlay'de kullanacağın FPS, metin ve outline çizim çağrılarının imzaları;
`DrawRectangleLinesEx` ve `DrawCircleLinesV` aynı sayfada.

**Kazanım:** Oyun içindeki state'i bir geliştirici aracıyla görünür yaptın.
Pong'un temel sürümü artık oynanabilir, debug edilebilir bir maç döngüsüne sahip.
