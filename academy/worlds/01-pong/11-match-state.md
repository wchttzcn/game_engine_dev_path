---
title: "1.11 — Maç state'i"
description: "Maçın servis, oyun ve bitiş anlarını açık state geçişleriyle yönet."
---

# 1.11 — Maç state'i

**Hedef:** Maçın hangi aşamada olduğunu explicit bir state ile tanımla ve
geçişleri tek yerde yönet.

## Görev

`SERVING`, `PLAYING` ve `MATCH_OVER` değerleri olan bir match state oluştur.
`PLAYING` sırasında top güncellensin ve sayı oluşsun. Oyunculardan biri seçtiğin
kazanma skoruna ulaştığında state `MATCH_OVER` olsun; top hareket etmesin ve
kazananı ekranda göster. `R` ile skorları sıfırlayıp yeni maçı `SERVING`
state'inde başlat; Space ile servisi başlat.

## Bilmen gereken küçük parça

Skor tek başına maçın ne yaptığını anlatmaz. Örneğin 5–3 skorda oyun oynanıyor
olabilir, servis bekliyor olabilir veya maç bitmiş olabilir. Bu farklı
davranışları dağınık `if score >= ...` kontrolleriyle türetmek yerine state'i
doğrudan saklarız.

State transition bir olaydır: sayı sonrası `SERVING`, kazanma sonrası
`MATCH_OVER`, Space sonrası `PLAYING`. Her state'in yalnızca kendi izin verdiği
update davranışını çalıştırması, topun bitmiş maçta hareket etmesi gibi hataları
önler.

## Sınırlar

- State değerlerini enum olarak tanımla; birbirini dışlayan durumları birden
  çok boolean ile temsil etme. `is_playing` ve `is_game_over` kolayca çelişir.
- Kazanma hedefi şimdilik sabit bir constant olsun; ayar menüsü veya config
  ekleme.
- Input kontrolleri transition tetiklesin. `MATCH_OVER` ekranında top update'i
  veya skor artırma çalışmamalı.

## Ne zaman bitti?

- Space yalnızca servis beklenirken topu başlatıyor.
- Kazanma skorunda maç bitiyor, kazanan görünür oluyor ve top duruyor.
- `R` her state'ten temiz bir yeni maça dönüyor; iki skor da sıfırlanıyor.
- `odin check games/pong` geçiyor.

::: details İpucu 1 — State nerede yaşar?
`match_state` alanını `Game` içine koy. Böylece skor, top ve maç aşaması aynı
frame state'inin altında bulunur.
:::

::: details İpucu 2 — Update akışı
Update procedure'ında önce yeniden başlatma input'unu ele al. Sonra `switch`
ile mevcut match state'in izin verdiği davranışı çalıştır.
:::

::: details İpucu 3 — Kazananı saklamak zorunda mısın?
`MATCH_OVER` çiziminde iki skor karşılaştırması şimdilik yeterlidir. Daha sonra
kazananın kimliği başka kurallara gerek duyarsa ayrı state yaparız.
:::

::: details Deep Dive — State machine neden burada?
Bu küçük enum bir finite state machine'dir: sınırlı sayıda durum ve tanımlı
geçişler. İleride serve countdown, pause veya replay eklediğinde her yeni
durumun hangi input ve update'e izin verdiği açık kalır. Şimdilik bir framework
çıkarma ihtiyacı yok; game state içindeki `switch` yeterli sınırdır.
:::

**Kazanım:** Maç kurallarını skor kontrollerinin arasına dağıtmak yerine açık
state transition'larla yönetiyorsun. Sonraki adım bu state'i update ve render
kodunun daha okunur sınırlarına yerleştirmek.
