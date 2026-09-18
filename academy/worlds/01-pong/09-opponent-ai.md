---
title: "1.9 — Rakip kendi kendine hareket etsin"
description: "Rakip raketin topun y konumuna kontrollü, titremeden yaklaşmasını sağla."
section: Oynanış
---

# 1.9 — Rakip kendi kendine hareket etsin

**Hedef:** Sağ raketi topun `y` konumuna doğru, sınırlı hızla ve titremeden
hareket ettir.

## Görev

Sağ paddle için opponent hareketini yaz. Raketin merkezini topun merkeziyle
karşılaştır: top yeterince üstteyse raket aşağı, yeterince alttaysa yukarı
gitsin, ikisi arasındaysa hiç hareket etmesin. “Yeterince”yi bir eşik sabitiyle
belirle — İpucu 2 bu eşiğin neden gerektiğini türetiyor. Hareketi
`opponent.speed * dt` ile ölçekle, sonunda `game.opponent.y`'yi ekranın
sınırları içinde tut.

## Ne zaman bitti?

- Sağ paddle topun dikey hareketini takip ediyor.
- Raket pencerenin üstünden veya altından taşmıyor.
- Hareket `dt` ile ölçekleniyor, frame rate'ten bağımsız.
- Top dikeyde durduğunda raket hedefin etrafında titremiyor.
- Rakip topun tam merkezine anında teleport etmiyor.
- `odin check games/pong` geçiyor.

## Elindekiler

```odin
OPPONENT_DEAD_ZONE :: 10.0
```

Bu, raketin “hedefe yeterince yakın” sayılacağı mesafe — değerin neden bu
olduğunu İpucu 2 türetiyor. `Paddle`'ın `speed` field'ı 1.3'ten beri var;
opponent için de aynı field'ı kullanacaksın.

Sınırı tutan builtin:

```odin
// clamp :: proc(value, minimum, maximum: T) -> T
x = clamp(x, 0, 100)
```

`clamp` generic ve import gerektirmez; `value` sınırın altında veya üstündeyse
en yakın sınıra çeker.

## Sınırlar

Rakip sadece topun güncel `y`'sini takip etsin; prediction, reaction delay
veya farklı zorluk seviyeleri ekleme. Rakibin hızını bu derste değiştirme — o
ayar 1.10'un konusu.

::: details İpucu 1 — Merkezleri karşılaştır
`game.opponent.y` paddle'ın üst kenarı, merkezi değil. Ayrı bir yerel
değişkende `opponent_center := game.opponent.y + game.opponent.height / 2`
hesapla, sonra `diff := game.ball.y - opponent_center` yap. `diff`
`OPPONENT_DEAD_ZONE`'dan büyükse aşağı, `-OPPONENT_DEAD_ZONE`'dan küçükse
yukarı hareket ettir; ikisi arasındaysa hiçbir şey yapma. Hareketi hâlâ
`game.opponent.y`'ye uygularsın, `opponent_center`'a değil.
:::

::: details İpucu 2 — Titremenin sebebi
Sadece iki dal (“üstteyse aşağı, alttaysa yukarı”) raketi hedefin etrafında
sonsuza kadar sallar: her frame'de tam `speed * dt` kadar yol alınır, daha
azı alınamaz. `speed` `400`, 60 fps'te `dt` ≈ `0.0167` iken adım ≈ **6.7
pixel** — raket hedefi bu adımdan küçük bir farkla asla tam tutturamaz. Eşik
bu adımdan büyük olmalı; küçük seçilirse titreme sürer. `10.0` bu adım için
rahat bir seçim.
:::

::: details İpucu 3 — Tam çözüm
```odin
opponent_center := game.opponent.y + game.opponent.height / 2
diff := game.ball.y - opponent_center
if diff > OPPONENT_DEAD_ZONE {
	game.opponent.y += game.opponent.speed * dt
} else if diff < -OPPONENT_DEAD_ZONE {
	game.opponent.y -= game.opponent.speed * dt
}
game.opponent.y = clamp(game.opponent.y, 0, SCREEN_HEIGHT - game.opponent.height)
```
Bu blok ana döngüde, player'ın kendi clamp'inden hemen sonra gidiyor —
sınır kontrolü hareketin hemen ardında, çizimden önce olmalı. (`update_game`
procedure'ı henüz yok; o ayrım 1.14'ün konusu.)
:::

## Kaynak

[Odin builtin procedure'ları](https://pkg.odin-lang.org/base/builtin/).
`clamp` burada; import gerektirmeyen, sınır içinde tutma için kullandığın
builtin.

## Kazanım

Hedefe yönelen, `dt` kullanan ve oyun alanı sınırını `clamp` ile tek yerde
tutan bir AI controller yazdın.

**“Pong 1.9 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım: [1.10 — Rakibin zorluğu](/worlds/01-pong/10-opponent-difficulty).
