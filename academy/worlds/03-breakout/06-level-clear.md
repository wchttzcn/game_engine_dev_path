---
title: "3.6 — Bölümü temizle"
description: "Son tuğla kırılınca oyunu kazanılmış say; bölümün bittiğini hangi veriden okuduğuna karar ver."
section: Tuğla duvarı
---

# 3.6 — Bölümü temizle

**Hedef:** Duvarda canlı tuğla kalmadığında oyunu kazanılmış say ve bunu ekranda
göster.

## Görev

`Game_State`'e üçüncü bir durum ekle. Canlı tuğla kalmadığında state'i o duruma
geçir, topu durdur, ekranda kazandığını yaz. `R` duvarı, topu, raketi ve state'i
başlangıca döndürsün.

## Ne zaman bitti?

- Son tuğla kırılınca state kazanma durumuna geçiyor ve top duruyor.
- Ekranda kazandığını söyleyen bir metin görünüyor.
- `R` duvarı yeniden dizip oyunu baştan başlatıyor.
- Kaybetme yolu hâlâ çalışıyor.
- `odin check games/breakout` geçiyor.

## Bilmen gereken küçük parça

Asıl soru sözdizimi değil: **“duvar bitti mi” sorusunu hangi veriden
cevaplıyorsun?**

İki yol var. Her frame array'i tarayıp canlı arayabilirsin:

```odin
for brick in game.bricks {
	if brick.alive do ...
}
```

Ya da `Game` içinde canlı tuğla sayacı tutup tuğla kırılınca azaltabilirsin.

İkisi de doğru cevabı verir, ama bedelleri farklı yerde: tarama her frame 50
karşılaştırma yapar ve **bakım borcu yoktur** — `alive` bayrakları neredeyse,
cevap oradan gelir. Sayaç frame başına sıfır iş yapar ama **tek doğruluk kaynağı
olmaktan çıkar**: tuğlayı düşüren her yol sayacı da azaltmayı hatırlamak zorunda,
`game_reset` de onu geri yüklemeyi. 2.7'de `occupied` grid'iyle tam olarak bu
bakımı üstlenmiştin ve unutulan bir yazma yüzünden iki temsil ayrışmıştı.

Hangisini seçtiğini incelemede sorarım; ikisi de kabul edilir, gerekçesi olsun.

Sözdizimi tarafında tek yeni şey enum'a üçüncü üyeyi eklediğinde oluyor. Odin'de
bir enum üzerinde `switch` bütün üyeleri karşılamak zorunda; yeni üye ekler
eklemez derleyici eksik kalan her switch'i sana gösteriyor:

```text
Error: Unhandled switch case: Won
	Suggestion: Was '#partial switch' wanted?
```

Bu bir engel değil, araç: yeni durumun hangi karar noktalarını ilgilendirdiğini
derleyici senin yerine listeliyor.

## Sınırlar

- Skor yok, can yok, ikinci bölüm yok. Tek duvar, tek sonuç.
- Kazanma ekranı için ayrı bir çizim yolu kurma; 3.3'te yaptığın gibi sahne
  çizilmeye devam etsin, metin üstüne binsin.

::: details İpucu 1 — Kontrolü nereye koyacaksın
Duvarın bitip bitmediği yalnız bir tuğla kırıldığında değişebilir. Bu kontrolü
her frame'in başında yapmak da doğru sonucu verir, ama en ucuz ve en okunur yer
tuğlanın düştüğü yerin hemen ardı.
:::

::: details İpucu 2 — Topu durdurmak
Ayrı bir bayrağa gerek yok. 3.3'te `Lost` durumunda topu durduran şey, güncelleme
kodunun `Playing` kolunun içinde olmasıydı; kazanma durumu da aynı kolun dışında
kalıyor.
:::

::: details İpucu 3 — Sayma
```odin
alive_count := 0
for brick in game.bricks {
	if brick.alive do alive_count += 1
}
if alive_count == 0 do game.state = .Won
```
Burada `brick` bir kopya, ama yalnız okuyorsun — 3.5'teki `&`'e bu döngüde gerek
yok.
:::

::: details Deep Dive — Sayaç ne zaman kazanır?
50 elemanlık bir taramanın frame maliyeti ölçülemeyecek kadar küçük; 60 FPS'te
saniyede 3000 karşılaştırma, modern bir CPU'nun mikrosaniyeler içinde bitirdiği
bir iş. Sayaç burada performans değil, alışkanlık tartışması.

Soru büyüdüğünde cevap değişiyor. 2.7'de yılanın gövdesinde “bu hücre dolu mu”
sorusunu her tick taramakla cevaplıyordun ve gövde uzadıkça tarama uzuyordu;
`occupied` grid'i o soruyu sabit sürede cevaplanır hale getirdi. Ayrım şu: orada
sorunun cevabı gövdenin **uzunluğuyla birlikte büyüyordu**, burada duvar sabit ve
küçük. Türetilmiş ikinci temsili ölçülmüş bir ihtiyaç olmadan eklemek, kazandığı
zamandan daha fazla bakım borcu getiriyor.
:::

## Birincil kaynak

[Odin Overview — resmi dil rehberi](https://odin-lang.org/docs/overview/#enumerations).
Enum üyelerinin nasıl tanımlandığı ve `switch`'in enum üzerinde neden bütün
üyeleri istediği burada; `#partial switch` de aynı bölümde geçiyor. Kurulu
derleyiciyle doğrulandı.

**Kazanım:** Breakout artık başı ve iki sonu olan tam bir oyun döngüsü — duvarı
temizlersen kazanıyorsun, topu kaçırırsan kaybediyorsun. Buradan sonrası
oynanabilirliği değil hissi değiştiriyor: kırılan tuğlanın ne kadar tatmin edici
olduğunu ayarlayabilmek için önce ayarlanabilir hale getirmek gerekiyor.

**“Breakout 3.6 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım kırılan tuğlanın yerinde bir şey doğurmak:
[3.7 — Parçacık havuzu](/worlds/03-breakout/07-particle-pool).
