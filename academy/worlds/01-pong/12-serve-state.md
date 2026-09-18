---
title: "1.12 — Servis state'i"
description: "1.11'in otomatik servisini Serving ve Playing state'lerine bağla; servisi Space başlatsın."
section: Oynanış
---

# 1.12 — Servis state'i

**Hedef:** Skor sonrası topun ne zaman hareket ettiğini skordan türetmeyi bırak;
bunu `Serving` ve `Playing` state'leriyle açıkça söyle.

## Görev

1.11'deki reset kodu topu merkeze koyup **hemen** velocity veriyor; bu dersin
işi o kararı görünür kılmak. `Game`'e `match_state` alanını ekle, maç
`Serving` ile başlasın. Update'te `switch` ile dallan: `Serving`'de top durur,
skor işlemez, yalnız Space beklenir; Space'e basılınca state `Playing` olur.
`Playing`'de top hareketi, collision ve skor kuralları çalışır. Skor artınca
reset kodunu çalıştır, state'i yeniden `Serving` yap.

## Ne zaman bitti?

- Oyun açıldığında top merkezde duruyor; Space'e basılana kadar kıpırdamıyor.
- Space topu 1.11'in belirlediği yöne gönderiyor ve state `Playing` oluyor.
- Skordan sonra top merkeze dönüyor ve yeniden Space bekliyor.
- `Serving` sırasında ne top hareket ediyor ne de skor artıyor.
- `odin check games/pong` geçiyor.

## Elindekiler

```odin
Match_State :: enum {
	Serving,
	Playing,
}

// Game'e eklenecek alan:
//   match_state: Match_State,
```

Odin'de enum üyesine, tip beklenen yerde baştan nokta ile ulaşırsın:
`Match_State.Serving` yerine `.Serving` yeter; `switch` de aynı biçimi kabul
eder.

```odin
switch game.match_state {
case .Serving:
	// yalnızca Space bekleniyor
case .Playing:
	// top hareketi, collision ve skor buraya
}
```

`case` kolları kendiliğinden sonlanır, `break` yazmazsın. Tek seferlik input
için:

```odin
IsKeyPressed :: proc(key: KeyboardKey) -> bool
```

`rl.IsKeyPressed(.SPACE)` yalnızca tuşa basılan frame'de `true` döner;
`IsKeyDown` her frame `true` kalır ve geçişi tekrar tekrar tetikler.

## Sınırlar

- Durumları enum ile temsil et, boolean'larla değil — iki boolean dört
  kombinasyon üretir, ikisi anlamsız.
- Tip ve üyeler Ada_Case yazılır (`Match_State`, `Serving`);
  SCREAMING_SNAKE_CASE Odin'de constant'a ayrılmıştır.
- Maç sonu bu dersin konusu değil; `Match_Over` sonraki derste gelir.
- 1.11'in deterministic servis yönü kuralı aynı kalsın; rastgelelik ekleme.

::: details İpucu 1 — Algoritma
`match_state` alanını `Game` içine koy, maç `Serving` ile başlasın. Update'te
`switch game.match_state` ile dallan. `Serving` kolunda yalnız Space kontrolü
olsun: basıldıysa state'i `Playing` yap, başka bir şey yapma. `Playing`
kolunda 1.5–1.11'de yazdığın top hareketi, collision ve skor kodu olduğu gibi
kalsın. Skoru artırdığın satırın hemen ardına state'i yeniden `Serving` yapan
satırı ekle.
:::

::: details İpucu 2 — Tek seferlik input tuzağı
Servis girişi tek seferlik bir olay: `rl.IsKeyPressed(.SPACE)` yalnız tuşa
basılan frame'de `true` döner. `IsKeyDown` kullanırsan tuş basılı tutulduğu
her frame `Playing`'e geçiş tekrar tetiklenir; şimdilik fark etmez ama ileride
kontrolsüz yan etkiler üretir. Doğru API seçimi geçişi tek frame'e sabitler.
:::

::: details İpucu 3 — Tam çözüm
```odin
switch game.match_state {
case .Serving:
	if rl.IsKeyPressed(.SPACE) {
		game.match_state = .Playing
	}
case .Playing:
	// ... top hareketi, collision (1.5-1.10) burada kalır ...
	dir := f32(0)
	if game.ball.x + game.ball.radius < 0 {
		game.opponent_score += 1
		dir = -1
	}
	if game.ball.x - game.ball.radius > SCREEN_WIDTH {
		game.player_score += 1
		dir = 1
	}
	if dir != 0 {
		game.ball.x = SCREEN_WIDTH / 2
		game.ball.y = SCREEN_HEIGHT / 2
		game.ball.velocity_x = 300.0 * dir
		game.ball.velocity_y = 180.0
		game.match_state = .Serving
	}
}
```
Bu switch, 1.11'de yazdığın skor/reset kodunu `case .Playing` içine taşır;
`case .Serving`'i onun üstüne ekle. `Game` literal'ında `match_state = .Serving`
zaten var, ek bir kurulum gerekmiyor.
:::

## Kaynak

[Odin Overview — resmi dil rehberi](https://odin-lang.org/docs/overview/#switch-statement).
`enum` ve `switch` sözdiziminin dile ait tanımı burada; `Match_State`'in
üyelerine nokta ile ulaşma biçimi aynı sayfanın `#enumerations` bölümünde.

## Daha derine

Ders bittikten sonra: [State — Robert Nystrom, Game Programming
Patterns](https://gameprogrammingpatterns.com/state.html). Finite state
machine'in enum ve `switch` ile en yalın kurulumu burada; bölümün ilerisi
nesne tabanlı varyantlara gider, Pong'un ihtiyacı ilk kısımdır.

Türetilmiş state, kaynağı ile arasındaki kuralı her okuyan yerde yeniden
yazmanı ister: `player_score == 0 && opponent_score == 0` “maç yeni başladı”
demek olabilir ama skor sonrası bekleyişi anlatamaz. Saklanan state tek yerde
değişir, her okuyan aynı cevabı görür. Kural: bilgi input'tan veya zamandan
doğuyorsa sakla; mevcut state'ten her seferinde aynı şekilde hesaplanıyorsa
türet.

Adlandırmanın dayanağı [Odin adlandırma
konvansiyonu](https://github.com/odin-lang/Odin/blob/master/base/runtime/core.odin):
tip ve enum üyesi Ada_Case, constant SCREAMING_SNAKE_CASE.

## Kazanım

Maçın en belirsiz anı — “top ne zaman kalkar?” — artık kodda yazılı, örtük bir
koşuldan türetilmiyor.

**“Pong 1.12 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım aynı enum'a maçın sonunu eklemek: [1.13 — Maç sonu ve
restart](/worlds/01-pong/13-match-over).
