---
title: "2.10 — Ring buffer"
description: "Sabit body array'ini kaydırmak yerine head index'iyle dairesel kullanacak şekilde yeniden yaz."
section: Veri temsili
---

# 2.10 — Ring buffer

**Hedef:** Gövdeyi her adımda baştan sona kaydırmak yerine, sabit array üzerinde
`head` index'iyle dairesel (ring buffer) kullan.

## Görev

`Game` içine bir `head: int` field'ı ekle. Adım attığında `body` array'ini artık
kaydırma: `head`'i bir slot oynat, yeni head hücresini `body[head]`'e yaz.
Kuyruk hücresi `head` ve `length`'ten hesaplanır. 2.4'te yazdığın kaydırma
döngüsünü tamamen sil.

Bu bir refactor: oyun bittiğinde hiçbir şey farklı oynanmayacak. Değişen tek şey
gövdenin hangi slotlarda durduğu — ve `body[0]`'ın artık baş olmaması. Bu yüzden
gövdeyi okuyan **her** kod yolu değişmek zorunda. Kendi dosyanda şu altısını
teker teker geç:

1. Başlangıç gövdesinin kurulumu — `head`'in nereden başladığı da buraya dahil.
2. `occupied`'in başlangıçta gövdeden türetilmesi.
3. Adımda eski head'in okunması (yeni head'i hesaplarken).
4. Adımda kuyruk hücresinin okunması (`occupied`'den düşürmek için).
5. Adımda yeni head'in yazılması.
6. Çizim döngüsü.

Listeyi baştan sona geçmeden bitti sayma. Çizimi (6) atlarsan ilk adımda
görürsün: yılan bozuk çizilir. `occupied` yollarını (2, 4) atlarsan ekranda
hiçbir şey bağırmaz — yanlışlanan tek şey ölüm tespiti olur ve bunu ancak
ölmemesi gereken bir yerde ölünce fark edersin.

## Ne zaman bitti?

- Oynanış 2.8'dekiyle birebir aynı: hareket, yem, büyüme, kendine çarpma
  davranışı değişmedi.
- Adım başına `body` array'inde yalnızca bir hücre yazılıyor (yeni head);
  kaydırma döngüsü kodda kalmadı.
- Çizim ve occupancy güncellemesi `head` ile `length`'ten hesaplanan index'leri
  okuyor, `body[0]`'ı sabit baş kabul etmiyor.
- `odin check games/snake` geçiyor.

## Bilmen gereken küçük parça

Şu ana kadar `body[0]` her zaman gövdenin başıydı; her adımda geri kalan her
hücre bir slot kaydırılıyordu. Bunun maliyeti gövde uzunluğuyla büyür — 200
hücrelik bir yılan her adımda 200 yazma yapar, oysa gerçekte değişen tek şey bir
baş eklenmesi ve bir kuyruğun düşmesidir.

Ring buffer bunu tersine çevirir: array'in kendisi hiç kaymaz, hareket eden şey
`head`'in array içinde hangi hücreyi gösterdiğidir. Gövdenin `i`'inci hücresi
artık `body[(head + i) % MAX_BODY]` ile okunur (`i` `0`'dan `length - 1`'e
kadar); kuyruk da bu formülde `i = length - 1` olan hücredir.

### Kuyruğu `head` hareket etmeden önce oku

Kuyruğun index'i sabit değil: `(head + length - 1) % MAX_BODY`. Formülün içinde
`head` var, yani `head`'i oynattığın anda formülün cevabı da değişiyor.

`head`'i bir slot geri kaydırdıktan sonra bu formülü okursan, elde ettiğin hücre
gövdeden çıkan kuyruk değil, onun bir önceki komşusudur — yani yılanın hâlâ
üstünde durduğu hücre. Onu `occupied`'de `false` yaparsan gövdenin ortasında
delik açarsın, gerçekten boşalan hücre ise dolu işaretli kalır. Grid ile gövde
sessizce ayrışır.

Bu, 2.7'de kaydırmadan sonra `body[length - 1]`'i okuduğunda çıkan off-by-one'ın
aynısı. Orada kuyruğu kaydırma yok ediyordu, burada `head`'in hareketi. Kural iki
durumda da aynı: **çıkan hücreyi, onu çıkaran işlemden önce oku.**

Sıra şu: kuyruk hücresini oku (ve gerekiyorsa `occupied`'de temizle), sonra
`head`'i oynat, sonra `body[head]`'e yeni head'i yaz.

### Negatif modulo, ikinci kez

2.4'teki negatif modulo tuzağı burada geri geliyor, yön tersine döndüğü için bir
kez daha dikkat ister: Odin'de `-1 % MAX_BODY` değeri `-1` döner, `MAX_BODY - 1`
değil. `head`'i geri kaydırırken `(head - 1 + MAX_BODY) % MAX_BODY` yazmak
zorundasın; düz `head - 1` bazı adımlarda negatif bir index üretir.

## Sınırlar

- `[dynamic]Cell`, `append`, `make` veya `core:container` paketini kullanma;
  kapasite hâlâ `MAX_BODY` sabit array.
- İndex hesabını gövdeye dokunan her satıra elle kopyalamak yerine tek bir
  yardımcı procedure'da toplamak serbest, hatta tavsiye edilir — ama zorunlu
  değil.
- Yön, tick süresi, yem ve büyüme kuralları 2.8'deki gibi kalıyor; bu ders
  yalnızca temsili değiştiriyor.

::: details İpucu 1 — Neyin sabit, neyin değişken olduğunu ayır
`body`'nin kendisi artık hiç kaymıyor. Değişen tek şey `head`'in hangi index'i
gösterdiği. Adımda önce `head`'i güncelle, sonra yeni head değerini
`body[head]`'e yaz — sırayı tersine çevirirsen eski head'in üstüne yazarsın.
:::

::: details İpucu 2 — Kuyruğu head'ten bulmak
Kuyruk hücresi ring içinde başın tam `length - 1` kadar gerisinde:
`body[(head + length - 1) % MAX_BODY]`. Büyümüyorsan (o adımda yem yemediysen)
bu hücreyi occupancy grid'de `false` yapman gerekiyor.
:::

::: details İpucu 3 — Head'i kaydırma formülü
Yeni adımın ilk iki satırı şuna benzer:

```odin
game.head = (game.head - 1 + MAX_BODY) % MAX_BODY
game.body[game.head] = new_head_cell
```

Kaydırma döngüsü artık burada yok; gövdenin geri kalanı array'de olduğu yerde
duruyor, sadece hangi hücrelerin gövdeye dahil sayıldığı `head` ve `length` ile
belirleniyor.
:::

::: details Deep Dive — Bu neden gerçek bir kazanç?
2.4'teki kaydırma tick başına `length` yazma yapıyordu — maliyet gövde
uzunluğuyla büyüyordu. Ring buffer'da tick başına yazma sayısı sabit: bir head
yazması, en fazla bir occupancy güncellemesi. Bu, oyun kodunda sık karşılaşacağın
bir desen: “sona ekle, baştan çıkar” ihtiyacı olan her yerde (event queue, input
geçmişi, replay buffer) aynı ring buffer fikri geri gelir.
:::

## Birincil kaynak

[Odin dil turu](https://odin-lang.org/docs/overview/). Sabit boyutlu
array'lerin `[N]T` biçiminde compile-time boyutlu, value-type olduğunu anlatır;
ring buffer'ın index aritmetiği tam olarak bu semantiğin üstüne kurulu.

**Kazanım:** Gövdenin adım başına maliyeti artık sabit; bir temsili
değiştirdiğinde gövdeye dokunan kaç yerin değiştiğini elinle saydın.

**“Snake 2.10 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu sabit maliyetli temsilin gerçekten allocation yapmadığını
ölçmek: [2.11 — Allocation sayacı](/worlds/02-snake/11-allocation-counter).
