---
title: "2.5 — Input tamponu"
description: "Input'un frame hızında geldiğini, simülasyonun tick hızında tükettiğini ayıran bir yön tamponu kur."
section: Grid ve hareket
---

# 2.5 — Input tamponu

**Hedef:** Input'un frame hızında geldiğini, simülasyonun tick hızında
tükettiğini ayır ve aradaki tamponu doğru yönde kur.

## Görev

`direction` alanının yanına bir `next_direction` alanı ekle. Her frame'de ok
tuşuna basılırsa `next_direction`'ı güncelle. Tick geldiğinde
`direction = next_direction` yap ve adımı bu yeni yöne göre at. 180 derece
dönüşü — yılanın anlık yönünün tam tersi — reddet.

## Ne zaman bitti?

- İki tick arasında basılan bir tuş kaybolmuyor; sonraki tick onu uyguluyor.
- Yılan hareket ettiği yönün tam tersine tek adımda dönemiyor.
- Bir tuşu basılı tutmak normal hareketten farklı davranmıyor.
- `odin check games/snake` geçiyor.

## Bilmen gereken küçük parça

2.3'te tick'i frame'den ayırdın: input her frame okunuyor, adım yalnızca
`tick_timer` eşiği geçince oluyor. Aynı frame içinde tuşa birden çok kez
basılabilir ama tick tek bir yön görebilir — o yüzden anlık tuş durumunu değil,
bir sonraki tick'te uygulanacak yönü saklayan ayrı bir alan gerekiyor.

Kontrolü neye karşı yaptığın kritik. `next_direction`'a karşı kontrol edersen
aynı tick arasında sağ, yukarı, sol gibi ardışık tuşlarla yılanı fiilen tersine
çevirebilirsin — her atama tek başına geçerli görünür ama tick geldiğinde sonuç
180 derece dönüş olur. Kontrol her zaman o an yürürlükte olan `direction`'a
karşı yapılmalı.

## Sınırlar

- Kuyruk uzunluğunda bir input queue kurma; tek slotluk `next_direction`
  yeterli.
- Bu ders yalnızca yön tamponunu ekliyor; kendine çarpma tespiti, occupancy
  grid veya yem bu dersin konusu değil.

::: details İpucu 1 — Nerede okunur, nerede uygulanır
Ok tuşu kontrolü her frame çalışan koddadır — `next_direction`'ı orada
güncelle. Yön değişimini gövdeye uygulayan satır ise yalnızca tick olduğunda
çalışan koddadır; `direction`'ı orada güncelle.
:::

::: details İpucu 2 — Ters yön nasıl tanımlanır
Her `Direction` üyesinin bir zıttı var: `Up`↔`Down`, `Left`↔`Right`.
Reddetmen gereken durum, önerilen yönün yürürlükteki yönün zıttı olması —
aynı yönde kalması veya dik açıda dönmesi değil.
:::

::: details İpucu 3 — Kontrolün sırası
Tick geldiğinde önce `next_direction`'ın yürürlükteki `direction`'ın tersi
olup olmadığına bak; tersse `next_direction`'ı yoksay, değilse
`direction = next_direction` yap. Bu sıra korunursa basılı tutulan bir tuş da
güvenli kalır, çünkü her tick aynı kontrolden geçer.
:::

## Birincil kaynak

[Odin dil turu — enum](https://odin-lang.org/docs/overview/#enumerations).
`Direction` üyeleri arasında karşılaştırma ve atama burada aynı sözdizimiyle.

**Kazanım:** Yılanın yönü artık frame'in değil, tick'in kontrolünde; input
kaybolmuyor ve kendi üstüne katlanmıyor.

**“Snake 2.5 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım yılanın kendi gövdesine çarpmasını tespit etmek:
[2.6 — Kendine çarpma](/worlds/02-snake/06-self-collision).
