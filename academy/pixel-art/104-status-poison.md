---
title: "1.104 — Zehri karakterin üstünde göster"
description: "Bir durum etkisini ikon şeridinden çıkar, karakterin kendisine taşı."
section: Idle oyun · durum etkileri
---

# {{ $frontmatter.title }}

**Hedef:** Bir karakterin zehirli olduğunu, ona bakarak anlaşılır yap.

**Önce şu teknik:** [1.15 — Sandığı iki frame ile aç](/pixel-art/15-chest-open) — Sabit parça karakter, hareketli parça durumun kendisi.

## Görev

1.30'daki warrior'ın üç karesini üret. Birincide karakter normal renklerinde ve başının üstünde tek bir `#7dbd72` damla var. İkincide karakterin gövde renkleri yeşil rampaya döner (`#7dbd72`, `#add1a2`, `#3b6149`) ve damla başa değer. Üçüncüde karakter normale döner, iki yanında iki küçük kabarcık yükselir. Frame süreleri 500, 150 ve 350 ms olsun. `art/fx/status-poison.aseprite` olarak üç frame kaydet.

## Ne zaman bitti?

- Üç karede de karakterin silüeti birebir aynı.
- Yeşil kare yalnız bir kare sürüyor; döngünün çoğunda karakter normal renginde.
- Damla ve kabarcıklar siluetin dışında; karakterin üstünü kapatmıyor.
- Üç kare döngüde oynatıldığında düzenli bir tik ritmi okunuyor.

## Bilmen gereken küçük parça

1.57'de üç durum ikonu çizdin. O ikonlar bir listede işe yarar — ama savaşta oyuncu listeye bakmaz, **karaktere** bakar. Durum etkisi karakterin üstünde görünmezse oyuncu canının neden eridiğini anlamaz.

Bunu karakteri yeniden çizerek yapmazsın. İki araç yeter: **palet değişimi** ve **dışarıdan bir işaret.** Palet değişimi siluetin rengini bir rampadan diğerine alır; işaret ise siluetin dışında durur ve hangi durum olduğunu söyler.

<PixelAnimation title="Zehir tiki" :frames='[{"src":"/pixel-art/status/poison-1.svg","label":"Bekleme","duration":500,"alt":"Warrior normal renklerinde; başının üstünde tek bir yeşil damla."},{"src":"/pixel-art/status/poison-2.svg","label":"Tik","duration":150,"alt":"Warrior yeşil rampaya dönmüş; damla başa değiyor."},{"src":"/pixel-art/status/poison-3.svg","label":"Sönüm","duration":350,"alt":"Warrior normal renklerine dönmüş; iki yanında yükselen küçük kabarcıklar."}]' />

Ritim burada bilginin kendisi. Zehir sürekli değil **periyodik** hasar verir; döngünün yalnız bir karesinde yeşile dönmek bunu anlatır. Karakter sürekli yeşil dursaydı oyuncu bunu bir renk değil bir kostüm sanırdı ve hasarın ne zaman geldiğini göremezdi.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/status/poison-row.svg" width="416" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Zehir döngüsünün üç karesi yan yana: damla, yeşil tik ve yükselen kabarcıklar." /></div>
    <figcaption><strong>Üç kare yan yana</strong><br />Silüet üç kez aynı; değişen şey palet ve siluetin dışındaki birkaç pixel.</figcaption>
  </figure>
</div>

Yeşil rampanın üç renkten oluşması da önemli. Bütün siluetı tek yeşile boyarsan 1.64'teki hasar flash'ıyla karışır — o da tek renktir. Üç basamaklı bir rampa karakterin hacmini korur; oyuncu yine warrior'a baktığını bilir, ama zehirli bir warrior'a.

## Sınırlar

Tek durum ve üç kare. Hasar sayısı, kalan süre ve aynı anda birden çok durum bu göreve girmiyor.

::: details İpucu 1 — Karakter zehirli değil de yeşil bir karakter gibi duruyor
Yeşil kare fazla uzun sürüyor. Tik karesi döngünün en kısa karesi olmalı; geri kalan zamanda karakter kendi renklerinde kalsın.
:::

::: details İpucu 2 — Damla karakteri bozuyor
İşareti siluetin içine koymuşsun. Damla ve kabarcıklar siluetin dışında, boş pixel'lerde durmalı; durum etkisi karakteri değil, çevresini kullanır.
:::

::: details İpucu 3 — Tam yerleşim
Damla 1. satırda 4. sütun; tik karesinde 1. ve 2. satırlarda 4. sütun. Kabarcıklar 3. satırda 2. sütun ve 4. satırda 7. sütun. Gövde rengi tik karesinde `#7dbd72`, yüz `#add1a2`, bacaklar `#3b6149` olur; siluetin hiçbir pixel'i eklenmez veya silinmez.
:::

## Birincil kaynak

[Aseprite — Replace Color](https://www.aseprite.org/docs/replace-color/).
`RESOURCES.md` içindeki bu belge, bütün renkleri tek adımda değiştirmeyi açıklar; karakterin paletini zehir rampasına almak için kullanıldı. Tik karesinin döngünün en kısa karesi olması bu dersin seçimidir.

**Kazanım:** Bir durum etkisini karakterin üstünde, ritmiyle birlikte gösterebiliyorsun.

**“Pixel Art 1.104 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.105 — Yanma, donma ve stun'ı ayır](/pixel-art/105-status-burn-freeze).
