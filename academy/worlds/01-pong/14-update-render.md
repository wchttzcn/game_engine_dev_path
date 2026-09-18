---
title: "1.14 — Update ve render sınırı"
description: "Game state'ini update eden kodu, state'i çizen koddan ayır."
section: Kod sınırları ve araç
---

# 1.14 — Update ve render sınırı

**Hedef:** Bir frame'in state değişimini çiziminden ayırarak Pong döngüsünü
okunur hale getir.

## Görev

Frame döngüsündeki oyun mantığını `update_game(game: ^Game, dt: f32)` içine,
çizim çağrılarını `draw_game(game: ^Game)` içine taşı. `main` her frame `dt`
alsın, update çağırsın, sonra drawing bloğu içinde draw çağırsın. Input,
hareket, skor ve match state update'te kalsın; rectangle, text ve arka plan
çizimi draw'da kalsın.

## Ne zaman bitti?

- `main` oyunu oluşturuyor, `dt` alıyor, update ediyor ve çiziyor.
- Oynanış önceki dersle aynı: input, skor, servis ve restart çalışıyor.
- `update_game` gerçek `Game` değerini pointer üzerinden değiştiriyor.
- `odin check games/pong` geçiyor.

## Elindekiler

`Game`, `Paddle`, `Ball` ve `Match_State` zaten var; bu ders yeni alan
eklemiyor. İki yeni procedure imzası:

```odin
update_game :: proc(game: ^Game, dt: f32) {
}

draw_game :: proc(game: ^Game) {
}
```

`^Game`, bir `Game` değerini gösteren pointer tipidir. Çağırırken `&game` ile
adresini verirsin; procedure içinde ayrı bir dereference sözdizimi yok,
`game.ball` yazman yeter — derleyici adresin gösterdiği değere kendisi erişir.
`main`'in gövdesi şu sırayı izler:

```odin
dt := rl.GetFrameTime()
update_game(&game, dt)

rl.BeginDrawing()
rl.ClearBackground(rl.BLACK)
draw_game(&game)
rl.EndDrawing()
```

## Sınırlar

- Yeni `engine/` paketi, entity sistemi veya genel game-loop abstraction'ı
  kurma; Pong'un iki procedure'e ihtiyacı var.
- `BeginDrawing`, `EndDrawing` ve `ClearBackground` çağrılarını `main` içinde
  tut; `draw_game` yalnızca sahneyi çizsin.
- Update içinde raylib çizim çağrısı, draw içinde state ataması yapma; bu
  sınır sonraki debug overlay'i güvenle eklememizi sağlar.

::: details İpucu 1 — Taşınacak satırları ayır
Position, velocity, score veya match state yazan her satır update'e gider:
input okuma, raket ve top hareketi, çarpışma tepkisi, skor artışı ve
`match_state` geçişleri. `rl.Draw...` ile başlayan her çağrı draw'a gider:
skor metni, dikdörtgenler, top ve orta çizgi. `game_reset` çağrısı da
update'te kalır, çünkü `R` tuşu bir input olayıdır.
:::

::: details İpucu 2 — Pointer'sız kopya tuzağı
`update_game`'i `game: Game` (pointer'sız) yazarsan derleme geçer ama
procedure kendi kopyası üzerinde çalışır; `main`'deki gerçek `game` hiç
değişmez — top hareket etmez, skor artmaz, hata mesajı da çıkmaz.
Parametreyi `^Game` yaz, çağrı tarafında `&game` ver; iki tarafı birlikte
unutursan aynı sessiz kopyalama draw için de tekrarlanır, ama draw yalnızca
okuduğu için fark edilmez.
:::

::: details İpucu 3 — Tam çözüm
```odin
update_game :: proc(game: ^Game, dt: f32) {
	if rl.IsKeyDown(.W) {
		game.player.y -= game.player.speed * dt
	}
	if rl.IsKeyDown(.S) {
		game.player.y += game.player.speed * dt
	}
	if rl.IsKeyPressed(.R) {
		game_reset(game)
	}
	if game.player.y + game.player.height > SCREEN_HEIGHT {
		game.player.y = SCREEN_HEIGHT - game.player.height
	}
	if game.player.y < 0 {
		game.player.y = 0
	}

	// opponent AI, rect güncellemesi, top hareketi, çarpışma ve skor: aynı
	// yapıda buraya taşınır — 1.9-1.13'te yazdığın mantık değişmiyor, yalnız
	// yeri değişiyor.

	switch game.match_state {
	case .Serving:
		if rl.IsKeyPressed(.SPACE) do game.match_state = .Playing
	case .Playing:
		// top hareketi, sınır ve raket çarpışması, skor artışı
	case .Match_Over:
	}
}

draw_game :: proc(game: ^Game) {
	switch game.match_state {
	case .Playing, .Serving:
		rl.DrawText(rl.TextFormat("%d", game.player_score), 150, 40, 32, rl.WHITE)
		rl.DrawText(rl.TextFormat("%d", game.opponent_score), 650, 40, 32, rl.WHITE)
		rl.DrawLineEx(
			rl.Vector2{SCREEN_WIDTH / 2, 0},
			rl.Vector2{SCREEN_WIDTH / 2, SCREEN_HEIGHT},
			1,
			rl.WHITE,
		)
		rl.DrawRectangleRec(game.player.rect, rl.WHITE)
		rl.DrawRectangleRec(game.opponent.rect, rl.WHITE)
		rl.DrawCircleV(rl.Vector2{game.ball.x, game.ball.y}, game.ball.radius, game.ball.color)
	case .Match_Over:
		// skor tablosu metni
	}
}
```

`main` içinde:

```odin
dt := rl.GetFrameTime()
update_game(&game, dt)

rl.BeginDrawing()
rl.ClearBackground(rl.BLACK)
draw_game(&game)
rl.EndDrawing()
```
:::

## Kaynak

[Odin Overview — resmi dil rehberi, Procedures](https://odin-lang.org/docs/overview/#procedures)
ve [aynı sayfanın Pointers bölümü](https://odin-lang.org/docs/overview/#pointers).
Procedure tanımının sözdizimi ve `^T` pointer parametresinin nasıl çalıştığı
burada.

## Daha derine

Ders bittikten sonra: [Game Loop — Robert Nystrom, Game Programming
Patterns](https://gameprogrammingpatterns.com/game-loop.html). Bir frame'in
“input al → update → render” sorumluluklarına neden ayrıldığını, bu ayrımın
render interpolation, sabit timestep ve birden çok kamera gibi ihtiyaçlar
büyüdüğünde nasıl genişlediğini anlatır. Bu dersin sınırı yalnızca bir
frame'in iki sorumluluğunu ayırmak; kitaptaki genişletmeler henüz Pong'un
ihtiyacı değil.

## Kazanım

Pong'un state'i tek bir update yolunda değişiyor, render ise onu yansıtıyor.

**“Pong 1.14 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu sınırın ayırdığı state'i oynarken okunur kılmak:
[1.15 — Debug overlay](/worlds/01-pong/15-debug-overlay).
