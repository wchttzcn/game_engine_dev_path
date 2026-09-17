---
title: "3.14 — F1 ayar paneli"
description: "3.10-3.13'ün sabitlerini tek bir Tuning struct'ında topla ve F1 ile açılan raygui panelinden runtime'da değiştir."
section: Runtime tuning
---

# 3.14 — F1 ayar paneli

**Hedef:** Oyun hissini belirleyen sabitleri tek bir `Tuning` struct'ında topla
ve `F1` ile açılan bir panelden bu değerleri oyunu kapatmadan değiştir.

## Görev

3.10-3.13'te yazdığın sayılar — hitstop süresi, trauma miktarı, parçacık ömrü
ve sayısı, pitch aralığı, top hızı — şu an birer `::` sabiti, yani her
değişiklikte yeniden derliyorsun. Bunların hepsini tek bir `Tuning` struct'ında
topla, `Game` içine bir alan olarak ekle, ve kodun her yerini o sabitler yerine
bu struct'tan okuyacak şekilde değiştir. Sonra `F1` ile açılıp kapanan bir
panel çiz; panelin slider'ları bu struct'ın alanlarını doğrudan değiştirsin.

## Ne zaman bitti?

- `Tuning` adında bir struct var; en azından hitstop süresi, trauma miktarı,
  parçacık ömrü/sayısı, pitch aralığı ve top hızını alan olarak tutuyor.
- `Game` içinde bir `tuning: Tuning` alanı var.
- Hitstop, kamera sarsıntısı, parçacık, ses pitch'i ve top hızı kodun hiçbir
  yerinde artık sabit okumuyor; hepsi `game.tuning`'den okuyor.
- `F1` panel açıp kapatıyor.
- Panel açıkken bir slider'ı sürüklediğinde oyunun hissi anında değişiyor —
  yeniden derlemeye gerek yok.
- Panel sahne kamerasının dışında çiziliyor; 3.11'in sarsıntısı panelin
  kendisini sallamıyor.
- `odin check games/breakout` geçiyor.

## Bilmen gereken küçük parça

Dünyanın açılış sorusuna geldik: hissi değiştirmek için neden her seferinde
yeniden derliyorsun? Çünkü şu ana kadar yazdığın sayılar derleme zamanında
donmuş sabitlerdi. Bu ders onları runtime'da değiştirilebilir veriye çeviriyor
— tek fark bir sabiti (`::`) bir struct alanına taşımak, ama sonucu köklü:
artık oyunu her denemende yeniden derlemene gerek yok.

raygui, Odin tarafında ayrı bir paket **değil**. `package raylib` içinde,
`vendor:raylib`'in kendi dosyalarından biri olarak geliyor — hâlâ kullandığın
`import rl "vendor:raylib"` ile çağrılır, ek kurulum, ek import, ek link adımı
yok. Dear ImGui kurmayı bekliyorsan gerek yok; kurulu derleyicinin `vendor/`
koleksiyonunda Dear ImGui zaten yok, `raygui` var ve oyun zaten raylib'e bağlı
olduğu için sıfır ek maliyetle geliyor.

Bir slider'ı çizip okumanın çağrı şekli şu:

```odin
volume: f32 = 0.5
rl.GuiSlider(rl.Rectangle{20, 50, 200, 20}, "sessiz", "yüksek", &volume, 0, 1)
```

`value` parametresi bir `^f32` — `volume` slider'ı sürüklediğin anda **yerinde**
değişir; dönen `c.int` çoğu zaman yok sayılır. Bu, immediate mode GUI'nin
anlamı: panelin kendine ait ayrı bir state'i yok, her frame yeniden çiziliyor
ve doğrudan senin verdiğin değişkeni düzenliyor.

Panel çizimi 3.11'in sahne kamerasının **dışında** kalmalı. `rl.BeginMode2D`/
`rl.EndMode2D` arasında çizilen her şey kameranın `target`/`zoom`/`rotation`'ından
geçer — trauma sarsıntısı da bu dönüşümden geliyordu. Panel o çiftin içinde
kalırsa hem sarsıntıyla birlikte sallanır hem de slider'a tıkladığın ekran
koordinatı artık sahne koordinatıyla örtüşmez, slider'a tıklayamaz hâle
gelirsin.

## Sınırlar

- raygui'nin görsel teması (renk, stil) konu değil; varsayılan görünüm yeterli.
- Panele yeni bir tuning parametresi eklemek zorunlu değil; görev yalnızca
  zaten var olan sabitleri struct'a taşımak ve onlara panelden erişmek.
- İki farklı ayar profili tutmak bu dersin konusu değil — tek bir `Tuning`
  değerini değiştirmek yeterli; birden fazla profil sıradaki derste geliyor.

::: details İpucu 1 — Hangi sabitleri topluyorsun
3.10'un hitstop süresi, 3.11'in trauma miktarı, 3.7'nin parçacık ömrü ve
doğurma sayısı, 3.13'ün pitch aralığı, ve 3.2'den beri sabit duran top hızı —
hepsi birer `::` tanımı olarak dosyanın başında duruyor. Her birini `Tuning`
struct'ında bir alan yap, `Game`'e `tuning: Tuning` ekle, `game_reset` içinde
(veya başlangıçta) başlangıç değerlerini ata.
:::

::: details İpucu 2 — Slider'ı neye bağlıyorsun
Sliderın `value` parametresi bir pointer. Kendine şunu sor: bu pointer'ı ayrı
bir yerel değişkene mi veriyorsun — mesela bir `trauma_slider: f32` tutup her
frame `game.tuning.trauma_amount = trauma_slider` diye elle kopyalıyor musun —
yoksa struct'ın alanının kendisine mi? 3.1'de Paddle'ı hatırla: ayrı
`x`, `y`, `width` ve `height` alanlarını `rect`'in bir aynası olarak
tutmuştun ve ikisi senkronsuz kalmıştı. Burada da aynı tuzak var — iki yerde tutulan bir sayı, iki
yerin birbirini takip etmesini gerektirir.
:::

::: details İpucu 3 — Doğrudan struct alanına yaz
Slider'a `game.tuning`'in kendi alanının adresini ver:

```odin
rl.GuiSlider(
	rl.Rectangle{20, 50, 200, 20},
	"az", "cok",
	&game.tuning.trauma_amount,
	0, 1,
)
```

Ayrı bir slider değişkeni yok. Panel her frame yeniden çizildiğinde
`game.tuning`'in güncel değerini gösteriyor, ve sen sürüklediğinde doğrudan
`game.tuning`'i değiştiriyorsun — okuma ve yazma aynı hücrede buluşuyor,
kopyalanacak ikinci bir yer hiç açılmıyor.
:::

::: details Deep Dive — Immediate mode ve neden Dear ImGui değil
Retained mode bir GUI kütüphanesinde (çoğu masaüstü UI framework'ü gibi)
widget'lar kendi state'ini tutan, bir kere kurulan ve olay (event) ile
güncellenen nesnelerdir — bir slider'ın kendi iç `value`'su vardır, sen ona
abone olursun. Immediate mode'da widget diye bir nesne yok: `GuiSlider` her
frame yeniden çağrılan bir procedure, kendi hafızası yok, sen ne veriyorsan
onu okuyup çiziyor. Bunun bedeli, retained mode'un sahip olduğu bazı şeyleri
(odak yönetimi, animasyonlu geçişler, karmaşık layout) kendin kurman gerekmesi;
kazancı, bir debug/tuning aracı için bakım maliyetinin neredeyse sıfır olması
— yeni bir alan eklemek yeni bir widget kaydı değil, yeni bir `GuiSlider`
çağrısı ve struct'a bir field.

Kurulu Odin derleyicisinin `vendor/` koleksiyonunda Dear ImGui yok; `microui`
ve `raylib/raygui.odin` var. Oyun zaten raylib'e bağlı olduğu için raygui
sıfır ek kurulumla geliyor — Dear ImGui'ye dönme kararı ancak raygui'nin
yetmediği somut bir araç ihtiyacı çıkarsa verilir, bugün için değil.
:::

## Birincil kaynak

[raygui — raysan5'in immediate-mode GUI kütüphanesi](https://github.com/raysan5/raygui)
(`RESOURCES.md`). Kütüphanenin immediate-mode tasarımı ve control listesi
buradan; Odin tarafında ayrı paket olmayıp `vendor:raylib` içinde geldiği
kurulu derleyiciyle derlenip link edilerek doğrulandı.

**Kazanım:** Artık oyunun hissini oyunu kapatmadan, canlı canlı
ayarlayabiliyorsun. Bu, `Tuning` struct'ının tek doğruluk kaynağı olmasıyla
mümkün oldu — slider doğrudan onu okuyup yazıyor, araya kopya giren bir ikinci
temsil yok. Sıradaki ders bu struct'ın bir değer olmasının asıl gücünü
gösterecek: aynı struct'tan iki farklı kopya tutup aralarında geçiş
yapabilirsin.

**“Breakout 3.14 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım aynı struct'tan iki farklı his profili çıkarmak:
[3.15 — İki profil, aynı karşılaşma](/worlds/03-breakout/15-two-profiles).
