---
title: "1.62 — 24×12 düğme durumları çiz"
description: "Düğmenin yüzeyini aşağı kaydırarak basılı durumunu göster."
section: Idle oyun · UI
---

# {{ $frontmatter.title }}

**Hedef:** Aynı UI düğmesinin basıldığını küçük bir yer değişimiyle anlat.

**Önce şu teknik:** [1.20 — 9-slice çerçeve kur](/pixel-art/20-nine-slice) — Düğme de köşeleri bozulmadan büyüyebilmeli.

## Görev

24×12 transparent RGB dosyada coin düğmesinin normal ve basılı durumlarını iki bağımsız frame olarak çiz. `art/idle-ui/coin-button.aseprite` olarak kaydet. Bu iki frame, UI'ın alternatif durumları.

## Ne zaman bitti?

- Dış biçim her iki durumda aynı 24×12 sınırında.
- Basılı durumda yüzey ve coin iki pixel aşağıda; alttaki koyu pay küçülüyor.
- İki durum da ayrı seçilebiliyor ve kaynak kaydedilmiş.

## Bilmen gereken küçük parça

Bir idle oyunda loot toplama veya satın alma düğmesi basıldığında tepki vermeli. Burada küçük bir yüzeyin aşağı inmesi bu tepkiyi gösteriyor. Yazıyı 24×12 pixel'e sıkıştırmak gerekmiyor; bu örnekte coin işareti var, gerçek oyunda açıklayıcı metin daha geniş UI yerleşiminde kullanılabilir.

<div class="pixel-steps pixel-steps-wide">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/button-base.svg" width="192" height="96" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Düğme dış biçimi — 24×12" /></div>
    <figcaption><strong>1 · Dış biçim</strong><br />24×12 alanı #203B39 ile kur. Dört köşe boş kalsın; dış biçim iki durumda da aynı.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/button-normal.svg" width="192" height="96" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Coin düğmesi — normal" /></div>
    <figcaption><strong>2 · Normal yüzey</strong><br />İçte soldan ve üstten birer pixel payla 22×8 yüzeyi #6A9B80 yap. Üst kenara #ADD1A2, ortasına aynı 8×8 coin'i yerleştir.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/button-pressed.svg" width="192" height="96" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Coin düğmesi — basılı, yüzey ve ikon iki pixel aşağıda" /></div>
    <figcaption><strong>3 · Basılı yüzey</strong><br />Bağımsız kopyada yüzeyi ve coin'i iki pixel aşağı al. Üstteki açık çizgiyi yüzey rengine döndür; eski üst yüzey alanı koyu kalsın.</figcaption>
  </figure>
</div>

Frame > Duplicate Cels ile normal durumdan basılı duruma geçebilirsin. Bunları playback'te döndürmek gerekmiyor. Frame seçerek yüzeyin iki konumunu karşılaştır ve kaydet.

## Sınırlar

Yalnız normal ve basılı durum; ilk UI tepkisini küçük tutmak için. Hover, disabled ve bütün menü sistemi sonraki ihtiyaçlar olabilir.

::: details İpucu 1 — Sadece rengi değişmiş gibi
Coin'in ve yüzeyin gerçekten iki pixel aşağı indiğini kontrol et.
:::

::: details İpucu 2 — Coin kesildi
Coin'in 8×8 alanı normal durumda üstten 2–9., basılı durumda 4–11. satırlarda kalır.
:::

::: details İpucu 3 — İki yüzey nerede?
1'den sayarak yüzey iki durumda da 2–23. sütunlarda. Normal 2–9., basılı 4–11. satırlarda. Dış biçimi yeniden çizme.
:::

## Birincil kaynak

[Aseprite — Drawing](https://www.aseprite.org/docs/drawing/).
`RESOURCES.md` içindeki bu kaynak, pixel ve dikdörtgen alanlarla çizim araçları için;
[New Frame](https://www.aseprite.org/docs/new-frame/) durum kopyaları için kullanıldı.
UI ölçüleri ve görünüşü bu dersin tasarım seçimleridir.

**Kazanım:** Tıklama tepkisini yalnız renk farkına bağlamadan gösteren bir UI durumu çizdin.

**“Pixel Art 1.62 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.63 — 32×16 kamp alanı kur](/pixel-art/63-camp).
