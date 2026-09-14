---
title: "1.34 — Priest'in dua pozunu çiz"
description: "Asayı kaldırıp ucunda ışık toplayarak iyileştirmenin başladığı anı göster."
section: Idle oyun · priest
---

# {{ $frontmatter.title }}

**Hedef:** İyileştirmenin nereden çıkacağını, daha efekti çizmeden belli et.

**Önce şu teknik:** [1.18 — Hazırlık karesiyle ağırlık ver](/pixel-art/18-chest-weight) — Asayı kaldırmak, kapağı bastırmakla aynı hazırlık.

## Görev

1.33'teki priest'i yeni bir 8×8 dosyaya kopyala. Asayı bir pixel yukarı taşı ve ucuna `#b7efd0` renginde tek bir ışık pixel'i koy. `art/characters/priest-cast.aseprite` olarak kaydet.

## Ne zaman bitti?

- Başlık, yüz, cübbe ve ayaklar duran pozdaki yerinde kalmış.
- Asa duran pozdan bir pixel yukarıda; ucunda tek bir açık pixel var.
- Işık rengi 1.35'te kullanacağın iyileştirme rengiyle aynı; kaynak 8×8.

## Bilmen gereken küçük parça

Mage elini kaldırır, warrior kılıcını geri çeker, archer yayını gerer. Priest'in hazırlığı ise **asasında** olur: asa yükselir, ucunda ışık toplanır.

İki işaret yeterli ve ikisi de tek pixel. Asanın yükselmesi hareketi, ucundaki ışık ise efektin çıkış noktasını kurar. Işığın rengi şimdiden iyileştirmenin rengi olmalı; oyuncu daha parıltı çıkmadan neyin geleceğini anlar.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/fx/priest-base.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="1.33'teki duran priest." /></div>
    <figcaption><strong>1 · Duran poz</strong><br />1.33'teki priest'i aynen kopyala. Cübbeye hiç dokunmayacağız.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/fx/priest-diff.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Değişecek pixel'ler turkuaz işaretli priest." /></div>
    <figcaption><strong>2 · Değişecek yerler</strong><br />Yalnız asanın ucu taşınıyor ve bir ışık pixel'i ekleniyor.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/fx/priest-cast.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Asasını kaldırmış, ucunda mint ışık beliren priest." /></div>
    <figcaption><strong>3 · Dua pozu</strong><br />Asa bir pixel yukarı; en üst köşeye ışığı koy.</figcaption>
  </figure>
</div>

Bu poz iyileştirmenin **hazırlık** karesi; 1.18'de sandığın kapağını bastırdığın kareyle aynı işi görür. 1.45'te bu pozu parıltıyla aynı zaman çizgisine koyacağız.

## Sınırlar

Tek kare ve iki pixel'lik değişiklik. Cübbenin dalgalanması, ikinci bir kol ve efektin kendisi bu göreve girmiyor.

::: details İpucu 1 — Asa aynı yerde duruyor gibi
Asanın ucunu bir satır yukarı taşı ve eski yerini boşalt; iki satırda birden görünmemeli.
:::

::: details İpucu 2 — Işık asaya karışıyor
Işık için asadan çok daha açık bir renk seç; kahverengi üstüne kahverengi kaybolur.
:::

::: details İpucu 3 — Tam yerleşim
Asanın ucu 7. sütunda 1. satır, ışık 8. sütunda 1. satır. Geri kalan her şey 1.33 ile aynı.
:::

## Birincil kaynak

[Aseprite — Onion Skinning](https://www.aseprite.org/docs/onion-skinning/).
`RESOURCES.md` içindeki bu belge, önceki pozu soluk görerek yeni pozu üstüne kurmayı açıklar. Asanın yönü ve ışığın yeri bu dersin seçimidir.

**Kazanım:** Dört karakterin dördünün de bir hazırlık pozu var. Her biri efekti kendi aracıyla başlatıyor.

**“Pixel Art 1.34 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.35 — Priest için iyileştirme çiz](/pixel-art/35-priest-heal).
