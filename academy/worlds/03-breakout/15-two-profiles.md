---
title: "3.15 — İki profil, aynı karşılaşma"
description: "İki adlandırılmış Tuning değeri tut, bir tuşla aralarında geçiş yap ve aynı oyunu iki his profiliyle karşılaştır."
section: Runtime tuning
next: false
---

# 3.15 — İki profil, aynı karşılaşma

**Hedef:** İki adlandırılmış `Tuning` değeri arasında bir tuşla geçiş yap ve
aynı oyunu iki farklı his profiliyle arka arkaya oynayıp aradaki farkı yargıla.

## Görev

3.14'te `Tuning` bir struct oldu — yani artık bir **değer**. Bunun anlamı: iki
farklı `Tuning` değeri tutup aralarında geçiş yapabilirsin. İki adlandırılmış
profil tanımla (örneğin “sakin” ve “abartılı” — hitstop, trauma, pitch aralığı
gibi alanlarda birbirinden belirgin şekilde farklı iki set), bir tuşla
aralarında geçiş kur, ve ekranda hangi profilin aktif olduğunu göster. Panelde
yaptığın bir değişiklik aktif profile yazılsın — diğer profile geçip geri
döndüğünde yaptığın ayarın hâlâ orada durduğunu görebilmelisin.

## Ne zaman bitti?

- İki adlandırılmış `Tuning` değeri var, alanları birbirinden belirgin şekilde
  farklı.
- Bir tuşla iki profil arasında geçiş yapılıyor.
- Ekranda hangi profilin aktif olduğu okunuyor (isim olarak).
- Panelden yapılan bir değişiklik aktif profile yazılıyor: profili değiştirip
  geri döndüğünde önceki ayarın korunduğu görülüyor.
- Profil değişimi anında oyunun hissi fark ediliyor.
- `odin check games/breakout` geçiyor.

## Bilmen gereken küçük parça

Burada dilin bir davranışı asıl konu: **Odin'de struct ataması değeri
kopyalar.** `game.tuning = LOUD_PROFILE` yazdığında `game.tuning` ile
`LOUD_PROFILE` arasında bir referans kurulmuyor — `LOUD_PROFILE`'ın o anki
alan değerleri `game.tuning`'e tek tek kopyalanıyor. Bu atamadan sonra
`game.tuning`'i değiştirmek (panelden bir slider sürüklemek gibi)
`LOUD_PROFILE`'ı hiç etkilemiyor; ikisi artık bağımsız iki kopya.

Bunu 2.4'te tam ters yönde yaşamıştın: `head := game.body[0]` yazıp `head`'i
değiştirmiştin, ama `head` de bir kopyaydı — değişiklik `game.body[0]`'a hiç
yansımamıştı, yılan iki tick'te tek hücreye çökmüştü. Orada kopyalama sana
zarar vermişti çünkü bir referans bekliyordun ama kopya almıştın. Burada aynı
semantik — atamanın kopya alması — tam tersi yönde işine yarıyor: iki profili
birbirine karıştırmadan ayrı ayrı tutabiliyorsun, çünkü biri diğerinin takma
adı değil.

Bu fikrin görev tanımındaki asıl zorluğu açtığı yer şurası: eğer geçiş yalnızca
`game.tuning = LOUD_PROFILE` ise, panelde yaptığın değişiklik yalnızca
`game.tuning`'i değiştirir, `LOUD_PROFILE`'ın kendisini değil — geri döndüğünde
değişikliğin kaybolduğunu görürsün. Görev “geri dönünce ayarın korunduğunu
görebilmelisin” diyor; bu, geçiş yapmadan **önce** güncel `game.tuning`'i
geldiği profile geri yazman gerektiği anlamına geliyor. Adlandırılmış
profillerin kendisi de bu yüzden değişebilir (yeniden atanabilir) bir yerde
tutulmalı — sabit (`::`) bir değere geri yazamazsın.

## Sınırlar

- Diske kaydetme yok; profiller yalnızca bellekte, oyun kapanınca kayboluyor.
  Diske yazmak ayrı bir soruyu (serialization) açıyor, o soru bu dersin
  kapsamında değil.
- İkiden fazla profil yok. İki profil farkı göstermeye yetiyor; üçüncü profil
  ekstra state yönetimi getirir, karşılaştırmayı zenginleştirmez.
- Profil düzenleyici (profillere isim verme, yeni profil oluşturma UI'ı) yok.
  İki profil kodda adlandırılmış olarak yeterli.

::: details İpucu 1 — İki profili nerede tutuyorsun
Adlandırılmış başlangıç değerlerini paket seviyesinde iki `Tuning` değeri
olarak tanımlayabilirsin — ama panelden gelen değişikliğin bir profile kalıcı
olarak yazılabilmesi için o profilin **değişebilir** bir yerde durması
gerekiyor. Sabit (`::`) bir tanıma sonradan atama yapamazsın; `Game` içinde
(veya paket seviyesinde) iki adet değişebilir `Tuning` alanı ve hangisinin
aktif olduğunu söyleyen küçük bir state (bir `bool` veya iki üyeli bir enum)
düşün.
:::

::: details İpucu 2 — Geçişte hangi sıra
Yalnızca `game.tuning = LOUD_PROFILE` yazarsan ne olur? Değer kopyalanır, ama
o ana kadar `game.tuning`'de biriken panel değişiklikleri nereye gider? Geçiş
yapmadan önce hangi işlemi yapman gerekiyor ki geri döndüğünde o değişiklikleri
bulasın? İki adımı ayrı ayrı düşün: (1) şu anki `game.tuning`'i geldiği yere
geri yaz, (2) yeni profili `game.tuning`'e kopyala. Sıra önemli — ters
çevirirsen az önce yaptığın değişikliği kaybedersin.
:::

::: details İpucu 3 — Geçiş procedure'ı
```odin
toggle_tuning_profile :: proc(game: ^Game) {
	if game.active_is_loud {
		game.profile_loud = game.tuning
	} else {
		game.profile_calm = game.tuning
	}
	game.active_is_loud = !game.active_is_loud
	game.tuning = game.active_is_loud ? game.profile_loud : game.profile_calm
}
```
İlk iki satır güncel `game.tuning`'i, az önce hangi profildeysen oraya kopyalar
— panelde yaptığın her değişiklik böylece kalıcı olur. Son satır yeni aktif
profili `game.tuning`'e kopyalar. Her iki yönde de olan tek şey bir struct
ataması; struct ataması değeri kopyaladığı için üç `Tuning` (`tuning`,
`profile_calm`, `profile_loud`) birbirinden bağımsız kalıyor, biri
değiştiğinde diğer ikisi kendiliğinden değişmiyor.
:::

::: details Deep Dive — Buradan sonra ne açılır
Bu dünyanın planı şu üç konuyu bilinçli olarak sonraya bıraktı, birer cümleyle:
profilleri diske yazmak bir serialization sorusu açıyor (struct'ı nasıl
byte'a çevirip geri okuyacaksın); raketin neresine çarpıldığının topun sekme
açısını değiştirmesi collision response'a yeni bir boyut ekliyor; parçacıklar
için sabit kapasiteli havuz yerine bir arena denemek, ömrü değişken çok sayıda
nesnenin başka bir yönetim stratejisini gösteriyor. Üçü de bu paketin
kapsamı dışında kaldı — ama artık `Tuning`'i bir değer olarak taşıyabildiğine
göre, bir profili diske yazmak sana çok uzak durmuyor olmalı.
:::

## Birincil kaynak

[Odin Overview — resmi dil rehberi](https://odin-lang.org/docs/overview/#structs).
Struct atamasının değeri kopyaladığı, bir referans bağlamadığı burada
yazıyor; iki profili birbirinden bağımsız tutabilmenin dayandığı kural bu.

**Kazanım:** Breakout artık yalnızca doğru çalışan bir oyun değil — hissi
ölçülebilir şekilde değiştirilebilen bir oyun. Aynı çarpışma kuralları, aynı
duvar, aynı raket; ama hitstop'u, sarsıntıyı, sesi ve top hızını değiştirerek
tamamen farklı iki oyun hissi üretebiliyorsun, ve bunu tek bir tuşla
karşılaştırabiliyorsun. Dünya 3 burada bitiyor.

**“Breakout 3.15 denememi değerlendir”** yaz; kodunu inceleyelim.
