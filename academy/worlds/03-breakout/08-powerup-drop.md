---
title: "3.8 — Güçlendirmeyi düşür ve yakala"
description: "Tuğladan belirli bir olasılıkla düşen bir güçlendirmeyi raketle yakala ve süreli etkisini başlat."
section: Nesne ömrü
---

# 3.8 — Güçlendirmeyi düşür ve yakala

**Hedef:** Tuğla kırılınca bazen bir güçlendirme düşsün; raket onu yakalarsa
süreli bir etki başlasın.

## Görev

Tuğla kırıldığında belirli bir olasılıkla bir güçlendirme doğsun ve sabit hızla
aşağı insin. Raket ona değerse raket bir süreliğine genişlesin, süre dolunca
eski genişliğine dönsün. Yakalanmayan güçlendirme ekranın altından çıkınca
kaybolsun.

## Ne zaman bitti?

- Tuğla kırıldığında bazen — her seferinde değil — bir güçlendirme düşüyor.
- Güçlendirme sabit hızla aşağı iniyor.
- Raket ona değince raket genişliyor; genişleme geçici, süre dolunca geri
  dönüyor.
- Yakalanmayan güçlendirme ekranın altından çıkınca slotu boşaltıyor.
- `R` ile oyun sıfırlanınca havuz ve süre sayacı da temizleniyor.
- `odin check games/breakout` geçiyor.

## Elindekiler

3.7'deki havuz kalıbının ikinci kurulumu. Bu sefer nesne kendi başına yaşayıp
ölmüyor, oyuncuyla etkileşiyor. Struct ve imzalar aşağıda; **proc gövdeleri ve
bu procleri nereden çağıracağın sana ait.**

```odin
MAX_POWERUPS :: 4
POWERUP_DROP_CHANCE :: 0.2
POWERUP_SPEED :: 120
POWERUP_DURATION :: 6

Powerup :: struct {
	rect:  rl.Rectangle,
	alive: bool,
}

// Game'e eklenecek iki alan:
//   powerups:      [MAX_POWERUPS]Powerup,
//   powerup_timer: f32,

powerup_spawn :: proc(game: ^Game, pos: rl.Vector2) {
}

powerup_update :: proc(game: ^Game, dt: f32) {
}
```

Doğurma olasılığı için 3.7'de gördüğün `rand.float32_range(0, 1)` yeter: eşikten
küçükse doğur. Raket-güçlendirme çarpışması iki dikdörtgen kesişme testi, raylib
bunu hazır veriyor:

```odin
// vendor:raylib — CheckCollisionRecs :: proc(rec1, rec2: Rectangle) -> bool
if rl.CheckCollisionRecs(powerup.rect, game.player.rect) {
}
```

Süreli etkinin sayacı güçlendirmeye değil, `Game`'e ait: etki başlayınca
`POWERUP_DURATION`'a kurulur, her frame `dt` kadar azalır.

## Sınırlar

- Tek tür, tek etki: yalnız raketi genişletme. Çoklu top, yavaşlatma gibi
  türler bu dersin dışında.
- Güçlendirme tek bir küçük dikdörtgen; ikon veya sprite yok.

::: details İpucu 1 — `powerup_update`'in üç işi
Her frame, yaşayan her güçlendirme için sırayla: aşağı ilerlet; raketle
kesişiyor mu bak, kesişiyorsa etkiyi başlat ve slotu boşalt; ekranın altını
geçtiyse slotu boşalt.

Sayaç bundan bağımsız, aynı procün sonunda: sıfırdan büyükse `dt` kadar azalt;
azaltma sonucu sıfırın altına indiyse raketin genişliğini geri yaz.
:::

::: details İpucu 2 — Genişliği katlamak yerine yazmak
Yakalama anında raketi büyütürken `game.player.rect.width *= 1.5` yazmak
cazip ama hatalı: etki sürerken ikinci bir güçlendirme yakalanırsa genişlik
üst üste katlanır ve süre dolunca dönülecek tek bir “eski genişlik” kalmaz.

Genişliği her zaman sabitten hesapla — `PADDLE_WIDTH * 1.5` — ve geri
dönerken de sabite dön. Böylece kaç kez yakalandığı önemsizleşir.
:::

::: details İpucu 3 — Tam çözüm
```odin
powerup_spawn :: proc(game: ^Game, pos: rl.Vector2) {
	for &p in game.powerups {
		if p.alive do continue
		p.rect = {pos.x, pos.y, 16, 16}
		p.alive = true
		return
	}
}

powerup_update :: proc(game: ^Game, dt: f32) {
	for &p in game.powerups {
		if !p.alive do continue
		p.rect.y += POWERUP_SPEED * dt
		if rl.CheckCollisionRecs(p.rect, game.player.rect) {
			game.player.rect.width = PADDLE_WIDTH * 1.5
			game.powerup_timer = POWERUP_DURATION
			p.alive = false
		} else if p.rect.y > SCREEN_HEIGHT {
			p.alive = false
		}
	}
	if game.powerup_timer > 0 {
		game.powerup_timer -= dt
		if game.powerup_timer <= 0 do game.player.rect.width = PADDLE_WIDTH
	}
}
```

Doğurma çağrısı tuğlanın kırıldığı yere, `particle_spawn` çağrısının yanına
gidiyor; `powerup_update` ise `particle_update` ile aynı yerden çağrılıyor.
:::

## Kaynak

[Odin vendor:raylib binding referansı](https://pkg.odin-lang.org/vendor/raylib/) —
`#CheckCollisionRecs` anchor'ı. Bu dersin tek yeni çağrısı orada; imza kurulu
derleyicideki `vendor/raylib/raylib.odin` ile doğrulandı.

## Daha derine

Ders bittikten sonra: [Game Programming Patterns — Update
Method](https://gameprogrammingpatterns.com/update-method.html). Her nesnenin
kendi `update` adımıyla tek merkezi döngüde ilerletilmesi o bölümün konusu.

Bu derste bir sabit anlam değiştirdi. `PADDLE_WIDTH` artık “raketin genişliği”
değil, yalnız “başlangıç genişliği” ve “etki bitince dönülecek genişlik”.
Raketin **şu anki** genişliğini soran kod `game.player.rect`'e bakmalı. İkisini
karıştırmak, aynı anda iki farklı raket genişliği yaşayan bir hata sınıfı açar.

İkinci karar: etki sürerken ikinci güçlendirme yakalanırsa süre sıfırlanır mı,
uzar mı? Yukarıdaki model sıfırlıyor (`=`). Biriktirmek (`+=`) de geçerli;
hangisini seçtiysen incelemede gerekçesini sorarım.

## Kazanım

Havuz kalıbı bir kere öğrenilip iki farklı nesne türüne uygulandı — biri kendi
başına ölen, biri oyuncunun kararını etkileyen.

**“Breakout 3.8 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu havuzdaki bayat bir referansı görünür kılmak:
[3.9 — Ölü slota tutunan index](/worlds/03-breakout/09-stale-index).
