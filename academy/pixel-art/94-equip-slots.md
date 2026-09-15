---
title: "1.94 — Boş ekipman slotlarını ayır"
description: "Boş slota sönük bir işaret koyarak oyuncuya oraya ne konacağını söyle."
section: Idle oyun · stat ve ekipman
---

# {{ $frontmatter.title }}

**Hedef:** Boş bir slotun ne beklediğini, dolu bir slotun ne kadar değerli olduğunu tek bakışta söyle.

**Önce şu teknik:** [1.10 — Kenarlığın farkını gör](/pixel-art/10-outline) — Sönük işaret de tıpkı kenarlık gibi, ana çizimden ayrılması gereken ikinci bir kontrast katmanı.

## Görev

1.72'deki slotu üç kez çoğalt ve içine 5×5 sönük işaretler koy: kılıç, göğüslük, halka. Sonra aynı üç slotun dolu hâlini üret — ikon ortada, kenar tier rengi (`#92afc3` rare, `#8ac982` uncommon, `#aa83bf` epic). `art/idle-ui/equip-slots.aseprite` olarak altı frame kaydet.

## Ne zaman bitti?

- Üç boş slotta da 5×5 sönük işaret `#354b50` renginde: kılıç, göğüslük, halka.
- Üç dolu slotta da ikon ortada, kenar sırasıyla `#92afc3`, `#8ac982`, `#aa83bf`.
- Boş ve dolu hâller arasında yalnız iç içerik değişmiş; slotun 12×12 çerçevesi aynı kalmış.
- Altı frame de `art/idle-ui/equip-slots.aseprite` içinde kaydedilmiş.

## Bilmen gereken küçük parça

1.72'deki 12×12 slot boşken tamamen sessizdir — içinde hiçbir şey yok, oyuncu oraya ne koyacağını bilmez. Çözüm boş slotun içine **sönük bir hayalet işaret** koymaktır: silah slotuna kılıç, zırh slotuna göğüslük, trinket slotuna halka.

İşaret `#354b50` ile çizilir; panelin koyu zemini `#182e33`'ten biraz daha açık ama dolu bir ikonun parlaklığından çok uzak. Yani var ama sırayı dolu slotlara bırakır — oyuncunun gözü önce dolu, değerli slotlara gider, boş slotlar arka planda bekler.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/equip/slot-row-empty.svg" width="480" height="144" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Üç boş slot: sönük kılıç, göğüslük ve halka işaretleri." /></div>
    <figcaption><strong>1 · Boş üç slot</strong><br />Silah, zırh ve trinket; her biri kendi eşyasının sönük hayaletini taşıyor.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/equip/slot-row-full.svg" width="480" height="144" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Aynı üç slot dolu: kılıç, zırh ve yüzük, kenarları tier renginde." /></div>
    <figcaption><strong>2 · Dolu üç slot</strong><br />İşaret gitmiş, yerine gerçek ikon ve tier renkli kenar gelmiş.</figcaption>
  </figure>
</div>

Üçünü tek tek gezdirdiğinde işaretlerin birbirinden ayrıldığını görürsün: kılıç dikey, göğüslük yatay geniş, halka ortası boş. 5×5'te de yön ayrımı çalışır — iç ayrıntı çalışmaz.

<PixelAnimation title="Boş slotun üç işareti" :columns="12" :rows="12" :frames='[{"src":"/pixel-art/equip/slot-weapon.svg","label":"Silah","duration":700,"alt":"Boş slot; içinde sönük bir kılıç işareti."},{"src":"/pixel-art/equip/slot-armor.svg","label":"Zırh","duration":700,"alt":"Boş slot; içinde sönük bir göğüslük işareti."},{"src":"/pixel-art/equip/slot-trinket.svg","label":"Trinket","duration":700,"alt":"Boş slot; içinde sönük bir halka işareti."}]' />

<PixelAnimation title="Aynı üç slot dolu" :columns="12" :rows="12" :frames='[{"src":"/pixel-art/equip/slot-weapon-full.svg","label":"Rare kılıç","duration":700,"alt":"Dolu slot; ortada kılıç, kenar rare mavisi."},{"src":"/pixel-art/equip/slot-armor-full.svg","label":"Uncommon zırh","duration":700,"alt":"Dolu slot; ortada göğüslük, kenar uncommon yeşili."},{"src":"/pixel-art/equip/slot-trinket-full.svg","label":"Epic yüzük","duration":700,"alt":"Dolu slot; ortada yüzük, kenar epic moru."}]' />

Doldurulduğunda işaret gider; onun yerini gerçek ikon ve tier rengindeki kenar alır. Aynı 12×12 çerçeve iki farklı bilgiyi taşıyor: boşken ne beklendiğini, doluyken ne kadar değerli olduğunu.

## Sınırlar

Yalnız üç slotun boş ve dolu hâli bu görevde. Sürükle-bırak, seçili slot vurgusu ve stack sayısı bu göreve girmiyor.

::: details İpucu 1 — Sönük işaret dolu ikon kadar parlak duruyor
`#354b50` panelin koyu zemini `#182e33`'ten yalnızca bir tık açık olmalı. Parlaklığı artırırsan boş slot doluymuş gibi görünür.
:::

::: details İpucu 2 — Üç işaret birbirine benziyor
5×5 alanda kılıcı dikey ve dar, göğüslüğü simetrik ve geniş, halkayı içi boş bir daire yap. Aynı silüet kuralı 1.91'deki stat ikonlarıyla aynı: ana hatlar birbirinden ayrılmalı.
:::

::: details İpucu 3 — Tam yerleşim
Slot 1.72'deki gibi: çerçeve 1. ve 12. sütun/satırda, iç alan 2–11. İşaret 5×5, iç alanın ortasına gelecek şekilde 4–8. sütun ve 4–8. satırlara yerleşir. Dolu hâlde ikon aynı merkezi 8×8 alanı kaplar, yalnız çerçeve rengi değişir.
:::

## Birincil kaynak

[Aseprite — Replace Color](https://www.aseprite.org/docs/replace-color/).
`RESOURCES.md` içindeki bu belge, seçili alanda bir rengi tek adımda değiştirmeyi anlatır. Burada iki ayrı değişim için kullanılıyor: sönük işareti gerçek ikonla değiştirmek ve kenarı tier rengine boyamak; 1.73'te yalnız kenar değişiyordu, burada iç içerik de değişiyor.

**Kazanım:** Aynı 12×12 çerçeveyle hem boş bir slotun ne beklediğini hem dolu bir slotun ne kadar değerli olduğunu anlatabiliyorsun.

**“Pixel Art 1.94 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.95 — Kuşanınca karakter değişsin](/pixel-art/95-equipped-look).
