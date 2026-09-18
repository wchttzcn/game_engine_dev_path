---
title: "3.6 — Bölümü temizle"
description: "Son tuğla kırılınca oyunu kazanılmış say; bölümün bittiğini hangi veriden okuduğuna karar ver."
section: Tuğla duvarı
---

# 3.6 — Bölümü temizle

**Hedef:** Duvarda canlı tuğla kalmadığında oyunu kazanılmış say ve bunu
ekranda göster.

## Görev

`Game_State`'e üçüncü bir durum ekle: `Won`. Canlı tuğla kalmadığında state'i
bu duruma geçir, topu durdur, ekranda kazandığını yaz. `R` duvarı, topu,
raketi ve state'i başlangıca döndürsün.

## Ne zaman bitti?

- Son tuğla kırılınca state kazanma durumuna geçiyor ve top duruyor.
- Ekranda kazandığını söyleyen bir metin görünüyor.
- `R` duvarı yeniden dizip oyunu baştan başlatıyor.
- Kaybetme yolu hâlâ çalışıyor.
- `odin check games/breakout` geçiyor.

## Elindekiler

Yeni struct yok, `Game_State` büyüyor:

```odin
Game_State :: enum {
	Playing,
	Lost,
	Won,
}
```

Odin'de bir enum üzerindeki `switch` bütün üyeleri karşılamak zorunda. Yeni
üyeyi ekler eklemez derleyici eksik kalan her switch'i sana gösterir:

```text
Error: Unhandled switch case: Won
	Suggestion: Was '#partial switch' wanted?
```

`game.state` üzerinde iki ayrı `switch` var — biri oyun mantığını yürütüyor,
biri ekranın altına metin basıyor; ikisi de bu hatayı verebilir. Kazanma
metnini çizmek 3.3'teki `draw_center_text`'in ikinci çağrısı, imza aynı:
`draw_center_text :: proc(text: cstring, font_size: i32, color: rl.Color)`.

## Sınırlar

- Skor yok, can yok, ikinci bölüm yok. Tek duvar, tek sonuç.
- Kazanma ekranı için ayrı bir çizim yolu kurma; sahne çizilmeye devam etsin,
  metin üstüne binsin.

::: details İpucu 1 — Duvarın bitip bitmediğini nasıl anlarsın
Tuğla-top çarpışma döngüsünden çıktıktan sonra ayakta kalan tuğlaları say: bir
sayaç tut, `game.bricks`'i dolaş, `alive` olanlarda bir artır. Döngü bitince
sayaç sıfırsa state'i `Won` yap. Bu kontrolü tuğla-top çarpışma döngüsünün
hemen ardına koy — state yalnızca bir tuğla kırıldığında değişebilir, en ucuz
ve en okunur yer orası.
:::

::: details İpucu 2 — İki switch, iki eksik case
Yeni `Won` üyesini yalnız bir `switch`'e eklemek derleyiciyi susturmaz — ikisi
de exhaustive, ikisinde de eksik kalan case ayrı ayrı hata verir. Oyun
mantığındaki `switch`'i ve ekranın altındaki çizim `switch`'ini ayrı ayrı bul
ve güncelle; biri unutulursa derleyici hangi satıra bakman gerektiğini zaten
söylüyor.
:::

::: details İpucu 3 — Tam çözüm
```odin
alive_count := 0
for brick in game.bricks {
	if brick.alive do alive_count += 1
}
if alive_count == 0 do game.state = .Won
```
Burada `brick` bir kopya, ama yalnız okuyorsun — 3.5'teki `&`'e bu döngüde
gerek yok. Blok, tuğla-top çarpışma döngüsünün hemen ardına, hâlâ `Playing`
kolunun içine gidiyor. Kazanma metni, `Lost` metninin çizildiği ikinci
`switch`'e üçüncü bir case olarak ekleniyor:
```odin
case .Won:
	draw_center_text("You win - Press R to reset", 32, rl.GREEN)
```
:::

## Kaynak

[Odin Overview — resmi dil rehberi](https://odin-lang.org/docs/overview/#enumerations).
Enum üyelerinin nasıl tanımlandığı ve `switch`'in enum üzerinde neden bütün
üyeleri istediği burada; `#partial switch` de aynı bölümde geçiyor. Kurulu
derleyiciyle doğrulandı.

## Daha derine

Duvarın bitip bitmediğini her frame tarayarak mı, yoksa `Game`'de tutulan bir
sayaçla mı cevaplamak gerektiği burada bilinçli olarak tarama lehine
çözüldü — 50 elemanlık bir taramanın frame maliyeti ölçülemeyecek kadar küçük
ve **bakım borcu yok**: `alive` bayrakları zaten oradan, cevap tek bir
kaynaktan geliyor. Bir sayaç frame başına sıfır iş yapar ama tek doğruluk
kaynağı olmaktan çıkar; tuğlayı düşüren her yol sayacı da azaltmayı
hatırlamak, `game_reset` de onu geri yüklemek zorunda kalırdı.

2.7'de yılanın gövdesinde aynı soru tersine döner: “bu hücre dolu mu”
sorusunu her tick taramak, gövde uzadıkça pahalılaşıyordu; `occupied` grid'i
o soruyu sabit sürede cevaplanır hale getirdi. Ayrım şu — orada sorunun
cevabı gövdenin uzunluğuyla birlikte büyüyordu, burada duvar sabit ve küçük.
Türetilmiş ikinci bir temsili ölçülmüş bir ihtiyaç olmadan eklemek, kazandığı
zamandan daha fazla bakım borcu getirir.

## Kazanım

Breakout artık başı ve iki sonu olan tam bir oyun döngüsü — duvarı temizlersen
kazanıyorsun, topu kaçırırsan kaybediyorsun. Buradan sonrası oynanabilirliği
değil hissi değiştiriyor: kırılan tuğlanın ne kadar tatmin edici olduğunu
ayarlayabilmek için önce ayarlanabilir hale getirmek gerekiyor.

**“Breakout 3.6 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım kırılan tuğlanın yerinde bir şey doğurmak:
[3.7 — Parçacık havuzu](/worlds/03-breakout/07-particle-pool).
