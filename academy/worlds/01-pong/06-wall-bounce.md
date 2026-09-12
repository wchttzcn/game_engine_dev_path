---
title: "1.6 — Duvarlardan sek"
description: "Topun dikey hızını sınırda tersine çevir."
---

# 1.6 — Duvarlardan sek

**Hedef:** Top üst veya alt sınıra geldiğinde onu sınır içine alıp dikey yönünü tersine çevir.

## Görev

`games/pong/main.odin` içindeki hareket eden topa üst ve alt duvar collision'ı
ekle. Topun merkezi `game.ball.y`, radius'u `game.ball.radius`, dikey hızı
`game.ball.velocity_y` ise görünür alan `game.ball.radius` ile
`SCREEN_HEIGHT - game.ball.radius` arasındadır. Top bu sınırlardan birini
geçerse önce `game.ball.y` değerini geçerli sınıra düzelt, sonra dikey
velocity'yi o duvardan uzağa yönlendir.

## Ne zaman bitti?

- Top pencerenin üst ve alt kenarından taşmadan sürekli sekebiliyor.
- Sol/sağ hareketi bu değişiklikten etkilenmiyor.
- `odin check games/pong` geçiyor.

## Bilmen gereken küçük parça

Velocity bir frame'de position'a eklenen yönlü hızdır. `y` aşağı doğru arttığı
için negatif dikey velocity topu yukarı, pozitif değer aşağı götürür. Hızın
magnitude'ını `abs` ile koruyup işaretini duvardan uzağa göre seçmek yönü
güvenceye alır.

Bu collision bir alan çakışması değildir: topun bir sınırı geçip geçmediğini
kontrol ediyorsun. Merkez koordinatını doğrudan `0` ve `SCREEN_HEIGHT` ile
karşılaştırmak yeterli değildir; dairenin kenarı merkezinden `game.ball.radius`
kadar uzaktadır.

## Sınırlar

Bu derste yalnızca `game.ball.y` ile `game.ball.velocity_y` değişsin. Topun hızını artırma, skorlama
ekleme veya paddle collision'ına geçme; hedef duvarın hareket yönüne etkisini
izole etmek.

::: details İpucu 1 — Hangi kenarı izleyeceksin?
Üst kenar `game.ball.y - game.ball.radius`, alt kenar `game.ball.y + game.ball.radius` olur.
Bu iki değeri `0` ve `SCREEN_HEIGHT` ile karşılaştır.
:::

::: details İpucu 2 — Yönü tersine çevir
Üst duvar response'u dikey velocity'yi pozitif, alt duvar response'u negatif
yapmalı. `abs` Odin'in builtin'idir; import gerekmeden `abs(...)` ile
magnitude'ı koruyup doğru işareti seçebilirsin.
:::

::: details İpucu 3 — Kontrolü nereye koyacaksın?
Önce position'ı velocity ve `dt` ile güncelle. Ardından yeni position'ın
sınırı geçip geçmediğini kontrol et; `game.ball.y` değerini sınıra koyup velocity'yi
doğru yöne ayarla.
:::

::: details Deep Dive — Position correction neden gerekli?
Bir frame topu sınırın birkaç pixel dışına taşıyabilir. Yalnızca velocity'nin
işaretini değiştirirsen sonraki frame hâlâ dışarıdaki topu yeniden işleyebilirsin.
Position correction o frame'i tekrar geçerli state'e getirir; 1.8'de aynı fikri
paddle overlap'ine uygulayacağız.
:::

## Birincil kaynak

[Odin builtin — `abs`](https://pkg.odin-lang.org/base/builtin/#abs).
Velocity'nin magnitude'ını almak için import gerektirmeyen builtin; `clamp`,
`min` ve `max` ile aynı sayfada.

**Kazanım:** Position ile velocity'nin ayrı state olduğunu, collision'ın da
velocity'yi değiştirebildiğini kullandın. Sonraki adım:
[1.7 — Rakete değdi mi?](/worlds/01-pong/07-paddle-collision).
