---
title: "3.11 — Kamera sarsıntısı"
description: "Vuruşta ekranı sarsan, tek bir trauma değerinden türeyen ve zamanla sönen bir kamera kur."
section: Oyun hissi
---

# 3.11 — Kamera sarsıntısı

**Hedef:** Tuğla kırıldığında ekranı kısa bir süre sarsan, `rl.Camera2D` ile
çizilen bir sahne kur.

## Görev

`Game` içine `trauma: f32` adında bir değer ekle, `0..1` aralığında tutulsun.
Tuğla kırıldığında bu değeri artır; her frame zamanla azalt. Sarsıntının gerçek
büyüklüğünü `trauma`'nın karesinden (veya küpünden) türet ve bu büyüklüğü bir
`rl.Camera2D`'nin `offset`'ine rastgele bir kayma olarak uygula. Sahneyi bu
kamerayla çiz; kazandın/kaybettin metni kameranın dışında, sarsılmadan kalsın.

## Ne zaman bitti?

- Tuğla kırıldığında ekran kısa bir süre sarsılıyor, sonra sakinleşiyor.
- Sarsıntı ani sıçramalarla değil, `trauma` zamanla azaldıkça küçülerek
  sönüyor.
- `trauma` küçükken sarsıntı görünmeyecek kadar hafif, büyükken belirgin —
  kare alma bu geçişi keskinleştiriyor.
- Kazandın/kaybettin metni sarsılmıyor; yalnız oyun sahnesi (raket, top,
  tuğlalar) sarsılıyor.
- `odin check games/breakout` geçiyor.

## Bilmen gereken küçük parça

`rl.Camera2D` şimdiye kadar kullanmadığın bir tür. Alanları:

```odin
Camera2D :: struct {
	offset:   Vector2, // kameranın hedeften kayması
	target:   Vector2, // kameranın baktığı nokta
	rotation: f32,     // derece cinsinden dönüş
	zoom:     f32,      // ölçek — 1.0 varsayılan
}
```

Sahneyi bu kamerayla çizmek için `rl.BeginMode2D`/`rl.EndMode2D` arasına al:

```odin
rl.BeginMode2D(camera)
// top, raket, tuğlalar burada çizilir
rl.EndMode2D()
// UI, kazandın/kaybettin metni burada çizilir — kameranın dışında
```

**Kritik tuzak:** Odin'de bir compound literal yazılmayan alanı sıfırlar. 3.3'te
`game.player.rect = {x, y}` yazınca `width` ve `height` sıfırlanıp raket
görünmez olmuştu — aynı tuzağın burada ikinci karşılaşması. Bir `Camera2D`
değerini compound literal ile kurarken `zoom` alanını yazmazsan sıfır kalır, ve
`zoom` sıfır demek her şeyin sıfır boyuta küçülmesi demek — ekran tamamen boş
görünür, hiçbir hata mesajı vermez. `zoom` mutlaka `1.0` olarak set edilmeli:

```odin
camera := rl.Camera2D{
	zoom = 1.0,
}
```

`trauma`'yı olay anında artırıyorsun, her frame `dt` ile azaltıyorsun:

```odin
game.trauma = min(game.trauma + TRAUMA_ON_HIT, 1.0)
// ...
game.trauma = max(game.trauma - TRAUMA_DECAY * dt, 0.0)
```

Eiserloh'un önerdiği fikir tek bir `trauma` değerinden büyüklük türetmek —
`shake := trauma * trauma`. Kare almanın etkisi: `trauma` küçükken (örnek
`0.2`) kare `0.04`'e düşer, yani sarsıntı neredeyse hissedilmez; `trauma`
büyükken (`0.9`) kare `0.81`, yani neredeyse tam güçte. Küçük tetiklenmeler
gürültü yapmaz, büyük tetiklenmeler belirgin kalır — his lineer artıştan daha
temiz oluyor.

Rastgele kayma için `rand.float32_range(-1, 1)` iki eksende ayrı ayrı çağrılıp
`shake` ile ölçeklenebilir:

```odin
offset_x := rand.float32_range(-1, 1) * shake * MAX_SHAKE_OFFSET
offset_y := rand.float32_range(-1, 1) * shake * MAX_SHAKE_OFFSET
camera.offset = {SCREEN_WIDTH / 2 + offset_x, SCREEN_HEIGHT / 2 + offset_y}
```

## Sınırlar

- Kamera dönüşü (`rotation`) bu derste kullanılmıyor; yalnız pozisyon kayması
  yeterli, ek bir eksen kognitif yükü artırmadan aynı hissi veriyor.
- Zoom sarsıntı efekti için oynatılmıyor; `zoom` sabit `1.0` kalıyor.

::: details İpucu 1 — Neyi kameranın içine, neyi dışına koyacaksın
Çizim bölümünü ikiye ayır: `rl.BeginMode2D(camera)` ile `rl.EndMode2D()`
arasında yalnız oyun dünyasının parçaları kalsın — tuğlalar, top, raket. UI
katmanı (kazandın/kaybettin metni) bu aralığın dışında, her zamanki gibi
çizilsin. Bu ayrım rastgele değil: oyuncu skoru veya durumu okurken metnin
titremesi okunabilirliği bozar, ama oyun dünyasının sarsılması vuruşu
güçlendirir.
:::

::: details İpucu 2 — trauma nerede yaşıyor, nerede güncelleniyor
`trauma` `Game` struct'ının bir alanı — `hitstop` ile aynı yerde, aynı mantıkla
yaşıyor. Tuğla kırılma noktasında artır, `.Playing` kolunun her frame'inde
zamanla azalt. Sıfırın altına düşmesin diye `max` ile tabanla.
:::

::: details İpucu 3 — Kamerayı kurup çizim döngüsüne bağlamak
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
`target` ile `offset` birlikte ekranın merkezini kameranın odak noktası
yapıyor; sarsıntı yalnız `offset`'i oynatıyor, `target`'a dokunmuyor.
:::

::: details Deep Dive — Rastgele mi, gürültü mü? Ve dönüş sarsıntısı gerekli mi?
`rand.float32_range(-1, 1)` her frame tamamen bağımsız bir sayı üretir: bir
frame `-0.9`, sonraki `0.7` olabilir — kamera frame'den frame'e rastgele
zıplar. Perlin noise (veya benzeri sürekli gürültü fonksiyonları) bunun yerine
zamanın bir fonksiyonu olarak **sürekli bir yol** çizer: komşu zaman
noktalarındaki değerler birbirine yakın kalır, kamera pürüzsüz ama öngörülemez
bir şekilde kayar. Vlambeer'in `The Art of Screenshake` konuşması ve
Eiserloh'un kendi konuşması ikisi de noise tabanlı sarsıntıyı öneriyor çünkü
saf rastgelelik göz için “titreşim” gibi okunabiliyor, noise ise daha organik
hissettiriyor. Bu derste saf rastgele yeterli — fark küçük tuğla kırılmalarında
gözle ayırt edilmiyor; noise'a geçmek, sarsıntı süresi uzadıkça (örneğin büyük
bir patlama anında) daha çok işe yarayan bir incelik.

Eiserloh ayrıca `rotation` alanını da sarsıntıya katmayı öneriyor — translational
(kayma) sarsıntı yanında rotational (dönüş) sarsıntı ekranın köşelerini de
oynatarak sarsıntıyı daha “fiziksel” hissettiriyor. Breakout'ta sahne küçük ve
dikdörtgen, oyuncu her zaman merkeze yakın bakıyor; dönüş eklemek bu ölçekte
fark edilir bir kazanç getirmiyor ve `rotation`'ı da `trauma`'dan türetip
ayrıca ölçeklemek gerektiriyor — ekstra karmaşıklık, küçük görsel kazanç. Daha
büyük bir sahne veya top hızının yüksek olduğu bir oyunda bu değiş tokuş
tersine dönebilir.
:::

## Birincil kaynak

[Squirrel Eiserloh — Math for Game Programmers: Juicing Your Cameras With Math (GDC 2016)](https://archive.org/details/GDC2016Eiserloh).
`trauma` fikri — ayrı sarsıntı efektleri yerine tek bir `0..1` değeri tutup
zamanla söndürmek ve sarsıntı büyüklüğünü bu değerin karesi/küpü olarak almak —
doğrudan bu konuşmadan geliyor.

**Kazanım:** Artık iki katmanlı bir geri bildirim sistemin var: hitstop vuruşu
durduruyor, kamera sarsıntısı vuruşu hissettiriyor. İkisi de aynı olaydan
(tuğla kırılması) tetikleniyor ama birbirinden bağımsız sayaçlarla yaşıyor —
birini kapatıp diğerini açık bırakarak hangisinin ne kattığını
karşılaştırabilirsin.

**“Breakout 3.11 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım vuruşun zaman içindeki şekline bakmak: [3.12 — Eğriler](/worlds/03-breakout/12-easing-curves).
