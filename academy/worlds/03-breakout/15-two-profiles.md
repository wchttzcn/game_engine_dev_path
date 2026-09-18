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

3.14'te `Tuning` bir struct oldu — yani artık bir **değer**. İki adlandırılmış
profil tanımla (örneğin “sakin” ve “abartılı” — hitstop, trauma, pitch aralığı
gibi alanlarda belirgin şekilde farklı iki set), bir tuşla aralarında geçiş
kur, ve ekranda hangi profilin aktif olduğunu göster. Panelde yaptığın bir
değişiklik aktif profile yazılsın — diğer profile geçip geri döndüğünde
ayarın hâlâ orada durduğunu görebilmelisin.

## Ne zaman bitti?

- İki adlandırılmış `Tuning` değeri var, alanları birbirinden belirgin
  şekilde farklı.
- Bir tuşla iki profil arasında geçiş yapılıyor.
- Ekranda hangi profilin aktif olduğu okunuyor (isim olarak).
- Panelden yapılan bir değişiklik aktif profile yazılıyor: profili değiştirip
  geri döndüğünde önceki ayarın korunduğu görülüyor.
- Profil değişimi anında oyunun hissi fark ediliyor.
- `odin check games/breakout` geçiyor.

## Elindekiler

Burada dilin bir davranışı asıl konu: **struct ataması değeri kopyalar.**
`game.tuning = game.profile_loud` yazdığında ikisi arasında referans kurulmaz
— alan değerleri tek tek kopyalanır; sonra `game.tuning`'i değiştirmek
`profile_loud`'u etkilemez. 2.4'te bunu ters yönde yaşamıştın:
`head := game.body[0]` bir kopyaydı, değişiklik `game.body[0]`'a hiç yansımamıştı.
Burada aynı semantik işine yarıyor: üç bağımsız `Tuning` kopyası
tutabiliyorsun.

`Game`'e eklenecek üç alan ve doldurman gereken procedure:

```odin
// Game'e eklenecek üç alan:
//   profile_calm:   Tuning,
//   profile_loud:   Tuning,
//   active_is_loud: bool,

toggle_tuning_profile :: proc(game: ^Game) {
}
```

## Sınırlar

- Diske kaydetme yok; profiller yalnızca bellekte, oyun kapanınca kayboluyor.
- İkiden fazla profil yok; iki profil farkı göstermeye yetiyor.
- Profil düzenleyici (isim verme, yeni profil oluşturma UI'ı) yok.

::: details İpucu 1 — Geçişte iki adım
Sabit (`::`) bir tanıma sonradan atama yapamazsın; profiller bu yüzden
`Game`'in değişebilir alanları. Geçiş iki adımdan oluşur: önce güncel
`game.tuning`'i, az önce hangi profildeysen oraya geri yaz — aksi halde
panelde yaptığın değişiklik kaybolur; sonra yeni profili `game.tuning`'e
kopyala. `active_is_loud` bu iki adımın hangi yöne gideceğini söylüyor.
:::

::: details İpucu 2 — Geri yazmadan geçmek
Yalnızca `game.tuning = game.profile_loud` yazıp `active_is_loud`'u çevirmek
yeterli görünür ama panelde biriken değişiklikleri kaybettirir: geri
döndüğünde ayarın sıfırlandığını görürsün. Sıra önemli — önce şu anki
profili geri yaz, sonra yeniyi oku; ters çevirirsen az önce yaptığın
değişikliği kaybedersin.
:::

::: details İpucu 3 — Tam çözüm
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
Çağrı yeri `.Playing` kolunda, `F1` kontrolünün yanında:
```odin
if rl.IsKeyPressed(.TAB) {
	toggle_tuning_profile(&game)
}
```
Aktif profil adı, panelle aynı çizim bloğunda:
```odin
name := game.active_is_loud ? "abartılı" : "sakin"
rl.DrawText(rl.TextFormat("profil: %s", name), 20, 20, 20, rl.WHITE)
```
:::

## Kaynak

[Odin Overview — resmi dil rehberi](https://odin-lang.org/docs/overview/#structs)
(`RESOURCES.md`). Struct atamasının değeri kopyaladığı, bir referans
bağlamadığı burada yazıyor; iki profili birbirinden bağımsız tutabilmenin
dayandığı kural bu.

## Daha derine

Bu dünyanın planı şu üç konuyu bilinçli olarak sonraya bıraktı: profilleri
diske yazmak bir serialization sorusu açıyor (struct'ı nasıl byte'a çevirip
geri okuyacaksın); raketin neresine çarpıldığının topun sekme açısını
değiştirmesi collision response'a yeni bir boyut ekliyor; parçacıklar için
sabit kapasiteli havuz yerine bir arena denemek, ömrü değişken çok sayıda
nesnenin başka bir yönetim stratejisini gösteriyor. Üçü de bu paketin
kapsamı dışında kaldı — ama artık `Tuning`'i bir değer olarak taşıyabildiğine
göre, bir profili diske yazmak sana çok uzak durmuyor olmalı.

## Kazanım

Breakout artık yalnızca doğru çalışan bir oyun değil — hissi ölçülebilir
şekilde değiştirilebilen bir oyun. Aynı çarpışma kuralları, aynı duvar, aynı
raket; ama hitstop'u, sarsıntıyı, sesi ve top hızını değiştirerek tamamen
farklı iki oyun hissi üretebiliyorsun, ve bunu tek bir tuşla
karşılaştırabiliyorsun. Dünya 3 burada bitiyor.

**“Breakout 3.15 denememi değerlendir”** yaz; kodunu inceleyelim.
