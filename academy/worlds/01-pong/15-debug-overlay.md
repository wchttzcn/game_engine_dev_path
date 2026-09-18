---
title: "1.15 — Debug overlay"
description: "F1 ile açılan bir overlay üzerinden Pong'un sayısal state'ini görünür yap."
section: Kod sınırları ve araç
---

# 1.15 — Debug overlay

**Hedef:** F1 ile açılıp kapanan bir overlay ile oyunun görünmeyen sayısal
state'ini oynarken oku.

## Görev

`Game` içine `debug_visible: bool` ekle ve F1'e her basışta tersine çevir.
Overlay açıkken FPS'i, topun position ve velocity değerlerini ve match state'in
adını ekrana yaz; kapalıyken bu metinler görünmesin. Normal maç akışı
değişmesin.

## Ne zaman bitti?

- F1, overlay'i her basışta bir kez açıp kapatıyor; tuşu basılı tutmak yanıp
  sönmeye yol açmıyor.
- Açık overlay FPS, top position/velocity ve match state adını gösteriyor.
- Overlay kapalıyken ekranda normal maç görüntüsünden başka bir şey yok.
- Overlay hiçbir state'i değiştirmiyor, yalnız okuyor.
- `odin check games/pong` geçiyor.

## Elindekiler

Bug ararken ekrandaki görüntü çoğu zaman yetmez: top yanlış sekiyorsa position
mı bozuk, velocity mi? Overlay aynı frame'in sayılarını yanına koyar. Oyuncu
UI'ı değildir; bilgi yoğun ve çirkin olabilir.

```odin
// Game'e eklenecek alan:
//   debug_visible: bool,
```

Bu dersin iki yeni çağrısı — imzalar kurulu binding'den:

```odin
// vendor:raylib — DrawFPS :: proc(posX, posY: c.int)
rl.DrawFPS(10, 10)

// TextFormat, Odin'in fmt verb'lerini kullanır: %v bir enum'u adıyla yazar.
rl.DrawText(rl.TextFormat("Match State : %v", game.match_state), 10, 70, 8, rl.GREEN)
```

`cstring` çevrimini ve `TextFormat`'in sabit buffer davranışını 1.11'de
görmüştün; burada aynı çağrıyı birden çok değerle kullanıyorsun.

## Sınırlar

- Overlay yalnız state gösterir; hiçbir değeri değiştirmez. 1.14'te kurduğun
  sınır burada işe yarıyor: çizim tarafı okur.
- Metinleri mevcut raylib fontuyla çiz. Dear ImGui bu Pong'un ihtiyacı değil.
- Panel abstraction'ı veya satır listesi kurma; bir `if` bloğu yeterli.

::: details İpucu 1 — Toggle ve okuma ayrı yerlerde
Tuşu update tarafında oku ve `debug_visible`'ı orada tersine çevir; çizim
tarafı yalnız sonucu okusun. Böylece input ve state değişimi tek yerde kalır.
Çizimde overlay bloğu, normal maç çizimi bittikten **sonra** gelsin — yoksa
raket ve top metinlerin üstüne biner.
:::

::: details İpucu 2 — Basılı mı, basıldı mı
Toggle tek seferlik bir input ister: `IsKeyPressed` yalnız tuşun basıldığı
frame'de `true` döner. `IsKeyDown` kullanırsan tuş tutulduğu sürece overlay
her frame açılıp kapanır ve parmağını kaldırdığında hangi durumda kaldığı
tamamen şansa bağlı olur.
:::

::: details İpucu 3 — Tam çözüm
```odin
// update tarafında, döngünün başında:
if rl.IsKeyPressed(.F1) {
	game.debug_visible = !game.debug_visible
}

// çizim tarafında, maç çizimi bittikten sonra:
if game.debug_visible {
	rl.DrawFPS(10, 10)
	rl.DrawText(rl.TextFormat("Ball:posX : %.1f", game.ball.x), 10, 30, 8, rl.GREEN)
	rl.DrawText(rl.TextFormat("Ball:posY : %.1f", game.ball.y), 10, 40, 8, rl.GREEN)
	rl.DrawText(rl.TextFormat("Ball:velocity_x : %f", game.ball.velocity_x), 10, 50, 8, rl.GREEN)
	rl.DrawText(rl.TextFormat("Ball:velocity_y : %f", game.ball.velocity_y), 10, 60, 8, rl.GREEN)
	rl.DrawText(rl.TextFormat("Match State : %v", game.match_state), 10, 70, 8, rl.GREEN)
}
```
Satırları sabit bir aralıkla aşağı kaydır; `posX`, `posY` ve `fontSize`
`c.int` olduğu için sabit sayılar dönüşüm istemez.
:::

## Kaynak

[Odin vendor:raylib binding referansı](https://pkg.odin-lang.org/vendor/raylib/) —
`#DrawFPS`, `#DrawText` ve `#IsKeyPressed` anchor'ları. Üç imza da aynı sayfada;
`TextFormat`'in Odin tarafındaki gövdesi de orada.

## Kazanım

Oyunun sayısal state'ini oynarken okuyabiliyorsun. Bu kalıp — state'i
değiştirmeyen, tuşla açılan bir okuma katmanı — Snake'te grid ve allocation
sayaçlarına, Breakout'ta ayar paneline genişleyecek.

**“Pong 1.15 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım görünmeyen shape'leri de çizmek: [1.16 — Collision shape'lerini
çiz](/worlds/01-pong/16-collision-shapes).
