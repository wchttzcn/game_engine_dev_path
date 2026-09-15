---
title: "1.88 — Guild seviye rozetini çiz"
description: "Sabit bir kutunun içinde değişen bir sayıyı okunur tut."
section: Idle oyun · guild ve parti
---

# {{ $frontmatter.title }}

**Hedef:** İçeriği büyüyen bir UI parçasını, kutusu büyümeden çalışır tut.

**Önce şu teknik:** [1.22 — 3×5 rakam seti çiz](/pixel-art/22-digits) — Rozetin içindeki tek bilgi bir sayıdır.

## Görev

12×12 bir guild rozeti çiz: `#e3ab52` kenar, `#3b2c16` iç, üstte üç satırlık küçük bir siper, altta 3×5 rakamlarla seviye (`#e9dfc2`). Aynı rozetin `1` ve `12` hâllerini üret; kutu iki hâlde de 12×12 kalsın. Ayrıca 8×8 bir guild binası ikonu çiz: `#8c6847` gövde, `#3b2c16` pencereler. `art/idle-ui/guild.aseprite` olarak kaydet.

## Ne zaman bitti?

- İki rozet de 12×12; kenar kalınlığı ve siperin yeri aynı.
- `1` ve `12` rozetin içinde yatayda ortalanmış.
- İki haneli sayı kenara değmiyor; en az bir pixel boşluk kalmış.
- Guild binası ikonu 8×8 ve rozetten ayrı bir dosyada.

## Bilmen gereken küçük parça

Guild seviyesi bu oyunun ana sayacı: kaçıncı parti slotunun açılacağını, hangi karakterin satın alınabilir olacağını o belirler. Yani ekranda sık görünür ve sürekli değişir.

Buradaki ders çizim değil **ölçü kararı.** Bir UI parçası en uzun içeriğine göre tasarlanır. `1` için yeterli bir kutu çizersen iki haneye çıktığın gün ya kutu büyür ya sayı taşar; ikisi de düzeni bozar. Doğrusu kutuyu baştan iki haneye göre kurmak ve tek hanede ortalamaktır.

<PixelAnimation title="Aynı rozet, büyüyen sayı" :columns="12" :rows="12" :frames='[{"src":"/pixel-art/ui/guild-badge-1.svg","label":"Seviye 1","duration":800,"alt":"Altın çerçeveli rozet; içinde tek haneli seviye."},{"src":"/pixel-art/ui/guild-badge-12.svg","label":"Seviye 12","duration":800,"alt":"Aynı rozet; içindeki sayı iki haneye çıkmış ama kutu aynı kalmış."}]' />

Rozetin üstündeki siper süs değil. Rozet tek başına bir sayıdan ibaret olsaydı altın sayacıyla ya da seviye satırıyla karışırdı. Küçük bir tepe işareti, bu sayının **hangi sayaç** olduğunu yazı olmadan söyler.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/ui/guild-hall.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="8×8 guild binası: kahverengi gövde, iki sıra koyu pencere ve düz çatı." /></div>
    <figcaption><strong>Guild binası</strong><br />Aynı sayacın ikon karşılığı; rozetin sığmadığı dar yerlerde onun yerine geçer.</figcaption>
  </figure>
</div>

İki parça aynı şeyi anlatır ama farklı yerlerde işe yarar: rozet sayıyı taşır, ikon yalnız konuyu. Kadro ekranının başlığında ikisini yan yana kullanacaksın.

## Sınırlar

Tek rozet ölçüsü ve iki hane. Üç haneli seviye, seviye atlama parıltısı ve guild adı bu göreve girmiyor.

::: details İpucu 1 — İki haneli sayı sıkışık duruyor
Rakamları birleştirmiş olabilirsin. 3×5 setinde iki rakam arasında bir pixel boşluk vardır; iki hane 7 pixel tutar, 6 değil.
:::

::: details İpucu 2 — Rozet altın sayacına benziyor
Sayı doğru ama işaret eksik demektir. Üstteki siper rozetin konusunu söyleyen tek parça; onu silme ya da sayıyla aynı renge boyama.
:::

::: details İpucu 3 — Tam yerleşim
Kenar 1 pixel, iç alan 10×10. Siper 2–5. satırlar arasında ve ortalı. Sayı 7–11. satırlarda; tek hane 3 pixel geniştir ve 5–7. sütunlara, iki hane 7 pixel geniştir ve 4–10. sütunlara oturur.
:::

## Birincil kaynak

[Aseprite — New Sprite](https://www.aseprite.org/docs/new-sprite/).
`RESOURCES.md` içindeki bu belge, canvas ölçüsünü baştan belirlemeyi açıklar; rozetin en uzun içeriğine göre ölçülmesi için kullanıldı. Sabit kutu ve ortalanan sayı kararı bu dersin seçimidir.

**Kazanım:** İçeriği büyüyen bir UI parçasını, kutusunu bozmadan tasarlayabiliyorsun.

**“Pixel Art 1.88 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.89 — Parti sırasının dört slotunu çiz](/pixel-art/89-party-row).
