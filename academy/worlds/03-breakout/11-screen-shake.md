---
title: "3.11 — Kamera sarsıntısı"
description: "Vuruşta ekranı sarsan, tek bir trauma değerinden türeyen ve zamanla sönen bir kamera kur."
section: Oyun hissi
---

# 3.11 — Kamera sarsıntısı

**Hedef:** Tuğla kırıldığında ekranı kısa bir süre sarsan, `rl.Camera2D` ile
çizilen bir sahne kur.

## Görev

`Game`'e `trauma: f32` ekle, `0..1` aralığında tut. Tuğla kırılınca artır,
her frame zamanla azalt. Sarsıntı büyüklüğünü `trauma`'nın karesinden türet
ve bir `rl.Camera2D`'nin `offset`'ine rastgele kayma olarak uygula. Sahneyi
bu kamerayla çiz; kazandın/kaybettin metni kameranın dışında, sarsılmadan
kalsın.

## Ne zaman bitti?

- Tuğla kırıldığında ekran kısa bir süre sarsılıyor, sonra sakinleşiyor.
- Sarsıntı ani sıçramayla değil, `trauma` azaldıkça küçülerek sönüyor.
- `trauma` küçükken sarsıntı hafif, büyükken belirgin.
- Kazandın/kaybettin metni sarsılmıyor; yalnız oyun sahnesi sarsılıyor.
- `odin check games/breakout` geçiyor.

## Elindekiler

```odin
// Game'e eklenecek alan:
//   trauma: f32,

TRAUMA_ON_HIT    :: 0.3
TRAUMA_DECAY     :: 1.5
MAX_SHAKE_OFFSET :: 10
```

`rl.Camera2D` ilk kez kullandığın bir tür:

```odin
Camera2D :: struct {
	offset:   Vector2, // hedeften kayma
	target:   Vector2, // bakılan nokta
	rotation: f32,     // derece
	zoom:     f32,     // ölçek
}
```

Sahneyi bu kamerayla çizmek için ilgili çizim çağrılarını
`rl.BeginMode2D`/`rl.EndMode2D` arasına alırsın:

```odin
// vendor:raylib — BeginMode2D :: proc(camera: Camera2D) ---
// vendor:raylib — EndMode2D :: proc() ---
rl.BeginMode2D(camera)
// ...
rl.EndMode2D()
```

`rand.float32_range` 3.7'den tanıdık; `min`/`max` builtin'leri sınırlama
için yeter.

## Sınırlar

- Kamera dönüşü (`rotation`) bu derste kullanılmıyor; yalnız pozisyon
  kayması yeterli.
- `zoom` sarsıntı için oynatılmıyor; sabit `1.0` kalıyor.

::: details İpucu 1 — Trauma'dan kamerayı kurmanın adımları
Tuğla kırılınca `trauma`'yı bir miktar artır, `1.0`'ı aşmasın. Her frame
zamanla azalt, `0.0`'ın altına düşmesin. Büyüklüğü `trauma`'nın karesi (veya
küpü) olarak hesapla — küçük tetiklenmeler neredeyse hissedilmez kalır,
büyükler belirgin kalır. İki eksende ayrı rastgele sayı çekip büyüklükle
ölçekle, kameranın `offset`'ine ekle. Çizimi `BeginMode2D`/`EndMode2D`
arasına al; UI dışında kalsın.
:::

::: details İpucu 2 — zoom'u unutma
Odin'de bir compound literal yazılmayan alanı sıfırlar. `Camera2D` değerini
`{offset = ..., target = ...}` gibi kurup `zoom`'u hiç yazmazsan sıfır kalır
— sıfır zoom demek her şeyin sıfır boyuta küçülmesi demek, ekran tamamen boş
görünür, hata mesajı vermez. `zoom` mutlaka `1.0` olarak set edilmeli. Aynı
tuzağın 3.3'teki `rect` alan sıfırlamasıyla aynı ailesi.
:::

::: details İpucu 3 — Tam çözüm
```odin
camera := rl.Camera2D{
	target = {SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2},
	zoom   = 1.0,
}

shake := game.trauma * game.trauma
offset_x := rand.float32_range(-1, 1) * shake * MAX_SHAKE_OFFSET
offset_y := rand.float32_range(-1, 1) * shake * MAX_SHAKE_OFFSET
camera.offset = {SCREEN_WIDTH / 2 + offset_x, SCREEN_HEIGHT / 2 + offset_y}

rl.BeginDrawing()
rl.ClearBackground(rl.BLACK)
rl.BeginMode2D(camera)
// mevcut tuğla/top/raket çizimi
rl.EndMode2D()
switch game.state {
case .Playing:
case .Lost:
	draw_center_text(...)
case .Won:
	draw_center_text(...)
}
rl.EndDrawing()
```
Tuğla kırılma noktasında `game.trauma = min(game.trauma + TRAUMA_ON_HIT, 1.0)`
satırını ekle. Sönmeyi state `switch`'inin dışına koy, her frame çalışsın:
`game.trauma = max(game.trauma - TRAUMA_DECAY * dt, 0.0)`. `.Playing`'in içine
koyarsan son tuğlada kazanınca `trauma` sıfırlanmadan donar ve kazandın ekranı
sonsuza dek titrer.
:::

## Kaynak

[Odin vendor:raylib binding referansı](https://pkg.odin-lang.org/vendor/raylib/),
`#Camera2D` ve `#BeginMode2D` anchor'ları. Bu dersin yeni türü ve yeni
çağrıları orada; imzalar kurulu derleyicideki `vendor/raylib/raylib.odin`
ile doğrulandı.

## Daha derine

Ders bittikten sonra: [Squirrel Eiserloh — Math for Game Programmers:
Juicing Your Cameras With Math (GDC 2016)](https://archive.org/details/GDC2016Eiserloh).
`trauma` fikri — ayrı efektler yerine tek bir `0..1` değeri tutup zamanla
söndürmek, sarsıntı büyüklüğünü bu değerin karesi/küpü olarak almak —
doğrudan bu konuşmadan geliyor.

`rand.float32_range(-1, 1)` her frame bağımsız bir sayı üretir, kamera
frame'den frame'e rastgele zıplar. Perlin noise bunun yerine zamanın sürekli
bir fonksiyonu olarak yumuşak bir yol çizer; Eiserloh ve Vlambeer'in [The Art
of Screenshake](https://archive.org/details/the-art-of-screenshake) konuşması
ikisi de bunu öneriyor çünkü saf rastgelelik göz için titreşim gibi okunur.
Bu derste saf rastgele yeterli; fark küçük kırılmalarda ayırt edilmiyor.
Eiserloh ayrıca `rotation`'ı da sarsıntıya katmayı öneriyor — Breakout'un
küçük, dikdörtgen sahnesinde bu ekstra karmaşıklığa değecek görsel kazanç
getirmiyor.

## Kazanım

Artık iki katmanlı bir geri bildirim sistemin var: hitstop vuruşu
durduruyor, kamera sarsıntısı hissettiriyor. İkisi de aynı olaydan
tetikleniyor ama bağımsız sayaçlarla yaşıyor — birini kapatıp diğerini açık
bırakarak hangisinin ne kattığını karşılaştırabilirsin.

**“Breakout 3.11 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım vuruşun zaman içindeki şekline bakmak: [3.12 — Eğriler](/worlds/03-breakout/12-easing-curves).
