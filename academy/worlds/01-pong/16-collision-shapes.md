---
title: "1.16 — Collision shape'lerini çiz"
description: "Topun ve raketlerin görünmeyen collision shape'lerini, collision hesabının kendi değerlerinden çiz."
section: Kod sınırları ve araç
next: false
---

# 1.16 — Collision shape'lerini çiz

**Hedef:** 1.7 ve 1.8'in kullandığı collision shape'leri, aynı değerlerden
üretilmiş outline'lar olarak overlay'e ekle.

## Görev

1.15'teki `debug_visible` bloğunu genişlet. Overlay açıkken topun circle
shape'ini, iki raketin rectangle shape'ini outline olarak ve sahanın merkez
çizgisini çiz. Shape'leri collision testinin okuduğu **aynı** field'lardan üret;
debug için yeni sayı yazma.

## Ne zaman bitti?

- Overlay açıkken top circle outline'ı ve iki raket rectangle outline'ı görünür.
- Merkez çizgisi sahayı ikiye bölüyor.
- Outline'lar raketler hareket ettikçe onlarla birlikte geliyor ve gerçek
  shape'lerin üstüne oturuyor.
- Overlay kapalıyken hiçbir debug çizimi kalmıyor.
- Debug için tanımlanmış ayrı bir position, boyut veya hitbox değeri yok.
- `odin check games/pong` geçiyor.

## Elindekiler

Girdinin tamamı zaten elinde: collision testinin okuduğu `game.player.rect` ve
`game.opponent.rect`, bir de `DrawCircleV`'ye verdiğin
`rl.Vector2{game.ball.x, game.ball.y}` merkezi. Bu dersin üç yeni çağrısı —
imzalar kurulu binding'den:

```odin
// vendor:raylib
// DrawRectangleLinesEx :: proc(rec: Rectangle, lineThick: f32, color: Color)
// DrawCircleLinesV     :: proc(center: Vector2, radius: f32, color: Color)
// DrawLineEx           :: proc(startPos, endPos: Vector2, thick: f32, color: Color)

rl.DrawRectangleLinesEx(game.player.rect, 2, rl.GREEN)
```

`DrawRectangleLinesEx` de `DrawRectangleRec` gibi bir `rl.Rectangle` alır;
`DrawCircleLinesV` ise `DrawCircleV` ile aynı iki değeri.

## Sınırlar

- Outline'lar yalnız çizer; hiçbir position, velocity veya skor değiştirmez.
- Ayrı “debug hitbox” sayıları tanımlama.
- Shape'ler outline olsun, dolu değil: altlarındaki gerçek raket ve top
  görünmeye devam etmeli.
- Çizim sırası kendi konusu değil; overlay normal sahnenin üstünde dursun.

::: details İpucu 1 — Türetmek ne demek
Her outline için soracağın soru şu: collision testi bu shape'i hangi değerden
okuyor? Raketler için bu `rect`, top için merkez ve `radius`. Outline
çağrısına tam o değerleri geçirirsen iki temsil hiçbir zaman ayrışamaz. Merkez
çizgisi collision shape değil, sahanın referans ekseni: iki ucunu
`SCREEN_WIDTH / 2` ekseninden, 1.3'te tanımladığın sabitlerden üret.
:::

::: details İpucu 2 — Debug için ikinci sayı yazmak
Debug çizimine kendi sayılarını yazmak cazip: “raket 20×100, şuraya bir
dikdörtgen çizeyim.” O anda doğru görünür, ama raket boyu veya konumu
değiştiği gün outline eski yerinde kalır. Overlay artık gerçeği değil kendi
kopyasını gösterir — aradığın bug'ı gizleyebilecek ikinci bir bug yazmış
olursun.
:::

::: details İpucu 3 — Tam çözüm
```odin
if game.debug_visible {
	rl.DrawRectangleLinesEx(game.player.rect, 2, rl.GREEN)
	rl.DrawRectangleLinesEx(game.opponent.rect, 2, rl.GREEN)
	rl.DrawCircleLinesV(rl.Vector2{game.ball.x, game.ball.y}, game.ball.radius, rl.GREEN)
}
```
Merkez çizgisi sahnenin kendi parçası; overlay'e değil normal çizime gidiyor:

```odin
rl.DrawLineEx(
	rl.Vector2{SCREEN_WIDTH / 2, 0},
	rl.Vector2{SCREEN_WIDTH / 2, SCREEN_HEIGHT},
	1,
	rl.WHITE,
)
```
:::

## Kaynak

[Odin vendor:raylib binding referansı](https://pkg.odin-lang.org/vendor/raylib/) —
`#DrawRectangleLinesEx`, `#DrawCircleLinesV` ve `#DrawLineEx` anchor'ları. Üç
çağrının parametre sırası ve tipleri aynı sayfada.

## Kazanım

Collision bug'ını artık tahmin ederek değil görerek inceliyorsun. Asıl kazanım
outline'lar değil, onları tek değerden türetmiş olman: render shape, collision
shape ve debug shape'i ayrı ayrı tutmak oyun kodunun klasik hatasıdır ve
gördüğün kutunun çarpışan kutu olmadığı bir oyunla sonuçlanır.

**“Pong 1.16 denememi değerlendir”** yaz; kodunu inceleyelim.

Pong'un temel sürümü bitti: oynanabilir bir maç döngüsü, açık state'ler ve
kendi debug aracı. Sırada grid üzerinde yaşayan, adım adım ilerleyen bir dünya
var: Dünya 2 — Snake.
