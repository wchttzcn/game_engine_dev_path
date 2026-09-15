---
title: "1.86 — Karakter seçim kartını çiz"
description: "Bir karakteri seçilebilir hâle getiren kartı ve o kartın seçili hâlini kur."
section: Idle oyun · guild ve parti
---

# {{ $frontmatter.title }}

**Hedef:** Bir karakteri, üstüne tıklanabilecek bir nesneye dönüştür.

**Önce şu teknik:** [1.21 — 9-slice çerçeve kur](/pixel-art/21-nine-slice) — Kart bir çerçevedir; içi değişir, kenarı kalıptır.

## Görev

24×32 bir dosyada karakter kartı çiz: panel çerçevesi (`#637980` kenar, `#182e33` iç, köşelerde `#92afc3`), ortada 1.25'teki mage 8×8 olarak, altında `#354b50` bir ayırıcı çizgi, sonra 3×5 harflerle adı ve `LV 1` satırı. Sonra aynı kartın seçili hâlini üret: kenar `#92afc3`, köşeler `#e3ab52`, altta iki satırlık `#e3ab52` şerit. `art/idle-ui/hero-card.aseprite` olarak iki frame kaydet.

## Ne zaman bitti?

- İki frame'de de kartın ölçüsü, portrenin yeri ve yazıların satırı birebir aynı.
- Seçili frame'de fark yalnız kenar rengi, köşeler ve alttaki şerit.
- Portre 8×8 kalmış; kart için yeniden çizilmemiş.
- Ad ve seviye satırı kart genişliğinde ortalanmış.

## Bilmen gereken küçük parça

Şimdiye kadar karakterleri sahnede çizdin. Kadro ekranında karakter sahnede değil, **bir listede** durur. Listedeki her şeyin tutunacak bir kenarı olmalı; o kenar karttır.

Kartın işi karakteri süslemek değil, onu **seçilebilir bir nesne** yapmak. Bu yüzden kartın üç sabit bölgesi olur: portre, ad, durum. Üç bölgenin yeri dört kartta da aynı kalırsa göz bir kez öğrenir, sonra yalnız içeriği okur.

<PixelAnimation title="Aynı kart, iki hâl" :columns="24" :rows="32" :frames='[{"src":"/pixel-art/party/card-off.svg","label":"Seçili değil","duration":600,"alt":"Kart sönük çerçeveyle duruyor; ortada mage, altında adı ve seviyesi."},{"src":"/pixel-art/party/card-on.svg","label":"Seçili","duration":600,"alt":"Aynı kart parlak çerçeveyle; köşeleri altın ve altında altın bir şerit var."}]' />

Seçili hâli çizerken en kolay yanlış, kartı **yeniden çizmektir.** Portreyi büyütmek, adı parlatmak, çerçeveyi kalınlaştırmak — hepsi ayrı ayrı mantıklı görünür, birlikte kartı başka bir karta çevirir. Seçim bir durumdur, yeni bir nesne değil. Tek bir parlak işaret yeter: burada çerçevenin rengi ve alttaki şerit.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/party/card-row.svg" width="408" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:4px 4px;outline:1px solid #486452" alt="Dört karakter kartı yan yana; ikincisi parlak çerçeveli ve altın şeritli." /></div>
    <figcaption><strong>Dört kart yan yana</strong><br />Aynı kalıp dört kez tekrarlanır; hangisinin seçili olduğu tek bakışta okunur.</figcaption>
  </figure>
</div>

Dördü yan yana geldiğinde kartın asıl sınavı başlar: portreler birbirine benzemiyorsa kadro okunur. Bu, 1.9'daki silüet testinin kadro ölçeğindeki hâli.

## Sınırlar

Tek kart ölçüsü ve iki durum. Fiyat, kilit, basılı hâl ve hover bu göreve girmiyor.

::: details İpucu 1 — Seçili kart başka bir kart gibi duruyor
Muhtemelen birden fazla şeyi aynı anda değiştirdin. Portreyi ve yazıları geri al; yalnız kenar rengini ve alttaki şeridi bırak.
:::

::: details İpucu 2 — Kart kalabalık görünüyor
Üç bölgenin arası bir pixel'den az olmuş olabilir. Portre ile ad arasına ayırıcı çizgiyi koy; boşluk, çizgiden daha çok iş görür.
:::

::: details İpucu 3 — Tam yerleşim
Kart 24 geniş, 32 yüksek. Portre 4. satırdan başlar ve 8 satır tutar. Ayırıcı çizgi 13. satırda, 3–22. sütunlar arasında. Ad 15–19. satırlar, seviye 22–26. satırlar, ikisi de kart genişliğinde ortalı. Seçili şerit 29–30. satırlarda, 4–21. sütunlar arasında.
:::

## Birincil kaynak

[Aseprite — Slices](https://www.aseprite.org/docs/slices/).
`RESOURCES.md` içindeki bu belge, bir çizimin içinde adlandırılmış bölgeler tanımlamayı açıklar; kartın portre, ad ve durum bölgelerini sabit tutmak için kullanıldı. Seçili hâlin tek işaretle kurulması bu dersin seçimidir.

**Kazanım:** Bir karakteri listede duran, seçilebilir bir nesneye çevirebiliyorsun.

**“Pixel Art 1.86 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.87 — Kilitli üyeyi ve fiyatını göster](/pixel-art/87-recruit-price).
