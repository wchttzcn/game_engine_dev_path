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
tuğlaya hangi eksenden girdiğine bakarak o eksenin velocity'sini ters çevir. Bir
frame'de en fazla bir tuğla kırılsın.

## Ne zaman bitti?

- Top tuğlaya çarpınca tuğla ekrandan kayboluyor.
- Yandan gelen top `vel.x`'i, alttan veya üstten gelen `vel.y`'yi çeviriyor.
- Kırılan tuğla bir daha çarpışmaya katılmıyor.
- Bir frame'de yalnız bir tuğla kırılıyor.
- `odin check games/breakout` geçiyor.

## Bilmen gereken küçük parça

Çarpışma testi 3.3'tekiyle aynı: `rl.CheckCollisionCircleRec`. Değişen iki şey
var.

**Birincisi: array elemanını değiştirmek.** Döngü değişkeni varsayılan olarak bir
kopya, ve Odin kopyaya yazmana izin vermiyor:

```text
Error: Cannot assign to 'brick.alive'
```

Elemanın kendisine yazmak için `&` ile referans olarak dolaş:

```odin
for &brick in game.bricks {
	if !brick.alive do continue
	// buradaki brick.alive = false array'deki tuğlayı düşürür
}
```

2.4'te `head := game.body[0]` yazıp kopyayı değiştirdiğinde derleyici susmuştu,
çünkü orada kopya geçerli bir değişkendi. Burada sessiz kalmıyor — bu hatayı
yapmanın tek yolu `&`'i unutmak, ve derleyici onu sana söylüyor.

**İkincisi: hangi eksen?** Duvarda top bir tuğlaya yandan da, alttan da
girebiliyor. Çarpışma anında topun merkezi ile tuğlanın merkezi arasındaki fark
bunu söylüyor:

```odin
dx := game.ball.pos.x - (brick.rect.x + brick.rect.width / 2)
dy := game.ball.pos.y - (brick.rect.y + brick.rect.height / 2)

overlap_x := (brick.rect.width / 2 + game.ball.radius) - abs(dx)
overlap_y := (brick.rect.height / 2 + game.ball.radius) - abs(dy)
```

`overlap_x` ve `overlap_y`, iki şeklin o eksende kaç pixel iç içe geçtiğini
veriyor. Top bir yüzden girdiğine göre, **girdiği yüzün ekseninde daha az
gömülmüştür** — çünkü o eksende yolu daha yeni kesişti. Kararı bu iki sayının
karşılaştırması veriyor.

## Sınırlar

- Konumu düzeltmeye gerek yok. 3.3'te duvara yapışmayı önlemek için topu sınıra
  sabitliyordun; burada tuğla aynı frame yok oluyor, yani ikinci kez tetiklenecek
  bir şey kalmıyor.
- Bir frame'de tek tuğla. Aynı anda ikisine değen top nadirdir ve iki kez
  çevirmek topu geri döndürür.
- Skor, ses, parçacık yok. Tuğla sessizce kayboluyor.

::: details İpucu 1 — Taramanın şekli
Her frame bütün array'i dolaşıyorsun ama iki elemeyi baştan yapabilirsin: ölü
tuğlayı atla, çarpışmayanı atla. Geriye kalan tek elemanda işi yapıp döngüden
çık.
:::

::: details İpucu 2 — Karşılaştırma
İki overlap'ten **küçük** olan, topun girdiği yüzü gösteriyor. Küçük olan
`overlap_x` ise top yan yüzden girmiş demektir, yani ters çevrilecek olan
`vel.x`.
:::

::: details İpucu 3 — Yanıtın şekli
```odin
if overlap_x < overlap_y {
	game.ball.vel.x = -game.ball.vel.x
} else {
	game.ball.vel.y = -game.ball.vel.y
}
brick.alive = false
break
```
`break` olmadan aynı frame'de ikinci bir tuğla da kırılabilir.
:::

::: details Deep Dive — Köşeden gelen top
`overlap_x` ile `overlap_y` eşit olduğunda top tam köşeye gelmiş demektir ve
yukarıdaki `if` keyfi bir taraf seçer. Gerçek oyunlar burada genelde iki ekseni
birden çevirir; bazıları hiçbirini çevirmeyip topu geçirir.

Bu belirsizlik, çarpışmayı frame frame örneklemenin doğrudan sonucu: temas anını
değil, temastan sonraki ilk kareyi görüyorsun, ve o karede top zaten iki yüzü de
aşmış olabiliyor. 3.3'ün Deep Dive'ında konumu düzeltirken aynı örnekleme
sorununun yumuşak halini görmüştün; bu onun sert hali. Kesin cevap için topun bir
önceki konumundan bu konumuna çizilen doğrunun tuğlanın hangi kenarını önce
kestiğini çözmek gerekir — sweep testi. 50 tuğlalık bir duvarda bu yatırımın
karşılığı yok; hangi frame'de hangi tuğlanın kaybolduğunu gözle ayırt edemezsin.
:::

## Birincil kaynak

[Odin builtin procedure'ları](https://pkg.odin-lang.org/base/builtin/).
`abs` import gerektirmeyen bir builtin ve `f32` üzerinde doğrudan çalışıyor;
overlap hesabının iki satırı buna dayanıyor.

**Kazanım:** Breakout ilk kez Breakout gibi oynanıyor — vurulacak bir şey var ve
duvar eriyor. Eksik olan tek şey duvarın bittiğinin fark edilmesi.

**“Breakout 3.5 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım duvarın sonunu görmek: [3.6 — Bölümü temizle](/worlds/03-breakout/06-level-clear).
