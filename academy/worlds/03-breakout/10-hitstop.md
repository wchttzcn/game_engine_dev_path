---
title: "3.10 — Hitstop"
description: "Tuğla kırıldığı anda simülasyonu birkaç frame dondurarak vuruşa ağırlık kat."
section: Oyun hissi
---

# 3.10 — Hitstop

**Hedef:** Bir tuğla kırıldığında simülasyonu çok kısa bir süreliğine durdur, ama pencere ve çizim çalışmaya devam etsin.

## Görev

`Game` içine bir hitstop sayacı ekle. Tuğla kırıldığı anda bu sayacı sabit bir
süreye set et. Her frame bu süre `dt` kadar azalsın. Sayaç sıfırdan büyükken o
frame'in simülasyon adımını — topun hareketi, raketin hareketi, çarpışmalar —
atla; sıfıra indiğinde oyun kaldığı yerden devam etsin.

## Ne zaman bitti?

- Bir tuğlaya çarptığında top ve sahne kısa bir an donuyor, sonra devam ediyor.
- Donma birkaç frame sürüyor (30-80ms civarı); göze fark edilir ama oyunu
  kilitleyecek kadar uzun değil.
- Pencere hâlâ kapanabiliyor, `R` hâlâ oyunu sıfırlıyor — hitstop sırasında da.
- Hitstop devam ederken tekrar tuğlaya çarpma gibi bir şey olmuyor; simülasyon
  gerçekten duruyor, yalnızca yavaşlamıyor.
- `odin check games/breakout` geçiyor.

## Bilmen gereken küçük parça

Hitstop bir çizim efekti değil. Ekranda parlayan, titreyen bir şey eklemiyorsun;
tam tersine, bir şeyi eklemiyorsun — o frame'lerde `update`'i hiç çalıştırmıyorsun.
Kod tarafında bu, `dt`'yi kullanan bütün bloğu bir `if`'in içine almak kadar basit.

Asıl karar nerede biteceği. `Game_State :: enum { Playing, Lost, Won }` etrafında
kurduğun `switch`'in `.Playing` kolu şu an topu hareket ettiriyor, raketi
hareket ettiriyor, çarpışmaları kontrol ediyor. Hitstop bu kolun **içine**
girer — kolun dışına değil. Çünkü `rl.WindowShouldClose()` kontrolü, `R` ile
`game_reset` çağrısı ve çizim çağrıları hitstop'tan etkilenmemeli: pencereyi
donmuş gibi göstermek istemiyorsun, yalnızca oyunun içindekileri.

Bu, STYLE_GUIDE'ın sorduğu sorunun tam burada karşına çıkması: **bu gameplay
state mi, presentation state mi?** Topun konumu, raketin konumu, tuğlaların
`alive` bayrağı — bunlar gameplay state, hitstop bunları dondurmalı. Pencere
event'leri ve çizim çağrıları presentation tarafı, hitstop onlara dokunmamalı.

Sayacın şekli:

```odin
Game :: struct {
	// ...
	hitstop: f32,
}
```

Tuğla kırıldığı anda set edilir:

```odin
brick.alive = false
game.hitstop = HITSTOP_DURATION
```

Her frame `dt` kadar düşer. Sayaç sıfırdan büyükse o frame'in simülasyon
kısmını atla:

```odin
if game.hitstop > 0 {
	game.hitstop -= dt
} else {
	// top hareketi, raket hareketi, çarpışmalar burada
}
```

## Sınırlar

- Hitstop yalnız tuğla kırılınca tetiklenir; raket-top sekmesinde veya duvar
  sekmesinde tetiklenmiyor. Tek bir olay türüyle sınırlı tutmak, “nereyi
  dondurdum” sorusuna net bir cevap veriyor.
- Süre bir sabit olarak kalabilir; runtime'da değiştirilebilir bir panel bu
  paketin sonunda geliyor.

::: details İpucu 1 — Hangi blok donacak
`.Playing` kolunun içindeki her şey — raket hareketi, top pozisyon güncellemesi,
duvar/raket/tuğla çarpışmaları — `dt`'ye dayanıyor. Hitstop aktifken bu bloğun
hiçbiri çalışmamalı. Kolun en başına bir kontrol koyup geri kalan her şeyi
`else` dalına almak, mevcut kodu neredeyse hiç yeniden yazmadan bu ayrımı verir.
:::

::: details İpucu 2 — Sayaç sırası
2.8'de büyüme kararını gövdeyi değiştirdikten sonra kullanman gövdeyi bozmuştu;
2.9'da sayaç karşılaştırmadan önce arttığı için hedef hiç eşleşmemişti. Burada
aynı ailede bir tuzak var: `game.hitstop -= dt` çalıştıktan **sonra** aynı
frame'de simülasyonu da çalıştırırsan, hitstop biteceği frame'de hem sayaç
azalır hem top hareket eder — sayaç sıfıra iniyor ama hâlâ o frame donmuş
olması gerekiyordu. Sıra şu olmalı: önce “hitstop aktif mi?” diye bak, aktifse
yalnız sayacı azalt ve simülasyona hiç girme; değilse simülasyonu çalıştır.
İkisini aynı frame'de birlikte yapma.
:::

::: details İpucu 3 — Donma değil dondurma
```odin
switch game.state {
case .Playing:
	if game.hitstop > 0 {
		game.hitstop -= dt
	} else {
		// mevcut raket/top/çarpışma kodu buraya
	}
case .Lost:
case .Won:
}
```
Tuğla kırılma noktasında (`brick.alive = false` satırının hemen ardında)
`game.hitstop = HITSTOP_DURATION` satırını ekle. `HITSTOP_DURATION` saniye
cinsinden küçük bir sabit, örneğin `0.05`.
:::

::: details Deep Dive — Süreyi neyle ölçüyorsun, ve neden “doğru” değer yok
Hitstop süresini saniyeyle mi ölçmelisin, yoksa “3 frame dur” diye frame
sayısıyla mı? Frame sayısıyla ölçersen 30 FPS'te çalışan biri senin 60 FPS'te
ayarladığın “3 frame”i iki katı süre hissedecek — donma göreceli olarak daha
uzun sürer. Saniyeyle ölçmek (yani `hitstop -= dt`, sabit değer saniye cinsinden)
bu sorunu ortadan kaldırır: donma her cihazda aynı gerçek süre kadar sürer, kaç
frame'e denk geldiği FPS'e göre değişir. Bu yüzden `f32` bir saniye sayacı,
sabit bir “N frame” sayacından daha sağlam.

İkinci soru daha ilginç: 0ms ile 100ms arasında “doğru” hitstop süresi nedir?
Cevap yok — çünkü bu bir doğruluk sorusu değil, bir his sorusu. 20ms fark
edilmeyebilir, 150ms “donuk” hissettirmeye başlar, arada bir yer “tam oturmuş”
hissettirir ama o yer oyuna, hıza, oyuncunun beklentisine göre değişir. Tek yol
denemek: değeri değiştir, derle, oyna, hisset. Şu an bu döngü `HITSTOP_DURATION`
sabitini değiştirip her denemede yeniden derlemek demek — yavaş bir döngü.
Paketin ilerisinde (3.14) bu sabitleri runtime'da bir panelden canlı
değiştirebileceksin; o zaman aynı soruyu saniyeler içinde onlarca kez
sorabileceksin. Şimdilik sabit değiştirip derlemek, o ihtiyacın nereden
geldiğini hissetmenin yolu.
:::

## Birincil kaynak

[Jan Willem Nijman (Vlambeer) — The Art of Screenshake](https://archive.org/details/the-art-of-screenshake).
Konuşma, aynı oyuna tek tek eklenen küçük geri bildirim katmanlarının (vuruşta
duraklama, sarsıntı, parçacık, ses) hissi nasıl kökten değiştirdiğini gösteriyor;
hitstop bu katmanların ilki ve genelde en ucuzu.

**Kazanım:** Artık oyunun “doğru” çalışması ile “iyi hissettirmesi” iki ayrı
soru olduğunu görüyorsun. Kod tarafında hitstop küçük bir `if`, ama nereyi
dondurup nereyi dondurmayacağını seçmek dersin asıl işiydi. Bu ayrım — gameplay
state'i mi, presentation state'i mi — sıradaki iki derste de karşına çıkacak.

**“Breakout 3.10 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım vuruşa ekranı da katmak: [3.11 — Kamera sarsıntısı](/worlds/03-breakout/11-screen-shake).
