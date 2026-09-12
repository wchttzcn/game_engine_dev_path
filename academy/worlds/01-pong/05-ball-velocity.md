---
title: "1.5 — Top velocity'si"
description: "Topun konumunu velocity ve delta time ile güncelle."
---

# 1.5 — Top velocity'si

**Hedef:** Topun sonraki konumunu velocity'sinden ve geçen süreden üret.

## Görev

`Game` içindeki `Ball` state'ine yatay ve dikey velocity field'ları ekle. Game
loop'un update bölümünde topun `x` ve `y` konumlarını bu velocity ile güncelle;
render mevcut top state'ini çizsin.

Başlangıç velocity'sini topun sağa ve aşağıya görünür biçimde ilerleyeceği bir
değer seç. Bu derste top ekran dışına çıkabilir; duvar ve raket collision'ı
sonraki problemdir.

## Ne zaman bitti?

- `Ball` hem konumu hem velocity'sini taşıyor.
- Her frame konum güncellemesi `velocity × dt` kullanıyor.
- Top, raketler sabitken çapraz biçimde hareket ediyor.
- `odin check games/pong` geçiyor.

## Bilmen gereken küçük parça

Topun `x` ve `y` field'ları dairenin merkezidir. Position, “nerede?”; velocity ise “bir saniyede hangi yönde ne kadar yer
değiştiriyor?” bilgisidir. İki ekseni ayrı tutarsan temel update şudur:

```odin
game.ball.x += game.ball.velocity_x * dt
game.ball.y += game.ball.velocity_y * dt
```

Örneğin `velocity_x = 300.0`, `velocity_y = 180.0` değerleri pixel/saniye
cinsindedir. Bir velocity negatif olursa top o eksende ters yöne gider. `dt`,
önceki derste aldığın aynı frame süresidir; ikinci kez çağırmana gerek yok.

## Sınırlar

Topu yalnızca velocity ile hareket ettir. Duvar bounce, paddle collision, skor
ve random başlangıç yönü ayrı oyun problemleridir. Bu sınır sayesinde bir sonraki
derste “top neden ekrandan çıkıyor?” sorusunun tek, net nedeni olacak.

::: details İpucu 1 — Yeni field'lar
`Ball` içine `velocity_x, velocity_y: f32` ekle. Başlangıç değerlerini topu sağa
ve aşağı taşıyacak pozitif sayılar seç.
:::

::: details İpucu 2 — Doğru update formülü
Input update'inden sonra, `BeginDrawing()`den önce hem `game.ball.x` hem `game.ball.y`
alanını kendi velocity'si ile `dt` çarparak artır.
:::

::: details İpucu 3 — Neyi değiştirme?
Topun render çağrısı hâlâ `game.ball.x`, `game.ball.y` ve `game.ball.radius` okur.
Hareket için render koduna yeni sayı ekleme; değişen tek kaynak ball state olsun.
:::

::: details Deep Dive — Position ve velocity neden ayrı state?
Velocity'yi doğrudan position yerine saklamak, sonraki collision response için
gereklidir: duvara değince `velocity_y`nin işaretini değiştirmek topu ters yöne
gönderir. Position'ı rastgele geri almak aynı bilgiyi ifade etmez ve raket
collision'ında hangi yönden geldiğini kaybettirir. Acceleration veya spin ancak
oyun bunları gerektirdiğinde bu modele eklenir.
:::

**Kazanım:** Pong'un ilk zaman-temelli hareketini kurdun. Sonraki adım:
[1.6 — Duvarlardan sek](/worlds/01-pong/06-wall-bounce).
