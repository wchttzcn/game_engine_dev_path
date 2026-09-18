---
title: "3.7 — Parçacık havuzu"
description: "Tuğla kırılınca kısa ömürlü parçacıklar doğuran, sabit kapasiteli bir havuz kur."
section: Nesne ömrü
---

# 3.7 — Parçacık havuzu

**Hedef:** Bir tuğla kırıldığında o noktada kısa ömürlü parçacıklar doğuran,
sabit kapasiteli bir havuz kur.

## Görev

Tuğla kırıldığında yerinde birkaç parçacık doğsun, hareket etsin, sonra
kaybolsun. Sabit kapasiteli bir array tut; doğururken boş bir slot ara,
bulursan doldur, bulamazsan sessizce vazgeç. Her frame yaşayan parçacıkların
konumunu ilerlet, ömrünü azalt; ömrü biten slot bir sonraki doğumda yeniden
kullanılabilsin.

## Ne zaman bitti?

- Bir tuğla kırıldığında o noktada birkaç parçacık beliriyor.
- Parçacıklar zamanla hareket edip kayboluyor; sonsuza kadar ekranda kalmıyor.
- Havuz dolduğunda oyun çökmüyor veya donmuyor; yeni parçacık isteği sessizce
  düşüyor.
- Ölü bir slot bir sonraki doğumda yeniden kullanılıyor.
- `R` ile sıfırlanınca havuz da temizleniyor; parçacıklar yeni oyuna taşınmıyor.
- `odin check games/breakout` geçiyor.

## Elindekiler

Bu, 3.4'teki tuğla duvarıyla aynı iskelet: sabit kapasiteli bir array, kapasiteyi
dolduran ama uzunluğu hiç değişmeyen bir kalıp. Struct ve imzalar aşağıda;
**proc gövdeleri ve bu procleri nereden çağıracağın sana ait.**

```odin
MAX_PARTICLES :: 64

Particle :: struct {
	alive:    bool,
	life:     f32,
	pos, vel: rl.Vector2,
}

// Game'e eklenecek alan:
//   particles: [MAX_PARTICLES]Particle,

particle_spawn :: proc(game: ^Game, pos: rl.Vector2) {
}

particle_update :: proc(game: ^Game, dt: f32) {
}
```

`MAX_PARTICLES` havuzun tavanı: aynı anda yaşayabilecek en çok parçacık. Tek
kırılmada kaç tane doğacağı ayrı bir sayı ve onu sen seçiyorsun.

`life` hem “yaşıyor mu” hem “ne kadar kaldı” sorusunu tek alanda cevaplıyor;
`alive` ayrı bir bayrak. 2.9'da kullandığın `rand.int_max` tamsayı
döndürüyordu; burada bir aralıktan ondalıklı `f32` çekiyorsun:

```odin
// core:math/rand — float32_range :: proc(low, high: f32) -> f32
vx := rand.float32_range(-80, 80)
```

## Sınırlar

- Parçacıkların şekli tek bir küçük daire olabilir; sprite, döngüsel animasyon
  veya renk geçişi bu derste yok.
- Yerçekimi, sürtünme gibi ek fizik yok; sabit bir hızla hareket etmesi
  yeterli.
- Havuz kapasitesi küçük tutulabilir; büyük bir sayıyla performans denemesi bu
  dersin konusu değil.

::: details İpucu 1 — İki procün işi
`particle_spawn` havuzu baştan tarasın; `life`'ı sıfır veya altında olan ilk
slotu bulunca `pos`'u verilen noktaya, `life`'ı 1'e, `vel`'i rastgele bir
yöne ayarlayıp `alive`'ı `true` yapsın ve dursun; hiç boş slot yoksa sessizce
çıksın. `particle_update` her frame yaşayan her parçacığı `vel * dt` kadar
ilerletsin ve `life`'ı `dt` kadar azaltsın; `life` sıfırın altına inince
`alive`'ı `false` yapsın.
:::

::: details İpucu 2 — Taramayı zamanında durdurmak
Boş slot bulduğunda hemen `return` etmezsen tarama devam eder ve tek bir
çağrı birden fazla slotu doldurabilir — bir tuğla kırılmasında beklenenden
çok parçacık doğar. Slotun boş olup olmadığını `life <= 0` ile kontrol et;
`alive`'ı yalnız doldururken `true` yaz, aksi halde iki alan birbirinden
bağımsız yalan söyleyebilir.
:::

::: details İpucu 3 — Tam çözüm
```odin
particle_spawn :: proc(game: ^Game, pos: rl.Vector2) {
	for &p in game.particles {
		if p.life > 0 do continue
		p.pos = pos
		p.life = 1
		p.vel = {rand.float32_range(-80, 80), rand.float32_range(-80, 80)}
		p.alive = true
		return
	}
}

particle_update :: proc(game: ^Game, dt: f32) {
	for &p in game.particles {
		if p.life <= 0 {
			p.alive = false
			continue
		}
		p.pos += p.vel * dt * 3
		p.life -= dt
	}
}
```
`particle_update` çağrısı `main`'in en başında, her frame bir kez gidiyor —
state'ten bağımsız, kaybetsen de kazansan da parçacıklar sönmeye devam etsin.
`particle_spawn` çağrısı tuğlanın kırıldığı yere, `brick.alive = false`
satırının yanına gidiyor; birkaç kez çağırarak tek kırılmada birden fazla
parçacık doğurabilirsin.
:::

## Kaynak

[Odin standart kütüphanesi — core:math/rand](https://pkg.odin-lang.org/core/math/rand/).
`float32_range`'in imzası ve aralık davranışı burada; parçacık hızının hangi
aralıktan çekildiği buna dayanıyor.

## Daha derine

Ders bittikten sonra: [Game Programming Patterns — Object
Pool](https://gameprogrammingpatterns.com/object-pool.html). Sabit kapasiteli
havuzun kendisi, boş slot arama ve slot yeniden kullanımı tam olarak bu
bölümün konusu; parçacık sistemleri kitabın kendi örneği.

Havuz dolduğunda üç seçenek var: en eski parçacığı ez, kapasiteyi büyüt, ya da
yeni isteği sessizce yok say. Bu oyunda üçüncüsü doğru. Kapasiteyi büyütmek
(dinamik array'e geçmek) bu dersin öğrettiği şeyin tam tersi — sabit
kapasiteli havuzun amacı, parçacık sayısının tavanını önceden bilip bir daha
allocation düşünmemek. En eskiyi ezmek her doğurmada havuzun tamamını tarayıp
en küçük `life`'ı bulmayı gerektirir — sabit sürede biten bir işlemi O(n)
yapar, kazandığı şey de yoktur: zaten kaybolacak bir parçacığın birkaç frame
erken ölmesi fark etmez. Sessizce vazgeçmek hem en ucuz hem de oyuncunun fark
etmeyeceği seçenek; havuz kapasitesini büyük patlamalarda bile dolmayacak
kadar cömert seçmek, karmaşık bir taşma stratejisinden daha iyi bir yatırım.

## Kazanım

Artık oyunda ömrü olan, doğan ve ölen nesneleri yönetebiliyorsun — sabit bir
bellek bütçesi içinde, allocation'a hiç dokunmadan. Bu kalıp sıradaki derste
ikinci kez, bu sefer oyuncuyla etkileşen bir nesne için karşına çıkacak.

**“Breakout 3.7 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım aynı havuz kalıbını oyuncuyla etkileşen bir nesneye uygulamak:
[3.8 — Güçlendirmeyi düşür ve yakala](/worlds/03-breakout/08-powerup-drop).
