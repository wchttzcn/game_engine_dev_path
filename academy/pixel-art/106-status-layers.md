---
title: "1.106 — Buff aurasını ve kalkan kabuğunu çiz"
description: "İyi durumları karakterin altına ve dışına koy; paletine hiç dokunma."
section: Idle oyun · durum etkileri
---

# {{ $frontmatter.title }}

**Hedef:** Olumlu durumları, karakteri değiştirmeden çevresine yerleştir.

**Önce şu teknik:** [1.10 — Kenarlığın farkını gör](/pixel-art/10-outline) — Kalkan kabuğu, siluetin dışına oturan bir kenarlıktır.

## Görev

Warrior'ın iki olumlu durumunu ikişer kareyle çiz. Buff: ayakların altında `#b7efd0` dar bir halka, ikinci karede halka `#8ac982` ile genişler ve iki yana kıvılcım atar. Kalkan: siluetin dışına `#cdf4fb` bir kabuk, ikinci karede kabuk seyrelir ve `#9de7f5` olur. İki durumda da karakterin kendi renkleri hiç değişmesin. `art/fx/status-buff.aseprite` olarak dört frame kaydet.

## Ne zaman bitti?

- İki durumda da karakterin gövde renkleri birebir 1.30'daki gibi.
- Aura karakterin altında, kalkan karakterin dışında; ikisi de siluetin üstüne binmiyor.
- Kalkanın ikinci karesinde kabuk seyrelmiş, tamamen kaybolmamış.
- Dört kare aynı dosyada ve ikişerli döngüler hâlinde oynuyor.

## Bilmen gereken küçük parça

Zehir, yanma ve donma karakterin **paletini** değiştiriyordu — çünkü kötü durumlar karaktere bir şey yapar. İyi durumlar öyle değil: onlar karaktere bir şey **ekler.** Bu fark doğrudan çizime yansır.

Buff aurası karakterin **altına** oturur. Sebebi basit: bir güçlenme karakterin bastığı zemini değiştirir, yüzünü değil. Aura altta durduğunda silüetle hiç yarışmaz ve yan yana duran dört karakterden hangisinin güçlendiği bir bakışta okunur.

Kalkan ise **dışına** oturur. Siluetin bir pixel dışını saran bir kabuk, koruma fikrinin en doğrudan karşılığıdır — karakterle dış dünya arasına giren bir katman. Kabuk zayıfladıkça pixel'leri teker teker düşer; bu, kalkanın canını bir sayı yazmadan gösterir.

<PixelAnimation title="Buff aurası" :frames='[{"src":"/pixel-art/status/buff-1.svg","label":"Dar halka","duration":250,"alt":"Warrior normal renklerinde; ayaklarının altında dar açık yeşil bir halka."},{"src":"/pixel-art/status/buff-2.svg","label":"Geniş halka","duration":250,"alt":"Aynı warrior; halka genişlemiş ve iki yana kıvılcım atmış."}]' />

<PixelAnimation title="Kalkan kabuğu" :frames='[{"src":"/pixel-art/status/shield-1.svg","label":"Tam kalkan","duration":300,"alt":"Warrior’ın siluetinin dışını saran kesintisiz camgöbeği kabuk."},{"src":"/pixel-art/status/shield-2.svg","label":"Zayıflamış","duration":300,"alt":"Aynı kabuk seyrelmiş; pixel’lerin yarısı düşmüş."}]' />

İkisinin de karakterin paletine dokunmaması bir kural hâline getirilebilir: **kötü durum rengi alır, iyi durum katman ekler.** Bu kuralı bir kez koyduğunda oyuncu yeni bir durumla karşılaştığında bile ne tür bir şey olduğunu tahmin eder.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/status/layer-row.svg" width="560" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Buff aurasının iki karesi ve kalkan kabuğunun iki karesi yan yana." /></div>
    <figcaption><strong>Dört kare</strong><br />Aura altta, kabuk dışta. Karakterin kendisi dördünde de değişmiyor.</figcaption>
  </figure>
</div>

Kalkan kabuğunu çizmenin pratik yolu siluetin dışını otomatik bulmaktır: dolu her pixel'in dört komşusuna bak, boş olanları işaretle. Bu, 1.10'da kenarlık çizerken yaptığın işin aynısı — tek fark, kenarlığı karakterin rengiyle değil, kalkanın rengiyle çizmen.

## Sınırlar

İki durum ve ikişer kare. Kalkanın kırılma animasyonu, aura içindeki desen ve birden çok buff'ın üst üste binmesi bu göreve girmiyor.

::: details İpucu 1 — Aura karakteri yutuyor
Halkayı fazla yukarı almışsın. Aura ayak satırında ve altında kalmalı; gövdenin hizasına çıktığı an karakterin bir parçası gibi okunur.
:::

::: details İpucu 2 — Kalkan kabuğu karakteri kalınlaştırıyor
Kabuğu siluetin **içine** çizmişsin. Kabuk yalnız boş pixel'lere oturur; karakterin kendi pixel'lerinden hiçbiri değişmez.
:::

::: details İpucu 3 — Tam yerleşim
Dar aura 8. satırda 3–5. sütunlar. Geniş aura 8. satırda 2–6. sütunlar, ayrıca 7. satırda 1. ve 7. sütunlarda birer kıvılcım. Kalkan kabuğu, dolu pixel'lerin dört komşusundan boş olanların tamamı; zayıflamış karede bu pixel'lerin bir atlamalı yarısı kalır.
:::

## Birincil kaynak

[Aseprite — Layers](https://www.aseprite.org/docs/layers/).
`RESOURCES.md` içindeki bu belge, bir çizimin üstüne ve altına ayrı katman koymayı açıklar; auranın karakterin altına, kabuğun üstüne yerleşmesi için kullanıldı. İyi durumların paleti hiç değiştirmemesi bu dersin seçimidir.

**Kazanım:** Olumlu durumları, karakterin kimliğine hiç dokunmadan gösterebiliyorsun.

**“Pixel Art 1.106 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.107 — Durum rozetlerini portrede sırala](/pixel-art/107-status-badges).
