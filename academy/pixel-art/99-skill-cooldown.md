---
title: "1.99 — Cooldown'ı ve hazır hâlini ayır"
description: "Bir skill slotunun dört hâlini, ikonu değiştirmeden value ile ayır."
section: Idle oyun · skill ve auto
---

# {{ $frontmatter.title }}

**Hedef:** Bir skill'in kullanılabilir olup olmadığını bir bakışta okunur yap.

**Önce şu teknik:** [1.11 — Üç value ile ayır](/pixel-art/11-value) — Dört durum, aynı ikonun dört farklı value'suyla kurulur.

## Görev

12×12 bir skill slotu çiz ve dört hâlini üret. Kilitli: `#354b50` kenar, ortada 5×5 kilit. Bekleyen: `#637980` kenar, ikon sönük ve üstten inen `#354b50` bir karartma bandı. Hazır: `#e3ab52` kenar, `#ffe5a3` köşeler, ikon tam renkte. Tetiklenmiş: `#ffffff` kenar, iç alan `#ffe5a3`, ikon `#3b2c16`. `art/idle-ui/skill-slot.aseprite` olarak dört frame kaydet.

## Ne zaman bitti?

- Dört frame'de kutu 12×12 ve ikonun yeri birebir aynı.
- Bekleyen frame'de karartma **üstten** iniyor, aşağıdan değil.
- Hazır frame ekranın en parlak öğesi.
- Tetiklenmiş frame diğer üçünden anlık olarak ayrılıyor: içi dolu ve ters kontrastlı.

## Bilmen gereken küçük parça

Skill slotu dört soru cevaplar: bu skill senin mi, hazır mı, ne kadar kaldı, az önce çıktı mı. Dördü de aynı 12×12 kutuda, aynı ikonla anlatılır.

Ayrımı **value** taşır. Kilitli en koyu, bekleyen koyu, hazır parlak, tetiklenmiş ise tersine çevrilmiş — içi dolu, ikonu koyu. Dördünü en koyudan en açığa sıraladığında her biri ayrı bir basamakta durmalı; iki durum aynı basamağa düşerse oyuncu onları ayıramaz.

<PixelAnimation title="Skill slotunun dört hâli" :columns="12" :rows="12" :frames='[{"src":"/pixel-art/skills/slot-locked.svg","label":"Kilitli","duration":700,"alt":"En sönük kenarlı slot; ortasında kilit var, ikon yok."},{"src":"/pixel-art/skills/slot-cooling.svg","label":"Bekliyor","duration":700,"alt":"İkon sönük; üstten inen koyu bir bant slotun üst yarısını kapatıyor."},{"src":"/pixel-art/skills/slot-ready.svg","label":"Hazır","duration":700,"alt":"Altın kenarlı, parlak köşeli slot; ikon tam renginde."},{"src":"/pixel-art/skills/slot-fired.svg","label":"Tetiklendi","duration":300,"alt":"Beyaz kenarlı slot; içi açık altınla dolmuş, ikon koyu."}]' />

Karartmanın **üstten** inmesi rastgele değil. Bir cooldown geri sayımdır; azalan bir şeydir. Aşağıdan yükselen bir karartma büyüyen bir şey okunur ve ters anlam verir. Üstten inen bir karartma ise çekilen bir perdedir: her frame'de biraz daha ikon görünür, yani skill biraz daha yaklaşır.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/skills/slot-states.svg" width="648" height="144" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Aynı skill slotunun dört hâli yan yana: kilitli, bekleyen, hazır ve tetiklenmiş." /></div>
    <figcaption><strong>Dördü yan yana</strong><br />Soldan sağa value artıyor; en parlak olan, oyuncunun beklediği an.</figcaption>
  </figure>
</div>

Tetiklenmiş kare yalnız bir iki kare sürer. Kısa olduğu için kuvvetli olmalı — bu yüzden tek kare boyunca kontrast tersine döner. 1.64'teki hasar flash'ıyla aynı fikir: göz kaçıramayacağı tek bir kare ister.

## Sınırlar

Dört durum ve tek slot ölçüsü. Kalan saniye sayısı, dairesel cooldown ve basılı hâl bu göreve girmiyor.

::: details İpucu 1 — Bekleyen slot kilitli gibi duruyor
İkonu fazla karartmışsın. Bekleyen slotta ikon görünmeye devam etmeli; kilitli slotta ikon hiç yok, onun yerine kilit var.
:::

::: details İpucu 2 — Hazır slot gözü çekmiyor
Kenar rengi tek başına yetmez. Dört köşeye birer pixel açık altın koy; küçük parlak noktalar, düz bir çerçeveden daha çok dikkat çeker.
:::

::: details İpucu 3 — Tam yerleşim
Kutu 12×12, kenar 1 pixel, ikon 3. satır ve 3. sütundan başlayan 8×8 alan. Karartma bandı 2–6. satırlarda, 2–11. sütunlarda. Hazır frame'in parlak köşeleri 2. ve 11. satır ile 2. ve 11. sütunların kesiştiği dört pixel. Tetiklenmiş frame'de iç alanın tamamı, yani 2–11. satır ve sütunlar dolu.
:::

## Birincil kaynak

[Aseprite — Layers](https://www.aseprite.org/docs/layers/).
`RESOURCES.md` içindeki bu belge, bir çizimin üstüne ayrı katman koymayı açıklar; cooldown karartmasını ikonun üstünde ayrı bir katman olarak tutmak için kullanıldı. Karartmanın üstten inmesi bu dersin seçimidir.

**Kazanım:** Bir skill'in kullanılabilirliğini, ikonu değiştirmeden dört basamakta gösterebiliyorsun.

**“Pixel Art 1.99 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.100 — AUTO tetiklenmesini göster](/pixel-art/100-auto-cast).
