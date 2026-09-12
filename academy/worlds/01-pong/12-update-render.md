---
title: "1.12 — Update ve render sınırı"
description: "Game state'ini update eden kodu, state'i çizen koddan ayır."
---

# 1.12 — Update ve render sınırı

**Hedef:** Bir frame'in state değişimini çiziminden ayırarak Pong döngüsünü
okunur hale getir.

## Görev

Frame döngüsündeki oyun mantığını `update_game(game: ^Game, dt: f32)` içine,
çizim çağrılarını `draw_game(game: ^Game)` içine taşı. `main` içinde bir `Game`
değeri oluştur; her frame delta time al, update çağır, ardından raylib drawing
bloğu içinde draw çağır. Input, raket hareketi, top hareketi, skor ve match
state transition'ları update tarafında kalsın. Rectangle, text ve arka plan
çizimi draw tarafında kalsın.

## Bilmen gereken küçük parça

Update, bir frame sonunda oyunun hangi state'e geldiğini belirler. Render o
state'i ekrana yansıtır. Render procedure'ı score, position veya match state
değiştirirse ekranın görünmesi simülasyonu değiştirmeye başlar; bu da bir debug
aracı eklerken bile beklenmedik hata üretir.

`Game` büyük bir struct olmaya başladığında update'in onu pointer ile alması
mantıklıdır: procedure gerçek game state'ini değiştirir, bir kopyasını değil.
Draw procedure'ı da şu an aynı imzayı kullanabilir; ancak ona yalnızca okuma
sorumluluğu ver.

## Sınırlar

- Yeni bir `engine/` paketi, entity sistemi veya genel game-loop abstraction'ı
  kurma. Bu Pong'un iki procedure'a ihtiyacı var.
- Raylib'in `BeginDrawing`, `EndDrawing` ve `ClearBackground` çağrılarını
  `main` içinde tut; `draw_game` yalnızca sahneyi çizsin.
- Update içinde raylib çizim çağrısı, draw içinde state ataması yapma. Bu sınır
  sonraki debug overlay'i güvenle eklememizi sağlar.

## Ne zaman bitti?

- `main` oyunu oluşturuyor, `dt` alıyor, update ediyor ve çiziyor.
- Oynanış sonuçları önceki dersle aynı: input, sayı, servis ve restart çalışıyor.
- `update_game` gerçek `Game` değerini pointer üzerinden değiştiriyor.
- `odin check games/pong` geçiyor.

::: details İpucu 1 — Taşınacak satırları ayır
Position, velocity, score veya match state yazan her satır update'e gider.
`rl.Draw...` ile başlayan her çağrı draw'a adaydır.
:::

::: details İpucu 2 — Pointer çağrısı
`game: ^Game` parametresi alan procedure'a yerel `game` değerini `&game` ile
verebilirsin. Procedure içinde field'lara `game.ball` biçiminde erişebilirsin.
:::

::: details İpucu 3 — Frame sırası
Önce `dt := rl.GetFrameTime()` al, sonra `update_game(&game, dt)` çağır.
`BeginDrawing` ile `EndDrawing` arasına yalnızca temizleme ve `draw_game(&game)`
koy.
:::

::: details Deep Dive — Neden render update'ten sonra?
Bu sırada ekrana güncellenmiş state çizilir. Daha gelişmiş oyunlarda render
interpolation, sabit timestep veya birden çok kamera eklenebilir; onlar update
ve render ayrımı gerçekten ihtiyaç duyduğunda gelecek. Bu dersin sınırı yalnızca
bir frame'in sorumluluklarını ayırmak.
:::

**Kazanım:** Pong'un state'i tek bir update yolunda değişiyor, render ise onu
yansıtıyor. Bu sınır, görünmeyen state'i oyun oynarken inceleyecek overlay için
temel oluşturuyor.
