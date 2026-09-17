---
title: "3.2 — Topu hareket ettir"
description: "Topu velocity ve delta time ile her frame güncelle; henüz hiçbir şeyden sekmesin."
section: Breakout iskeleti
---

# 3.2 — Topu hareket ettir

**Hedef:** Sahneye bir top koy ve onu velocity ile hareket ettir — henüz hiçbir
şeyden sekmeden.

## Görev

`Game` içine bir top ekle: konum, yarıçap ve iki eksende velocity. Her frame
konumu velocity ve delta time ile güncelle, topu çiz. Top ekranın dışına
çıkacak; bu ders bunu düzeltmiyor.

## Ne zaman bitti?

- Top ekranda görünüyor ve sabit bir yönde hareket ediyor.
- Hareket delta time ile; FPS değişse de hız değişmiyor.
- Top ekranın dışına çıkıp kayboluyor — henüz sekme yok.
- `odin check games/breakout` geçiyor.

## Bilmen gereken küçük parça

Pong'un topuyla aynı fikir: konum bir vektör, velocity bir vektör, her frame
`konum += velocity * dt`. Velocity'nin işareti yönü, büyüklüğü hızı taşıyor.

Breakout'a özgü tek şey başlangıç yönü. Pong'da top yatay servis ediliyordu;
burada tuğlalar yukarıda olduğu için topun **yukarı** gitmesi gerekiyor. raylib'de
`y` ekseni aşağı doğru büyür, yani yukarı gitmek negatif bir `y` velocity'si demek.

Topu rakete yakın bir yerden, hafif eğimli başlat — tam dikey bir top sadece iki
duvar arasında gidip gelir, oyun olmaz.

## Sınırlar

- Sekme yok, çarpışma yok, kaybetme yok. Top ekrandan çıkıyorsa doğru çalışıyor.
- Topu rakete yapıştırıp `Space` ile fırlatma bu derste yok; şimdilik pencere
  açılır açılmaz hareket etsin.

::: details İpucu 1 — Ne tutman gerekiyor
Konum, velocity ve yarıçap. Konum ile velocity'nin ikisi de iki bileşenli, yani
her biri tek bir `rl.Vector2`'ye sığıyor:

```odin
Ball :: struct {
	pos, vel: rl.Vector2,
	radius:   f32,
}
```

Rengi sabit tutabilirsin.
:::

::: details İpucu 2 — Güncelleme
```odin
game.ball.pos += game.ball.vel * dt
```
`rl.Vector2` bir `[2]f32` olduğu için aritmetik bileşen bazlı çalışıyor; iki
ekseni ayrı satırlarda toplamana gerek yok. `speed` gibi ayrı bir alan da
tutmana gerek yok; velocity zaten hem yön hem hız.
:::

::: details İpucu 3 — Başlangıç değerleri
`vel.y` negatif olmalı ki top yukarı gitsin. `vel = {220, -260}` gibi bir çift
iyi bir başlangıç. Topu raketin biraz üstünden başlat.
:::

::: details Deep Dive — Neden ayrı bir `speed` alanı tutmuyoruz?
Pong'da da tutmamıştın. Velocity vektörünün boyu zaten hız; ayrı bir `speed`
alanı tutarsan iki kaynak olur ve biri diğerinden sapabilir — 2.7'deki `body` ve
`occupied` ikilisinin aynı sınıfı. Hızı ayrı ayarlamak istediğinde velocity'yi
normalize edip çarpmak, iki alanı senkron tutmaktan daha güvenli. 3.9'da top
hızını slider'a bağlarken bu kararı tekrar göreceksin.
:::

## Birincil kaynak

[Odin vendor:raylib — `GetFrameTime`](https://pkg.odin-lang.org/vendor/raylib/#GetFrameTime).
Delta time'ın saniye cinsinden `f32` döndüğünü, yani velocity'nin saniye başına
pixel olarak yazıldığını doğrulayan imza.

**Kazanım:** Sahnede hareket eden iki nesne var ve ikisi de zamana bağlı.
Şimdiye kadar hiçbiri diğerini bilmiyor — bir sonraki ders bu ikisini ilk kez
karşılaştıracak.

**“Breakout 3.2 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım topu sahnenin içinde tutmak: [3.3 — Duvar ve raket sekmesi](/worlds/03-breakout/03-bounce).
