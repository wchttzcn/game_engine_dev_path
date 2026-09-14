---
title: "1.29 — Warrior'ın hazırlık pozunu çiz"
description: "Silahı geriye çekerek vuruşa ağırlık veren bir poz kur."
section: Idle oyun · warrior
---

# {{ $frontmatter.title }}

**Hedef:** Bir vuruşun öncesini çizerek darbenin ağır hissettirilmesini sağla.

**Önce şu teknik:** [1.18 — Hazırlık karesiyle ağırlık ver](/pixel-art/18-chest-weight) — Kılıcı geri çekmek, kapağı bastırmakla aynı hazırlık.

## Görev

1.27'deki warrior'ı yeni bir 8×8 dosyaya kopyala. Soluna geriye çekilmiş bir kılıç ekle ve gövdeyi bir pixel sağa kaydır. Kılıç ağzı için `#cfe0e8`, kabza için `#626080` kullan. `art/characters/warrior-windup.aseprite` olarak kaydet.

## Ne zaman bitti?

- Kılıç gövdenin solunda, yukarı doğru uzanıyor.
- Gövde duran poza göre bir pixel sağa kaymış; miğfer ve yüz tanınıyor.
- Kaynak 8×8 ve kaydedilmiş.

## Bilmen gereken küçük parça

Bir vuruş yalnız darbe anından ibaret değil. Oyuncu ağırlığı **darbeden önceki geri çekilmede** hisseder. Buna hazırlık denir ve tek karede bile işe yarar.

Kural basit: silah, gideceği yönün tersine çekilir. Warrior sağa vuracaksa kılıç sola gider. Gövdenin de bir pixel ters yöne kayması, bütün figürün o yöne yüklendiğini anlatır.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/fx/warrior-base.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="1.27'deki duran warrior." /></div>
    <figcaption><strong>1 · Duran poz</strong><br />1.27'deki warrior'ı aynen kopyala; miğfer, yüz ve kalkan yerinde.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/fx/warrior-sword.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Warrior'ın soluna eklenmiş dik kılıç." /></div>
    <figcaption><strong>2 · Kılıç</strong><br />Sol sütuna yukarıdan aşağı üç pixel ağız, altına bir pixel kabza koy.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/fx/warrior-wind.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Gövdesi sağa kaymış, kılıcı geride duran warrior." /></div>
    <figcaption><strong>3 · Yüklenme</strong><br />Gövdeyi bir pixel sağa taşı. Kılıç yerinde kalır; aradaki boşluk gerilimi gösterir.</figcaption>
  </figure>
</div>

Kılıcın ağzını gövdeden açık bir renkte tutmak, 8×8'de silahı zırhtan ayırmanın en kolay yolu. Bu poz tek başına da kullanılabilir; 1.31'de aynı pozu vuruş ve duruşla birleştireceğiz.

## Sınırlar

Tek bir hazırlık karesi çiziyoruz. Vuruşun kendisi, kılıç izi ve isabet bu göreve girmiyor.

::: details İpucu 1 — Poz duran pozdan farksız
Kılıcı eklemek yetmiyor; gövdeyi de ters yöne bir pixel kaydır.
:::

::: details İpucu 2 — Kılıç zırha karışıyor
Ağız için gövdeden daha açık bir renk seç. Aynı maviyi kullanırsan silah kaybolur.
:::

::: details İpucu 3 — Tam yerleşim
Kılıç ağzı 1. sütunda 1–3. satırlar, kabza 1. sütunda 4. satır. Gövde 1.27'deki hâlinin bir sütun sağa taşınmışı.
:::

## Birincil kaynak

[Aseprite — Onion Skinning](https://www.aseprite.org/docs/onion-skinning/).
`RESOURCES.md` içindeki bu belge, önceki pozu soluk görerek yeni pozu kurmayı açıklar. Hazırlık pozunun yönü ve kılıcın oranları bu dersin seçimidir.

**Kazanım:** Bir vuruşun ağırlığını, darbeyi hiç çizmeden kurabiliyorsun.

**“Pixel Art 1.29 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.30 — Warrior için kılıç izi çiz](/pixel-art/30-warrior-slash).
