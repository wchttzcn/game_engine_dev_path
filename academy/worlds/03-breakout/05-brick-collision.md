---
title: "3.5 — Tuğlayı kır"
description: "Topu canlı tuğlalarla çarpıştır, çarpılanı düşür ve topun hangi yüzden girdiğine bakarak doğru ekseni ters çevir."
section: Tuğla duvarı
---

# 3.5 — Tuğlayı kır

**Hedef:** Top canlı bir tuğlaya çarpınca tuğlayı düşür ve topu girdiği yüze
göre doğru eksenden sektir.

## Görev

Her frame canlı tuğlaları tara, topla çarpışanı bul, bayrağını düşür ve topun
tuğlaya hangi eksenden girdiğine bakarak o eksenin velocity'sini ters çevir.
Bir frame'de en fazla bir tuğla kırılsın.

## Ne zaman bitti?

- Top tuğlaya çarpınca tuğla ekrandan kayboluyor.
- Yandan gelen top `vel.x`'i, alttan veya üstten gelen `vel.y`'yi çeviriyor.
- Kırılan tuğla bir daha çarpışmaya katılmıyor.
- Bir frame'de yalnız bir tuğla kırılıyor.
- `odin check games/breakout` geçiyor.

## Elindekiler

Yeni struct veya proc yok — 3.4'teki `Brick` ve tuğla duvarı yeterli. Bu ders
mevcut duvar taramasına tepki eklemekle ilgili; tarama zaten `Playing`
kolunda `game.bricks` üzerinde dönüyor olacak. Tek fark: bu sefer array
elemanını **değiştirmen** gerekiyor.

```odin
for &brick in game.bricks {
	if !brick.alive do continue
	if rl.CheckCollisionCircleRec(game.ball.pos, game.ball.radius, brick.rect) {
		// çarpışma tepkisi — sana ait
	}
}
```

`for brick in ...` sana bir **kopya** verir; kopyaya yazmak derleyiciyi
susturmaz. `&` ile dolaşmak elemanın kendisine erişim verir, `brick.alive =
false` yazabilmenin tek yolu bu.

`abs` import gerektirmeyen bir builtin, `f32` üzerinde doğrudan çalışır:
`abs(-3.5) // 3.5`.

## Sınırlar

- Konumu düzeltmeye gerek yok. Tuğla aynı frame yok oluyor, ikinci kez
  tetiklenecek bir şey kalmıyor.
- Bir frame'de tek tuğla. Aynı anda ikisine değen top nadirdir ve iki kez
  çevirmek topu geri döndürür.
- Skor, ses, parçacık yok. Tuğla sessizce kayboluyor.

::: details İpucu 1 — Hangi ekseni çevireceğine nasıl karar verirsin
Canlı her tuğlayı sırayla dene; ilk çarpışanı bulunca dur. Çarpışma anında
topun merkezi ile tuğlanın merkezi arasındaki fark, her eksende ne kadar iç
içe geçtiğini söylüyor — bu iki `overlap` değerini hesapla. Top hangi yüzden
girdiyse o eksende daha az gömülmüştür: küçük olan `overlap`, ters çevrilecek
ekseni gösterir. O eksenin velocity'sini çevir, tuğlayı düşür, döngüden çık.
:::

::: details İpucu 2 — Döngüden çıkmayı unutmak
Tuğlayı düşürüp döngüye devam edersen top aynı frame'de ikinci bir tuğlaya da
çarpabilir — komşu tuğlalar art arda `overlap` testini geçebilir. Birinci
çarpışmayı bulduğunda hemen `break` ile çık; aksi halde bir frame'de birden
fazla tuğla kaybolur ve top aynı anda iki farklı eksende zıplamış gibi
davranır.
:::

::: details İpucu 3 — Tam çözüm
```odin
for &brick in game.bricks {
	if !brick.alive do continue
	if rl.CheckCollisionCircleRec(game.ball.pos, game.ball.radius, brick.rect) {
		dx := game.ball.pos.x - (brick.rect.x + brick.rect.width / 2)
		dy := game.ball.pos.y - (brick.rect.y + brick.rect.height / 2)
		overlap_x := (brick.rect.width / 2 + game.ball.radius) - abs(dx)
		overlap_y := (brick.rect.height / 2 + game.ball.radius) - abs(dy)
		if overlap_x < overlap_y {
			game.ball.vel.x = -game.ball.vel.x
		} else {
			game.ball.vel.y = -game.ball.vel.y
		}
		brick.alive = false
		break
	}
}
```
Bu döngü `Playing` kolunda, raket-top çarpışma kontrolünden hemen sonra
gidiyor — top o frame'in konumuna zaten ulaşmış olmalı.
:::

## Kaynak

[Odin builtin procedure'ları](https://pkg.odin-lang.org/base/builtin/).
`abs` import gerektirmeyen bir builtin ve `f32` üzerinde doğrudan çalışıyor;
overlap hesabının iki satırı buna dayanıyor.

## Daha derine

Ders bittikten sonra: `overlap_x` ile `overlap_y` eşit çıktığında top tam
köşeye gelmiş demektir ve yukarıdaki karşılaştırma keyfi bir taraf seçer.
Gerçek oyunlar burada genelde iki ekseni birden çevirir, bazıları hiçbirini
çevirmeyip topu geçirir.

Bu belirsizlik, çarpışmayı frame frame örneklemenin doğrudan sonucu: temas
anını değil, temastan sonraki ilk kareyi görüyorsun, ve o karede top zaten iki
yüzü de aşmış olabiliyor. 3.3'te konumu düzeltirken aynı örnekleme sorununun
yumuşak halini görmüştün; bu onun sert hali. Kesin cevap için topun bir önceki
konumundan bu konumuna çizilen doğrunun tuğlanın hangi kenarını önce kestiğini
çözmek gerekir — sweep testi. 50 tuğlalık bir duvarda bu yatırımın karşılığı
yok; hangi frame'de hangi tuğlanın kaybolduğunu gözle ayırt edemezsin.

## Kazanım

Breakout ilk kez Breakout gibi oynanıyor — vurulacak bir şey var ve duvar
eriyor. Eksik olan tek şey duvarın bittiğinin fark edilmesi.

**“Breakout 3.5 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım duvarın sonunu görmek: [3.6 — Bölümü temizle](/worlds/03-breakout/06-level-clear).
