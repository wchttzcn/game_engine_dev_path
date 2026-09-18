---
title: "3.9 — Ölü slota tutunan index"
description: "Havuzdaki bir slotun yeniden kullanılmasıyla ortaya çıkan bayat referansı görünür kıl ve çöz."
section: Nesne ömrü
---

# 3.9 — Ölü slota tutunan index

**Hedef:** Aktif güçlendirme etkisinin havuzdaki yanlış slotu göstermeye
başladığı bayat index hatasını önce görünür kıl, sonra çöz.

## Görev

Efekt aktifken, onu tetikleyen güçlendirmenin konumunu ekranda küçük bir
işaretle göster. Slotun index'ini tutmak cazip geliyor — ama slot yeniden
kullanılıyor, index bir süre sonra başka bir nesneyi gösteriyor. Bir debug
tuşuyla bunu kendin tetikle, F1 overlay'inde gör, sonra çöz.

## Ne zaman bitti?

- `P` tuşu, doğurma olasılığını atlayıp art arda birkaç güçlendirme doğuruyor
  (hatayı tetiklemek için).
- F1 açtığında ekranda aktif güçlendirmeyle ilgili debug bilgisi görünüyor.
- Efekt aktifken ekrandaki işaret, slot yeniden kullanılsa bile hep yakalanan
  orijinal güçlendirmenin konumunu gösteriyor — bayat index hatası yok.
- İki güçlendirme art arda hızlı yakalanınca işaret yanlış yere zıplamıyor.
- `odin check games/breakout` geçiyor.

## Elindekiler

3.8'deki güçlendirme havuzuna iki alan ekleniyor:

```odin
// Game'e eklenecek iki alan:
//   active_powerup_pos: rl.Vector2,   // yakalama anındaki konum
//   debug_visible:      bool,
```

F1 kalıbı 2.14'teki gibi: `rl.IsKeyPressed(.F1)` ile `game.debug_visible`'ı
tersine çevir, çizim tarafı yalnız sonucu okur. `rl.DrawText`/`rl.TextFormat`
zaten tanıdık.

## Sınırlar

- `P` tuşunun hızlı doğurması yalnız hatayı tetiklemek için; normal oynanışa
  karışmıyor.
- Genel bir handle/generation sistemi kurmuyorsun; bu oyundaki tek somut
  hatayı çözmen yeterli.

::: details İpucu 1 — Neyi görünür kılıp neyi düzelteceksin
Önce hatayı üret: `P`'ye basınca art arda birkaç `powerup_spawn` çağır —
gerçek tuğla kırmayı bekleme. Yakaladığın güçlendirmenin slotu anında
boşalıyor, aynı slota hemen yenisi doğabiliyor. Efekt hâlâ sürerken o slotun
içeriği çoktan değişmiş oluyor: bir index tutsaydın, gösterdiği nesne artık
senin yakaladığın nesne olmazdı. Onun yerine yakalama anındaki **konumu**
kopyala ve sakla; artık havuza hiç bakmana gerek kalmaz. F1 satırına da bu
konumu yazdır, işaretin nereye gittiğini gözle takip et.
:::

::: details İpucu 2 — Index bir slotu işaret eder, kimliği değil
Yakalanan güçlendirme hemen `alive = false` olur, slotu boşaltır. Süresi
dolana kadar süren şey **efekt** (`powerup_timer`); nesne değil — nesne
yakalandığı karede ölür. Efekt sürerken yeni bir güçlendirme tam o slota
doğabilir: tuttuğun index aynı sayıyı korur ama artık başka bir nesneyi
gösterir. Derleyici
bunu yakalamaz: index geçerli bir sayı, sınır aşımı yok, sadece yanlış nesne.
:::

::: details İpucu 3 — Tam çözüm
```odin
// powerup_update içindeki yakalama dalında — index yerine konum yazılıyor:
if rl.CheckCollisionRecs(p.rect, game.player.rect) {
	game.player.rect.width = PADDLE_WIDTH * 1.5
	game.powerup_timer = POWERUP_DURATION
	game.active_powerup_pos = {p.rect.x, p.rect.y}
	p.alive = false
}
```
Çizim tarafında artık havuza bakmıyorsun:
```odin
if game.powerup_timer > 0 {
	rl.DrawCircleV(game.active_powerup_pos, 4, rl.YELLOW)
}
if game.debug_visible {
	rl.DrawText(rl.TextFormat("active_powerup_pos: %v", game.active_powerup_pos), 10, 30, 10, rl.GREEN)
}
```
`P` tuşu `game_reset`'in yanına, `.Playing` kolunun başına eklenir; birkaç kez
`powerup_spawn` çağırır.
:::

## Kaynak

[Odin Overview — resmi dil rehberi](https://odin-lang.org/docs/overview/),
`#array-programming` bölümü. Bu ders havuzu `for &p in game.powerups` ile
pointer üzerinden gezmeye dayanıyor; sözdizimi buradan doğrulandı.

## Daha derine

Ders bittikten sonra: [Game Programming Patterns — Object
Pool](https://gameprogrammingpatterns.com/object-pool.html). Kitap,
havuzdaki slotların dışarıdan tutulan referanslarla yeniden kullanılmasının
tehlikesini açıkça tartışıyor; bu dersin kurgusu o uyarının somutlaşmış hali.

Kopyalamanın yetmeyeceği durumlar var: efekt havuzdaki nesneyi sürekli
güncellemesi gerekiyorsa (konumunu her frame okumak gibi) index tek başına
yetmez. O zaman index'e bir `generation` sayacı eklenir — her slot yeniden
kullanıldığında sayaç artar, tutulan `Handle` okumadan önce kendi
`generation`'ını slotunkiyle karşılaştırır. Breakout'ta böyle sürekli-canlı
bir referans yok; güçlendirme yakalandığı anda etkisini bırakıp havuzdan
çıkıyor. Bu yüzden burada kopyalamak yetiyor — `Handle` inşa etmek burada
ihtiyaç doğmadan bir soyutlama eklemek olurdu.

## Kazanım

Artık “derleyici sessiz kaldı ama davranış yanlış” sınıfındaki bir hatayı
önce görünür kılıp sonra çözebiliyorsun. Bu, ileride havuz kullanan her
sistemde (mermiler, efektler, ağ nesneleri) karşına çıkacak bir dikkat.

**“Breakout 3.9 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım oyun hissine geçmek: [3.10 — Hitstop](/worlds/03-breakout/10-hitstop).
