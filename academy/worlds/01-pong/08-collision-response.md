---
title: "1.8 — Çakışmayı çöz"
description: "Topu raketin dışına al ve yatay yönünü doğru tarafa çevir."
---

# 1.8 — Çakışmayı çöz

**Hedef:** Her paddle hit'inden sonra topu çakışmanın dışına taşıyıp doğru yöne gönder.

## Görev

1.7'deki overlap'lerden biri true olduğunda iki response uygula:

1. `game.ball.x` değerini çarptığı raketin hemen dışına taşı.
2. `game.ball.velocity_x` değerini raketten uzağa doğru ayarla: sol paddle sonrası
   pozitif, sağ paddle sonrası negatif.

Topun radius'unu yeni `x` position'ına katmayı unutma. Collision rengi bu
derste kalabilir; response'u debugging için görünür tutar.

## Ne zaman bitti?

- Soldan gelen top sol rakete çarptığında sağa döner.
- Sağdan gelen top sağ rakete çarptığında sola döner.
- Top raketin içinde kalmaz ve frame'ler arasında titreşip tekrar tekrar yön
  değiştirmez.
- `odin check games/pong` geçiyor.

## Bilmen gereken küçük parça

Overlap bulunması tek başına geçerli bir sonraki frame üretmez. Top önceki
hareketten dolayı raketin içinde kalmışsa, aynı collision bir sonraki frame'de
de true olur. Bu yüzden response iki iş yapar: penetration'ı çözer ve sonraki
hareket yönünü belirler.

Sol raketin sağ kenarı `game.player.x + f32(game.player.width)`, sağ raketin sol
kenarı `game.opponent.x` olur. Topun merkezi ilgili kenarın dışında en az
`game.ball.radius` kadar uzakta olmalıdır. Yatay velocity'nin magnitude'ını koruyup
işaretini paddle tarafına göre seçmek hızı değiştirmeden yönü güvenceye alır.

## Sınır

Bu response iki paddle için de yalnızca yatay yönü belirler. Açıya göre sekme,
hızlanma ve skor sonraki küçük problemlerdir. Amaç güvenilir bir temas sonrası
state'i kurmak.

::: details İpucu 1 — Yeni güvenli merkez
Sol hit'te sol raketin sağ kenarına `game.ball.radius` ekle. Sağ hit'te sağ raketin
sol kenarından `game.ball.radius` çıkar. Böylece circle'ın kenarı paddle'ın dışında
kalır.
:::

::: details İpucu 2 — Hızı koru, yönü sabitle
Velocity'nin magnitude'ını `abs(game.ball.velocity_x)` ile bulabilirsin. Sol
paddle response'unda sonuç pozitif, sağ paddle response'unda negatif olmalı.
`abs` builtin olduğu için ayrı bir import gerekmez.
:::

::: details İpucu 3 — Update sırası
Önce topu hareket ettir, sonra collision'ı tespit et. Hit varsa aynı update
adımında position düzeltmesini ve velocity yönünü uygula; render bundan sonra
yeni state'i çizer.
:::

::: details Deep Dive — Neden sadece velocity'yi çevirmiyoruz?
Sadece işareti değiştirirsen top collision frame'inde raketin içinde kalabilir.
Sonraki frame detection yeniden çalışır ve hız tekrar çevrilebilir. Position
correction topu geçerli tarafa çıkarır; bu küçük Pong response'u sürekli bir
physics engine gerektirmeden kararlı yapar.
:::

**Kazanım:** Collision response'un position correction ve yön kararından
oluştuğunu kullandın. Sonraki adım:
[1.9 — Rakip kendi kendine hareket etsin](/worlds/01-pong/09-opponent-ai).
