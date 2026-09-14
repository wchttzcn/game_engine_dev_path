---
title: "1.24 — Mage'in büyü yapma pozunu çiz"
description: "Kolu kaldırıp elde ışık toplayarak büyünün başladığı anı göster."
section: Idle oyun · mage
---

# {{ $frontmatter.title }}

**Hedef:** Büyünün nereden çıkacağını, daha efekti çizmeden belli et.

**Önce şu teknik:** [1.18 — Hazırlık karesiyle ağırlık ver](/pixel-art/18-chest-weight) — Büyü yapmadan önceki hazırlık, kapağın bastırılmasıyla aynı fikir.

## Görev

1.22'deki mage'i yeni bir 8×8 dosyaya kopyala. Sağ üst köşeye doğru uzanan bir kol ekle ve elin ucunda `#9de7f5` renginde tek bir ışık pixel'i bırak. `art/characters/mage-cast.aseprite` olarak kaydet.

## Ne zaman bitti?

- Şapka, yüz, cübbe ve ayaklar duran pozdaki yerinde kalmış.
- Kol gövdeden yukarı sağa doğru uzanıyor; ucunda tek bir açık pixel var.
- Işık rengi 1.25'te kullanacağın büyü rengiyle aynı; kaynak 8×8.

## Bilmen gereken küçük parça

Warrior'ın kılıcı, archer'ın yayı var; mage'in ise elinden başka bir şeyi yok. Bu yüzden büyünün nereden çıktığını **pozun kendisi söylemek zorunda.**

İki işaret yeterli: yukarı uzanan bir kol ve ucunda toplanan ışık. Kol yönü efektin gideceği yönü, ışık ise efektin çıkış noktasını kurar. Işığın rengi şimdiden büyünün rengi olmalı; oyuncu daha efekt çıkmadan neyin geleceğini anlar.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/fx/mage-base.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="1.22'deki duran mage." /></div>
    <figcaption><strong>1 · Duran poz</strong><br />1.22'deki mage'i aynen kopyala. Gövdeye hiç dokunmayacağız.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/fx/mage-diff.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Değişecek iki pixel turkuaz işaretli mage." /></div>
    <figcaption><strong>2 · Değişecek yerler</strong><br />Yalnız iki pixel eklenecek: elin yeri ve ışığın yeri.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/fx/mage-cast.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Kolunu kaldırmış, elinde camgöbeği ışık toplanan mage." /></div>
    <figcaption><strong>3 · Büyü pozu</strong><br />Şapkanın sağına eli, onun da sağ üstüne ışığı koy. Çapraz yön okunur.</figcaption>
  </figure>
</div>

Bu poz büyünün **hazırlık** karesi; 1.18'de sandığın kapağını bastırdığın kareyle aynı işi görür. 1.41'de bu pozu büyü atışıyla aynı zaman çizgisine koyacağız ve mage'in ne zaman duruşuna döneceğine karar vereceğiz.

## Sınırlar

Tek kare ve iki pixel'lik değişiklik. Asa çizmek, cübbenin dalgalanması ve efektin kendisi bu göreve girmiyor.

::: details İpucu 1 — Kol gövdeye karışıyor
El için ten rengini kullan; cübbe rengiyle çizersen kol kaybolur.
:::

::: details İpucu 2 — Işık nereye gelmeli?
Elin bir pixel sağ üstüne. Aynı hizaya koyarsan el ile ışık tek bir parça gibi okunur.
:::

::: details İpucu 3 — Tam yerleşim
El 6. sütunda 2. satır, ışık 7. sütunda 1. satır. Geri kalan her şey 1.22 ile birebir aynı.
:::

## Birincil kaynak

[Aseprite — Onion Skinning](https://www.aseprite.org/docs/onion-skinning/).
`RESOURCES.md` içindeki bu belge, önceki pozu soluk görerek yeni pozu üstüne kurmayı açıklar. Kolun yönü ve ışığın yeri bu dersin seçimidir.

**Kazanım:** Mage artık bir şey yapıyor. Efekt çizilmeden önce büyünün nereden çıkacağı belli.

**“Pixel Art 1.24 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.25 — Mage için büyü atışı çiz](/pixel-art/25-mage-bolt).
