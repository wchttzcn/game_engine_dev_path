---
title: "2.8 — Occupancy lookup"
description: "Kendine çarpma taramasını, occupied grid'in tek hücre okumasıyla değiştir."
section: Veri temsili
---

# 2.8 — Occupancy lookup

**Hedef:** Kendine çarpma tespitini gövde taramasından `occupied`'in tek hücre
okumasına indir.

## Görev

2.6'daki tarama döngüsünü, yeni head hücresinin `occupied` değerini okuyan
tek bir kontrolle değiştir. Kontrolü doğru sırada çalıştır: kuyruk hücresi
`occupied`'de `false` olduktan sonra, ama head hücresi `true` yapılmadan
önce. Artık gereksiz kalan tarama döngüsünü sil.

## Ne zaman bitti?

- Kendine çarpma hâlâ aynı şekilde tespit ediliyor; aynı dönüşler, aynı ölüm.
- Çarpışma kontrolü artık gövdeyi taramıyor; tek bir `occupied` okuması.
- Kontrol, kuyruk `false` yapıldıktan sonra ve head `true` yapılmadan önce
  çalışıyor.
- Kısa yılanda çıkan kuyruk hücresiyle yeni head aynı hücre olsa da geçerli
  hareket ölüm sanılmıyor.
- Gövdeyi baştan sona tarayan döngü kodda kalmadı.
- `odin check games/snake` geçiyor.

## Elindekiler

Yeni alan veya API yok. `occupied` ve onu güncelleyen kuyruk/head yazmaları
2.7'de kuruldu; bu ders yalnız çarpışma kontrolünün hangi veriye baktığını
değiştiriyor. Fixed array'den okunan bir `bool` değer `if` koşulunda
doğrudan kullanılabilir, ek bir dönüşüm gerekmez.

## Sınırlar

- Genel bir handle/generation sistemi kurmuyorsun; yalnız bu tek kontrolü
  değiştiriyorsun.
- `occupied`'i güncelleme sırası — kuyruk, sonra head — 2.7'den değişmiyor;
  bu ders o sırayı kullanıyor, yeniden tasarlamıyor.
- Yem veya büyüme yok.

::: details İpucu 1 — Taramayı okumaya çevirmek
Adım attıktan sonra elindeki tek yeni bilgi head'in gideceği hücre.
2.6'daki taramanın cevapladığı soru — “bu hücre şu an dolu mu?” —
2.7'den beri `occupied`'de hazır duruyor. Kuyruk hücresini `occupied`'de
boşalttıktan sonra, ama head hücresini doldurmadan önce, yeni head'in
`occupied` değerini oku; `true` ise oyun bitti, `false` ise hücreyi doldurup
devam et.
:::

::: details İpucu 2 — Sıra karışırsa geçerli hareket ölüm sanılır
Kısa bir yılanda kuyruğun boşalttığı hücre ile yeni head'in girdiği hücre
aynı hücre olabilir — yılan tam o an boşalan yere ilerliyordur, bu geçerli
bir hareket. Kontrolü kuyruk henüz boşaltılmadan çalıştırırsan bu hücre hâlâ
`true` görünür ve geçerli hareket çarpışma sanılır. Doğru sıra: kuyruk
`false` → kontrol → head `true`.
:::

::: details İpucu 3 — Tam çözüm
```odin
// Kaydırma döngüsünden önce yakalanan tail için, 2.7'deki gibi:
game.occupied[tail.row][tail.col] = false

for i := game.length - 1; i > 0; i -= 1 {
	game.body[i] = game.body[i - 1]
}
game.body[0] = new_head

// 2.6'daki taramanın yerine geçen kontrol — head'i occupied'de
// işaretlemeden ÖNCE çalışır:
if game.occupied[new_head.row][new_head.col] {
	game.state = .Dead
	break
}
game.occupied[new_head.row][new_head.col] = true
```
2.6'daki tarama döngüsü artık silinebilir; bu tek okuma onun yerini alıyor.
:::

## Kaynak

[Odin Overview — resmi dil rehberi](https://odin-lang.org/docs/overview/#fixed-arrays).
`game.occupied[new_head.row][new_head.col]` ifadesinin doğrudan `if` koşulu
olarak kullanılması bu sayfadaki fixed array indexleme semantiğine dayanıyor.

## Kazanım

Kendine çarpma tespiti artık `length`'ten bağımsız: gövde ne kadar uzarsa
uzasın hâlâ tek okuma. Sıra tuzağını bir kez gördükten sonra, ilerideki her
“bu hücre/nesne burada mı” sorusunu aynı dikkatle kuracaksın.

**“Snake 2.8 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu iki temsili bir tick'in içindeki gerçek bir karara bağlamak:
[2.9 — Yemi ye ve büyü](/worlds/02-snake/09-food-and-growth).
