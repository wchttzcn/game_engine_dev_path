---
title: "3.2 — Topu hareket ettir"
description: "Topu velocity ve delta time ile her frame güncelle; henüz hiçbir şeyden sekmesin."
section: Breakout iskeleti
---

# 3.2 — Topu hareket ettir

**Hedef:** Sahneye bir top koy ve onu velocity ile hareket ettir — henüz
hiçbir şeyden sekmeden.

## Görev

`Game`'e bir top ekle: konum, yarıçap ve iki eksende velocity. Her frame
konumu velocity ve delta time ile güncelle, topu çiz. Top ekranın dışına
çıkacak; bu ders bunu düzeltmiyor.

## Ne zaman bitti?

- Top ekranda görünüyor ve sabit bir yönde hareket ediyor.
- Hareket delta time ile; FPS değişse de hız değişmiyor.
- Top ekranın dışına çıkıp kayboluyor — henüz sekme yok.
- `odin check games/breakout` geçiyor.

## Elindekiler

`Game`'e eklenecek alan: `ball: Ball`.

```odin
Ball :: struct {
	pos, vel: rl.Vector2,
	radius:   f32,
}
```

`rl.Vector2` bir `[2]f32`, yani aritmetik bileşen bazlı çalışır — `pos + vel`
her iki ekseni birden toplar. Çizim için `rl.DrawCircleV`'yi Pong'dan
biliyorsun.

## Sınırlar

- Sekme yok, çarpışma yok, kaybetme yok. Top ekrandan çıkıyorsa doğru
  çalışıyor.
- Topu rakete yapıştırıp `Space` ile fırlatma bu derste yok; pencere açılır
  açılmaz top hareket etsin.

::: details İpucu 1 — Güncelleme ve başlangıç yönü
Her frame `pos`'a `vel * dt`'yi ekle. raylib'de `y` ekseni aşağı doğru büyür;
tuğlalar yukarıda olacağı için topun **yukarı** gitmesi gerekiyor, yani
`vel.y` negatif olmalı. Topu rakete yakın bir yerden, hafif eğimli başlat.
:::

::: details İpucu 2 — İşareti unutmak
`vel.y`'yi pozitif yazmak kolay bir hata: top hemen aşağı iner ve daha ilk
frame'de kaybedilmiş gibi görünür. Kontrol et: `vel = {220, -260}` gibi bir
çiftte ikinci bileşen negatif olmalı.
:::

::: details İpucu 3 — Tam çözüm
```odin
game.ball.pos += game.ball.vel * dt
```
Başlangıç değerleri `game_reset` içinde: `radius = 10`, `pos` raketin biraz
üstünde, `vel = {220, -260}`. Güncelleme satırı ana döngüde, raket
hareketinden sonra, çizimden önce giriyor.
:::

## Kaynak

[Odin vendor:raylib binding referansı](https://pkg.odin-lang.org/vendor/raylib/) —
`#GetFrameTime` anchor'ı. Delta time'ın saniye cinsinden `f32` döndüğünü,
yani velocity'nin saniye başına pixel olarak yazıldığını doğrulayan imza.

## Kazanım

Sahnede hareket eden iki nesne var ve ikisi de zamana bağlı. Şimdiye kadar
hiçbiri diğerini bilmiyor — bir sonraki ders bu ikisini ilk kez
karşılaştıracak.

**“Breakout 3.2 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım topu sahnenin içinde tutmak: [3.3 — Duvar ve raket sekmesi](/worlds/03-breakout/03-bounce).
