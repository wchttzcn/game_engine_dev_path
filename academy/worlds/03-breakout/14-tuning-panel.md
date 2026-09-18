---
title: "3.14 — F1 ayar paneli"
description: "3.10-3.13'ün sabitlerini tek bir Tuning struct'ında topla ve F1 ile açılan raygui panelinden runtime'da değiştir."
section: Runtime tuning
---

# 3.14 — F1 ayar paneli

**Hedef:** Oyun hissini belirleyen sabitleri tek bir `Tuning` struct'ında topla
ve `F1` ile açılan bir panelden bu değerleri oyunu kapatmadan değiştir.

## Görev

3.10-3.13'te yazdığın sayıları — hitstop süresi, trauma miktarı, parçacık
ömrü, pitch aralığı, top hızı — tek bir `Tuning` struct'ında topla, `Game`'e
ekle, ve kodun her yerini bu struct'tan okuyacak şekilde değiştir. Sonra `F1`
ile açılıp kapanan bir panel çiz; panelin slider'ları struct'ın alanlarını
doğrudan değiştirsin.

## Ne zaman bitti?

- `Tuning` adında bir struct var: hitstop süresi, trauma miktarı, parçacık
  ömrü, pitch aralığı, top hızı alan olarak tutuluyor.
- `Game` içinde bir `tuning: Tuning` alanı var.
- Hitstop, kamera sarsıntısı, parçacık ömrü, ses pitch'i ve top hızı kodun
  hiçbir yerinde artık sabit okumuyor; hepsi `game.tuning`'den okuyor.
- `F1` panel açıp kapatıyor.
- Panel açıkken bir slider'ı sürüklediğinde oyunun hissi anında değişiyor.
- Panel sahne kamerasının dışında çiziliyor; 3.11'in sarsıntısı panelin
  kendisini sallamıyor.
- `odin check games/breakout` geçiyor.

## Elindekiler

raygui Odin tarafında ayrı bir paket değil — `vendor:raylib`'in bir dosyası,
hâlâ `import rl "vendor:raylib"` ile çağrılır, ek kurulum yok.

```odin
GuiSlider :: proc(bounds: Rectangle, textLeft: cstring, textRight: cstring, value: ^f32, minValue: f32, maxValue: f32) -> c.int
```

`value` bir `^f32`; sürüklediğin anda **yerinde** değişir, dönen değer çoğu
zaman yok sayılır:

```odin
rl.GuiSlider(rl.Rectangle{20, 50, 200, 20}, "az", "çok", &game.tuning.trauma_on_hit, 0, 1)
```

Struct, `Game`'e eklenecek iki alan, ve doldurman gereken procedure:

```odin
Tuning :: struct {
	hitstop_duration:  f32,
	trauma_on_hit:     f32,
	trauma_decay:      f32,
	particle_lifetime: f32,
	pitch_min:         f32,
	pitch_max:         f32,
	ball_speed:        f32,
}

// Game'e eklenecek iki alan:
//   tuning:            Tuning,
//   show_tuning_panel: bool,

tuning_defaults :: proc() -> Tuning {
}
```

## Sınırlar

- raygui'nin görsel teması (renk, stil) konu değil; varsayılan görünüm
  yeterli.
- Panele yeni bir tuning parametresi eklemek zorunlu değil; görev yalnızca
  zaten var olan sabitleri struct'a taşımak ve onlara panelden erişmek.
- İki farklı ayar profili tutmak bu dersin konusu değil; sıradaki derste
  geliyor.

::: details İpucu 1 — Hangi sabitleri topluyorsun
3.10'un hitstop süresi, 3.11'in trauma miktarı ve sönmesi, parçacık ömrü,
3.13'ün pitch aralığı, top hızının bugünkü büyüklüğü — hepsi `tuning_defaults`
içinde birer alana yazılır, `game_reset` bu değeri `game.tuning`'e atar. Top
hızı bir `Vector2` değil `f32`: yönü sabit tutup büyüklüğü
`game.tuning.ball_speed`'den oku — `vel = normalize(yön) * game.tuning.ball_speed`.
:::

::: details İpucu 2 — Paneli kameranın neresine çiziyorsun
Panel çizimini `rl.BeginMode2D`/`rl.EndMode2D` çiftinin içine koymak cazip,
çünkü çizim kodu zaten orada — ama o çift içinde çizilen her şey kameranın
`offset`/`zoom`'undan geçer, 3.11'in sarsıntısı da bu dönüşümden geliyordu.
Panel içeride kalırsa hem sarsıntıyla sallanır hem tıkladığın ekran
koordinatı artık sahne koordinatıyla örtüşmediği için slider'a tıklayamaz hâle
gelirsin. Paneli `rl.EndMode2D()`'den sonra çiz.
:::

::: details İpucu 3 — Tam çözüm
```odin
tuning_defaults :: proc() -> Tuning {
	return {
		hitstop_duration  = HITSTOP_DURATION,
		trauma_on_hit     = TRAUMA_ON_HIT,
		trauma_decay      = TRAUMA_DECAY,
		particle_lifetime = 1.0,
		pitch_min         = 0.95,
		pitch_max         = 1.05,
		ball_speed        = 340,
	}
}
```
`game_reset` içinde: `game.tuning = tuning_defaults()`. Açma/kapama:
`if rl.IsKeyPressed(.F1) { game.show_tuning_panel = !game.show_tuning_panel }`.
Çizim, `rl.EndMode2D()`'den sonra:
```odin
if game.show_tuning_panel {
	rl.GuiSlider(rl.Rectangle{20, 50, 200, 20}, "az", "çok", &game.tuning.trauma_on_hit, 0, 1)
	// diğer alanlar için aynı desen, ayrı bir dikdörtgen ve etiketle
}
```
:::

## Kaynak

[raygui — raysan5'in immediate-mode GUI kütüphanesi](https://github.com/raysan5/raygui)
(`RESOURCES.md`). Kütüphanenin control listesi buradan; Odin tarafında ayrı
paket olmayıp `vendor:raylib` içinde geldiği kurulu derleyiciyle derlenip
link edilerek doğrulandı.

## Daha derine

Retained mode bir GUI kütüphanesinde widget'lar kendi state'ini tutan, bir
kere kurulan nesnelerdir. Immediate mode'da widget diye bir nesne yok:
`GuiSlider` her frame yeniden çağrılan bir procedure, kendi hafızası yok, sen
ne veriyorsan onu okuyup çiziyor. Bedeli, odak yönetimi ve karmaşık layout
gibi şeyleri kendin kurman; kazancı, bir debug/tuning aracı için bakım
maliyetinin neredeyse sıfır olması — yeni bir alan eklemek yeni bir `GuiSlider`
çağrısı ve struct'a bir field.

Kurulu derleyicinin `vendor/` koleksiyonunda Dear ImGui yok; `microui` ve
`raylib/raygui.odin` var. Oyun zaten raylib'e bağlı olduğu için raygui sıfır
ek kurulumla geliyor — Dear ImGui'ye dönme kararı ancak raygui'nin yetmediği
somut bir araç ihtiyacı çıkarsa verilir.

## Kazanım

Artık oyunun hissini oyunu kapatmadan, canlı canlı ayarlayabiliyorsun. Bu,
`Tuning` struct'ının tek doğruluk kaynağı olmasıyla mümkün oldu. Sıradaki ders
bu struct'ın bir değer olmasının asıl gücünü gösterecek: aynı struct'tan iki
farklı kopya tutup aralarında geçiş yapabilirsin.

**“Breakout 3.14 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım aynı struct'tan iki farklı his profili çıkarmak:
[3.15 — İki profil, aynı karşılaşma](/worlds/03-breakout/15-two-profiles).
