---
title: "3.3 — Duvar ve raket sekmesi"
description: "Topu üç duvardan sektir, rakete çarpınca geri gönder ve alt kenardan düşünce kaybettir."
section: Breakout iskeleti
---

# 3.3 — Duvar ve raket sekmesi

**Hedef:** Topu sol, sağ ve üst duvardan sektir; rakete çarpınca yukarı gönder;
alt kenardan düşerse kaybettir.

## Görev

Topun konumunu her frame üç duvara karşı kontrol et ve çarptığı eksenin
velocity'sini ters çevir. Rakete çarptığında `vel.y`'yi ters çevir. Top alt
kenarın altına inerse oyunu kaybedilmiş say: bir `Game_State` tut, `Lost`
durumunda topu durdur ve ekranda kaybettiğini yazan bir metin göster. `R` oyunu
baştan kursun.

## Ne zaman bitti?

- Top sol, sağ ve üst duvardan sekiyor; hiçbirinin içine gömülmüyor.
- Top rakete çarpınca yukarı dönüyor.
- Top alt kenardan çıkınca state `Lost` oluyor ve ekranda görünüyor.
- `R` topu ve raketi başlangıç konumuna döndürüp state'i `Playing` yapıyor.
- `odin check games/breakout` geçiyor.

## Bilmen gereken küçük parça

Dört kenarın üçü aynı kural, biri farklı. Sol, sağ ve üst **sektiriyor**; alt
**bitiriyor**. Breakout'u Pong'dan ayıran şey tam olarak bu asimetri: Pong'da
alt ve üst simetrikti, yan duvarlar skordu.

Sekme kuralı 1.6'dakiyle aynı: çarptığın eksenin velocity'sini ters çevir, diğerine
dokunma. Sol/sağ duvar `vel.x`'i, üst duvar `vel.y`'yi çevirir.

Bir ayrıntı seni ısırabilir: velocity'yi ters çevirmek yetmiyor, topu duvarın
dışına da itmen gerekiyor. Top duvarın içine bir miktar girmişken sadece işaret
çevirirsen, bir sonraki frame hâlâ içeride olabilir ve koşul tekrar tetiklenir —
top duvara yapışıp titrer. Çözüm: işareti çevirirken konumu da sınıra sabitle.

```odin
if ball.pos.x - ball.radius < 0 {
	ball.pos.x = ball.radius
	ball.vel.x = -ball.vel.x
}
```

Raket için de aynı soru geçerli ama daha yumuşak: `vel.y` zaten negatif
olduğunda (top yukarı giderken) rakete çarpma kontrolü tetiklenmemeli, yoksa
raketin içinden geçen top kilitlenir. Çarpmayı yalnızca top aşağı inerken kabul
et.

## Sınırlar

- Raketin neresine çarpıldığının açıyı değiştirmesi bu derste yok; `vel.y`'yi
  çevirmek yeterli. Açı kontrolü ayrı bir görev olarak sonra gelecek.
- Can sayısı, skor veya seviye yok. Tek düşüş, tek kayıp.
- Tuğla hâlâ yok.

::: details İpucu 1 — Üç duvar, tek soru
Her duvar için sorduğun soru aynı: topun o kenardaki ucu sınırı geçti mi?
Sol için `ball.pos.x - ball.radius`, sağ için `ball.pos.x + ball.radius`, üst
için `ball.pos.y - ball.radius`. Merkezi değil, kenarı kontrol ediyorsun.
:::

::: details İpucu 2 — Raket çarpışması
Raket bir dikdörtgen, top bir daire. raylib'de
`rl.CheckCollisionCircleRec(game.ball.pos, game.ball.radius, game.player.rect)`
bu soruyu doğrudan cevaplıyor; kendi kontrolünü yazmana gerek yok. İlk parametre
zaten bir `rl.Vector2` istiyor, topun konumu da öyle tutuluyorsa doğrudan
geçebilirsin.
:::

::: details İpucu 3 — Aşağı inme koşulu
```odin
if game.ball.vel.y > 0 && rl.CheckCollisionCircleRec(...) {
	game.ball.pos.y = game.player.rect.y - game.ball.radius
	game.ball.vel.y = -game.ball.vel.y
}
```
`vel.y > 0` kontrolü topun aşağı indiğini söylüyor. Onsuz, raketin içinde
kalan bir top her frame işaret çevirip yerinde titrer.
:::

::: details Deep Dive — Neden konumu da düzeltiyoruz?
Çarpışmayı frame frame örneklediğin için topu tam temas anında değil, biraz
geçtikten sonra yakalıyorsun. Sadece velocity'yi çevirmek “artık ters yöne
gidiyorum” der ama “hâlâ içerideyim” gerçeğini değiştirmez; hızlı topta bir
sonraki frame de içeride biter ve ikinci bir çevirme olur. Buna tünel etkisinin
küçük kardeşi diyebilirsin. Konumu sınıra sabitlemek, durumu çarpışma anının
fiziksel olarak geçerli olduğu yere geri koyuyor. 3.5'te topun tuğlaya hangi
yüzden girdiğini çözerken aynı soru daha sert haliyle gelecek.
:::

## Birincil kaynak

[Odin vendor:raylib — `CheckCollisionCircleRec`](https://pkg.odin-lang.org/vendor/raylib/#CheckCollisionCircleRec).
Daire–dikdörtgen çarpışmasının imzası ve parametre sırası burada; 1.7'de aynı
soruyu Pong'un raketleri için çözmüştün.

**Kazanım:** Breakout artık oynanabilir bir döngüye sahip — top sahnede kalıyor,
raket onu tutuyor, kaçırırsan kaybediyorsun. Eksik olan tek şey oynamak için bir
sebep: vurulacak bir şey.

**“Breakout 3.3 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım sahneye vurulacak bir şey koymak: [3.4 — Tuğla duvarını kur](/worlds/03-breakout/04-brick-wall).
