---
title: "1.59 — Eşya slotuna tier rengi ver"
description: "Slot kenarının rengiyle eşyanın değerini anlat."
section: Idle oyun · UI
---

# {{ $frontmatter.title }}

**Hedef:** Tek bir çerçeveden dört farklı değer seviyesi üret.

**Önce şu teknik:** [1.11 — Üç value ile ayır](/pixel-art/11-value) — Değer seviyesini renk taşır.

## Görev

1.58'deki 12×12 eşya slotunu dört kez çoğalt. Kenar rengini sırayla `#637980`, `#8ac982`, `#92afc3` ve `#aa83bf` yap; iç alan ve ikon aynı kalsın. `art/idle-ui/tier-frames.aseprite` olarak dört frame kaydet.

## Ne zaman bitti?

- Dört slotta da çerçeve kalınlığı ve iç alan aynı.
- Yalnız kenar rengi değişmiş; ikon hiç değişmemiş.
- Renk sırası 1.49'daki monster tier'larıyla aynı aileden; kaynak 12×12.

## Bilmen gereken küçük parça

Envanterde onlarca eşya olur. Her birinin ne kadar değerli olduğunu yazıyla anlatmak yer kaplar. Bunun yerine **çerçevenin rengi** bilgiyi taşır.

1.49'da slime'ları yeşil, mavi ve mora boyadık. Aynı sırayı burada kullanmak oyuna tek bir dil kazandırır: mor bir çerçeve ile mor bir slime aynı şeyi söyler. Aynı renk sistemini iki yerde kullanmak, ayrı ayrı güzel iki sistemden daha iyidir.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/tier-common.svg" width="144" height="144" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Gri çerçeveli eşya slotu." /></div>
    <figcaption><strong>1 · Sıradan</strong><br />Temel çerçeve rengi. Başlangıç eşyaları burada durur.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/tier-uncommon.svg" width="144" height="144" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Yeşil çerçeveli eşya slotu." /></div>
    <figcaption><strong>2 · İyi</strong><br />Yalnız kenar rengi değişti. İkon ve iç alan aynı.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/tier-rare.svg" width="144" height="144" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Mavi çerçeveli eşya slotu." /></div>
    <figcaption><strong>3 · Nadir</strong><br />Üçüncü renk. Sıra oyuncunun alışkın olduğu sırayı izler.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/tier-epic.svg" width="144" height="144" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Mor çerçeveli eşya slotu." /></div>
    <figcaption><strong>4 · Çok nadir</strong><br />Son basamak. Mor, monster tier'larındaki morla aynı.</figcaption>
  </figure>
</div>

`Edit > Replace Color` ile kenar rengini tek adımda değiştirebilirsin. Dört durumu ayrı frame'lerde tutmak, 1.64'teki kit'e girerken işini kolaylaştırır: aynı ölçüdeki dört çerçeve tek grup olur.

## Sınırlar

Yalnız kenar rengi değişiyor. Parlama, animasyonlu çerçeve, yazı ve ikinci bir kenar bu göreve girmiyor.

::: details İpucu 1 — Renkler ikonun önüne geçiyor
Kenar tek pixel kalsın. Kalın çerçeve, içindeki eşyayı ezer.
:::

::: details İpucu 2 — Sıra karışık duruyor
Griden mora doğru açıktan koyuya değil, sıradandan nadire doğru git. Sıra 1.49 ile aynı olmalı.
:::

::: details İpucu 3 — Tam yerleşim
Çerçeve 1. ve 12. sütun ile 1. ve 12. satırlarda. İç alan ve ikon 1.58'deki gibi kalır.
:::

## Birincil kaynak

[Aseprite — Replace Color](https://www.aseprite.org/docs/replace-color/).
`RESOURCES.md` içindeki bu belge, seçilen alanda veya bütün frame'lerde renk değiştirmeyi açıklar. Tier sırası ve renk eşleşmesi bu dersin seçimidir.

**Kazanım:** Oyunun tamamında geçerli tek bir değer dili kurdun: monster'da da eşyada da aynı renk aynı şeyi söylüyor.

**“Pixel Art 1.59 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.60 — Kilitli slot ve artı düğmesi çiz](/pixel-art/60-slot-states).
