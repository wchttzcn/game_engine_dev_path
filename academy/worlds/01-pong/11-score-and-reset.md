---
title: "1.11 — Skor ve servis"
description: "Top saha dışına çıktığında skoru güncelle ve topu belirli bir yöne sıfırla."
section: Oynanış
---

# 1.11 — Skor ve servis

**Hedef:** Top sol veya sağ sınırı geçtiğinde doğru oyuncunun skorunu artırıp
topu belirli bir servis yönüyle yeniden oyuna sok.

## Görev

`Game` state'ine skor tutan iki alan ekle. Update'te topun tamamının sol veya
sağ sınırı geçtiğini kontrol et — sınırlar `SCREEN_WIDTH`'ten gelir. Sol
sınırdan çıkarsa sağ oyuncunun, sağ sınırdan çıkarsa sol oyuncunun skorunu
artır; ardından topu sahanın merkezine koy ve hızını kaybeden tarafa doğru
sabit bir değere ayarla. Skorları ekrana çiz.

## Ne zaman bitti?

- Top soldan çıkınca sağ skor bir artıyor; top sağdan çıkınca sol skor bir artıyor.
- Her skordan sonra top merkezde beliriyor ve kaybeden oyuncuya doğru ilerliyor.
- Skor ekranda okunuyor.
- `odin check games/pong` geçiyor.

## Elindekiler

```odin
// Game'e eklenecek alanlar:
//   player_score, opponent_score: i32,
```

Ekrana sayı çizmek raylib'in `cstring` beklediği ilk yer. Odin'in `string`'i
uzunluğunu kendi taşır; `cstring` C temsili, sonu `0` byte'ıyla biter. Kurulu
binding'deki imzalar:

```odin
DrawText :: proc(text: cstring, posX, posY: c.int, fontSize: c.int, color: Color)
TextFormat :: proc(text: cstring, args: ..any) -> cstring
```

`TextFormat` `i32`'yi `printf` biçimiyle (`%d`) `cstring`'e çevirir, sonucu
kendi sabit buffer'ına yazar — allocation yok. Buffer sayısı sınırlı
(`MAX_TEXTFORMAT_BUFFERS`, varsayılan `4`) ve sırayla döner; dönen `cstring`'i
saklama, aynı frame'de çiz.

```odin
rl.DrawText(rl.TextFormat("%d", game.player_score), 150, 40, 32, rl.WHITE)
```

## Sınırlar

- Sadece top tamamen sol/sağ sınırı geçince skoru artır; üst-alt duvar bu
  dersin konusu değil.
- Position/velocity atamasını iki dalda tekrarlama: çıkış tarafını bir servis
  yönü değişkenine (`-1`/`+1`) yaz, sıfırlamayı tek yerde yap.
- Servis hızı ve yönü deterministic kalsın; rastgelelik yok.
- 1.9'daki hız ayarı doğru olsun — rakip topu ıskalayabilmeli, yoksa sağ sınır
  hiç tetiklenmez.

::: details İpucu 1 — Algoritma
Topun sol kenarı `x - radius`, sağ kenarı `x + radius`. Sol kenar sıfırın
solundaysa top soldan tam çıkmış say, sağ oyuncunun skorunu artır ve servis
yönünü `-1` yap. Sağ kenar `SCREEN_WIDTH`'in sağındaysa top sağdan çıkmış
say, sol oyuncunun skorunu artır ve servis yönünü `1` yap. Bu iki kontrolden
sonra, servis yönü belirlendiyse topu merkeze koy ve hızını o yönle çarp.
:::

::: details İpucu 2 — Yakın kenar tuzağı
“Tamamen çıktı” demek topun **uzak** kenarına bakmak demek, yakın kenarına
değil. Yakın kenarı kullanırsan top duvara değer değmez skor sayılır ve
ekrandan hiç çıkmadan sıfırlanır — sekme ile skor birbirine karışır ve top
hiçbir zaman gerçekten dışarı çıkmaz.
:::

::: details İpucu 3 — Tam çözüm
```odin
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
}
```
Bu blok, topun hareketini güncellediğin satırların hemen ardına gidiyor —
henüz ayrı bir procedure yok, hepsi `main`'in for döngüsünde art arda çalışır.
:::

## Kaynak

[Odin vendor:raylib binding referansı](https://pkg.odin-lang.org/vendor/raylib/) —
`#DrawText` ve `#TextFormat` anchor'ları. Skoru çizerken hangi temsilin
beklendiğini (`cstring`, `string` değil) ve `TextFormat`'in sabit buffer
davranışını orada doğrula; imzalar kurulu derleyicideki
`vendor/raylib/raylib.odin` ile karşılaştırıldı.

## Kazanım

Sahanın sınır kuralını, skor state'ini ve tam reset'i birlikte kurdun. Reset
kuralı tek yerde durduğu için servis hızını değiştirmek istediğinde
değiştireceğin satır da tek.

**“Pong 1.11 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu kuralların maç içinde hangi sırayla geçerli olduğunu açıkça
tanımlamak: [1.12 — Servis state'i](/worlds/01-pong/12-serve-state).
