---
title: "2.10 — Yemi nereye koyalım?"
description: "Occupancy grid'i kullanarak yemi her zaman boş bir hücreye rastgele yerleştir; grid dolduğunda kilitlenme."
section: Veri temsili
---

# 2.10 — Yemi nereye koyalım?

**Hedef:** Occupancy grid'in cevapladığı ikinci soruyu kullan — boş hücre
nerede — ve yemi oradan seç.

## Görev

2.9'deki sabit yem hücresini kaldır. Head yem hücresine girip `grow` doğru
olduğunda, `occupied` grid'ini kullanarak yemi her zaman boş bir hücreye
yeniden yerleştir; gövdeyi tarama. Boş hücre kalmadığında yeni yem
yerleştirmeyi deneme; oyunu kilitlemeden mevcut durumda bırak.

## Ne zaman bitti?

- Yem hiçbir zaman gövdenin üstünde doğmuyor.
- Yem yenildiğinde yeni yem her zaman boş bir hücrede beliriyor.
- Grid tamamen dolduğunda program donmuyor veya sonsuz döngüye girmiyor.
- `odin check games/snake` geçiyor.

## Bilmen gereken küçük parça

Naif yöntem rastgele bir hücre seçip doluysa tekrar denemektir. Grid %95
doluyken bu döngü ortalama 20 deneme sürer — küçük bir grid'de sorun değil
gibi görünür, ama teorik olarak hiç bitmeme ihtimali de vardır: her deneme
dolu bir hücreye denk gelebilir, grid tamamen dolmasa bile.

`occupied` grid'i daha iyi bir yol açıyor: boş hücreleri say, “kaçıncı boş
hücreyi istiyorum” sorusunun cevabını rastgele seç, sonra grid'i tekrar
tarayıp o sıradaki boş hücreyi bul. Bu yöntem her zaman sonlanır ve doluluk
arttıkça yavaşlamaz — hâlâ bir tarama ama sabit sayıda, asla tekrar
denemeyen bir tarama.

Rastgele sayı üretimi `core:math/rand` paketinden gelir:

```odin
import "core:math/rand"
```

Kullanacağın imza `int_max :: proc(n: int) -> int` — `0` ile `n - 1` arasında
(yani `n` hariç) tek bir rastgele tamsayı döndürür. Boş hücre sayısını `n`
olarak verirsen, dönen değer “kaçıncı boş hücreyi istiyorum” sorusunun
cevabıdır.

## Sınırlar

- Rastgele bir hücre seçip doluysa tekrar deneyen naif yöntemi kullanma;
  occupancy'den türeyen sayma + seçme yöntemini kur.
- Boş hücre kalmama durumunu resmi bir kazanıldı state'i olarak modelleme;
  şimdilik oyunun kilitlenmemesi yeterli — `Won` durumu 2.15'te geliyor.
- Skor veya seviye sistemi yok.

::: details İpucu 1 — Boş hücre sayısı
`GRID_COLS * GRID_ROWS - game.length` sana boş hücre sayısını verir —
`occupied`'i taramadan. Ama “kaçıncı boş hücre” sorusunu cevaplamak için yine
de grid'i taraman gerekiyor.
:::

::: details İpucu 2 — Rastgele seçim iki adımda
Önce `target := rand.int_max(bos_sayisi)` ile bir sayı seç. Sonra grid'i satır
satır, sütun sütun tara; her boş hücrede bir sayaç artır, sayaç `target`'a
eşit olduğunda o hücre senin yemin.
:::

::: details İpucu 3 — Grid tamamen doluysa
Boş hücre sayısı `0` ise `rand.int_max(0)` çağırma — `n <= 0` için panic'ler.
Bu durumda yeni yem aramaktan vazgeç; mevcut `food` değerine (artık gövdenin
bir parçası olsa bile) dokunma ve fonksiyondan çık.
:::

## Birincil kaynak

[Odin core:math/rand —
`int_max`](https://pkg.odin-lang.org/core/math/rand/#int_max). Bu derste
kullandığın imza ve `0..<n` aralığı burada tanımlı.

**Kazanım:** Occupancy grid'in ilk faydası kendine çarpma tespitiydi (2.7);
ikinci faydası bedava geldi — aynı veri nerede yer var sorusunu da cevaplıyor,
ve bunu sonsuz döngüye hiç girmeden yapıyorsun.

**“Snake 2.10 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım gövdeyi kaydırmadan büyüyüp ilerleyen bir temsile geçmek:
[2.11 — Ring buffer](/worlds/02-snake/11-ring-buffer).
