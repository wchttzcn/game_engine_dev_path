---
title: "1.70 — Çarpan rozetini çiz"
description: "Yükseltmenin ne kadar güçlendirdiğini tek rozetle söyle."
section: Idle oyun · ilerleme
---

# {{ $frontmatter.title }}

**Hedef:** Bir yükseltmenin etkisini rakamla ve rozetle göster.

**Önce şu teknik:** [1.20 — 9-slice çerçeve kur](/pixel-art/20-nine-slice) — Rozet ve kart, köşeleri bozulmadan büyüyen çerçevelerdir.

## Görev

17×11 bir rozet çiz: altın çerçeve, koyu iç alan ve 1.21–1.22'deki setle `X2` yazısı. Sonra 60×16 bir yükseltme kartı kur: solda eşya slotu, ortada rozet, sağda coin ve fiyat. `art/idle-ui/upgrade.aseprite` olarak kaydet.

## Ne zaman bitti?

- Rozetin çerçevesi altın, içi koyu; yazı çerçeveye değmiyor.
- Kart üç bölgeye ayrılmış: ikon, çarpan, fiyat.
- Yazılar 1.21 ve 1.22'deki setlerden; kaynak kaydedilmiş.

## Bilmen gereken küçük parça

Idle oyunun ana yükseltmesi çarpandır: üretimi iki katına, üç katına çıkaran bir satın alma. Maliyetler üstel büyüdüğü için oyuncu sürekli **ne kadar güçleneceğini** bilmek ister.

Rozet bu soruyu tek bakışta cevaplar. Altın çerçeve değeri, koyu iç alan okunurluğu, rakam ise miktarı taşır. Kart ise rozeti bağlama oturtur: **ne yükseliyor, ne kadar, kaça.** Üç bilgi, soldan sağa okunan üç bölge.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/mult-badge.svg" width="204" height="132" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Altın çerçeveli, içinde X2 yazan rozet." /></div>
    <figcaption><strong>1 · Rozet</strong><br />Altın çerçeve, koyu iç alan, açık renk yazı. Yazı kenardan iki pixel içeride.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/upgrade-card.svg" width="480" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Eşya slotu, X2 rozeti, coin ve 150 fiyatı olan kart." /></div>
    <figcaption><strong>2 · Kart</strong><br />Soldan sağa: ne yükseliyor, ne kadar, kaça. Üç bölge eşit aralıklı.</figcaption>
  </figure>
</div>

Aynı rozet `X5`, `X10` veya `X100` için de çalışır; yazı uzadıkça rozeti genişlet, çerçeveyi değil. Rozetin altın olması onu ekrandaki diğer çerçevelerden ayırır — tier renkleri eşyanın değerini, altın rozet ise **kazancı** anlatır.

## Sınırlar

Tek rozet ve tek kart. Basılı hâl, satın alınamaz durum ve liste hâlinde birden çok kart bu göreve girmiyor.

::: details İpucu 1 — Yazı çerçeveye değiyor
İç alanı büyüt. Yazı ile çerçeve arasında en az iki pixel kalmalı.
:::

::: details İpucu 2 — Rozet tier çerçevelerine benziyor
Tier çerçeveleri ince ve renkli; rozet dolu ve altın. Karışıyorsa iç alanı koyulaştır.
:::

::: details İpucu 3 — Tam yerleşim
Rozet 17×11; yazı 4. sütun ve 4. satırdan başlar. Kartta slot 3. sütunda, rozet 18. sütunda, coin 38. sütunda.
:::

## Birincil kaynak

[Aseprite — Slices](https://www.aseprite.org/docs/slices/).
`RESOURCES.md` içindeki bu belge, 9-slice ile çerçeveyi istediğin boyda kurmayı açıklar. Rozetin ölçüleri ve kartın üç bölgeli düzeni bu dersin seçimidir.

**Kazanım:** Bir yükseltmenin ne yaptığını ve neye mal olduğunu tek kartta gösterebiliyorsun.

**“Pixel Art 1.70 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.71 — AUTO anahtarını çiz](/pixel-art/71-auto-toggle).
