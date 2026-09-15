---
title: "1.56 — Bir silahtan üç silah çıkar"
description: "Aynı sapa farklı başlar takarak bir ikon ailesi kur."
section: Idle oyun · eşya ve monster
---

# {{ $frontmatter.title }}

**Hedef:** Tek bir kalıptan birden çok eşya ikonu üret.

**Önce şu teknik:** [1.9 — Silüet testi yap](/pixel-art/09-silhouette-test) — Ailenin üç üyesi silüette ayrılmazsa aile olmaz.

## Görev

8×8 transparent RGB dosyada üç frame kur: kılıç, balta ve mızrak. Üçünde de sap aynı yerde ve aynı renkte (`#9b6b43`) kalsın; yalnız üstteki baş değişsin. `art/idle-items/weapons.aseprite` olarak kaydet.

## Ne zaman bitti?

- Üç silahta da sap aynı sütunda ve aynı yükseklikte.
- Üç baş birbirinden tek bakışta ayırt ediliyor.
- Üçü de aynı canvas'ta, kaynak 8×8 ve kaydedilmiş.

## Bilmen gereken küçük parça

Bir envanter on iki ikonla dolmaz. Ama her yeni eşya için sıfırdan çizmek de sürdürülebilir değil. Çözüm **aile kurmak:** ortak bir gövde seç, yalnız ayırt edici parçayı değiştir.

Silahlarda ortak gövde saptır. Kılıcın ağzı dik ve dar, baltanın başı yana taşan bir kama, mızrağın ucu yaprak biçiminde. Üçü aynı sapa oturduğu için yan yana konduklarında **aynı oyuna ait** görünürler — bu, ayrı ayrı güzel üç ikondan daha değerlidir.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/objects/sword-family-1.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Ağzı, balçağı ve sapı olan kılıç." /></div>
    <figcaption><strong>1 · Kılıç</strong><br />Dik ve dar ağız, geniş balçak, iki pixel'lik sap.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/objects/axe.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Aynı sapa oturan balta başı." /></div>
    <figcaption><strong>2 · Balta</strong><br />Sap yerinde kalır. Başı yalnız bir yana taşır; kama biçimi ağırlığı anlatır.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/weapon-family.svg" width="192" height="64" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Kılıç, balta ve mızrak yan yana." /></div>
    <figcaption><strong>3 · Aile</strong><br />Mızrağın ucu yaprak gibi. Üçü yan yana aynı setin parçası gibi durur.</figcaption>
  </figure>
</div>

Aynı yöntem zırhta da çalışır: ortak omuz hattı, değişen yaka. İksirde ortak şişe, değişen sıvı rengi. Bir aile kurduğunda envanteri büyütmek çizim işi olmaktan çıkıp karar işine döner.

## Sınırlar

Üç silah ve tek ortak sap. Hasar değerleri, nadirlik ve ikinci bir aile bu göreve girmiyor.

::: details İpucu 1 — Üç silah birbirine benziyor
Başlar yeterince farklı değil. Biri dik, biri yana taşan, biri sivri olmalı.
:::

::: details İpucu 2 — Aile gibi durmuyorlar
Sap üçünde de aynı sütunda ve aynı renkte mi? Ortak parça kaymışsa bağ kopar.
:::

::: details İpucu 3 — Tam yerleşim
Sap üçünde de 4–5. sütunlarda, 6–7. satırlarda. Baş 1–5. satırlarda değişir.
:::

## Birincil kaynak

[Aseprite — Drawing](https://www.aseprite.org/docs/drawing/).
`RESOURCES.md` içindeki bu belge, küçük şekilleri pixel ve çizgi araçlarıyla kurmayı açıklar. Aile kalıbı ve üç baş biçimi bu dersin seçimidir.

**Kazanım:** Envanteri büyütmenin ucuz yolunu biliyorsun: kalıbı koru, ayırt edici parçayı değiştir.

**“Pixel Art 1.56 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.57 — Durum etkisi ikonlarını çiz](/pixel-art/57-status-icons).
