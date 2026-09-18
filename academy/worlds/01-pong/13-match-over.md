---
title: "1.13 — Maç sonu ve restart"
description: "Kazanma skorunda maçı bitir, kazananı göster ve R ile temiz bir yeni maç başlat."
section: Oynanış
---

# 1.13 — Maç sonu ve restart

**Hedef:** Maçın bittiği anı üçüncü bir state olarak tanımla, kazananı göster ve
`R` ile sıfırdan yeni bir maça dön.

## Görev

`Match_State`'e üçüncü üyeyi ekle: `Match_Over`. Kazanma hedefi için bir
constant tanımla. Skoru artırdığın yerde hedefe ulaşıldıysa state'i `Serving`
yerine `Match_Over` yap. `Match_Over` sırasında top hareket etmesin, skor
artmasın; ekranda kazananın kim olduğu yazsın. `R` her state'ten temiz bir
yeni maça dönsün: iki skor da sıfır, top merkezde, state `Serving`.

## Ne zaman bitti?

- Bir oyuncu `WIN_SCORE` değerine ulaştığında maç bitiyor ve top duruyor.
- Ekranda hangi oyuncunun kazandığı okunuyor.
- `R`, `Serving`, `Playing` ve `Match_Over` state'lerinin üçünden de
  sıfır-sıfır ve merkezdeki topla yeni bir maç başlatıyor.
- Yeni maç ilk servisi yine Space ile bekliyor.
- `odin check games/pong` geçiyor.

## Elindekiler

```odin
WIN_SCORE :: 5

Match_State :: enum {
	Serving,
	Playing,
	Match_Over,
}
```

Kazananın kimliğini ayrı bir field'da saklamana gerek yok; `Match_Over`
durumunda iki skoru karşılaştırmak yeterli bilgi verir
(`game.player_score > game.opponent_score`).

Restart bir state transition değil, state'in tamamının yeniden kurulmasıdır —
`R` kontrolü switch'in içine değil, switch'ten önceki bir satıra gider; hangi
state'te olursan ol aynı işi yapar.

## Sınırlar

- Kazanma hedefi sabit bir constant olsun; ayar menüsü veya config parametresi
  ekleme.
- Restart'ı tek yerde topla; iki ayrı `R` kontrolü biri zamanla diğerinden
  farklı bir maç kurar.
- `Match_Over` sırasında top update'i ve skor artışı çalışmamalı.
- Kazanan metni için `rl.DrawText` yeterli; menü veya geçiş efekti bu dersin
  konusu değil.

::: details İpucu 1 — Algoritma
Skoru artırdığın satırın hemen ardına kazanma kontrolünü ekle: skoru artan
oyuncunun skoru `WIN_SCORE`'a eşitse state'i `Match_Over` yap, aksi halde
`Serving`'e dön. Ayrıca her frame'in başında, switch'ten önce, `R`'ye
basıldı mı kontrol et; basıldıysa iki skoru sıfırla, topu merkeze koy, state'i
`Serving` yap. Bu blok switch'in dışında çalışır ki hangi state'te olursan ol
tetiklensin.
:::

::: details İpucu 2 — Yarım kalan top tuzağı
Skorları sıfırlarken topu unutma: yalnızca iki skoru sıfırlarsan yeni maç,
önceki maçın son servis yönüyle ve yarı yolda kalmış bir topla başlar. `R`
kontrolüne skorları sıfırlayan satırların yanına topu merkeze koyup hızını
sabit bir değerden kuran satırları da ekle — 1.11'deki reset ile aynı
atamalar.
:::

::: details İpucu 3 — Tam çözüm
```odin
// Playing kolunda, skor artırma satırlarının hemen ardına:
if game.opponent_score == WIN_SCORE {
	game.match_state = .Match_Over
}
if game.player_score == WIN_SCORE {
	game.match_state = .Match_Over
}
```
```odin
// switch'ten önce, her frame:
if rl.IsKeyPressed(.R) {
	game.player_score = 0
	game.opponent_score = 0
	game.ball.x = SCREEN_WIDTH / 2
	game.ball.y = SCREEN_HEIGHT / 2
	game.ball.velocity_x = 300.0
	game.ball.velocity_y = 180.0
	game.match_state = .Serving
}
```
```odin
// çizim kısmında, mevcut skor/saha çizimlerinin yanına:
if game.match_state == .Match_Over {
	winner := game.player_score > game.opponent_score ? "Player" : "AI"
	rl.DrawText(
		rl.TextFormat("%d - %d %s Won", game.player_score, game.opponent_score, winner),
		300, 200, 32, rl.WHITE,
	)
}
```
Üç blok da `main`'in aynı for döngüsünde kalır: ilki skor artırma dallarının
içine, ikincisi switch'ten önce, üçüncüsü BeginDrawing/EndDrawing arasına
gidiyor.
:::

## Kaynak

[Odin vendor:raylib binding referansı — `IsKeyPressed`](https://pkg.odin-lang.org/vendor/raylib/#IsKeyPressed).
`R` tuşunun `KeyboardKey` üyesi olarak yazılışı ve tek seferlik basış
semantiği burada.

## Daha derine

Ders bittikten sonra: [State — Robert Nystrom, Game Programming
Patterns](https://gameprogrammingpatterns.com/state.html). Üç state ve
aralarındaki geçişler artık küçük bir finite state machine; yeni durum
eklendiğinde hangi input'a ve hangi update'e izin verdiği tek `switch`'te
görünür kalır. State sayısı büyüdüğünde sorun `switch` değil, geçiş
kurallarının dağılmasıdır — Pong'un şimdilik buna ihtiyacı yok.

## Kazanım

Maç artık başlıyor, bitiyor ve yeniden başlıyor — Pong oynanabilir bir oyun.

**“Pong 1.13 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu büyüyen update kodunu çizimden ayırmak: [1.14 — Update ve render
sınırı](/worlds/01-pong/14-update-render).
