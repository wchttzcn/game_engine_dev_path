---
title: "1.5 — Top velocity'si"
description: "Topun konumunu velocity ve delta time ile güncelle."
section: Temel hareket
---

# 1.5 — Top velocity'si

**Hedef:** Topun sonraki konumunu velocity'sinden ve geçen süreden üret.

## Görev

`Ball`'a yatay ve dikey velocity field'ları ekle. Game loop'un update
bölümünde topun `x` ve `y` konumlarını bu velocity ile her frame güncelle;
render mevcut top state'ini çizsin. Başlangıç velocity'sini topun sağa ve
aşağıya görünür biçimde ilerleyeceği bir değer seç. Bu derste top ekran
dışına çıkabilir; duvar ve raket collision'ı sonraki problemlerdir.

## Ne zaman bitti?

- `Ball` hem konumu hem velocity'sini taşıyor.
- Her frame `x` ve `y` güncellemesi `velocity × dt` kullanıyor.
- Top, raketler sabitken çapraz biçimde hareket ediyor.
- `odin check games/pong` geçiyor.

## Elindekiler

`Ball` şu an yalnız konum taşıyor: `x`, `y`, `radius`. Position “nerede?”
sorusunu cevaplar; velocity “bir saniyede hangi yönde ne kadar yer
değiştiriyor?” sorusunu.

```odin
// Ball struct'ına eklenecek alanlar:
//   velocity_x, velocity_y: f32,
```

`dt`, 1.4'te aldığın aynı frame süresi (`rl.GetFrameTime()`); burada ikinci
kez, hem `x` hem `y` için kullanıyorsun.

## Sınırlar

Topu yalnızca velocity ile hareket ettir. Duvar bounce, paddle collision,
skor ve random başlangıç yönü ayrı problemlerdir. Bu sınır sayesinde bir
sonraki derste “top neden ekrandan çıkıyor?” sorusunun tek, net nedeni
olacak.

::: details İpucu 1 — Adımlar
`Ball`'a `velocity_x, velocity_y: f32` ekle; başlangıç değerlerini topu sağa
ve aşağı taşıyacak pozitif sayılar seç. Her frame, `x` alanına
`velocity_x * dt`, `y` alanına `velocity_y * dt` ekle. İki ekseni ayrı
tutup birbirinden bağımsız güncelle.
:::

::: details İpucu 2 — Hangi state değişiyor?
Render hâlâ `game.ball.x`, `game.ball.y` ve `game.ball.radius` okur. Hareket
için render koduna yeni bir sayı ekleme veya `x`/`y`'yi başka bir yerde elle
değiştirme; değişen tek kaynak velocity üzerinden yürüyen bu iki alan olsun,
yoksa iki farklı konum kaynağı birbirini ezer.
:::

::: details İpucu 3 — Tam çözüm
```odin
game.ball.y += game.ball.velocity_y * dt
game.ball.x += game.ball.velocity_x * dt
```
Bu iki satır, `dt := rl.GetFrameTime()` alındıktan sonra, `rl.BeginDrawing()`
çağrısından önce gidiyor — render bu güncellemeden sonra çalışıp güncel
konumu çizsin.
:::

## Kaynak

[Odin vendor:raylib — `GetFrameTime`](https://pkg.odin-lang.org/vendor/raylib/#GetFrameTime).
Bu dersin `dt`'yi ikinci kez kullandığı çağrının gerçek imzası ve dönüş
tipi; 1.4'ten beri kullanıyorsun ama hiç kaynaklanmamıştı.

## Daha derine

Ders bittikten sonra: [Integration Basics — Glenn
Fiedler](https://gafferongames.com/post/integration_basics/).
`position += velocity * dt` ifadesinin adı semi-implicit Euler
entegrasyonudur; yazı bu adımın neden bu sırayla yapıldığını gösterir.
Position'ı velocity'den ayrı saklamak da burada gerekçelendirilir: duvara
değince yalnızca `velocity_y`'nin işaretini değiştirmek topu ters yöne
gönderir, position'ı rastgele geri almak aynı bilgiyi taşımaz.

## Kazanım

Pong'un ilk zaman-temelli top hareketini kurdun.

**“Pong 1.5 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım: [1.6 — Duvarlardan sek](/worlds/01-pong/06-wall-bounce).
