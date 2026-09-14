---
title: "1.28 — 32×16 kamp alanı kur"
description: "Zemin, ağaç ve çadırla idle oyununun küçük dış mekânını kur."
section: Idle RPG · UI ve çevre
next: false
---

# {{ $frontmatter.title }}

**Hedef:** Birkaç büyük, sade şekli aynı zeminde bir dış mekâna dönüştür.

## Görev

32×16 RGB dosyada küçük kamp çiz. Örnekteki hazır renklerle zemin, tek ağaç ve tek çadırı kur. `art/world/camp.aseprite` olarak kaydet.

## Ne zaman bitti?

- Alt dört satır zemin; ağaç ve çadır onun üst sınırına oturuyor.
- Solda ağaç, sağda çadır ve aralarında açık alan var.
- Kaynak 32×16; karakter, eşya veya UI eklemeden kaydedilmiş.

## Bilmen gereken küçük parça

Dış mekânın işi birkaç nesneyi birlikte barındırmak. Bu yüzden 32×16 seçiyoruz; bir sonraki karakterin boyutu yine 8×8 olabilir. Şimdilik perspektif, doku veya renk oranı hesaplamıyoruz. Aynı zemine oturan iki büyük şekil yeterli.

<div class="pixel-steps pixel-steps-wide">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/camp-ground.svg" width="256" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Kamp zemini — 32×16" /></div>
    <figcaption><strong>1 · Zemin</strong><br />Canvas'ı #263D4C ile doldur. Alt dört satırı #557447 yap. İki büyük düz alan oluştur.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/camp-tree.svg" width="256" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Tek ağaçlı kamp alanı" /></div>
    <figcaption><strong>2 · Ağaç</strong><br />Solda iki pixel genişliğinde #8C6847 gövde çiz. Üstüne #3B6149 ile basamaklı, geniş bir yaprak kütlesi koy.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/idle/camp.svg" width="256" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Ağaç ve çadırla kurulmuş 32×16 kamp" /></div>
    <figcaption><strong>3 · Çadır</strong><br />Sağda #C8A66B ile tepeden aşağı genişleyen çadır çiz. Altta iki pixel genişliğinde #293A37 kapı bırak.</figcaption>
  </figure>
</div>

Her nesnenin altında çim detayı çizmen gerekmiyor. Ağaç ile çadırın zeminde aynı yüksekliğe oturduğunu kontrol et. [Idle RPG görsel seti](/pixel-art/idle-kit), bu parçaların UI ve 8×8 karakterlerle yan yana gelebileceği örnek bir yerleşim gösterir.

## Sınırlar

Tek ağaç ve tek çadır, nesneleri aynı alanda yerleştirmeyi çalışmak için. 60–30–10, büyük dünya haritası ve tile sistemi bu göreve eklenmiyor.

::: details İpucu 1 — Nesneler havada
Zemin 13. satırda başlar. Ağaç gövdesinin ve çadırın son dolu satırı 12. satır olmalı.
:::

::: details İpucu 2 — Yer kalmadı
Önce solda ağacın, sağda çadırın yerini ayır. Ayrıntıdan önce iki büyük şekil görünür olsun.
:::

::: details İpucu 3 — Çadırı kuramıyorum
Tepesi 7. satırın 21–22. sütunlarında. Her alt satırda iki yandan birer pixel genişlet; 12. satır 16–27. sütunlara uzanır. Kapı 21–22. sütunlarda, 10–12. satırlardadır.
:::

## Birincil kaynak

[Pedro Medeiros — Cluster Sketching and Painting](https://saint11.art/pixel_art_articles/article2/).
`RESOURCES.md` içindeki bu kaynak, ayrıntıdan önce büyük renk alanlarıyla yerleşim kurma yaklaşımı için kullanıldı. 32×16 kampın biçimleri ve hazır renkleri bu ders için seçildi.

**Kazanım:** Küçük nesne, karakter, UI ve dış mekânın farklı ölçülerde bir araya gelebileceği bir idle RPG görsel setine başladın.

**“Pixel Art 1.28 denememi değerlendir”** yaz; çizimini inceleyelim.
