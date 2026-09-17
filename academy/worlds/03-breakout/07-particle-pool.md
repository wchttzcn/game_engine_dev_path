---
title: "3.7 — Parçacık havuzu"
description: "Tuğla kırılınca kısa ömürlü parçacıklar doğuran, sabit kapasiteli bir havuz kur."
section: Nesne ömrü
---

# 3.7 — Parçacık havuzu

**Hedef:** Bir tuğla kırıldığında o noktada kısa ömürlü parçacıklar doğuran,
sabit kapasiteli bir havuz kur.

## Görev

Tuğla kırıldığında yerinde birkaç parçacık doğsun. Parçacıklar bir süre hareket
etsin, sonra kaybolsun. Sabit kapasiteli bir array tut; doğurmak istediğinde boş
bir slot ara, bulursan onu kullan, bulamazsan sessizce vazgeç. Her frame yaşayan
parçacıkların konumunu ilerlet ve ömrünü azalt; ömrü biten parçacığın slotu
boşalsın ve bir sonraki doğumda yeniden kullanılabilsin.

## Ne zaman bitti?

- Bir tuğla kırıldığında o noktada birkaç parçacık beliriyor.
- Parçacıklar zamanla hareket edip kayboluyor; sonsuza kadar ekranda kalmıyor.
- Parçacık sayısı sabit kapasiteli bir array'de tutuluyor, dinamik array veya
  allocation yok.
- Havuz dolduğunda oyun çökmüyor veya donmuyor; yeni parçacık isteği sessizce
  düşüyor.
- Ölü bir slot bir sonraki doğumda yeniden kullanılıyor.
- `odin check games/breakout` geçiyor.

## Bilmen gereken küçük parça

Bu, 3.4'teki tuğla duvarıyla aynı iskelet: sabit kapasiteli bir array, kapasiteyi
dolduran ama uzunluğu hiç değişmeyen bir kalıp. Farkı şu — orada bütün slotlar
`game_reset`'te bir kerede dolduruluyordu, burada slotlar oyun sırasında tek tek
doluyor ve tek tek boşalıyor.

`Particle` struct'ının alanlarını burada vermiyorum. Kendine şu soruyu sor: bir
parçacığın ekranda **çizilmesi**, zamanla **hareket etmesi** ve bir süre sonra
**ölmesi** için hangi veriye ihtiyacın var? Üç davranış, üç zorunlu alan grubu —
gerisini ekleme.

Ömrü temsil etmenin iki geçerli yolu var: bir `alive: bool` bayrağı, ya da
sıfırdan büyük olduğu sürece parçacığın yaşadığını söyleyen bir sayaç (`life`
veya `timer` gibi). İkisi de kabul; incelemede hangisini seçtiğini ve neden
sorarım.

Doğurma tarafında yeni olan tek şey rastgele bir aralıktan **ondalıklı** sayı
çekmek. 2.9'da kullandığın `rand.int_max` tamsayı döndürüyordu; parçacık hızı
için bir aralıktan `f32` çekmen gerekiyor:

```odin
import "core:math/rand"

// -80.0 ile 80.0 arasında rastgele bir f32
vx := rand.float32_range(-80, 80)
```

Boş slot arama, kendi başına yeni bir kalıp değil — 2.9'da yem için
“nerede yer var” sorusunu tararken kullandığın refleksin aynısı; burada hedef
bir grid hücresi değil, bir array slotu.

## Sınırlar

- Parçacıkların şekli tek bir küçük dikdörtgen veya daire olabilir; sprite,
  döngüsel animasyon veya renk geçişi bu derste yok.
- Yerçekimi, sürtünme gibi ek fizik yok; sabit bir hızla hareket etmesi yeterli.
- Havuz kapasitesi küçük tutulabilir (örneğin 64); büyük bir sayıyla
  performans denemesi bu dersin konusu değil.

::: details İpucu 1 — Hangi soruları cevaplaman gerekiyor
`Particle` struct'ını tasarlarken üç soruyu sırayla sor: Ekranda nereye
çiziyorum (konum)? Her frame nasıl değişiyor (hız)? Ne zaman silmem gerektiğini
nasıl biliyorum (ömür)? Her sorunun cevabı bir alan. Renk, boyut gibi ekstra
alanlar bu üçü çözülmeden gerekmiyor.
:::

::: details İpucu 2 — Boş slot arama ve doğurma
Doğurma fonksiyonun havuzu baştan sona tarasın, ilk boş (ölü) slotu bulduğunda
onu doldursun ve dursun:

```odin
particle_spawn :: proc(particles: ^[MAX_PARTICLES]Particle, pos: rl.Vector2) {
	for &p in particles {
		if p.life > 0 do continue
		// slotu doldur
		return
	}
	// buraya geldiysen havuz dolu — sessizce vazgeç
}
```

`return` olmadan devam edersen tarama boş bir slot daha bulup onu da
doldurabilir; tek çağrıda tek parçacık istiyorsan dur.
:::

::: details İpucu 3 — Güncelleme ve tuğla kırılınca çağırma
```odin
particle_update :: proc(particles: ^[MAX_PARTICLES]Particle, dt: f32) {
	for &p in particles {
		if p.life <= 0 do continue
		p.pos += p.vel * dt
		p.life -= dt
	}
}
```

Tuğla kırıldığı anda, tam olarak `brick.alive = false` satırının yanında,
birkaç kez `particle_spawn` çağır — merkez konumu kırılan tuğlanın `rect`'inden
geliyor.
:::

::: details Deep Dive — Havuz dolduğunda ne yapılır?
Üç seçenek var: en eski parçacığı ez, kapasiteyi büyüt, ya da yeni isteği
sessizce yok say. Bu oyunda üçüncüsü doğru.

Kapasiteyi büyütmek (dinamik array'e geçmek) bu dersin öğrettiği şeyin tam
tersi — sabit kapasiteli havuzun bütün amacı, parçacık sayısının tavanını
önceden bilip bir daha allocation düşünmemek. Bir Breakout'ta aynı anda
gerçekten görünür kaç parçacık olabilir ki? Ekranı dolduran bir bulut zaten
oyuncunun okuyamayacağı bir görüntü verir; kapasiteyi aşan istekleri kaybetmek
görsel olarak fark edilmez.

En eskiyi ezmek (`life`'ı en düşük olanı bulup üzerine yazmak) her doğurmada
havuzun tamamını tarayıp en küçük değeri bulmayı gerektirir — sabit sürede
biten bir işlemi O(n) yapar, ve kazandığı şey burada hiçbir şey: zaten
kaybolacak olan en eski parçacığın birkaç frame erken ölmesi fark etmez.

Sessizce vazgeçmek hem en ucuz olanı hem de oyuncunun fark etmeyeceği olanı.
Havuz kapasitesini büyük tuğla kırılma patlamalarında bile dolmayacak kadar
cömert seçmek, karmaşık bir taşma stratejisinden daha iyi bir yatırım.
:::

## Birincil kaynak

[Game Programming Patterns — Object Pool](https://gameprogrammingpatterns.com/object-pool.html).
Sabit kapasiteli havuzun kendisi, boş slot arama ve slot yeniden kullanımı
tam olarak bu bölümün konusu; parçacık sistemleri kitabın kendi örneği.

**Kazanım:** Artık oyunda ömrü olan, doğan ve ölen nesneleri yönetebiliyorsun —
sabit bir bellek bütçesi içinde, allocation'a hiç dokunmadan. Bu kalıp
sıradaki derste ikinci kez, bu sefer oyuncuyla etkileşen bir nesne için
karşına çıkacak.

**“Breakout 3.7 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım aynı havuz kalıbını oyuncuyla etkileşen bir nesneye uygulamak:
[3.8 — Güçlendirmeyi düşür ve yakala](/worlds/03-breakout/08-powerup-drop).
