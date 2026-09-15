---
title: "2.7 — Occupancy grid"
description: "Kendine çarpma taramasını, body'den türeyen bir occupied grid'i ile tek okumaya indir."
section: Veri temsili
---

# 2.7 — Occupancy grid

**Hedef:** “Bu hücre dolu mu?” sorusunu gövdeyi taramadan, tek dizi okumasıyla cevapla.

## Görev

**Bu ders bir refactor.** Oyun bittiğinde hiçbir şey farklı oynanmayacak: yılan
aynı hızda gidecek, aynı yerde ölecek, `R` aynı şekilde başlatacak. Değişen tek
şey aynı sorunun içeriden nasıl cevaplandığı. Ekrana eklenen tek yeni şey,
refactor'ın doğru olduğunu gözünle görmen için bir çizim.

İki turda yap. Her turun sonunda oyunu çalıştır.

### Tur A — grid'i kur ve doğru tut

Çarpışma tespitine **dokunma**; `head_hits_body` yerinde kalsın. Bu turda tek
işin `occupied`'i gövdeyle tutarlı tutmak.

1. `Game`'e `occupied: [GRID_ROWS][GRID_COLS]bool` ekle.
2. `game_reset` içinde grid'i sıfırla, sonra gövdenin ilk `length` hücresinden
   **türet** — başlangıç koordinatlarını ikinci kez elle yazma.
3. Her tick'te grid'i güncelle: kuyruktan çıkan hücre `false`, yeni head
   hücresi `true`. Başka hiçbir hücreye dokunma.
4. `occupied`'in dolu dediği her hücreyi, gövdeden **farklı bir renkte** outline
   olarak çiz.

### Tur B — tespiti çevir

`head_hits_body` çağrısını yeni head hücresinin `occupied` değerini okuyan tek
bir kontrolle değiştir, sonra artık çağrılmayan procedure'ı sil.

## Ne zaman bitti?

- Program açılır açılmaz, ilk tick gelmeden, `occupied` başlangıç gövdesiyle
  uyumlu — boş bir grid değil.
- Her gövde karesinin üstünde bir outline var; boş hücrede outline yok.
- Kendine çarpma hâlâ 2.6'daki gibi çalışıyor: aynı dönüşler, aynı ölüm.
- Tespit artık `length`'ten bağımsız — gövde ne kadar uzarsa uzasın tek okuma.
- `R` sonrası grid yeniden başlangıç gövdesiyle uyumlu; önceki oyundan kalan
  dolu hücre yok.
- `odin check games/snake` geçiyor.

## Bilmen gereken küçük parça

### İki ayrı soru

`body` sıra bilgisini tutuyor: kim baş, kim kuyruk. “Üçüncü halka nerede?”
sorusunu doğrudan cevaplıyor — `body[3]`.

“Bu hücre dolu mu?” farklı bir soru ve `body` bunu doğrudan cevaplamıyor. 2.6'da
bu yüzden taradın. Tarama çalışıyor ama her tick'te `length` karşılaştırma
ödüyorsun — temsilin sana vermediği bir bilgiyi her defasında yeniden
hesaplıyorsun.

`occupied` o bilgiyi hazır tutuyor: hücrenin kendi indexi, cevabın adresi.

2.9'da bu zorunlu hale gelecek: yemi boş bir hücreye koyacaksın. Tarama ile bu
“rastgele hücre seç, tüm gövdeyi tara, doluysa baştan dene” olur.

### Tick başına kaç hücre el değiştirir

Buranın tuzağı şu: `body` her tick'te **bütün** slotlarına yazıyor, ama kaplanan
hücrelerin **kümesi** iki eleman değişiyor.

Sağa giden beş hücrelik yılan, `row` sabit:

```text
önce:   body = (6,10) (7,10) (8,10) (9,10) (10,10)
sonra:  body = (7,10) (8,10) (9,10) (10,10) (11,10)
```

Kaydırma beş slot'un beşine de yazdı. Kaplanan hücreler ise:

```text
{6,7,8,9,10}  ->  {7,8,9,10,11}
```

`6` çıktı, `11` girdi. 7, 8, 9 ve 10 dolu kalmaya devam etti; yalnızca `body`
içindeki sıraları kaydı. **Index'in kayması, hücrenin el değiştirmesi değil.**

Yılan tick başına bir hücre ilerler: bir hücre boşalır, bir hücre dolar. Gövde
ne kadar uzun olursa olsun. `occupied`'e dokunan satır sayısı ikidir. Kaydırma
döngüsünün içinde `occupied` işi yok.

### Kuyruk kaydırmada kaybolur

Kaydırma `body[length - 1]`'in üstüne `body[length - 2]`'yi yazar. Yani çıkan
kuyruk hücresi, kaydırma bittiğinde artık okunamaz durumdadır. Onu kaydırmadan
önce bir yere almadıysan, sonrasında elindeki `body[length - 1]` çıkan hücre
değil, yılanın hâlâ üstünde durduğu yeni kuyruktur.

### Türetmek ne demek

`occupied` bağımsız bir gerçek değil; `body`'nin söylediğinin başka biçimde
yazılmış hali. Kurulumda başlangıç koordinatlarını bir `occupied` bloğuna tekrar
yazarsan aynı gerçeği iki yerde tanımlamış olursun — başlangıç düzenini
değiştirdiğin gün biri güncellenir, diğeri unutulur. Bunun yerine `body`'ye sor:

```odin
for i in 0 ..< game.length {
	cell := game.body[i]
	game.occupied[cell.row][cell.col] = true
}
```

Bu döngü başlangıç düzeni ne olursa olsun doğru kalır. `game.length` değerinin
döngüden önce atanmış olması gerekir.

Grid'i sıfırlamak için array'i zero value'suna döndürebilirsin:

```odin
game.occupied = {}
```

### Çizim neden var

Çünkü `occupied` bozulduğunda oyun **normal görünür.** Gövdede hata yapsan yılan
yanlış yerde ölür, hemen yakalarsın; ama `occupied` bir cache, yanlış olduğunda
hiçbir şey şikayet etmez. Belirti 2.9'da, yem yılanın içine düştüğünde çıkar ve
sebebi iki ders geride ararsın.

Bu yüzden cache'i ekrana basıyorsun: `body` hücreleri dolduruyor, `occupied`
onları çerçeveliyor, ikisi çakışmazsa gözüne batıyor.

Rengi gövdeden farklı seç. Gövde `rl.GREEN` ise outline da `rl.GREEN` olursa
çerçeve dolu karenin üstünde görünmez — doğrulama aracın görünmez olur.

| Ekranda | Anlamı |
| --- | --- |
| Her dolu karede bir çerçeve | İki temsil tutarlı |
| Boş hücrede çerçeve | `occupied`, yılanın terk ettiği hücreyi hâlâ dolu sanıyor |
| Dolu karede çerçeve yok | `occupied`, yılanın üstünde durduğu hücreyi boş sanıyor |

20x20'lik grid 400 `bool`, yani 400 byte; `Game` struct'ının içinde contiguous
duruyor. Bedeli hafıza değil, sorumluluk: gövdeyi değiştiren her kod yolu artık
grid'i de güncellemek zorunda.

## Sınırlar

- `occupied`'i bağımsız bir doğruluk kaynağı yapma. Sıra bilgisinin sahibi hâlâ
  `body`; `occupied` ondan türeyen bir önbellek.
- Bitfield veya bitset optimizasyonu yok; bu boyutta `bool` array'i yeterli.
- F1 toggle'ı, ayrı bir debug renderer veya panel abstraction'ı kurma. Outline
  çizimi `draw` bölümündeki bir döngüden ibaret ve sürekli görünür. Tam
  overlay 2.12'de geliyor.
- Yem veya büyüme yok.

::: details İpucu 1 — Tur A'nın iki yeri
Grid'e dokunulan yalnız iki yer var: kurulum ve tick.

Kurulumda (`game_reset`) sıra şu: önce `occupied = {}`, sonra gövde hücreleri,
sonra `game.length`, en sonra yukarıdaki türetme döngüsü.

Tick'te iki yazma var — biri kuyruk için, biri head için. İkisi de kaydırma
döngüsünün dışında.
:::

::: details İpucu 2 — Kuyruğu ne zaman yakalarsın
`head := game.body[0]` satırını kaydırmadan önce yazıyorsun, çünkü sonra `body[0]`
değişecek. Kuyruk için de aynısı geçerli: `body[length - 1]` kaydırmada eziliyor.

İkisini yan yana, kaydırmadan önce al:

```odin
head := game.body[0]
tail := game.body[game.length - 1]
```

Sonra `tail`'in hücresini `occupied`'de `false` yap; yeni head hesaplandığında da
onun hücresini `true` yap.
:::

::: details İpucu 3 — Tur B ve sıra
Kontrol tek satıra iniyor:

```odin
if game.occupied[head.row][head.col] {
	game.state = .Dead
	break
}
```

Bu satır, head hücresini `true` yapan satırın **önünde** olmalı — sonrasında
okursan yılan her tick'te kendi yeni hücresini dolu bulur. Kuyruk ise bu noktada
çoktan boşaltılmış olmalı: kısa yılanlarda çıkan kuyruk hücresiyle yeni head aynı
hücre olabilir, sıra karışırsa geçerli bir hareketi çarpışma sanarsın.

Doğru sıra: kuyruk `false` → kontrol → head `true`.

Çizim için `occupied`'in tamamını iki iç içe `for` ile dolaş, `true` olan her
hücrede:

```odin
rl.DrawRectangleLinesEx(cell_rect(i32(col), i32(row)), 1, rl.YELLOW)
```
:::

## Birincil kaynak

[Odin dil turu — diziler](https://odin-lang.org/docs/overview/#arrays). Çok
boyutlu sabit boyutlu array tanımı — `[GRID_ROWS][GRID_COLS]bool` — burada aynı
sözdizimiyle.

**Kazanım:** Aynı gerçeğin iki temsilini elle senkron tuttun. “Bu hücre dolu mu?”
artık `length`'ten bağımsız, tek okumada cevaplanıyor; karşılığında gövdeyi
değiştiren her kod yolunun grid'i de güncelleme sorumluluğunu aldın ve bu
sorumluluğun tutulduğunu ekranda doğrulayabiliyorsun.

**“Snake 2.7 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu iki temsili bir tick'in içindeki gerçek bir karara bağlamak:
[2.8 — Yemi ye ve büyü](/worlds/02-snake/08-food-and-growth).
