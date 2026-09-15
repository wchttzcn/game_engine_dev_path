---
title: "2.6 — Kendine çarpma"
description: "Yeni head'in gövdeye çarpıp çarpmadığını baştan sona tarayarak tespit et, oyunu durdur ve R ile yeniden başlat."
section: Veri temsili
---

# 2.6 — Kendine çarpma

**Hedef:** Yeni head'in gövdenin geri kalanına çarpıp çarpmadığını en açık
yöntemle — baştan sona tarayarak — tespit et ve oyunu durdur.

## Görev

Yılanın başlangıç düzenini 2.2'deki 3 hücre yerine 5 geçerli hücreye çıkar
(aynı satırda, ardışık `col` değerleriyle). Her adımdan sonra yeni `body[0]`'ı,
gövdenin geri kalanındaki her hücreyle karşılaştır. Eşleşen bir hücre
bulursan çarpışma var demektir. `Game_State :: enum { Playing, Dead }` ekle;
çarpışma anında `Dead`'e geç ve o andan sonra tick'i durdur — yılan artık
ilerlemesin. Son olarak `R` tuşuna basit bir restart bağla: `Dead`
durumundayken `R`'ye basılınca yılanı bu 5 hücrelik başlangıç düzenine,
`direction`/`next_direction`'ı başlangıç yönüne ve `state`'i `Playing`'e
döndür.

## Ne zaman bitti?

- Yılan kendi gövdesine girdiğinde hareket duruyor.
- Beş hücrelik başlangıç düzeniyle dört ardışık dönüş (örneğin sağ, aşağı, sol,
  yukarı) yılanı gerçekten kendi gövdesine sokuyor — bu davranışı ekranda
  gözlemleyebiliyorsun.
- Oyunun `Dead` durumda olduğu ekranda okunuyor (bir metin yeterli).
- `R`'ye basınca yılan yeniden `Playing` durumunda, başlangıç uzunluğunda ve
  konumunda beliriyor.
- Normal oynanışta — çarpışma olmadığı sürece — hiçbir şey değişmedi.
- `odin check games/snake` geçiyor.

## Bilmen gereken küçük parça

Üç hücrelik bir yılan, 2.5'in yasakladığı 180 derecelik dönüş dışında hangi
sırayla dönersen dön kendi gövdesine çarpamaz: kuyruk her adımda ilerleyip
eski hücresini boşaltıyor, yani yeni head'in çarpabileceği tek hücre tam o
anda boşalmış oluyor. Beş hücre, dört ardışık 90 derecelik dönüşle (örneğin
sağ, aşağı, sol, yukarı) yılanı kendi üstüne kapatabileceğin minimum uzunluk —
başlangıç düzenini bu yüzden büyütüyorsun.

Elindeki tek temsil `body` array'i; sıra bilgisini tutuyor — hangi hücre baş,
hangisi bir sonraki, hangisi kuyruk. “Bu hücre dolu mu?” sorusunu cevaplamak
için ise sıra değil, doluluk bilgisi gerekiyor ve `body` bunu doğrudan
vermiyor. Elindeki tek yol her seferinde baştan sona taramak: `length` kadar
karşılaştırma yapmak.

Eklediğin `R` restart'ı şimdilik yalnızca gövdeyi, yönü ve state'i
sıfırlıyor — `occupied` grid'i (2.7) ve ring buffer index'i (2.10) henüz yok,
yani henüz senkronize edilecek ikinci bir temsil de yok. Birden fazla
temsili tek seferde tutarlı kuran tam `game_reset` disiplini 2.13'te geliyor;
burada amaç yalnızca collision ve büyüme üzerinde çalışırken programı elle
yeniden başlatmak zorunda kalmamak.

Bu tarama tick başına `length` karşılaştırma demek. Yılan 200 hücreye çıkınca
tick başına 200 karşılaştırma olur — bu ölçekte hiç sorun değil. Asıl önemli
olan sayının kendisi değil, neden bu sayıyı ödediğin: temsilin sana vermediği
bir bilgiyi her defasında yeniden hesaplıyorsun.

## Sınırlar

- Occupancy grid kurma; bu bir sonraki dersin konusu.
- Restart'ı yalnızca gövde, yön ve state'i kapsayacak şekilde tut; `occupied`
  grid'i, ring buffer index'i veya yem henüz yok, onları sıfırlamaya çalışma.
- Yem veya büyüme yok.

::: details İpucu 1 — Neyi neyle karşılaştırıyorsun
Adım attıktan sonra `body[0]` yeni head'in. Çarpışma kontrolü `body[0]`'ı
`body[1]`'den `body[length - 1]`'e kadar olan hücrelerle karşılaştırır —
kendisiyle değil.
:::

::: details İpucu 2 — Eşitlik neye göre
`Cell` yalnızca `col` ve `row` alanlarından oluşan bir struct. Odin'de bütün
alanları karşılaştırılabilir olan struct'lar `==` ile doğrudan
karşılaştırılabilir; iki hücreyi field'larını tek tek okumadan eşitleyebilirsin.
:::

::: details İpucu 3 — Döngü ve durum geçişi
```odin
for i in 1..<game.length {
	if game.body[i] == game.body[0] {
		game.state = .Dead
	}
}
```
Bu döngüyü adım attıktan hemen sonra çalıştır. `state == .Dead` olduğunda
tick'i ilerleten kodun en başına bir kontrol koyup adımı orada durdurabilirsin.

`R` restart'ı, 2.2'deki başlangıç atamasını (bu kez 5 hücreyle) tekrar
çalıştırıp `state`'i `.Playing`'e döndürmekten ibaret. `rl.IsKeyPressed(.R)`
ile kontrol et, ama yalnızca `state == .Dead` iken uygula — `Playing` sırasında
basılırsa hiçbir şey değişmesin.
:::

## Birincil kaynak

[Odin dil turu — for döngüsü](https://odin-lang.org/docs/overview/#for-statement).
`1..<game.length` aralık sözdizimi bu derste kullandığın parça burada.

**Kazanım:** Yılan artık kendi üstüne çarpıp durabiliyor ve `R` ile hemen
yeniden deneyebiliyorsun; ama bunun bedelini de gördün — “dolu mu?” sorusunu
cevaplamak için gövdeyi baştan taramak zorundasın.

**“Snake 2.6 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu soruyu sabit sürede cevaplayan ikinci bir temsil eklemek:
[2.7 — Occupancy grid](/worlds/02-snake/07-occupancy-grid).
