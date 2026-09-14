---
title: "1.37 — Archer'ın yay germe pozunu çiz"
description: "Aynı gövdeyi koruyup yalnız kolu ve yayı değiştirerek ikinci bir poz kur."
section: Idle oyun · archer
---

# {{ $frontmatter.title }}

**Hedef:** Bir karakterin ikinci pozunu, gövdesini yeniden çizmeden üret.

**Önce şu teknik:** [1.18 — Hazırlık karesiyle ağırlık ver](/pixel-art/18-chest-weight) — Yayı germek, atıştan önceki hazırlık karesidir.

## Görev

1.36'da çizdiğin archer'ı yeni bir 8×8 dosyaya kopyala ve yalnız sağ tarafını değiştir: yay dışa taşınsın, elin geri gelsin ve kirişe bir ok ucu otursun. `art/characters/archer-draw.aseprite` olarak kaydet.

## Ne zaman bitti?

- Baş, gövde ve ayaklar duran pozdaki yerinde kalmış.
- Yay duran pozdan daha dışarıda; el ile yay arasında ok ucu görünüyor.
- İki dosya da ayrı ayrı açılabiliyor; kaynak 8×8.

## Bilmen gereken küçük parça

Bir karakterin ikinci pozunu çizerken en büyük hata her şeyi yeniden çizmektir. Küçük canvas'ta bu, karakterin **kendine benzememesine** yol açar.

Bunun yerine sabit kalacak parçayı seç: burada baş, gövde ve ayaklar. Değişecek parça yalnız kol ve yay. İki poz arka arkaya gösterildiğinde göz, değişen yeri hareket olarak okur.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/fx/archer-base.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="1.36'daki duran archer; yay sağda kavisli." /></div>
    <figcaption><strong>1 · Duran poz</strong><br />Önce 1.36'daki archer'ı aynen kopyala. Bu senin referansın.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/fx/archer-diff.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Değişen pixel'ler turkuaz renkle işaretli archer." /></div>
    <figcaption><strong>2 · Değişecek yerler</strong><br />Turkuaz pixel'ler duran pozdan farklı olanlar. Gövdeye hiç dokunulmuyor.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/fx/archer-draw.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Yayı dışa taşınmış, kirişinde ok ucu olan archer." /></div>
    <figcaption><strong>3 · Germe pozu</strong><br />Yayı en sağ sütuna al, eli bir pixel geri çek ve aralarına ok ucunu koy.</figcaption>
  </figure>
</div>

İki pozu aynı dosyada iki frame olarak da tutabilirsin; o zaman `Frame > New Frame` ile kopyalayıp yalnız değişen pixel'leri düzenlersin. Ayrı dosya tutmak da geçerli: oyunda hangi pozun ne zaman görüneceği kodun kararı olacak.

## Sınırlar

Tek bir hazırlık pozu çiziyoruz. Atış anı, okun bırakılması ve karakterin geri yaylanması bu göreve girmiyor.

::: details İpucu 1 — İki poz birbirine benzemiyor
Gövdeyi yeniden çizme. Duran pozu kopyala, sonra yalnız sağ sütunlara dokun.
:::

::: details İpucu 2 — Ok ucu görünmüyor
Ok ucunu yayın soluna, elin sağına koy. Üç parça aynı satırda sırayla dizilmeli.
:::

::: details İpucu 3 — Tam yerleşim
Yay 8. sütunda 2–7. satırlar. El 6. sütunda 5. satır, ok ucu 7. sütunda 5. satır. Diğer her şey 1.36 ile aynı.
:::

## Birincil kaynak

[Aseprite — Onion Skinning](https://www.aseprite.org/docs/onion-skinning/).
`RESOURCES.md` içindeki bu belge, önceki pozu soluk görerek yeni pozu üstüne kurmayı açıklar. Hangi parçanın sabit kalacağı bu dersin seçimidir.

**Kazanım:** Bir karakterin iki pozunu, kimliğini bozmadan üretebiliyorsun. Aynı yöntem yürüyüş ve saldırı pozlarında da geçerli.

**“Pixel Art 1.37 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.38 — 8×8 ok çiz](/pixel-art/38-arrow).
