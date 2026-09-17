---
title: "3.8 — Güçlendirmeyi düşür ve yakala"
description: "Tuğladan belirli bir olasılıkla düşen bir güçlendirmeyi raketle yakala ve süreli etkisini başlat."
section: Nesne ömrü
---

# 3.8 — Güçlendirmeyi düşür ve yakala

**Hedef:** Tuğla kırılınca bazen bir güçlendirme düşsün; raket onu yakalarsa
süreli bir etki başlasın.

## Görev

Tuğla kırıldığında belirli bir olasılıkla bir güçlendirme doğsun ve aşağı doğru
sabit hızla insin. Raket onu yakalarsa raket bir süreliğine genişlesin; süre
dolunca eski genişliğine dönsün. Ekranın altından çıkarsa güçlendirme
kaybolsun.

## Ne zaman bitti?

- Bir tuğla kırıldığında bazen (her seferinde değil) bir güçlendirme düşüyor.
- Güçlendirme sabit hızla aşağı iniyor.
- Raket ona değerse raket genişliyor; genişleme geçici, bir süre sonra geri
  dönüyor.
- Yakalanmayan güçlendirme ekranın altından çıkınca kayboluyor, sonsuza kadar
  düşmeye devam etmiyor.
- Güçlendirmeler sabit kapasiteli bir havuzda tutuluyor, 3.7'deki kalıbın
  tekrarı.
- `odin check games/breakout` geçiyor.

## Bilmen gereken küçük parça

Bu ders 3.7'nin aynı iskeletini ikinci kez kuruyor: sabit kapasiteli havuz, boş
slot ara, doğur, ömrü (ya da bu sefer ekran dışına çıkma) bitince slotu boşalt.
Farkı şu — bu sefer nesne yalnız kendi başına yaşayıp ölmüyor, **oyuncuyla
etkileşiyor**. Kalıbı ikinci kez kurman bilinçli bir tekrar: aynı şekli ikinci
kez görünce onu kendi gözünle tanıman isteniyor, bu yüzden burada da alan
listesi verilmiyor — güçlendirmenin konumu, hızı ve yaşayıp yaşamadığı için
hangi veriye ihtiyacın olduğuna 3.7'de verdiğin cevaba bakarak kendin karar
ver.

Doğurma olasılığı için 3.7'de gördüğün `rand.float32_range`'i tekrar
kullanabilirsin: `0` ile `1` arasında bir sayı çek, sabit bir eşikten küçükse
doğur.

Raket ile güçlendirme arasındaki çarpışma testi için raylib'de hazır bir
prosedür var — iki dikdörtgen kesişiyor mu diye bakan `CheckCollisionRecs`:

```odin
if rl.CheckCollisionRecs(powerup.rect, game.player.rect) {
	// yakalandı
}
```

Bunun yerine kendi overlap testini elle de yazabilirsin (3.5'te tuğla-top
çarpışmasında overlap hesabını gördün); ikisi de kabul, dersi zorlamıyor.

Süreli etki için yeni bir sayaç gerekiyor — 2.3'teki tick timer'la aynı fikir:
bir süre alanını her frame `dt` kadar azalt, sıfıra inince etkiyi geri al.

## Sınırlar

- Tek etki, tek tür: yalnız raketi genişletme. Farklı güçlendirme türleri
  (çoklu top, yavaşlatma, vb.) bu dersin kapsamı dışında.
- Güçlendirme şekli tek bir küçük dikdörtgen olabilir; ikon veya sprite yok.
- Aynı anda birden fazla güçlendirme düşebilir ama derste yalnız tek bir tür
  var; ikisinin etkisi birbiriyle çakışabilir, bunu Deep Dive'da tartışıyoruz.

::: details İpucu 1 — Ne tutman gerekiyor
3.7'de bir parçacığın çizilmesi, hareket etmesi ve ölmesi için gereken veriyi
kendin bulmuştun. Burada aynı üç soruya bir dördüncüsü ekleniyor: bu nesne
**raketle çarpıştığında** ne olacağını bilmem için neye ihtiyacım var? Cevap
muhtemelen 3.7'deki struct'ının neredeyse aynısı, üstüne raketin çarpışma
testinde kullanabileceği bir `rl.Rectangle`.
:::

::: details İpucu 2 — Doğurma olasılığı ve düşme
```odin
POWERUP_DROP_CHANCE :: 0.2

if rand.float32_range(0, 1) < POWERUP_DROP_CHANCE {
	// güçlendirme doğur
}
```

Doğurma, 3.5'teki tuğla kırılma anının hemen yanına, `brick.alive = false`
satırının yakınına gidiyor. Düşme hareketi parçacığınkinden farklı değil —
`pos += vel * dt`, yalnız `vel` sabit ve aşağı yönlü.
:::

::: details İpucu 3 — Yakalama ve süreli etki
```odin
if rl.CheckCollisionRecs(powerup.rect, game.player.rect) {
	game.player.rect.width = PADDLE_WIDTH * 1.5
	game.powerup_timer = 6.0
	// powerup'ı öldür
}
```

Süre her frame azalıyor, sıfırı geçince raket eski genişliğine dönüyor:

```odin
if game.powerup_timer > 0 {
	game.powerup_timer -= dt
	if game.powerup_timer <= 0 {
		game.player.rect.width = PADDLE_WIDTH
	}
}
```

Genişliği değiştirirken raketin `x`'ini sabit bıraktığını fark et — raket sola
doğru büyür, merkezi kaymaz. Bunu istiyorsan `x`'i de yeniden hesaplaman
gerekir; istemiyorsan olduğu gibi bırak, ikisi de geçerli bir tercih.
:::

::: details Deep Dive — Sabit artık başlangıç değeri
Raketi büyütmeden önce `PADDLE_WIDTH` raketin genişliği hakkında bildiğin tek
gerçekti — sabit, değişmez, tek doğruluk kaynağı. Artık değil: raketin
**güncel** genişliği `game.player.rect.width` alanında, runtime'da değişen bir
değer. `PADDLE_WIDTH` hâlâ var ama artık yalnızca “oyun başladığında raket ne
kadar genişti” ve “etki bitince neye dönüyoruz” sorularının cevabı — raketin
şu anki genişliğini soran hiçbir kod artık ona bakmamalı, `game.player.rect`'e
bakmalı. Bu ayrımı gözden kaçırmak kolay bir hata sınıfı açar: bir yerde
sabitten, başka bir yerde struct'tan okursan iki farklı “raket genişliği”
aynı anda var olur.

İkinci soru: iki güçlendirme üst üste yakalanırsa ne olur? Bu dersin
uyguladığı basit modelde (`powerup_timer`'ı sabit bir değere set etmek) ikinci
yakalama süreyi **sıfırlar**, uzatmaz — zaten geri sayan sayaç yeniden
altı saniyeye döner. Süreyi biriktirmek (`+=`) istersen bu bilinçli bir
tasarım kararı, ders bunu zorunlu kılmıyor. Hangisini seçtiysen incelemede
gerekçesini sorarım.
:::

## Birincil kaynak

[Game Programming Patterns — Update Method](https://gameprogrammingpatterns.com/update-method.html).
Her nesnenin kendi `update` mantığıyla (hareket, çarpışma testi, ömür/süre
azaltma) tek bir merkezi döngüde ilerletilmesi bu bölümün konusu; güçlendirme
düşürme ve süreli etki tam olarak bu deseni uyguluyor.

**Kazanım:** Artık yalnız kendi başına yaşayıp ölen değil, oyuncunun kararını
etkileyen nesnelerin var — havuz kalıbı bir kere öğrenilip iki farklı nesne
türüne uygulandı. Sıradaki ders bu havuzun içindeki bir slotu, o slot başka
bir nesne tarafından ele geçirildikten sonra okumanın ne kadar sinsi bir hataya
yol açabileceğini gösteriyor.

**“Breakout 3.8 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu havuzdaki bayat bir referansı görünür kılmak:
[3.9 — Ölü slota tutunan index](/worlds/03-breakout/09-stale-index).
