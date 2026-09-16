---
title: "2.10 — Ring buffer"
description: "Sabit body array'ini kaydırmak yerine head index'iyle dairesel kullanacak şekilde yeniden yaz."
section: Veri temsili
---

# 2.10 — Ring buffer

**Hedef:** Gövdeyi her adımda baştan sona kaydırmak yerine, sabit array üzerinde
`head` index'iyle dairesel (ring buffer) kullan.

Dersin tamamı tek kurala dayanıyor:

```
gövdenin i'inci hücresi  =  body[(head + i) % MAX_BODY]
```

`i` `0`'dan `length - 1`'e gider; `i = 0` baş, `i = length - 1` kuyruk.
Aşağıdaki altı yol, bu kuralın geçerli olması gereken altı nokta.

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

Bu dersin ekranda kendiliğinden bağıran bir sinyali yok: doğru yaptığında hiçbir
şey değişmiyor. Sinyali kendin üret — başlangıçta `head`'i `0` yerine `37` yap ve
oyunu çalıştır.

Görüntü ve oynanış **birebir aynı olmalı**. `head`'in başlangıç değeri ring
buffer'da hiçbir şeyi etkilemez; gövde başka slotlarda durur, ekranda fark olmaz.
Fark görüyorsan altı yoldan birinde formül eksik, ve hangisi olduğunu belirtiden
okuyabilirsin: yılan bozuk çiziliyorsa (6); grid debug görünümünü eklediysen
(2.12) sarı çerçeveler gövdenin üstünde değilse (2); yem gövdenin altına
düşüyorsa (2) veya (4). Test bitince `head`'i `0`'a geri al.

## Bilmen gereken küçük parça

Şu ana kadar `body[0]` her zaman gövdenin başıydı; her adımda geri kalan her
hücre bir slot kaydırılıyordu. Bunun maliyeti gövde uzunluğuyla büyür — 200
hücrelik bir yılan her adımda 200 yazma yapar, oysa gerçekte değişen tek şey bir
baş eklenmesi ve bir kuyruğun düşmesidir.

Ring buffer bunu tersine çevirir: array'in kendisi hiç kaymaz, hareket eden şey
`head`'in array içinde hangi hücreyi gösterdiğidir. Gövdenin `i`'inci hücresi
artık `body[(head + i) % MAX_BODY]` ile okunur (`i` `0`'dan `length - 1`'e
kadar); kuyruk da bu formülde `i = length - 1` olan hücredir.

### Elle iz sür

Formülü okumak yetmiyor; küçük bir array üzerinde elle izlemek oturtuyor.
`MAX_BODY = 8`, `length = 3`, gövde `A B C` ve `head = 0` al. Yem yok, yani her
adımda bir baş giriyor, bir kuyruk çıkıyor:

```
tick 0   [A B C _ _ _ _ _]   head=0   pencere: 0,1,2  ->  A B C
tick 1   [A B C _ _ _ _ D]   head=7   pencere: 7,0,1  ->  D A B
tick 2   [A B C _ _ _ E D]   head=6   pencere: 6,7,0  ->  E D A
tick 3   [A B C _ _ F E D]   head=5   pencere: 5,6,7  ->  F E D
```

Tabloya bakarak değil, kendin türeterek yap: her tick'te üç şey yaz — kuyruğun
index'i, yeni `head`, pencere.

İki şey görünür hale geliyor. Birincisi tick 1'de `head` `0`'dan `7`'ye atlıyor;
negatif modulo tuzağının neden var olduğu artık ezber değil, elinde. İkincisi
slot 2'deki `C` tick 1'den sonra hâlâ orada duruyor: gövdeden çıkan hücre
**silinmiyor**, sadece pencerenin dışında kaldığı için sayılmıyor. Array çöple
dolu, oyun doğru. `length` pencerenin genişliği, `head` nereden başladığı;
ikisinin dışında kalan her şey anlamsız.

### `head` neden geri gidiyor

Gövde `head, head+1, ..., head+length-1` slotlarını kaplıyor — `i` büyüdükçe
kuyruğa doğru gidiyorsun. Yeni bir baş eklediğinde eski başın `i = 1` olması
gerekiyor. `yeni_head = head - 1` seçersen:

```
yeni_head + 1  =  head
```

Eski baş kendiliğinden `i = 1` oluyor, gövdenin geri kalanı da bir kayıyor —
hiçbir hücreye dokunmadan. 2.4'te `length` tane yazmayla yaptığın kaydırma
burada `head`'i bir eksiltmenin yan etkisi. Kaydırma kaybolmadı, bedava oldu.

Bu bir doğa yasası değil, bir seçim: `head`'i `+1` yönünde de kurabilirdin, o
zaman gövdeyi `(head - i + MAX_BODY) % MAX_BODY` ile okurdun. İkisi de geçerli;
şart olan tek yönde tutarlı kalmak.

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
