---
title: "1.42 — 8×8 armor ikonu çiz"
description: "Omuz ve yaka boşluğuyla bağımsız bir armor ikonu kur."
section: Idle oyun · eşya ve monster
---

# {{ $frontmatter.title }}

**Hedef:** Bir ekipman ikonunu yaka boşluğu ve omuzlarıyla tanıt.

**Önce şu teknik:** [1.9 — Silüet testi yap](/pixel-art/09-silhouette-test) — Omuz ve yaka boşluğu ancak silüette işe yarar.

## Görev

8×8 transparent RGB dosyada göğüslük çiz. Tek renk `#92AFC3` kullan; `art/idle-items/armor.aseprite` olarak kaydet.

## Ne zaman bitti?

- İki geniş omuz arasında yaka boşluğu var.
- Gövde omuzlardan dar; karakterin başı veya ayakları eklenmemiş.
- Canvas 8×8 ve kaynak kaydedilmiş.

## Bilmen gereken küçük parça

Karakterin üzerindeki zırh ile inventory'deki armor ikonu farklı çizim ihtiyaçlarıdır. Inventory ikonu kendi başına tanınmalı. Yaka boşluğu, düz bir dikdörtgenin giyilen bir göğüslük gibi okunmasını sağlar.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/armor-1.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="armor-1 — 8×8 ders örneği" /></div>
    <figcaption><strong>1 · Dar gövde</strong><br />Dördüncü satırdan yedinciye kadar ortalanmış dört pixel genişliğinde gövde çiz.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/armor-2.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="armor-2 — 8×8 ders örneği" /></div>
    <figcaption><strong>2 · Geniş omuz</strong><br />İkinci ve üçüncü satırlara ortalanmış altışar pixel ekle. Gövdenin üstü iki yandan genişlesin.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/armor.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="armor — 8×8 ders örneği" /></div>
    <figcaption><strong>3 · Yaka boşluğu</strong><br />İkinci satırın ortasındaki iki pixel'i sil. Üçüncü satır bağlı kalsın.</figcaption>
  </figure>
</div>

Önce bu tek göğüslük yeterli. Aşağıdaki helmet ve boots aynı ölçüde başka ekipman fikirleri; ayrıca çizmen gerekmiyor.

<div class="pixel-preview">
  <figure><div class="pixel-canvas"><img src="/pixel-art/idle/helmet.svg" width="96" height="96" alt="Helmet · Başın gireceği açık alt bölüm" /></div><figcaption>Helmet · Başın gireceği açık alt bölüm</figcaption></figure>
  <figure><div class="pixel-canvas"><img src="/pixel-art/idle/boots.svg" width="96" height="96" alt="Boots · Aralarında boşluk bulunan iki parça" /></div><figcaption>Boots · Aralarında boşluk bulunan iki parça</figcaption></figure>
</div>

## Sınırlar

Tek renk, ekipmanı tanıtan dış şekli ve boşluğu çalışmak için. Metal yansıması veya rarity rengi bu görevin ön koşulu değil.

::: details İpucu 1 — Kutu gibi duruyor
Omuzların gövdeden geniş olduğuna ve yakanın gerçekten boş kaldığına bak.
:::

::: details İpucu 2 — Yaka iki parçaya ayırdı
Yalnız ikinci satırın ortasını sil. Altındaki üçüncü satır omuzları birbirine bağlar.
:::

::: details İpucu 3 — Hangi pixel'leri silmeliyim?
Soldan 4–5. sütunların yukarıdan 2. satırdaki pixel'lerini sil. Gövde 3–6. sütunlarda kalır.
:::

## Birincil kaynak

[Pedro Medeiros — An Absolute Beginner's Guide](https://saint11.art/pixel_art_articles/article1/).
`RESOURCES.md` içindeki bu kaynak, küçük bir sprite'ı az araçla görerek kurma yaklaşımı için kullanıldı. Buradaki ikonlar ve adımlar özgün ders örnekleridir.

**Kazanım:** Karakterden bağımsız, tek başına okunabilen bir ekipman ikonu çizdin.

**“Pixel Art 1.42 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.43 — 8×8 trinket çiz](/pixel-art/43-trinket).
