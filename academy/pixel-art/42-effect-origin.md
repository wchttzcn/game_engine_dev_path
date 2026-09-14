---
title: "1.42 — Efekt karakterin neresinden çıkar?"
description: "Her karakterin efekt çıkış noktasını bulup efekti oraya hizala."
section: Idle oyun · skilleri bağla
---

# {{ $frontmatter.title }}

**Hedef:** Bir efektin karakterin neresinden çıkacağını karaktere bakarak belirle.

**Önce şu teknik:** [1.10 — Kenarlığın farkını gör](/pixel-art/10-outline) — Efekt ile karakter birbirine karışmasın diye ayrım şart.

## Görev

Dört karakterini yan yana koy ve her biri için efektin çıkacağı tek pixel'i işaretle. Sonra 16×8 bir dosyada mage'i ve büyüsünü iki kez çiz: birinde büyü yanlış hizada, birinde doğru hizada. `art/craft/effect-origin.aseprite` olarak kaydet.

## Ne zaman bitti?

- Dört karakterin de çıkış noktası işaretlenmiş ve gerekçesi söylenebiliyor.
- Yanlış ve doğru hizalama aynı dosyada karşılaştırılabiliyor.
- Doğru örnekte efektin merkezi, çıkış noktasıyla aynı satırda.

## Bilmen gereken küçük parça

Şimdiye kadar karakterleri ve efektleri **ayrı ayrı** çizdik. Oyunda ikisi aynı ekranda olacak ve o an tek bir soru önemli: efekt karakterin neresinden çıkıyor?

Cevap karakterin kendisinde yazılı. Mage elini kaldırır, efekt elden çıkar. Warrior kılıcını savurur, iz kılıcın geçtiği yerde belirir. Priest'in asası vardır, ışık asanın ucundan yükselir. Archer'ın yayı vardır, ok yaydan ayrılır. **Çıkış noktasını efekt değil, karakter belirler.**

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/origin-four.svg" width="256" height="64" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Dört karakter; her birinin efekt çıkış noktası turkuaz işaretli." /></div>
    <figcaption><strong>1 · Dört çıkış noktası</strong><br />Soldan sağa: mage'in eli, warrior'ın kılıç tarafı, priest'in asa ucu, archer'ın yayı.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/origin-wrong.svg" width="192" height="96" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Duran mage ve ayak hizasından çıkan büyü." /></div>
    <figcaption><strong>2 · Yanlış hiza</strong><br />Büyü ayak hizasından çıkıyor. Karakter büyüyü yapmıyor, büyü yanından geçiyor.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/origin-right.svg" width="192" height="96" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Kolunu kaldırmış mage ve el hizasından çıkan büyü." /></div>
    <figcaption><strong>3 · Doğru hiza</strong><br />Büyü elin hizasından çıkıyor. Aynı iki sprite, tek fark yükseklik.</figcaption>
  </figure>
</div>

Hizalama iki sayıdan ibaret: efektin karakterin kaç pixel sağında ve hangi satırda duracağı. Bu iki sayıyı şimdi çizerek bulmak, sonra oyunda deneme yanılmayla aramaktan çok daha hızlı. Çizimlerinin yanına bu sayıyı not etmen yeterli; oyun tarafında aynı değerler kullanılacak.

## Sınırlar

Yalnız hizalama. Efektin kod tarafında nasıl konumlandırılacağı, çarpışma ve ölçek bu göreve girmiyor.

::: details İpucu 1 — Karakter efekti yapmıyor gibi duruyor
Efektin merkezi ile karakterin çıkış noktası aynı satırda mı? Bir pixel'lik kayma bile bağı koparır.
:::

::: details İpucu 2 — Warrior'ın çıkış noktası nerede?
Kılıcını savurduğu taraf. 1.31'deki iz hangi tarafta belirdiyse çıkış noktası orasıdır.
:::

::: details İpucu 3 — İki sprite üst üste binmiş
Efekti karakterden en az bir pixel uzağa koy. Değme anı ayrı bir karenin işi.
:::

## Birincil kaynak

[Aseprite — Layers](https://www.aseprite.org/docs/layers/).
`RESOURCES.md` içindeki bu belge, iki çizimi ayrı katmanlarda üst üste görmeyi açıklar; [Move Tool](https://www.aseprite.org/docs/move-tool/) seçili içeriği taşımak içindir. Dört çıkış noktasının seçimi bu dersin kararıdır.

**Kazanım:** Karakter ile efekti aynı ekranda birbirine bağlayan ilk kuralı biliyorsun: hiza.

**“Pixel Art 1.42 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.43 — Mage'i ve büyüsünü aynı zaman çizgisine koy](/pixel-art/43-combine).
