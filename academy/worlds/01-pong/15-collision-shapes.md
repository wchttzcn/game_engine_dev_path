---
title: "1.15 — Collision shape'lerini çiz"
description: "Topun ve raketlerin görünmeyen collision shape'lerini, collision hesabının kendi değerlerinden çiz."
section: Kod sınırları ve araç
next: false
---

# 1.15 — Collision shape'lerini çiz

**Hedef:** 1.7 ve 1.8'in kullandığı collision shape'leri, aynı değerlerden
üretilmiş outline'lar olarak overlay'e ekle.

## Görev

1.14'teki `debug_visible` bloğunu genişlet. Overlay açıkken topun circle
collision shape'ini, iki raketin rectangle collision shape'ini outline olarak ve
sahanın merkez çizgisini çiz. Bu shape'leri, collision testinin okuduğu **aynı**
`Game` field'larından üret; debug için yeni sayı yazma. Overlay kapalıyken bu
çizimler görünmesin.

## Ne zaman bitti?

- Overlay açıkken top circle outline'ı ve iki raket rectangle outline'ı görünür.
- Merkez çizgisi sahayı ikiye bölüyor.
- Outline'lar raketler hareket ettikçe onlarla birlikte geliyor ve gerçek
  shape'lerin üstüne oturuyor.
- Overlay kapalıyken hiçbir debug çizimi kalmıyor.
- `odin check games/pong` geçiyor.

## Bilmen gereken küçük parça

1.7'de collision testi yaptın, 1.8'de response yazdın; ikisi de gözle
göremediğin shape'ler üzerinde çalışıyor. Top raketin köşesinden sekmiyorsa
sorun detection'da mı, yoksa raketin collision rectangle'ı gördüğün beyaz
dikdörtgenden farklı bir yerde mi? Outline bu soruyu tek bakışta cevaplar.

Ancak bunu yalnızca outline'ı collision hesabının kendi değerinden üretirsen
yapar. Debug çizimi için ayrı sayılar yazarsan iki temsil zamanla ayrışır ve
overlay gerçeği değil, kendi kopyasını gösterir — yani bulmaya çalıştığın bug'ı
gizleyebilecek ikinci bir bug yazmış olursun.

Merkez çizgisi bir collision shape değil; sahanın referans ekseni. Topun ve
raketlerin konumunu `SCREEN_WIDTH / 2` ile karşılaştırırken gözünün dayanağı
olur.

## Sınırlar

- Outline'lar yalnızca çizim yapar; hiçbir position, velocity veya skor
  değiştirmez.
- Ayrı “debug hitbox” sayıları tanımlama. `game.player`, `game.opponent` ve
  `game.ball` field'ları girdinin tamamıdır.
- Shape'leri outline olarak çiz, dolu değil: altlarındaki gerçek raket ve top
  görünmeye devam etmeli.
- Çizim sırası kendi konusu değil; overlay'i normal sahnenin üstüne koyman
  yeterli.

::: details İpucu 1 — Hangi değerler zaten elinde?
Collision testinin okuduğu `game.player.rect` ve `game.opponent.rect`, bir de
`DrawCircleV`'ye verdiğin `rl.Vector2{game.ball.x, game.ball.y}` merkezi.
Outline çağrıları tam olarak bu üç değeri alır; `draw_game` zaten ilk ikisini
`DrawRectangleRec`'e veriyor.
:::

::: details İpucu 2 — Outline çağrıları
`rl.DrawRectangleLinesEx(rec, lineThick, color)` de `DrawRectangleRec` gibi bir
`rl.Rectangle` alır; ikinci parametre çizgi kalınlığıdır. Top için
`rl.DrawCircleLinesV(center, radius, color)`; `DrawCircleV` ile aynı iki değeri
kullanır.
:::

::: details İpucu 3 — Merkez çizgisi
`rl.DrawLineEx(startPos, endPos: rl.Vector2, thick: f32, color)` iki nokta
arasına çizgi çeker. Noktalar `rl.Vector2{SCREEN_WIDTH / 2, 0}` ve
`rl.Vector2{SCREEN_WIDTH / 2, SCREEN_HEIGHT}`; 1.3'te tanımladığın sabitler
burada da işini görüyor.
:::

::: details Deep Dive — Neden ayrı bir debug shape tutmak kötü?
Bu, oyun kodunda sık görülen bir hatadır: render shape, collision shape ve debug
shape ayrı ayrı tutulur, biri değişince diğerleri unutulur. Sonuç, gördüğün
kutunun çarpışan kutu olmadığı bir oyundur. Tek değerden türetmek bunu yapısal
olarak imkânsız kılar. Daha büyük oyunlarda aynı fikir “collider component'i tek
doğruluk kaynağıdır, debug renderer onu okur” biçiminde geri gelir.
:::

## Birincil kaynak

[Odin vendor:raylib — `DrawRectangleLinesEx`](https://pkg.odin-lang.org/vendor/raylib/#DrawRectangleLinesEx).
Bu dersteki üç çizim çağrısının — `DrawRectangleLinesEx`, `DrawCircleLinesV` ve
`DrawLineEx` — parametre sırası ve tipleri aynı binding sayfasında.

**Kazanım:** Collision bug'ını artık tahmin ederek değil, gözle görerek
inceleyebiliyorsun. Pong'un temel sürümü oynanabilir ve debug edilebilir bir maç
döngüsüne sahip; ses ve game-feel adımları bu sürümü oynadıktan sonra doğacak
ihtiyaca kalıyor.

**“Pong 1.15 denememi değerlendir”** yaz; kodunu inceleyelim.
