---
title: "2.8 — Yemi ye ve büyü"
description: "Sabit bir yem hücresini ye; büyüme kararını gövde değişmeden önce, aday new_head üzerinden ver."
section: Veri temsili
---

# 2.8 — Yemi ye ve büyü

**Hedef:** Bir tick içinde “büyüyecek miyim?” kararının hangi state üzerinden,
hangi sırada verildiğini doğru kur.

## Görev

`food: Cell` ekle ve grid üzerinde sabit, tek bir hücreye yerleştir (yeniden
yerleştirme henüz yok — bu 2.9'un konusu). Adım attığında önce yeni head'i
yerel bir `new_head: Cell` değişkeni olarak hesapla — henüz `body`'ye yazma.
`grow := new_head == game.food` ile büyüme kararını bu aday üzerinden ver.
Ancak bundan sonra gövdeyi güncelle. Sıra önemli: `grow` doğruysa `length`'i
**kaydırma döngüsünden önce** bir artır — 2.4'teki döngü sınırını mevcut
`length`'ten aldığı için, artış sonra gelirse yeni slot hiç yazılmaz. `grow`
doğruysa kuyruğu o adımda çıkarma (dolayısıyla `occupied`'de bırak); değilse
kuyruğu her zamanki gibi çıkar.

## Ne zaman bitti?

- Sabit konumdaki yem ekranda görünüyor.
- Head yem hücresine girdiği tick'te — bir tick gecikmeden — `length` bir
  artıyor.
- Büyüme kararı `game.body[0]`'ın eski değerine değil, o adımda hesaplanan
  `new_head`'e bakıyor.
- Yem yenilmediği sürece gövde uzunluğu değişmiyor.
- `odin check games/snake` geçiyor.

## Bilmen gereken küçük parça

Bir tick'te birden fazla karar veriliyor: yeni head nerede, çarpışma var mı,
büyüme var mı. Bu kararların hangi sırada, hangi state'e bakarak verildiği
önemli — yanlış sırada bir karara yanlış state'i sokarsan sonuç bir tick geç
gelir.

Aklın yatkın olduğu sıralama şu: “gövdeyi kaydır, sonra `body[0]`'a bak, yem mi
diye kontrol et.” Bu yanlış. Kaydırmadan sonra `body[0]` zaten yeni head'i
taşıyor, ama bu kontrolü kaydırmadan **önce** yaparsan `body[0]` hâlâ eski
head'i taşır — yem bir tick geç algılanır, yılan bir hücre kısa büyür. Doğrusu
kaydırmadan önce, ayrı bir yerel değişkende adayı hesaplamak:

```odin
new_head := Cell{new_col, new_row} // 2.4'teki delta ve wrap hesabıyla
grow := new_head == game.food
```

Bu iki satır gövdeye hiç dokunmuyor — yalnızca “eğer ilerlersem nereye
giderim, orası yem mi” sorusunu cevaplıyor. Gövdeyi değiştiren kod bu kararı
zaten verilmiş olarak devralır.

Büyüme için ayrı bir kod yolu açma. Normal adımda kuyruk çıkar, yeme adımında
çıkmaz; bu ikisi arasındaki tek fark `grow` bayrağı. Kuyruk çıkarma kodunu bu
bayrağa göre atla.

## Sınırlar

- Yem bu derste sabit tek bir hücrede duruyor; boş hücre seçimi ve yeniden
  yerleştirme 2.9'un konusu.
- Ring buffer kurma; kaydırma hâlâ 2.4'teki `body[i] = body[i - 1]`
  biçiminde kalıyor.
- Skor veya seviye sistemi yok.

::: details İpucu 1 — Neyi ne zaman hesaplıyorsun
Adımın en başında, gövdeye hiç dokunmadan, yalnızca 2.4'teki delta/wrap
hesabıyla `new_head`'i bul. Bu değişken geçici; henüz `body[0]`'a yazılmadı.
:::

::: details İpucu 2 — Yaygın hata
`grow := game.body[0] == game.food` yazmak cazip görünür ama yanlıştır — bu
ifade kaydırmadan önce okunursa hâlâ ESKİ head'e bakar, kaydırmadan sonra
okunursa zaten `new_head`'in kopyasına bakar ve sıralama gizlenir. Doğrusu her
zaman `new_head == game.food`'u, `new_head` hesaplandığı anda, ayrı bir
değişken olarak kontrol etmek.
:::

::: details İpucu 3 — Tick'in tam sırası
```odin
new_head := // yeni head hücresi
grow := new_head == game.food

if grow {
	game.length += 1          // kaydırmadan ÖNCE: döngü sınırı length'ten geliyor
} else {
	// kuyruk hücresini `occupied`'de false yap
}

for i := game.length - 1; i > 0; i -= 1 {
	game.body[i] = game.body[i - 1]
}
game.body[0] = new_head
game.occupied[new_head.row][new_head.col] = true
```
Kaydıran döngü her zaman çalışır; koşullu olan yalnız `length` artışı ile
kuyruk çıkarma. Artışı döngüden sonra yaparsan `body[eski_length]` hiç
yazılmaz ve gövdenin sonunda bayat bir hücre kalır.
:::

## Birincil kaynak

[Odin dil turu — struct'lar](https://odin-lang.org/docs/overview/#structs).
`new_head`'i bir `Cell` composite literal olarak oluşturman ve `==` ile
`game.food` ile karşılaştırman bu sayfadaki struct semantiğine dayanıyor.

**Kazanım:** Bir tick içinde hangi kararın hangi state üzerinden, hangi
sırada verildiği artık senin kontrolünde; büyüme kararı bir tick geç gelmiyor.

**“Snake 2.8 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu sabit yemi occupancy grid'in ikinci sorusuyla — boş hücre
nerede — yeniden yerleştirmek: [2.9 — Yemi nereye
koyalım?](/worlds/02-snake/09-food-placement).
