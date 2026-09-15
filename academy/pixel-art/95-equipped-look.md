---
title: "1.95 — Kuşanınca karakter değişsin"
description: "Bir eşyayı kuşanmanın karşılığını, sprite'ın birkaç pixel'ini değiştirerek göster."
section: Idle oyun · stat ve ekipman
---

# {{ $frontmatter.title }}

**Hedef:** Kuşanılan eşyayı, siluetini bozmadan sprite üzerinde görünür kıl.

**Önce şu teknik:** [1.12 — Kendi renk rampanı kur](/pixel-art/12-color-ramp) — Orada bir renkten yeni tonlar türettin; burada var olan sprite'a yeni bir aksan rengi ekliyorsun.

## Görev

1.30'daki warrior'ın üç hâlini üret: kuşanmamış, epic kılıçlı (yalnız kılıç pixel'leri altın), zırhlı (yalnız miğfer ve göğüs pixel'leri açık mavi). Üçünde de siluet birebir aynı kalsın. `art/characters/warrior-gear.aseprite` olarak üç frame kaydet.

## Ne zaman bitti?

- Kuşanmamış, kılıçlı ve zırhlı üç frame de aynı siluete sahip; hiçbir pixel eklenmemiş veya çıkarılmamış.
- Kılıçlı frame'de yalnız kılıç pixel'leri `#e3ab52`.
- Zırhlı frame'de yalnız miğfer ve göğüs pixel'leri `#9de7f5`.
- Diğer bütün pixel'ler üç frame'de de birebir aynı renkte.
- Üç frame `art/characters/warrior-gear.aseprite` içinde kaydedilmiş.

## Bilmen gereken küçük parça

Bir eşyayı kuşanmanın oyundaki karşılığı bir sayının artmasıdır; **oyuncunun gördüğü** karşılığı ise sprite'ın değişmesidir. Sayı arttı diye ekranda hiçbir şey değişmezse, oyuncu kuşandığını unutur.

8×8'de yeni bir karakter çizmezsin — varolan sprite'ın birkaç pixel'ini başka bir renge alırsın. Epic kılıç demek, kılıç pixel'lerinin `#e3ab52`'ye dönmesi demek; zırh demek, miğfer ve göğüs pixel'lerinin `#9de7f5`'e dönmesi demek. Silüet aynı kalır, kimlik korunur, yine de fark bir bakışta görülür.

<PixelAnimation title="Warrior — üç kuşanım hâli" :frames='[{"src":"/pixel-art/equip/hero-plain.svg","label":"Kuşanmamış","duration":320,"alt":"Warrior temel renklerde, kılıç ve zırh sade."},{"src":"/pixel-art/equip/hero-sword.svg","label":"Epic kılıç","duration":320,"alt":"Aynı warrior, yalnız kılıç pixel\u2019leri altın renginde."},{"src":"/pixel-art/equip/hero-armor.svg","label":"Zırhlı","duration":320,"alt":"Aynı warrior, yalnız miğfer ve göğüs pixel\u2019leri açık mavi."}]' />

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/equip/hero-row.svg" width="416" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Üç warrior yan yana: kuşanmamış, epic kılıçlı, zırhlı." /></div>
    <figcaption><strong>Üç hâl yan yana</strong><br />Aynı siluet, üç farklı aksan rengi. Kural: değişen pixel sayısı az, değişen renk farkı büyük olsun.</figcaption>
  </figure>
</div>

Kural budur: değişen pixel sayısı az, değişen renk farkı büyük olsun. Birkaç pixel değişince fark görünmezse renk yetersiz demektir; çok pixel değişince siluet bozulursa eşya değil karakter değişmiş demektir. İkisinin arasındaki dar bant, kuşanımın doğru hissettirdiği yerdir.

## Sınırlar

Yalnız warrior'ın üç hâli bu görevde. Diğer üç karakter, ikinci silah tier'ı ve zırh parçalarının ayrı ayrı gösterilmesi bu göreve girmiyor.

::: details İpucu 1 — Hangi pixel'in silaha, hangisinin gövdeye ait olduğu belirsiz
Kuşanmamış frame'i referans al. Kılıcı ayakta tutan pixel'lerle gövdeyi oluşturan pixel'ler arasında net bir sınır çiz; sınırın neresi olduğuna kuşanmamış hâlde karar ver.
:::

::: details İpucu 2 — Renk değişince siluet de değişiyormuş gibi görünüyor
Yeni rengi (`#e3ab52` veya `#9de7f5`) mevcut palete yakın bir value'da tut. Çok parlak bir renk, aynı pixel'ler olsa bile gözde yeni bir şekil hissi verir.
:::

::: details İpucu 3 — Tam yerleşim
Kılıç warrior'ın sağ elinde, gövdenin sağ kenarına yakın 1–2 pixel'lik dar bir bölge; yalnız o pixel'ler `#e3ab52`'ye döner. Miğfer baş bölgesinde üst 1–2 satır, göğüs gövdenin üst-orta satırlarında; ikisi birlikte `#9de7f5`'e döner. Bacaklar, kabza ve arka plan üç frame'de de değişmez.
:::

## Birincil kaynak

[Aseprite — Color Bar](https://www.aseprite.org/docs/color-bar/).
`RESOURCES.md` içindeki bu belge, foreground color seçimini ve RGB modunda palette ile çizim arasındaki ilişkiyi anlatır. Yalnız kılıç veya yalnız miğfer-göğüs pixel'lerini seçip tek bir foreground rengiyle boyamak bu dersin seçimidir.

**Kazanım:** Bir eşyanın kuşanıldığını, karakterin kimliğini bozmadan sprite üzerinde gösterebiliyorsun.

**“Pixel Art 1.95 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.96 — Karakter sayfasını kur](/pixel-art/96-hero-screen).
