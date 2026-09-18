---
title: "2.12 — İndex'i tek yerde topla"
description: "Altı yere dağılmış ring buffer index hesabını tek bir procedure'da topla ve head'in yönünü kendin türet."
section: Veri temsili
---

# 2.12 — İndex'i tek yerde topla

**Hedef:** Altı yere dağılmış `(head + i) % MAX_BODY` hesabını tek bir
procedure'da topla ve `head`'in neden `-1` yönünde ilerlediğini kendin türet.

## Görev

Gövdeyi okuyan altı yerdeki `(head + i) % MAX_BODY` hesabını tek bir
`body_index` procedure'unda topla; altı çağrı yerini ona çevir. Sonra
`head`'in neden `-1` yönünde ilerlediğini kendin türet: `yeni_head + 1 = head`
olacak şekilde seç, eski başın kendiliğinden `i = 1` olduğunu göster.
Kaydırma döngüsü artık yok; onun yerini bu türetim aldı.

## Ne zaman bitti?

- Gövdeyi okuyan her yer `body_index` çağırıyor veya `i = 0` olduğu için
  doğrudan `game.head` okuyor; hiçbiri formülü elle tekrar yazmıyor.
- Başlangıçta `head`'i `0` yerine `37` yaptığında görüntü ve oynanış
  birebir aynı kalıyor; farklıysa hangi yolun eksik olduğunu belirtiden
  okudun (yılan bozuk çiziliyorsa çizim, grid debug'ta (2.14) çerçeveler
  gövdenin üstünde değilse `occupied` türetme, yem gövdenin altına
  düşüyorsa `occupied` veya kuyruk yolu).
- Test bitince `head`'i `0`'a geri aldın.
- `odin check games/snake` geçiyor.

## Elindekiler

`body_index`'in imzası hazır, gövdesi ödev — 2.11'deki formülü buraya
taşıyorsun:

```odin
body_index :: proc(game: ^Game, i: int) -> int {
}
```

Altı çağrı yerini (`(game.head + i) % MAX_BODY` yazan her satırı)
`body_index(&game, i)`'a çevir.

Küçük bir örnek üstünde elle izleme, formülü ezber değil türetilmiş bilgi
yapar. `MAX_BODY = 8`, `length = 3`, gövde `A B C`, `head = 0`; her tick'te
bir baş girip bir kuyruk çıkıyor:

```
tick 0   [A B C _ _ _ _ _]   head=0   pencere: 0,1,2  ->  A B C
tick 1   [A B C _ _ _ _ D]   head=7   pencere: 7,0,1  ->  D A B
tick 2   [A B C _ _ _ E D]   head=6   pencere: 6,7,0  ->  E D A
tick 3   [A B C _ _ F E D]   head=5   pencere: 5,6,7  ->  F E D
```

Her tick'te üç şeyi kendin yaz: kuyruğun index'i, yeni `head`, pencere —
tabloya bakarak değil, türeterek.

## Sınırlar

- `body_index`'in imzasını değiştirme; parametre sırası ve dönüş tipi
  verildiği gibi kalsın.
- Genel bir handle/generation sistemi kurma; bu derste tek ihtiyaç
  `head`/`length`'ten okumak.
- Hareket, tick, yem ve büyüme kuralları değişmiyor; yalnız index
  hesabının nerede yaşadığı değişiyor.

::: details İpucu 1 — Yönü türetmek
Gövde `head, head+1, ..., head+length-1` slotlarını kaplıyor; `i`
büyüdükçe kuyruğa yaklaşıyorsun. Yeni bir baş eklediğinde eski başın
`i = 1` olması gerekiyor, yani `yeni_head + 1 = head` olacak şekilde
`head`'i seç — bu da `yeni_head = head - 1` demek. Bu seçimle gövdenin
geri kalanı hiçbir hücreye dokunmadan bir kayar; `+1` yönünü seçseydin
okuma formülü `(head - i + MAX_BODY) % MAX_BODY` olurdu, ikisi de geçerli,
şart tek yönde tutarlı kalmak.
:::

::: details İpucu 2 — Neden bu formül güvenli
`body_index`'in gövdesi tek satır: `return (game.head + i) % MAX_BODY`.
Bunun güvenli olmasının nedeni `head` ve `i` ikisinin de asla negatif
olmaması — `head` hep `0..MAX_BODY-1`, `i` hep `0..length-1` aralığında.
Odin'de `-1 % MAX_BODY` `-1` döner, `MAX_BODY - 1` değil; `head`'i geri
kaydıran satır tam bu yüzden `+ MAX_BODY` taşıyor. Formül artık tek yerde
durduğu için bu tuzağı denetlemen gereken tek nokta da tek: `body_index`'in
kendisi, altı çağrı yeri değil.
:::

::: details İpucu 3 — Tam çözüm
```odin
body_index :: proc(game: ^Game, i: int) -> int {
	return (game.head + i) % MAX_BODY
}
```
Çağrı yerleri:
```odin
// kuruluş — game_reset içinde:
idx := body_index(game, i)
game.body[idx] = cell
game.occupied[cell.row][cell.col] = true

// kuyruk okuma — head hareket etmeden önce:
tail := game.body[body_index(&game, game.length - 1)]

// çizim döngüsü:
cell := game.body[body_index(&game, i)]
```
Üç yer artık `body_index` çağırıyor: kuruluş, kuyruk okuma, çizim. Eski
head okuma (`game.body[game.head]`) ve yeni head yazma
(`game.body[game.head] = new_head`) zaten `i = 0` durumu; `game.head`'in
kendisini okuyorlar, `body_index`'e ihtiyaçları yok.
:::

## Kaynak

[Odin dil turu — `#procedures`](https://odin-lang.org/docs/overview/#procedures).
`body_index`'in imzası ve `^Game` pointer parametresi buradaki procedure
sözdizimine dayanıyor; altı yeri birleştirmek bu sözdiziminin üstüne
kuruluyor.

## Kazanım

Artık gövdeye dokunan her yol tek bir formülden geçiyor; index hesabını
değiştirmen gerekirse tek yeri değiştiriyorsun, altı yeri değil. `head`'in
yönünü de artık ezbere değil, kendi türettiğin bir zorunluluktan biliyorsun.

**“Snake 2.12 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu sabit maliyetli temsilin gerçekten allocation yapmadığını
ölçmek: [2.13 — Allocation sayacı](/worlds/02-snake/13-allocation-counter).
