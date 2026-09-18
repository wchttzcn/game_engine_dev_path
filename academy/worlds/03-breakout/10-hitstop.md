---
title: "3.10 — Hitstop"
description: "Tuğla kırıldığı anda simülasyonu birkaç frame dondurarak vuruşa ağırlık kat."
section: Oyun hissi
---

# 3.10 — Hitstop

**Hedef:** Bir tuğla kırıldığında simülasyonu çok kısa bir süreliğine durdur, ama pencere ve çizim çalışmaya devam etsin.

## Görev

`Game` içine bir hitstop sayacı ekle. Tuğla kırıldığında sayacı sabit bir
süreye kur, her frame `dt` kadar azalt. Sayaç sıfırdan büyükken o frame'in
simülasyon adımını — top, raket, çarpışmalar — atla; sıfıra inince kaldığı
yerden devam et. Pencere kapatma ve `R` sıfırlaması hitstop sırasında da
çalışmalı.

## Ne zaman bitti?

- Tuğlaya çarpınca top ve sahne kısa bir an donuyor, sonra devam ediyor.
- Donma birkaç frame sürüyor (30-80ms civarı), oyunu kilitlemiyor.
- Pencere hâlâ kapanabiliyor, `R` hâlâ sıfırlıyor — hitstop sırasında da.
- Hitstop devam ederken simülasyon gerçekten duruyor, yavaşlamıyor.
- `odin check games/breakout` geçiyor.

## Elindekiler

```odin
Game :: struct {
	// ...
	hitstop: f32,
}

HITSTOP_DURATION :: 0.05 // saniye
```

Hitstop bir çizim efekti değil: o frame'lerde `update` kısmını hiç
çalıştırmıyorsun. Şu an `Game_State :: enum { Playing, Lost, Won }` üzerindeki
`switch`'in `.Playing` kolu topu, raketi ve çarpışmaları güncelliyor; hitstop
bu kolun **içine** girer, dışına değil — pencere olayları ve çizim çağrıları
ondan etkilenmemeli.

## Sınırlar

- Hitstop yalnız tuğla kırılınca tetiklenir; raket-top veya duvar sekmesinde
  değil.
- Süre şimdilik sabit; runtime'da değiştirilebilir panel paketin sonunda
  geliyor.

::: details İpucu 1 — Hangi blok donacak
`.Playing` kolunun içindeki her şey — raket hareketi, top pozisyonu,
duvar/raket/tuğla çarpışmaları — `dt`'ye dayanıyor. Hitstop aktifken bu
bloğun hiçbiri çalışmamalı. Kolun en başına bir kontrol koyup geri kalan her
şeyi bir dalın içine almak, mevcut kodu neredeyse hiç yeniden yazmadan bu
ayrımı verir.
:::

::: details İpucu 2 — Sayaç sırası
Aynı frame'de önce sayacı azaltıp sonra simülasyonu da çalıştırırsan,
hitstop biteceği frame'de hem sayaç sıfıra iner hem top hareket eder — ama o
frame hâlâ donmuş olması gerekiyordu. Sıra şu olmalı: önce “hitstop aktif
mi?” diye bak; aktifse yalnız sayacı azalt, simülasyona hiç girme; değilse
simülasyonu çalıştır. İkisini aynı frame'de birlikte yapma.
:::

::: details İpucu 3 — Tam çözüm
```odin
switch game.state {
case .Playing:
	if game.hitstop > 0 {
		game.hitstop -= dt
	} else {
		// mevcut raket/top/çarpışma kodu buraya
	}
case .Lost:
case .Won:
}
```
Tuğla kırılma noktasında (`brick.alive = false` satırının hemen ardında)
`game.hitstop = HITSTOP_DURATION` satırını ekle.
:::

## Kaynak

[Odin Overview — resmi dil rehberi](https://odin-lang.org/docs/overview/),
`#switch-statement` bölümü. Bu ders yeni kontrol akışını mevcut bir
`switch` kolunun içine yerleştiriyor; kolun kapsamı ve dallanma sözdizimi
buradan doğrulandı.

## Daha derine

Ders bittikten sonra: [Jan Willem Nijman (Vlambeer) — The Art of
Screenshake](https://archive.org/details/the-art-of-screenshake). Aynı oyuna
tek tek eklenen küçük geri bildirim katmanlarının (vuruşta duraklama,
sarsıntı, parçacık, ses) hissi nasıl değiştirdiğini gösteriyor; hitstop bu
katmanların ilki ve genelde en ucuzu.

Süreyi saniyeyle ölçmek (`hitstop -= dt`), “N frame dur” demekten daha
sağlamdır: frame sayısıyla ölçersen 30 FPS'te oynayan biri senin 60 FPS'te
ayarladığın süreyi iki katı hisseder. “Doğru” hitstop süresi de yok — 20ms
fark edilmeyebilir, 150ms donuk hissettirir, arası oyuna göre değişir. Tek
yol denemek: değeri değiştir, derle, oyna, hisset. 3.14'te bu sabitleri
runtime'da bir panelden canlı değiştireceksin.

## Kazanım

Oyunun “doğru” çalışması ile “iyi hissettirmesi” iki ayrı soru. Kod tarafında
hitstop küçük bir `if`, ama nereyi dondurup nereyi dondurmayacağını seçmek
dersin asıl işiydi. Bu ayrım — gameplay state mi, presentation state mi —
sıradaki iki derste de karşına çıkacak.

**“Breakout 3.10 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım vuruşa ekranı da katmak: [3.11 — Kamera sarsıntısı](/worlds/03-breakout/11-screen-shake).
