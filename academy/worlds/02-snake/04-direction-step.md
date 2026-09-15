---
title: "2.4 — Yön ve adım"
description: "WASD ile yön belirle, her tick'te gövdeyi kaydırarak bir hücre ilerle."
section: Grid ve hareket
---

# 2.4 — Yön ve adım

**Hedef:** Her tick'te yılanı bir hücre ilerlet; gövde kaydırarak başı takip
etsin.

## Görev

`Direction :: enum { Up, Down, Left, Right }` ekle ve `Game`'e `direction: Direction`
koy. WASD tuşlarıyla `direction`'ı değiştir (Pong 1.3'teki `rl.IsKeyDown(.W)`
kalıbının aynısı). 2.3'teki tick olayı geldiğinde:
önce gövdeyi **sondan başa doğru** bir slot kaydır (`body[i] = body[i - 1]`),
sonra yeni head'i `direction`'a göre hesaplayıp `body[0]`'a yaz. Grid dışına
çıkan head karşı kenardan girsin (wrap).

## Ne zaman bitti?

- Yılan sabit bir hızda, tick başına bir hücre ilerliyor.
- WASD yönü değiştiriyor.
- Grid'in bir kenarından çıkan baş, karşı kenardan giriyor.
- Gövde başı adım adım takip ediyor, kendi üstüne yığılmıyor.
- `odin check games/snake` geçiyor.

## Bilmen gereken küçük parça

Kaydırma yönü zorunlu: sondan başa. `body[length - 1]`'den başlayıp geriye
doğru `body[i] = body[i - 1]` yaparsan her hücre bir öncekinin eski değerini
alır. Baştan sona kaydırırsan (`body[0]`'dan başlarsan) `body[0]`'ı henüz
kaydırmadan `body[1]`'e yazmış olursun — aynı değer zincirleme olarak bütün
gövdeye kopyalanır ve yılan tek bir hücreye çöker.

Wrap için Odin'in `%` davranışına dikkat: negatif sayılarda `-1 % 20` `-1`
döner, `19` değil. `col`'ü `-1`'e düşürüp doğrudan `% GRID_COLS` yaparsan
negatif bir index elde edersin. Doğrusu önce pozitif tarafa taşımak:
`(col + GRID_COLS) % GRID_COLS`.

Bu kaydırma her tick'te `length` kadar hücreye yazmak demek. 2.10'da bunu
kaldıracağız; şimdilik en açık hali bu, ve doğruluğu anlamak performansından
önce geliyor.

## Sınırlar

- Ring buffer veya dairesel index kurma; bu ders düz kaydırmayla çalışıyor.
- 180° dönüş yasağı bu derste yok — o 2.5'te geliyor, burada tuşa basınca
  yön doğrudan değişir.
- Yem yok, kendine çarpma kontrolü yok.

::: details İpucu 1 — Kaydırma sırası
`for i := game.length - 1; i > 0; i -= 1 { game.body[i] = game.body[i - 1] }`
biçiminde geriye doğru bir döngü kur, sonra `body[0]`'a yeni head'i yaz.
:::

::: details İpucu 2 — Yeni head'i yön'den türet
`direction`'a göre `col`/`row`'a `+1` veya `-1` ekleyen bir eşleme düşün
(örneğin bir `switch game.direction`). Sonucu wrap'lemeden önce hesapla, wrap'i
en son uygula.
:::

::: details İpucu 3 — Wrap formülü
```odin
new_col := (old_head.col + delta_col + GRID_COLS) % GRID_COLS
new_row := (old_head.row + delta_row + GRID_ROWS) % GRID_ROWS
```
`delta_col`/`delta_row` yalnızca `-1`, `0` veya `1` olacağı için `+ GRID_COLS`
eklemek negatif ara sonucu güvenli tarafa taşır.
:::

## Birincil kaynak

[Odin dil turu — For statement](https://odin-lang.org/docs/overview/#for-statement).
Geriye doğru kaydırma döngüsünün ve `%` operatörünün davranışı bu sayfadaki
temel kontrol akışı ve aritmetik kurallarına dayanıyor.

**Kazanım:** Yılan artık zamanla hareket ediyor; gövdenin başı takip etme
mantığı kuruldu.

**“Snake 2.4 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu yönü tick'ten bağımsız güvenli hale getirmek: [2.5 — Input tamponu](/worlds/02-snake/05-input-buffer).
