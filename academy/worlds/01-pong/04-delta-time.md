---
title: "1.4 — Delta time"
description: "Raket hızını frame sayısından saniyeye bağla."
section: Temel hareket
---

# 1.4 — Delta time

**Hedef:** Raket hızını “frame başına pixel” yerine “saniye başına pixel”
olarak tanımla.

## Görev

Player hareketini delta time'a çevir. Hızı pixel/saniye cinsinden adlandırılmış
bir değerde tut ve W/S güncellemesinde bu hızı frame süresiyle çarp. Önceki
dersin sınır kontrolleri aynı kalsın. Oyun 60 FPS hedeflese de hesap frame
sayısına bağlı kalmasın.

## Ne zaman bitti?

- Hızın anlamı kodda açık: pixel/saniye cinsinden adlandırılmış bir değer var.
- Her frame `rl.GetFrameTime()` çağrılıyor ve hareket bununla çarpılıyor.
- W/S ile hareket sürüyor, raket ekran dışına taşmıyor.
- `odin check games/pong` geçiyor.

## Elindekiler

Bir frame'in süresi `dt` ise o frame'de alınan yol `hız × dt`. 60 FPS'te `dt`
yaklaşık `1/60` saniye, yani `400` pixel/saniye hız o frame'de ≈ `6.67` pixel
eder. FPS düşünce frame uzar ve aynı gerçek zamanda toplam mesafe korunur.

Frame süresini veren çağrı:

```odin
// vendor:raylib — GetFrameTime :: proc() -> f32
// Son frame'in süresi, saniye cinsinden.
dt := rl.GetFrameTime()
```

Hızı taşıyacak sabit — `game.player.speed` alanı da olabilir, dosya seviyesinde
bir sabit de:

```odin
PLAYER_SPEED :: 400.0
```

`game.player.y` zaten `f32`; çarpım dönüşüm istemez.

## Sınırlar

- Bu ders variable timestep kuruyor. Fixed timestep, frame-time spike limiti ve
  yeniden kullanılabilir update API'si gerçek physics ihtiyacıyla gelecek.
- Yalnız player hareketinin birimini düzelt; top ve rakip bu derste yok.

::: details İpucu 1 — Nereden başlar
Döngünün ilk satırında frame süresini bir yerel değişkene al; aynı frame'de
birden çok yerde kullanacaksan iki kez çağırma, tek değeri paylaş. Sonra
input bloğundaki sabit miktarı hız ile bu değerin çarpımına çevir. Sınır
kontrolleri olduğu gibi kalır; onlar mesafeyle değil sonuç konumuyla
ilgileniyor.
:::

::: details İpucu 2 — Hedef FPS hız kontrolü değildir
`rl.SetTargetFPS(60)` döngüyü o aralıkta tutmaya *çalışır*, hızın birimi
değildir. Pencere taşınırken, debugger dururken veya makine başka iş
yaparken frame süresi değişir. Sabit miktarla hareket eden bir raket o
anlarda yavaşlar ya da fırlar; `dt` bu farkı state güncellemesine taşıdığı
için hareket aynı kalır.
:::

::: details İpucu 3 — Tam çözüm
```odin
for !rl.WindowShouldClose() {
	dt := rl.GetFrameTime()

	if rl.IsKeyDown(.W) {
		game.player.y -= game.player.speed * dt
	}
	if rl.IsKeyDown(.S) {
		game.player.y += game.player.speed * dt
	}
	// ... 1.3'teki sınır kontrolleri değişmeden devam eder
}
```
`speed` değerini `Paddle` kurulumunda `400.0` olarak ver; çizim bölümü bu
değişiklikten habersiz kalır.
:::

## Kaynak

[Odin vendor:raylib binding referansı](https://pkg.odin-lang.org/vendor/raylib/) —
`#GetFrameTime` anchor'ı. Dönüş tipinin `f32` saniye olduğunu ve çağrının frame
başına bir kez yapıldığını orada görürsün.

## Daha derine

[Fix Your Timestep! — Glenn Fiedler](https://gafferongames.com/post/fix_your_timestep/).
Delta time'ın neden ölçülüp hesaba katıldığını, variable timestep'in nerede
bozulduğunu ve accumulator'ın ne işe yaradığını anlatan klasik yazı. Pong'un
bugünkü ihtiyacından derin — ders bittikten sonra oku, accumulator bölümü
Snake'in sabit tick'ine gelince anlam kazanacak.

## Kazanım

Hareketi frame sayısına değil geçen zamana bağladın. Bundan sonra oyuna giren
her hareketli şey aynı birimi kullanacak; karıştırdığın gün fark, makine
değiştirdiğinde ortaya çıkar.

**“Pong 1.4 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım: [1.5 — Top velocity'si](/worlds/01-pong/05-ball-velocity).
