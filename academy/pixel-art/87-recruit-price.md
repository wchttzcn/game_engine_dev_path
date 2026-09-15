---
title: "1.87 — Kilitli üyeyi ve fiyatını göster"
description: "Alınmamış bir parti üyesini silüetle göster ve fiyatın rengiyle alım gücünü söyle."
section: Idle oyun · guild ve parti
---

# {{ $frontmatter.title }}

**Hedef:** Henüz sahip olmadığın bir karakteri, istenecek kadar görünür tut.

**Önce şu teknik:** [1.22 — 3×5 rakam seti çiz](/pixel-art/22-digits) — Fiyat bir sayıdır; sayı bu setle kurulur.

## Görev

1.86'daki kartı üç hâlde çoğalt. Kilitli hâlde portreyi tek renge (`#4c5f66`) indir ve portrenin sağ altına 5×5 bir kilit koy; durum satırına 5×5 coin ile fiyatı yaz, rakamlar `#e3ab52` olsun. Parası yetmeyen hâlde yalnız rakamların rengini `#b87848` yap. Satın alınmış hâlde portre tam renkte dönsün, fiyat yerine `LV 1` gelsin. `art/idle-ui/recruit-card.aseprite` olarak üç frame kaydet.

## Ne zaman bitti?

- Kilitli portrede karakterin silüeti tanınıyor; yalnız renkleri gitmiş.
- Kilit işareti portrenin üstünü kapatmıyor, köşesine oturuyor.
- Üç frame'de kart ölçüsü ve satır yerleşimi birebir aynı.
- Parası yetmeyen frame'de değişen tek şey rakamların rengi.

## Bilmen gereken küçük parça

Bir idle oyunda kadronun çoğu, çoğu zaman **alınmamış** durumdadır. O kartları boş bırakmak en kolay çözümdür ve en kötüsüdür: oyuncu neyi kaçırdığını görmezse istemez.

Doğru yol kartı silmek değil **susturmaktır.** Renkleri al, silüeti bırak. Silüet kaldığı sürece oyuncu orada bir mage olduğunu bilir — hatta 1.9'daki silüet testini iyi geçtiysen hangi karakter olduğunu da bilir. Kilit işareti bunun üstüne yalnız tek bir bilgi ekler: henüz senin değil.

<PixelAnimation title="Aynı kart, üç durum" :columns="24" :rows="32" :frames='[{"src":"/pixel-art/party/card-locked.svg","label":"Kilitli","duration":700,"alt":"Portre tek koyu renge inmiş, sağ altında kilit var, fiyat altın renkte."},{"src":"/pixel-art/party/card-poor.svg","label":"Altın yetmiyor","duration":700,"alt":"Aynı kart; yalnız fiyat rakamları sıcak bir renge dönmüş."},{"src":"/pixel-art/party/card-owned.svg","label":"Alınmış","duration":700,"alt":"Portre tam renginde, fiyat satırının yerini seviye almış."}]' />

Fiyatın rengi ayrı bir iş yapar. Aynı sayı iki farklı cevap verir: altın renkte yazıldığında **alabilirsin**, sıcak renkte yazıldığında **altının yetmiyor.** Oyuncu altın sayacına bakıp kafadan çıkarma yapmak zorunda kalmaz; kart kendi durumunu kendisi söyler.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/party/card-states.svg" width="304" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:4px 4px;outline:1px solid #486452" alt="Aynı priest kartının üç hâli yan yana: kilitli, parası yetmeyen ve satın alınmış." /></div>
    <figcaption><strong>Üçü yan yana</strong><br />Kart ölçüsü değişmez; değişen şey renk ve tek bir işaret.</figcaption>
  </figure>
</div>

Coin ikonunu 8×8 değil 5×5 çizmenin sebebi yer değil hiyerarşi. Fiyat satırı kartın en küçük bilgisidir; portreyle aynı ağırlıkta çizilirse göz önce oraya gider.

## Sınırlar

Üç durum ve tek fiyat satırı. Satın alma animasyonu, indirim rozeti ve fiyatın zamanla artması bu göreve girmiyor.

::: details İpucu 1 — Kilitli kart boş bir kutu gibi duruyor
Silüeti fazla karartmış olabilirsin. Silüet zeminden ayrılmalı: `#182e33` iç üzerinde `#4c5f66` tam bu iş için seçildi.
:::

::: details İpucu 2 — Kilit karakteri yutuyor
Kilidi portrenin ortasına koyma. Portrenin köşesine oturt ve altındaki birkaç pixel'i zemin rengiyle temizle; işaret okunur, silüet ayakta kalır.
:::

::: details İpucu 3 — Tam yerleşim
Portre 4–11. satırlar. Kilit 7–12. satırlarda, 16–21. sütunlarda; altındaki 7×7 alan önce `#182e33` ile boşaltılır. Fiyat satırı 22–26. satırlarda: 5×5 coin, bir pixel boşluk, sonra rakamlar; ikisi birlikte kart genişliğinde ortalanır.
:::

## Birincil kaynak

[Aseprite — Replace Color](https://www.aseprite.org/docs/replace-color/).
`RESOURCES.md` içindeki bu belge, bir çizimdeki bütün renkleri tek adımda değiştirmeyi açıklar; portreyi silüete indirmek ve fiyatın rengini çevirmek için kullanıldı. Kilitli kartın silüeti koruması bu dersin seçimidir.

**Kazanım:** Sahip olmadığın bir karakteri görünür, istenebilir ve fiyatı okunur hâlde gösterebiliyorsun.

**“Pixel Art 1.87 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.88 — Guild seviye rozetini çiz](/pixel-art/88-guild-badge).
