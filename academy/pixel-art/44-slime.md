---
title: "1.44 — 8×8 slime çiz"
description: "İki göz ekleyerek basit bir kütleyi küçük bir monster'a dönüştür."
section: Idle oyun · eşya ve monster
---

# {{ $frontmatter.title }}

**Hedef:** Basit bir gövdeye yüz işareti ekleyerek monster olarak okunmasını sağla.

**Önce şu teknik:** [1.9 — Silüet testi yap](/pixel-art/09-silhouette-test) — Gövde ile gözün ayrımı önce dış şekilde başlar.

## Görev

8×8 transparent RGB dosyada slime çiz. Gövde `#7DBD72`, gözler `#182E33` olsun. `art/monsters/slime.aseprite` olarak kaydet.

## Ne zaman bitti?

- Geniş, yere oturan gövdenin üstü daralıyor.
- İki göz aynı satırda ve birbirinden ayrı seçiliyor.
- Canvas 8×8, iki renk ve kaynak kaydedilmiş.

## Bilmen gereken küçük parça

İlk monster için kol, bacak ve anatomi eklemiyoruz. Geniş tabanlı küçük bir kütle ve iki göz yeterli. Oyunda bunun düşman oluşunu yalnız göz rengi anlatmayacak; konum, davranış ve UI da rol oynayacak. Burada tek işimiz okunur sprite.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/slime-1.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="slime-1 — 8×8 ders örneği" /></div>
    <figcaption><strong>1 · Yere oturan kütle</strong><br />Beşinci satırdan yedinciye kadar ortalanmış altışar yeşil pixel çiz.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/slime-2.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="slime-2 — 8×8 ders örneği" /></div>
    <figcaption><strong>2 · Üst biçim</strong><br />Dördüncü satıra altı, üçüncü satıra dört yeşil pixel ekle. Tepesi tabandan dar olsun.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/slime.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="slime — 8×8 ders örneği" /></div>
    <figcaption><strong>3 · İki göz</strong><br />Beşinci satırın 3. ve 6. sütunlarını koyu renge çevir.</figcaption>
  </figure>
</div>

İlk ve son satırlardaki boşluk, daha sonra küçük bir hareket için yer bırakır. Şimdilik tek poz yeterli. Bat örneği, başka bir monster'ı bu ölçüde nasıl ayırt edebileceğini gösterir.

<div class="pixel-preview">
  <figure><div class="pixel-canvas"><img src="/pixel-art/idle/bat.svg" width="96" height="96" alt="Bat · Gövdeden dışa açılan geniş kanatlar" /></div><figcaption>Bat · Gövdeden dışa açılan geniş kanatlar</figcaption></figure>
</div>

## Sınırlar

İki göz ve tek kütle, yüz işaretinin etkisini görmek için. Monster saldırısı veya tam animasyon seti bu ilk görevin parçası değil.

::: details İpucu 1 — Gözler tek çizgi oldu
Gözlerin arasında yeşil pixel bırak; koyu alanı arada birleştirme.
:::

::: details İpucu 2 — Slime havada gibi
Alt gövdeyi düz ve geniş tut. Tek poza ayrıca gölge eklemek gerekmiyor.
:::

::: details İpucu 3 — Gövde nasıl?
Dolu satır genişlikleri 0, 0, 4, 6, 6, 6, 6, 0. Ortala; beşinci satırın 3. ve 6. sütunlarını göz yap.
:::

## Birincil kaynak

[Pedro Medeiros — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/).
`RESOURCES.md` içindeki bu kaynak, küçük bir sprite'ı az araçla görerek kurma yaklaşımı için kullanıldı. Buradaki ikonlar ve adımlar özgün ders örnekleridir.

**Kazanım:** Karakterlerden farklı bir şekil ve iki küçük yüz işaretiyle ilk monster'ını çizdin.

**“Pixel Art 1.44 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.45 — Tek slime'dan üç tier üret](/pixel-art/45-slime-tiers).
