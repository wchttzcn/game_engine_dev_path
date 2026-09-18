---
title: "3.3 — Duvar ve raket sekmesi"
description: "Topu üç duvardan sektir, rakete çarpınca geri gönder ve alt kenardan düşünce kaybettir."
section: Breakout iskeleti
---

# 3.3 — Duvar ve raket sekmesi

**Hedef:** Topu sol, sağ ve üst duvardan sektir; rakete çarpınca yukarı
gönder; alt kenardan düşerse kaybettir.

## Görev

Topun konumunu her frame üç duvara karşı kontrol et ve çarptığı eksenin
velocity'sini ters çevir. Rakete çarptığında `vel.y`'yi ters çevir. Top alt
kenarın altına inerse `Game_State`'i `Lost` yap, ekranda kaybettiğini yazan
bir metin göster. `R` oyunu baştan kursun.

## Ne zaman bitti?

- Top sol, sağ ve üst duvardan sekiyor; hiçbirinin içine gömülmüyor.
- Top rakete çarpınca yukarı dönüyor.
- Top alt kenardan çıkınca state `Lost` oluyor ve ekranda görünüyor.
- `R` topu ve raketi başlangıç konumuna döndürüp state'i `Playing` yapıyor.
- `odin check games/breakout` geçiyor.

## Elindekiler

`Game`'e eklenecek alan: `state: Game_State`.

```odin
Game_State :: enum {
	Playing,
	Lost,
}

draw_center_text :: proc(text: cstring, font_size: i32, color: rl.Color) {
}
```

`draw_center_text` `rl.DrawText`'i sarıyor ama metni ortalıyor.
`rl.MeasureText(text, font_size) -> c.int` metnin pixel genişliğini veriyor —
bu derste ilk kez kullandığın çağrı. Raket–top çarpışması için
`rl.CheckCollisionCircleRec(center, radius, rec)`'i Pong'dan biliyorsun.

## Sınırlar

- Raketin neresine çarpıldığının açıyı değiştirmesi bu derste yok; `vel.y`'yi
  çevirmek yeterli.
- Can sayısı, skor veya seviye yok. Tek düşüş, tek kayıp. Tuğla hâlâ yok.

::: details İpucu 1 — Üç duvar, tek soru
Her duvar için sorduğun soru aynı: topun o kenardaki ucu sınırı geçti mi? Sol
için `pos.x - radius`, sağ için `pos.x + radius`, üst için `pos.y - radius`.
Geçtiyse ilgili velocity bileşenini ters çevir **ve** konumu sınıra sabitle —
yalnızca işareti çevirmek topu duvarın içinde bırakabilir.
:::

::: details İpucu 2 — Raketin içinde kilitlenen top
Raket çarpışmasını yalnızca `vel.y > 0` iken, yani top aşağı inerken kabul
et. Bu koşulu atlarsan, rakete değen top her frame işaret çevirip yerinde
titrer — yukarı giden top da aynı karede tekrar çarpışmaya girer.
:::

::: details İpucu 3 — Tam çözüm
```odin
if game.ball.pos.x - game.ball.radius < 0 {
	game.ball.pos.x = game.ball.radius
	game.ball.vel.x = -game.ball.vel.x
}
if game.ball.pos.x + game.ball.radius > SCREEN_WIDTH {
	game.ball.pos.x = SCREEN_WIDTH - game.ball.radius
	game.ball.vel.x = -game.ball.vel.x
}
if game.ball.pos.y - game.ball.radius < 0 {
	game.ball.pos.y = game.ball.radius
	game.ball.vel.y = -game.ball.vel.y
}
if game.ball.pos.y + game.ball.radius > SCREEN_HEIGHT {
	game.state = .Lost
}

if game.ball.vel.y > 0 &&
   rl.CheckCollisionCircleRec(game.ball.pos, game.ball.radius, game.player.rect) {
	game.ball.pos.y = game.player.rect.y - game.ball.radius
	game.ball.vel.y = -game.ball.vel.y
}
```
```odin
draw_center_text :: proc(text: cstring, font_size: i32, color: rl.Color) {
	text_x := SCREEN_WIDTH / 2 - rl.MeasureText(text, font_size) / 2
	rl.DrawText(text, text_x, SCREEN_HEIGHT / 2, font_size, color)
}
```
Duvar ve raket kontrolleri `case .Playing:` içine, top güncellemesinden hemen
sonra giriyor. `draw_center_text` çizim bölümünde `game.state` üzerinden bir
`switch` ile çağrılıyor; `R` kontrolü ise bu `switch`'ten önce durup her
state'ten `game_reset`'i çağırıyor.
:::

## Kaynak

[Odin vendor:raylib binding referansı](https://pkg.odin-lang.org/vendor/raylib/) —
`#MeasureText` anchor'ı. Metni ortalamak için gereken pixel genişliği bu
çağrıdan geliyor; parametre sırası ve dönüş tipi burada doğrulandı.

## Daha derine

Çarpışmayı frame frame örneklediğin için topu tam temas anında değil, biraz
geçtikten sonra yakalıyorsun. Sadece velocity'yi çevirmek “artık ters yöne
gidiyorum” der ama “hâlâ içerideyim” gerçeğini değiştirmez; hızlı topta bir
sonraki frame de içeride biter ve ikinci bir çevirme olur — tünel etkisinin
küçük kardeşi diyebilirsin. Konumu sınıra sabitlemek, durumu çarpışma anının
fiziksel olarak geçerli olduğu yere geri koyuyor.
[MDN — 2D collision detection](https://developer.mozilla.org/en-US/docs/Games/Techniques/2D_collision_detection)
bu örnekleme sorununu JavaScript arka planından anlatıyor.

## Kazanım

Breakout artık oynanabilir bir döngüye sahip — top sahnede kalıyor, raket
onu tutuyor, kaçırırsan kaybediyorsun. Eksik olan tek şey oynamak için bir
sebep: vurulacak bir şey.

**“Breakout 3.3 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım sahneye vurulacak bir şey koymak: [3.4 — Tuğla duvarını kur](/worlds/03-breakout/04-brick-wall).
