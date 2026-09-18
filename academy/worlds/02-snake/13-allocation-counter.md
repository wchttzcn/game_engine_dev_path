---
title: "2.13 — Allocation sayacı"
description: "main içinde bir tracking allocator kurup context.allocator üzerinden geçen allocation'ları ölç; ölçümün kapsamını doğru yorumla."
section: Veri temsili
---

# 2.13 — Allocation sayacı

**Hedef:** “Oynanış sırasında allocation yapmıyorum” varsayımını bir tracking
allocator ile ölç — ve ölçümün gerçekte neyi kapsadığını doğru yorumla.

## Görev

`core:mem` paketini import et. `main` içinde bir `mem.Tracking_Allocator` kur
ve `context.allocator`'ı ona bağla; bunu yaptıktan sonra `context.allocator`
üzerinden geçen her allocation bu sayaca kaydedilir. Ekranın bir köşesine
`total_allocation_count` ve `current_memory_allocated` değerlerini yaz (F1
toggle'ı henüz gerekmiyor, 2.14'de bu sayaçları oraya taşıyacaksın).

Sayacın gerçekten bağlı olduğunu kanıtlamak için bilerek küçük bir kontrol
yap: geçici olarak bir `make([]byte, 64)` veya `fmt.aprintf` çağrısı ekle,
sayaçların hareket ettiğini gözlemle, sonra bu çağrıyı kaldır. Ardından oyna:
yılanı hareket ettir, yem ye, kendine çarp; bu kez sayaçların oynanış
sırasında sabit kaldığını doğrula.

## Ne zaman bitti?

- Sayaçlar ekranda görünüyor.
- Bilerek eklediğin kontrol çağrısı (`make` veya `fmt.aprintf`) sayaçları
  hareket ettiriyor; kaldırdığında sayaçlar tekrar sabitleşiyor — bağlantının
  gerçekten çalıştığını kanıtladın.
- Pencere açıldıktan sonra normal oynanış sırasında (hareket, yem, büyüme,
  kendine çarpma) `total_allocation_count`, `context.allocator` üzerinden
  sabit kalıyor — ya da artıyorsa hangi çağrının artırdığını söyleyebiliyorsun.
- raylib çağrılarının (`rl.DrawText`, `rl.BeginDrawing` gibi) bu sayaca hiç
  yansımadığını biliyorsun ve bunun neden beklenen bir davranış olduğunu
  açıklayabiliyorsun.
- Program kapanırken tracking allocator temizleniyor.
- `odin check games/snake` geçiyor.

## Bilmen gereken küçük parça

`core:mem`, Odin'in bellek yönetimi yardımcılarını taşıyan paket;
`Tracking_Allocator` da oradan geliyor. `context.allocator`, o an yürürlükte
olan allocator'ı taşıyan implicit bir parametre — `make`, `new`, `append`,
`fmt.aprintf` gibi tahsis yapan hemen her çağrı, açıkça başka bir allocator
vermediğin sürece `context.allocator`'ı kullanır. Onu tracking allocator'a
atadığında, bu implicit parametreden geçen her çağrı artık önce sayaç
üzerinden geçer.

`body` array'i de `occupied` grid'i de `Game` struct'ının içinde yaşıyor;
`Game` de `main` içinde yerel bir değişken. İkisi de heap'e hiç gitmedi — ama
bunu bilmek yetmez, göstermek gerekir. Tracking allocator gerçek sayıyı verir.

Kurulum üç parça: allocator'ı başlat, `context.allocator`'ı ona ata, çıkışta
temizle.

```odin
track: mem.Tracking_Allocator
mem.tracking_allocator_init(&track, context.allocator)
context.allocator = mem.tracking_allocator(&track)
defer mem.tracking_allocator_destroy(&track)
```

Bunu `rl.InitWindow`'dan önce, `main`'in başına koy — o andan sonraki her
`make`, `append` veya `fmt.aprintf` çağrısı bu allocator'dan geçer.
[1.14 — Debug overlay](/worlds/01-pong/14-debug-overlay)'de öğrendiğin
`rl.TextFormat` kendi static buffer'ına yazar, allocate etmez; `fmt.aprintf`
gibi bir çağrı heap'ten alır. Overlay metnini yanlışlıkla `fmt.aprintf` ile
kurarsan sayaç bunu anında ele verir.

Ama tracking allocator'ın ne ölçtüğü konusunda dikkatli ol: yalnızca kendisinden
— yani `context.allocator`'dan — geçen istekleri sayar. raylib'in C tarafındaki
kendi internal allocator'ı (`MemAlloc`/`MemFree`) `context.allocator`'dan hiç
geçmez; raylib kendi belleğini kendi C kodunda ayırır ve Odin'in allocator
sistemine hiç uğramaz. Odin binding'i bu iç allocator'ı `MemAllocator` adıyla
bir `mem.Allocator` olarak da sarmalıyor — ama bu sarmalayıcı senin kendi
Odin kodunun raylib'in belleğinden pay alması içindir, raylib'in kendi
içindeki çağrıları tracking allocator'a yönlendirmez. Bu yüzden sayaç
“0 allocation” derse bunun anlamı **“`context.allocator`
üzerinden geçen sıfır allocation”**dır — “programda hiç bellek ayrılmadı”
değil. Bir raylib çağrısı dahili olarak onlarca byte ayırabilir ve bu sayaçta
hiç görünmez; aynı boyuttaki bir Odin `make` çağrısı ise anında görünür. Bu
farkı bilerek kontrol çağrını ekleyip kaldırman da tam bu yüzden — sayacın
gördüğü şeyle görmediği şey arasındaki sınırı elinle çizmiş oluyorsun. Dersin
asıl kazanımı “sıfır allocation” demek değil, ölçtüğün sayıyı doğru
yorumlamak.

## Sınırlar

- Kendi allocator'ını veya arena'nı yazma; bu ders yalnızca ölçüm, tasarım
  sonraki oyunlarda gelecek.
- raylib'in kendi C allocator'ını sayaca bağlamaya çalışma; bu dersin kapsamı
  dışında.
- Sayaçları F1 arkasına gizleme; şimdilik her an görünür kalsınlar.

::: details İpucu 1 — Hangi alanları okuyacaksın
`track.total_allocation_count` programın başından beri yapılan toplam
allocation sayısını, `track.current_memory_allocated` o an ayrılı duran byte
sayısını verir. İkisi de `i64`.
:::

::: details İpucu 2 — Ekrana yazmak
`rl.TextFormat` zaten Odin'in `fmt` verb'lerini kullanıyor; `i64` bir değeri
`%v` veya `%d` ile doğrudan yazdırabilirsin. Ayrı bir string dönüşümüne gerek
yok.
:::

::: details İpucu 3 — Çizim satırı
```odin
rl.DrawText(rl.TextFormat("allocs: %v  mem: %v", track.total_allocation_count, track.current_memory_allocated), 10, 10, 10, rl.GREEN)
```
`track`'e `draw_game` içinden erişebilmen için ya `Game` struct'ına bir alan
olarak taşı ya da pointer'ını `draw_game`'e ayrı bir parametre olarak geç.
:::

::: details Deep Dive — Bu kurulum her oyunda aynı mı kalır?
Evet — bu üç satır bu oyuna özgü değil; bundan sonraki her oyunda aynı kurulumu
tekrar edebilirsin. Gerçek motorlarda bu fikir per-sistem bellek bütçeleri veya
frame başına allocation alarmına genişler, ama temel soru aynı kalır: “şu an ne
kadar bellek ayrılı ve bunu kim istedi?”
:::

## Birincil kaynak

[Odin standart kütüphanesi — core:mem](https://pkg.odin-lang.org/core/mem/).
Bu derste kullandığın `Tracking_Allocator`, `tracking_allocator_init`,
`tracking_allocator` ve `tracking_allocator_destroy` imzaları aynı sayfada.
raylib'in kendi iç allocator'ının Odin tarafındaki karşılığı için
[Odin vendor:raylib — `MemAllocator`](https://pkg.odin-lang.org/vendor/raylib/#MemAllocator);
sayacın raylib'in kendi C çağrılarını neden görmediğinin kaynağı burası.

**Kazanım:** “Sıfır allocation” iddian artık ölçülmüş bir gerçek, varsayım
değil — ve bu ölçümün tam olarak neyi kapsadığını, neyi kapsamadığını
biliyorsun.

**“Snake 2.13 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu sayaçları ve gövdenin diğer gizli state'ini tek bir yerde
toplamak: [2.14 — Grid debug görünümü](/worlds/02-snake/14-grid-debug-view).
