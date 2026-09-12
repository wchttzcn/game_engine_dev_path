---
title: "1.9 — Rakip kendi kendine hareket etsin"
description: "Rakip raketin hedefe kontrollü yaklaşmasını sağla."
---

# 1.9 — Rakip kendi kendine hareket etsin

**Hedef:** Sağ raketi topun `y` konumuna doğru, sınırlı hızla hareket ettir.

## Görev

Sağ paddle için basit bir opponent update'i yaz. Raketin merkezi topun
merkezinin üstündeyse aşağı, altındaysa yukarı hareket etsin. Hızı örneğin
`opponent_speed` ile sınırla ve her frame hareketi `dt` ile çarp. Update sonunda
`game.opponent.y` değerini `0` ile `SCREEN_HEIGHT - game.opponent.height`
arasında clamp et.

Bu AI topun konumuna “teleport” etmemeli. Capped speed yüzünden hızlı bir top
raketi geçebilmeli; bu, oyunun zorluk ayarı için kullanışlı bir davranış.

## Ne zaman bitti?

- Sağ paddle topun dikey hareketini takip ediyor.
- Raket pencerenin üstünden veya altından taşmıyor.
- Rakibin hızı `dt` ile frame rate'ten bağımsız güncelleniyor.
- Rakip, topun tam merkezini her frame anında yakalamıyor.
- `odin check games/pong` geçiyor.

## Bilmen gereken küçük parça

AI'nin hedefi `game.ball.y` olsa da paddle'ın position'ı üst kenarıdır.
Karar verirken paddle merkezini `game.opponent.y + game.opponent.height / 2` ile topun
merkeziyle karşılaştır. Bu, top raketin ortasına yaklaşırken yön değiştirmeyi
sağlar.

`clamp(value, min, max)` değeri güvenli aralığın altında veya üstündeyse sınıra
çeker. Input ile hareket eden paddle için de aynı sınır gerekecek; burada
opponent update'inden sonra uygula ki hareket kaynağı ne olursa olsun oyun alanı
kuralı tek yerde kalsın.

## Sınır

Rakip sadece topun güncel `y` konumunu takip etsin. Prediction, reaction delay,
hedef sapması veya farklı zorluk seviyeleri ekleme; bunlar çalışır temel AI'ın
sonra gelen game-feel ayarlarıdır.

::: details İpucu 1 — Merkezleri karşılaştır
`game.opponent.y` paddle'ın üstüdür. Rakibin merkezini hesapla ve bunu `game.ball.y` ile
karşılaştır; eşitliğin etrafında küçük bir dead zone bırakmak titreşimi azaltır.
:::

::: details İpucu 2 — Frame başına mesafe
Bir frame'deki hareket `opponent_speed * dt` kadar olmalı. Top yukarıdaysa bu
değeri `game.opponent.y`den çıkar, aşağıdaysa ekle.
:::

::: details İpucu 3 — Clamp API'si
`clamp` builtin ve generic'tir; import gerekmez. `game.opponent.y`
güncellendikten sonra minimum `0`, maksimum
`SCREEN_HEIGHT - game.opponent.height` ile çağır.
:::

::: details Deep Dive — Bu neden “iyi” AI değildir?
Bu controller yalnızca hedefe doğru sabit hızla gider; topun gelecekte nerede
olacağını hesaplamaz. Yine de speed cap rakibin hata yapmasına izin verdiği
için oynanabilir bir başlangıçtır. Daha sonra zorluk sorusu doğarsa reaction
delay, hedef sapması veya prediction'i ayrı ayrı ekleyebiliriz.
:::

## Birincil kaynak

[Update Method — Robert Nystrom, Game Programming
Patterns](https://gameprogrammingpatterns.com/update-method.html).
Her entity'nin kendi davranışını frame başına bir adım ilerletmesi fikri; rakip
raketin update'i bunun en küçük hali.

**Kazanım:** Hedefe yönelen, delta time kullanan ve oyun alanı sınırını koruyan
bir AI controller yazdın. Sonraki adım:
[1.10 — Skor ve yeni servis](/worlds/01-pong/10-score-and-reset).
