---
title: "1.89 — Parti sırasının dört slotunu çiz"
description: "Aynı kutunun dört farklı anlamını yalnız kenar rengiyle ayır."
section: Idle oyun · guild ve parti
---

# {{ $frontmatter.title }}

**Hedef:** Dört durumu, içini değiştirmeden kenardan okunur yap.

**Önce şu teknik:** [1.10 — Kenarlığın farkını gör](/pixel-art/10-outline) — Anlamı taşıyan şey burada kenarlığın kendisi.

## Görev

12×12 bir parti slotu çiz ve dört hâlini üret. Kenar renkleri sırayla `#92afc3` (dolu), `#637980` (boş), `#e3ab52` (alınabilir) ve `#354b50` (kilitli) olsun; iç alan dördünde de `#182e33` kalsın. Dolu slotun içine 1.30'daki warrior, alınabilir slotun içine `#ffe5a3` bir artı, kilitli slotun içine 5×5 kilit, boş slotun içine `#354b50` köşe işaretleri gelsin. `art/idle-ui/party-slot.aseprite` olarak dört frame kaydet.

## Ne zaman bitti?

- Dört frame'de kutu ölçüsü, kenar kalınlığı ve iç rengi aynı.
- Dört durum yan yana dizildiğinde farkları kenardan okunuyor.
- Boş slotla alınabilir slot birbirine benzemiyor.
- İçerideki işaretler kenara değmiyor.

## Bilmen gereken küçük parça

Parti sırası oyuncunun en sık baktığı yer: kadroda kim var, sırada ne var. Dört kutu aynı ölçüdedir; farklı olan tek şey ne anlattıkları.

Bu farkı **içeriden** anlatmak cazip gelir — boş slota büyük bir yazı, kilitli slota kalın bir zincir. Ama içerik zaten karakterin yeri; oraya yüklenen her şey dolu slotla yarışır. Bu yüzden ayrımı kenar taşır. Kenar, kutunun kimliğidir; iç, kutunun içeriği.

<PixelAnimation title="Aynı slot, dört anlam" :columns="12" :rows="12" :frames='[{"src":"/pixel-art/party/slot-filled.svg","label":"Dolu","duration":700,"alt":"Parlak kenarlı slot; içinde warrior duruyor."},{"src":"/pixel-art/party/slot-empty.svg","label":"Boş","duration":700,"alt":"Sönük kenarlı slot; içinde yalnız dört köşe işareti var."},{"src":"/pixel-art/party/slot-hire.svg","label":"Alınabilir","duration":700,"alt":"Altın kenarlı slot; ortasında açık altın bir artı."},{"src":"/pixel-art/party/slot-locked.svg","label":"Kilitli","duration":700,"alt":"En sönük kenarlı slot; ortasında kilit."}]' />

Boş ile alınabilir arasındaki fark özellikle önemli. İkisi de karakter içermez, ama biri **bekliyor**, diğeri **çağırıyor.** Bekleyen slot en sönük işareti taşır; çağıran slot ekranın en parlak rengini kullanır. Bir ekranda en parlak şey her zaman oyuncunun yapması gereken iştir.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/party/party-row.svg" width="432" height="96" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Dört parti slotu yan yana: iki dolu, biri altın artılı, biri kilitli." /></div>
    <figcaption><strong>Sıranın kendisi</strong><br />İki dolu, bir çağıran, bir kilitli. Göz soldan sağa okur ve ne yapacağını bulur.</figcaption>
  </figure>
</div>

Slotlar arasındaki iki pixel'lik boşluk da bir karar. Bitişik kutular tek bir şerit gibi okunur; iki pixel ayırınca dört ayrı yuva olurlar.

## Sınırlar

Dört durum ve tek slot ölçüsü. Sürükle bırak, sıralama okları ve slotun basılı hâli bu göreve girmiyor.

::: details İpucu 1 — Dört slot birbirine benziyor
Kenar renklerini birbirine yakın seçmiş olabilirsin. Dört renk arasında value farkı olmalı; en koyudan en açığa sıralayınca dördü de ayrı basamakta durmalı.
:::

::: details İpucu 2 — Boş slot gözü çekiyor
İçindeki işaret fazla parlak demektir. Boş slot bekler; işareti iç alanın hemen bir tık üstünde kalsın, kenardan parlak olmasın.
:::

::: details İpucu 3 — Tam yerleşim
Kenar 1 pixel, iç alan 10×10. Karakter 3. satır ve 3. sütundan başlar. Artı 4–8. satırlarda ve 4–8. sütunlarda. Kilit 4–8. satırlarda ve 4–8. sütunlarda. Boş slotun köşe işaretleri 4. ve 9. satırların uçlarında ikişer pixel.
:::

## Birincil kaynak

[Aseprite — Replace Color](https://www.aseprite.org/docs/replace-color/).
`RESOURCES.md` içindeki bu belge, tek bir rengi bütün çizimde değiştirmeyi açıklar; aynı slotun dört kenar rengini üretmek için kullanıldı. Anlamın kenara, içeriğin ortaya verilmesi bu dersin seçimidir.

**Kazanım:** Aynı kutunun birden çok anlamını, içeriğiyle yarıştırmadan gösterebiliyorsun.

**“Pixel Art 1.89 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.90 — Kadro kurma ekranını kur](/pixel-art/90-roster-screen).
