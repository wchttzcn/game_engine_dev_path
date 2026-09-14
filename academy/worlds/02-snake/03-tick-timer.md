---
title: "2.3 — Tick'li zaman"
description: "Simülasyon adımını frame'den ayıran bir tick timer kur."
section: Grid ve hareket
---

# 2.3 — Tick'li zaman

**Hedef:** Simülasyonun ilerlediği hızı, frame'in çizildiği hızdan ayır.

## Görev

`Game`'e `tick_timer: f32` ekle, `TICK_SECONDS :: 0.12` sabitini tanımla. Her
frame `tick_timer`'a `dt` ekle; `tick_timer` `TICK_SECONDS`'ı geçtiğinde bir
“adım” olsun: `tick_timer`'dan `TICK_SECONDS`'ı **çıkar** (sıfırlama değil) ve
bir `tick_count: int` sayacını bir artır. `tick_count`'u ekrana `rl.DrawText`
ile yaz.

## Ne zaman bitti?

- `tick_count`, FPS'ten bağımsız bir hızda artıyor.
- `rl.SetTargetFPS`'i 30 veya 144 yaptığında `tick_count`'un artış hızı
  gözle görülür şekilde değişmiyor.
- `odin check games/snake` geçiyor.

## Bilmen gereken küçük parça

Pong 1.4'te `dt` ile sürekli hareket kurmuştun: top her frame `velocity * dt`
kadar ilerliyordu, ara durumların hepsi anlamlıydı. Snake'te ara durum yok:
yılan ya bu hücrede ya bir sonraki hücrede — “hücrenin %40'ında” diye bir şey
olmayacak. Bu yüzden hareketi frame'e değil, düzenli aralıklarla gelen bir
tick'e bağlıyoruz.

`tick_timer -= TICK_SECONDS` ile `tick_timer = 0` arasındaki fark önemli:
çıkarma, eşiği aşan fazlalığı bir sonraki tick'e devreder; sıfırlama o
fazlalığı atar ve uzun süren bir frame'den sonra oyun gözle görülür şekilde
yavaşlar. Bir frame'de birden fazla tick birikebileceği için (örneğin işletim
sistemi oyunu bir an duraklattıysa) `if` yerine `for` de yazabilirsin —
`-=` seçimi bu kapıyı açık tutuyor, `for` ile aynı satırı tekrar tekrar
çalıştırabilirsin.

## Sınırlar

- Genel bir “sabit timestep” kütüphanesi veya abstraction'ı kurma; bu ders
  yalnızca Snake'in kendi `tick_timer`'ını istiyor.
- Yılan hareketi henüz yok — bu ders yalnızca zamanı ölçüyor, hücre
  değiştirmiyor.

::: details İpucu 1 — Frame başına biriktir
Her frame'in başında `game.tick_timer += dt` yap. Sonra bu değeri
`TICK_SECONDS` ile karşılaştır.
:::

::: details İpucu 2 — Neden `-=` ve neden `if` yetmeyebilir
`tick_timer`, `TICK_SECONDS`'ı ne kadar aştıysa o kadarı sonraki tick'in
parçası olmalı. `if tick_timer >= TICK_SECONDS { tick_timer -= TICK_SECONDS }`
çoğu frame'de yeterli; ama bir frame gerçekten uzun sürerse (`dt` büyükse)
`tick_timer` `TICK_SECONDS`'ın iki katını geçebilir — `if`'i `for`'a
çevirirsen birikmiş her tick işlenir.
:::

::: details İpucu 3 — İskelet
```odin
game.tick_timer += dt
for game.tick_timer >= TICK_SECONDS {
	game.tick_timer -= TICK_SECONDS
	game.tick_count += 1
}
```
`tick_count`'u yazdırmak için `rl.DrawText(rl.TextFormat("tick: %d", game.tick_count), 10, 10, 20, rl.WHITE)`.
:::

## Birincil kaynak

[Fix Your Timestep! — Glenn Fiedler, Gaffer On Games](https://gafferongames.com/post/fix_your_timestep/).
Frame süresini biriktirip sabit adımlarla tüketme fikrinin kaynağı bu yazı;
`tick_timer -= TICK_SECONDS` deseni doğrudan buradan geliyor.

**Kazanım:** Simülasyon adımın artık `dt`'den bağımsız, düzenli bir tick'e
bağlı — Snake'in ilerleyen her dersi bu tick üzerine kurulacak.

**“Snake 2.3 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu tick'e gerçek bir hareket bağlamak: [2.4 — Yön ve adım](/worlds/02-snake/04-direction-step).
