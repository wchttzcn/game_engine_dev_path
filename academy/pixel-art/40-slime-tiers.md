---
title: "1.40 — Tek slime'dan üç tier üret"
description: "Aynı çizimi yeniden çizmeden renk seti değiştirerek güç seviyesi anlat."
section: Monster kadrosu
---

# {{ $frontmatter.title }}

**Hedef:** Yeni bir düşman çıkarmak için yeni bir çizime ihtiyaç olmadığını gör.

## Görev

1.24'teki slime'ı üç ayrı 8×8 dosya olarak çoğalt. Gövde rengini sırayla `#7dbd72`, `#92afc3` ve `#aa83bf` yap; göz rengine dokunma. `art/monsters/` altına `slime-green`, `slime-blue` ve `slime-purple` adlarıyla kaydet.

## Ne zaman bitti?

- Üç dosyada da siluet birebir aynı.
- Yalnız gövde rengi değişmiş; göz her üçünde de koyu kalmış.
- Üç kaynak da 8×8 ve ayrı ayrı kaydedilmiş.

## Bilmen gereken küçük parça

Idle oyun ilerledikçe düşman güçlenir. Her güç seviyesi için yeni bir canavar çizmek, küçük bir projeyi hızla tıkar. **Palette swap** bu yüzden var: aynı çizim, farklı renk seti.

Renk sırası da bir bilgi taşır. Yeşil sıradan, mavi daha iyi, mor nadir; bu sıra oyunlarda yaygın olduğu için oyuncu öğretmeden anlar. Gözün koyu kalması ise kimliği korur: üçü de aynı türden.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/monsters/slime-green.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Yeşil gövdeli slime." /></div>
    <figcaption><strong>1 · Sıradan</strong><br />Temel renk. İlk bölgede karşılaşılan slime bu.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/monsters/slime-blue.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Mavi gövdeli slime." /></div>
    <figcaption><strong>2 · Güçlü</strong><br />Yalnız gövde rengi değişti. Şekle hiç dokunulmadı.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/monsters/slime-purple.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Mor gövdeli slime." /></div>
    <figcaption><strong>3 · Nadir</strong><br />Aynı sprite üçüncü kez. Üçü yan yana bir kadro gibi okunur.</figcaption>
  </figure>
</div>

`Edit > Replace Color` ile gövde rengini tek adımda değiştirebilirsin; `From` alanına eski rengi, `To` alanına yenisini koy. Aynı üç rengi 1.46'daki eşya tier çerçevelerinde de kullanacağız; böylece monster'ın gücü ile eşyanın değeri aynı dili konuşur.

## Sınırlar

Yalnız gövde rengi değişiyor. Yeni şekiller, boyut farkı ve farklı göz düzeni bu göreve girmiyor.

::: details İpucu 1 — Üç slime birbirinden ayırt edilemiyor
Renkler birbirine çok yakın olabilir. Farklı bir renk ailesi seç, aynı rengin tonunu değil.
:::

::: details İpucu 2 — Göz de değişti
Replace Color bütün frame'e uygulanmış olabilir. Önce gövdeyi seç, sonra değiştir.
:::

::: details İpucu 3 — Tam yerleşim
Siluet 1.24 ile birebir aynı; göz 3. satırda 2. ve 7. sütunlarda koyu kalır.
:::

## Birincil kaynak

[Aseprite — Replace Color](https://www.aseprite.org/docs/replace-color/).
`RESOURCES.md` içindeki bu belge, From ve To alanlarıyla renk değiştirmeyi açıklar; [Color Bar](https://www.aseprite.org/docs/color-bar/) renk seçimi içindir. Tier renk sırası bu dersin seçimidir.

**Kazanım:** Bir çizimden kaç düşman çıkarabileceğini gördün. Kadro büyütmek artık çizim işi değil, karar işi.

**“Pixel Art 1.40 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.41 — İki frame'lik bat çiz](/pixel-art/41-bat).
