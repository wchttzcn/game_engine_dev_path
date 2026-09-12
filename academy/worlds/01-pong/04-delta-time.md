---
title: "1.4 — Delta time"
description: "Raket hızını frame sayısından saniyeye bağla."
---

# 1.4 — Delta time

**Hedef:** Raket hızını “frame başına pixel” yerine “saniye başına pixel” olarak tanımla.

## Görev

Player hareketini delta time kullanacak hale getir. Raket hızını örneğin
`400.0` pixel/saniye olarak bir named sabitte tut ve W/S input'unda bu hız ile
`rl.GetFrameTime()` sonucunu çarp.

Önceki dersteki aynı sınırları koru. Oyun 60 FPS hedeflese de hız hesabının
frame sayısına bağlı kalmaması gerekiyor.

## Ne zaman bitti?

- Hızın anlamı kodda açık: pixel/saniye cinsinden named bir değer var.
- Her frame `rl.GetFrameTime()` çağrılıyor ve input güncellemesinde kullanılıyor.
- W/S ile hareket sürüyor, raket ekran dışına taşmıyor.
- `odin check games/pong` geçiyor.

## Bilmen gereken küçük parça

Bir frame'in süresi `dt` ise o frame'deki mesafe şudur:

```text
mesafe = hız × dt
```

60 FPS'te `dt` yaklaşık `1 / 60` saniyedir. `400 pixel/saniye` hız, o frame'de
yaklaşık `6.67 pixel` hareket üretir. FPS düştüğünde frame daha uzun sürer ve
aynı gerçek zaman içinde toplam mesafe korunur.

Raylib `rl.GetFrameTime()` ile son frame'in süresini `f32` saniye olarak verir.
Örneğin döngü başında `dt := rl.GetFrameTime()` al; update'te `player_speed * dt`
kullan. `game.player.y` zaten `f32` olduğu için dönüşüme gerek kalmaz.

## Sınırlar

Bu ders variable timestep'in pratik kullanımını kuruyor. Fixed timestep,
frame-time spike limiti ve reusable update API'si daha sonra gerçek physics
ihtiyacıyla gelecek. Şimdilik yalnızca player hareketinin birimini düzelt.

::: details İpucu 1 — Adlandırma
`PLAYER_SPEED :: 400.0` gibi bir sabit oluştur. İsminin birimini anlatmasına
yardım etmek istersen `PLAYER_SPEED_PIXELS_PER_SECOND` da kullanabilirsin.
:::

::: details İpucu 2 — Eski miktarı değiştir
`5.0` yerine `PLAYER_SPEED * dt` kullan. Yukarıda çıkar, aşağıda eklerken aynı
çarpım kalır.
:::

::: details İpucu 3 — Sıra
Önce `dt`yi al, sonra input ile `game.player.y`yi güncelle, ardından önceki dersteki
clamp koşullarını uygula. Render bölümü bu değişiklikten habersiz kalır.
:::

::: details Deep Dive — Target FPS hız kontrolü değildir
`SetTargetFPS(60)` render döngüsünü hedeflenen bir aralıkta tutmaya çalışır;
oyun hızının matematiksel birimi değildir. Frame süresi değişebilir: pencere
taşınabilir, debugger durabilir veya makine başka iş yapabilir. `dt` bu farkı
state güncellemesine taşır. Deterministik replay ya da sağlam collision gerektiğinde
fixed timestep'i ayrıca ele alacağız.
:::

## Birincil kaynak

[Fix Your Timestep! — Glenn Fiedler](https://gafferongames.com/post/fix_your_timestep/).
Delta time'ın neden ölçülüp hesaba katıldığını ve variable timestep'in nerede
bozulduğunu anlatan klasik yazı. Pong'un ihtiyacından derin; accumulator
bölümünü şimdi okuman gerekmiyor.

**Kazanım:** Hareketi frame sayısına değil geçen zamana bağladın.
Sonraki adım: [1.5 — Top velocity'si](/worlds/01-pong/05-ball-velocity).
