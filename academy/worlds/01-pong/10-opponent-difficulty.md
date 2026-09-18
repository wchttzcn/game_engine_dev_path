---
title: "1.10 — Rakibin zorluğu"
description: "Rakibin hızını, topu ıskalayabileceği bir tasarım değerine ayarla."
section: Oynanış
---

# 1.10 — Rakibin zorluğu

**Hedef:** Rakibin hızını, topu bazen ıskalayabileceği bir değere düşür.

## Görev

1.9'daki controller çalışıyor ama rakip hiç gol yemiyor: `speed` topun dikey
hızından büyük olduğu sürece raket aradaki farkı her zaman kapatır, ıskalaması
matematiksel olarak imkânsızdır. `opponent`'in `speed` alanını, topun dikey
hızının **altında** bir değere indir; `player`'a dokunma.

## Ne zaman bitti?

- Çapraz giden hızlı bir top zaman zaman rakibi geçip skor yapıyor.
- Rakip hâlâ yavaş veya dikey giden topları yakalıyor, tamamen aciz değil.
- `player`'ın hızı değişmedi.
- `odin check games/pong` geçiyor.

## Elindekiler

Bu ders yeni bir proc veya API çağrısı getirmiyor; tek değişiklik `main`
içindeki `opponent` kurulumunda bir sayı. Değiştirdiğin alan:

```odin
opponent = Paddle{x = 740, y = 160, width = 20, height = 100, speed = 400.0}
```

Topun dikey hızı `ball_reset`'te sabit: `ball.velocity_y = 180.0`. Karar
kuralı: raket ile top aynı süre boyunca dikeyde yol alır — raket `speed × t`,
top `180 × t`. `speed` `180`'den büyükse raket farkı her zaman kapatır.

## Sınırlar

Sadece `opponent.speed` değerini değiştir. Reaction delay, hedef sapması,
prediction veya ayrı zorluk seviyeleri ekleme — bunlar bu ayarın ötesinde,
henüz gelmeyen game-feel kararları.

::: details İpucu 1 — Hangi yöne, ne kadar
Kural sayılardan bağımsız: `speed` topun dikey hızının **altında** olmalı ki
raket zaman zaman geç kalsın. Üstündeyse ıskalamak imkânsız kalır, tam eşitse
sınırda garip davranış çıkar. Aşağı yönde makul bir pay bırak; çok düşük
seçersen rakip hiç tepki vermeyen bir engel gibi durur.
:::

::: details İpucu 2 — Yakın sayı, kararsız his
`speed`'i `180`'e çok yakın seçersen raket bazen yakalar bazen ıskalar ama
sonuç rastgele görünür, “yetkin” hissi vermez — dead zone'un ufak
titremeleri bile sınırın hangi tarafında kaldığını değiştirebilir. Belli bir
farkla altında bir değer seç, sınırın hemen dibinde durma.
:::

::: details İpucu 3 — Tam çözüm
```odin
opponent = Paddle{x = 740, y = 160, width = 20, height = 100, speed = 150.0}
```
Bu satır `main` içinde `game := Game{...}` literal'inin `opponent` alanı;
`player` satırındaki `speed = 400.0`'a dokunma. `150`, topun dikey hızı
`180`'in altında kalıp rakibi hâlâ yetkin gösterecek bir pay bırakıyor.
:::

## Kaynak

[Odin Overview — resmi dil rehberi](https://odin-lang.org/docs/overview/#structs).
Yeni bir API çağrısı yok; değiştirdiğin tek şey bir struct literal alanının
değeri, sözdizimi bu sayfada.

## Kazanım

Bir sabitin değerinin gelişigüzel bir sayı değil, matematikten türeyen bir
tasarım kararı olduğunu gördün: rakip artık ıskalayabiliyor.

**“Pong 1.10 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım: [1.11 — Skor ve servis](/worlds/01-pong/11-score-and-reset).
