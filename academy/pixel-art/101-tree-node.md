---
title: "1.101 — Skill tree düğümünün dört hâlini çiz"
description: "Bir skill düğümünün kilitli, açılabilir, alınmış ve son seviye hâllerini ayır."
section: Idle oyun · skill tree
---

# {{ $frontmatter.title }}

**Hedef:** Bir ağaçtaki her düğümün hangi aşamada olduğunu tek bakışta okunur yap.

**Önce şu teknik:** [1.10 — Kenarlığın farkını gör](/pixel-art/10-outline) — Düğümün aşaması kenarında yazılıdır.

## Görev

12×12 bir skill tree düğümü çiz ve dört hâlini üret. Kilitli: `#354b50` kenar, ikon `#4c5f66`. Açılabilir: `#e3ab52` kenar, dört köşede `#ffe5a3`, ikon tam renkte. Alınmış: `#8ac982` kenar, ikon tam renkte. Son seviye: `#e3ab52` kenar, iç alan `#3b2c16`, ikon tam renkte ve sağ alt köşede 2×2 `#ffe5a3` işaret. `art/idle-ui/tree-node.aseprite` olarak dört frame kaydet.

## Ne zaman bitti?

- Dört frame'de kutu 12×12 ve ikonun yeri birebir aynı.
- Alınmış düğümle açılabilir düğüm birbirine benzemiyor.
- Son seviye düğümü alınmış düğümden ayrılıyor.
- Kilitli düğümde ikon hâlâ seçilebiliyor; tamamen kaybolmamış.

## Bilmen gereken küçük parça

Skill tree ekranında bir düzine kutu aynı anda görünür. Oyuncu oraya tek bir soruyla bakar: **şimdi ne alabilirim?** Ekran bu soruyu cevaplayamıyorsa ağaç bir yığına döner.

Dört aşamayı dört kenar rengi taşır ve renklerin sırası rastgele değil. Kilitli en sönük — daha yolu gelmedi. Alınmış yeşil — bitti, artık bilgi. Açılabilir altın — asıl mesele bu. Son seviye yine altın ama içi koyu, çünkü artık alınacak bir şey kalmadı; altın orada bir ödül işareti, bir davet değil.

<PixelAnimation title="Düğümün dört aşaması" :columns="12" :rows="12" :frames='[{"src":"/pixel-art/tree/node-locked.svg","label":"Kilitli","duration":700,"alt":"Sönük kenarlı düğüm; içindeki ikon koyu tek renkte."},{"src":"/pixel-art/tree/node-open.svg","label":"Açılabilir","duration":700,"alt":"Altın kenarlı düğüm; dört köşesi parlak, ikon tam renginde."},{"src":"/pixel-art/tree/node-taken.svg","label":"Alınmış","duration":700,"alt":"Yeşil kenarlı düğüm; ikon tam renginde."},{"src":"/pixel-art/tree/node-max.svg","label":"Son seviye","duration":700,"alt":"Altın kenarlı, içi koyu altın düğüm; sağ altında iki pixel’lik işaret."}]' />

Kilitli düğümde ikonun **görünmeye devam etmesi** önemli. Ağacın işi oyuncuya ileride ne olacağını göstermektir; kilitli düğümleri boş bırakırsan ağaç bir yol haritası olmaktan çıkar ve sürprize döner. Sürpriz burada istenen şey değil — oyuncu neyi hedefleyeceğini bilerek puan biriktirir.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/tree/node-states.svg" width="648" height="144" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Bir skill tree düğümünün dört hâli yan yana: kilitli, açılabilir, alınmış ve son seviye." /></div>
    <figcaption><strong>Dört aşama</strong><br />Aynı kutu, aynı ikon. Aşamayı kenar ve köşeler söylüyor.</figcaption>
  </figure>
</div>

Düğümlerin içindeki ikonlar 1.97'deki skill ikonlarıyla aynı aileden gelir. Ağaçta gördüğü hilali, oyuncu savaşta warrior'ın izinde de görür; ikisi arasındaki bağ kurulduğunda ağaç soyut bir menü olmaktan çıkar.

## Sınırlar

Dört aşama ve tek düğüm ölçüsü. Düğümün seviye sayısı, maliyeti ve bilgi kutusu bu göreve girmiyor.

::: details İpucu 1 — Alınmış düğüm de dikkat çekiyor
Yeşil kenarı fazla parlak seçmiş olabilirsin. Alınmış bir düğüm tamamlanmış bir iştir; okunur olsun ama çağırmasın.
:::

::: details İpucu 2 — Son seviye düğümü alınmış gibi duruyor
Yalnız kenarı değiştirmişsin. İç alanı da koyu altına çevir; iç renk, kenardan daha büyük bir alan kaplar ve farkı o taşır.
:::

::: details İpucu 3 — Tam yerleşim
Kutu 12×12, kenar 1 pixel, ikon 3. satır ve 3. sütundan başlayan 8×8 alan. Açılabilir düğümün parlak köşeleri 2. ve 11. satır ile 2. ve 11. sütunların kesiştiği dört pixel. Son seviye işareti 10–11. satırlarda ve 10–11. sütunlarda.
:::

## Birincil kaynak

[Aseprite — Replace Color](https://www.aseprite.org/docs/replace-color/).
`RESOURCES.md` içindeki bu belge, tek bir rengi bütün çizimde değiştirmeyi açıklar; aynı düğümün dört kenar rengini üretmek için kullanıldı. Dört aşamanın hangi renge bağlandığı bu dersin seçimidir.

**Kazanım:** Bir ilerleme ağacındaki her düğümün aşamasını tek bakışta okunur kılıyorsun.

**“Pixel Art 1.101 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.102 — Düğümleri bağlayan hattı çiz](/pixel-art/102-tree-link).
