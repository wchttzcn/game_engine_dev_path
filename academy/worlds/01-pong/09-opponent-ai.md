---
title: "1.9 — Rakip kendi kendine hareket etsin"
description: "Rakip raketin hedefe kontrollü yaklaşmasını sağla."
section: Oynanış
---

# 1.9 — Rakip kendi kendine hareket etsin

**Hedef:** Sağ raketi topun `y` konumuna doğru, sınırlı hızla hareket ettir.

## Görev

Sağ paddle için basit bir opponent update'i yaz. Karar üç durumlu olmalı:
raketin merkezi topun merkezinin yeterince üstündeyse aşağı, yeterince
altındaysa yukarı hareket etsin, ikisinin arasındaysa **hiç hareket etmesin**.
“Yeterince”nin ne demek olduğunu bir eşik sabitiyle belirle; aşağıdaki bölüm bu
eşiğin neden gerektiğini ve ne kadar olması gerektiğini anlatıyor.

Hızı raketin kendi `speed` field'ı ile sınırla ve her frame hareketi `dt` ile
çarp. Update sonunda `game.opponent.y` değerini `0` ile
`SCREEN_HEIGHT - game.opponent.height` arasında clamp et.

Bu AI topun konumuna “teleport” etmemeli. Capped speed yüzünden hızlı bir top
raketi geçebilmeli; bu, oyunun zorluk ayarı için kullanışlı bir davranış.

## Ne zaman bitti?

- Sağ paddle topun dikey hareketini takip ediyor.
- Raket pencerenin üstünden veya altından taşmıyor.
- Rakibin hızı `dt` ile frame rate'ten bağımsız güncelleniyor.
- Rakip, topun tam merkezini her frame anında yakalamıyor.
- Top dikey olarak durduğunda raket hedefin etrafında titremiyor, duruyor.
- `odin check games/pong` geçiyor.

## Bilmen gereken küçük parça

AI'nin hedefi `game.ball.y` olsa da paddle'ın position'ı üst kenarıdır.
Karar verirken paddle merkezini `game.opponent.y + game.opponent.height / 2` ile topun
merkeziyle karşılaştır. Bu, top raketin ortasına yaklaşırken yön değiştirmeyi
sağlar.

### Neden iki dal yetmiyor

“Üstündeyse aşağı, altındaysa yukarı” kuralı tek başına raketi hedefin etrafında
titretir. Sebebi, raketin adımının sabit olması: bir frame'de tam olarak
`speed * dt` kadar yol alır, daha azını alamaz.

Kendi sayılarınla: `speed` `400`, 60 fps'te `dt` ≈ `0.0167`, yani adım ≈ **6.7
pixel**. Raket hedefin 2 pixel üstündeyken “yukarıdayım” der, 6.7 iner ve
hedefin 4.7 pixel altına geçer. Bu sefer “aşağıdayım” der, 6.7 çıkar, 2 pixel
üstte olur. Aynı iki durum sonsuza kadar sırayla tekrarlanır — raket hedefi
hiçbir zaman tutturamaz, çünkü aradaki mesafe adımından küçüktür.

Çözüm, “eşit sayılır” diyebileceğin bir aralık bırakmak: fark bir eşikten
küçükse hareket etme. Bu aralığa **dead zone** denir ve kodda üçüncü bir dal
olarak değil, iki dalın da çalışmadığı boşluk olarak belirir.

Eşik bir frame'lik adımdan büyük olmalı. Küçük seçersen raket eşiği her adımda
aşar, karşı tarafta yine eşiğin dışında kalır ve titreme devam eder — yani eşik
hiç yokmuş gibi davranır. Yukarıdaki 6.7 pixel'lik adım için `10.0` rahat bir
seçim. Sabit adı `SCREAMING_SNAKE_CASE` olmalı, dilin konvansiyonu bu.

### Sınırı tek yerde tut

`clamp(value, min, max)` değeri güvenli aralığın altında veya üstündeyse sınıra
çeker. Input ile hareket eden paddle için de aynı sınır gerekecek; burada
opponent update'inden sonra uygula ki hareket kaynağı ne olursa olsun oyun alanı
kuralı tek yerde kalsın.

## Sınırlar

Rakip sadece topun güncel `y` konumunu takip etsin. Prediction, reaction delay,
hedef sapması veya farklı zorluk seviyeleri ekleme; bunlar çalışır temel AI'ın
sonra gelen game-feel ayarlarıdır.

::: details İpucu 1 — Merkezleri karşılaştır
`game.opponent.y` paddle'ın üstüdür, merkezi değil. Rakibin merkezini ayrı bir
yerel değişkende hesapla ve kararı onunla ver; hareketi yine `game.opponent.y`'ye
uygularsın. Merkez ile `game.ball.y` arasındaki farkı tek bir değişkende
tutarsan o değişkenin işareti yönü, büyüklüğü de dead zone karşılaştırmasını
verir.
:::

::: details İpucu 2 — Frame başına mesafe
Bir frame'deki hareket `opponent_speed * dt` kadar olmalı. Top yukarıdaysa bu
değeri `game.opponent.y`'den çıkar, aşağıdaysa ekle.
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
bir AI controller yazdın.

**“Pong 1.9 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım: [1.10 — Skor ve servis](/worlds/01-pong/10-score-and-reset).
