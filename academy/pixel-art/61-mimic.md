---
title: "1.61 — Sandıktan mimic çıkar"
description: "Var olan bir nesneye göz ve diş ekleyerek onu canavara çevir."
section: Idle oyun · eşya ve monster
---

# {{ $frontmatter.title }}

**Hedef:** Bir nesneyi yeniden çizmeden düşmana dönüştür.

**Önce şu teknik:** [1.9 — Silüet testi yap](/pixel-art/09-silhouette-test) — Mimic silüette hâlâ sandık görünmeli; sürpriz buna bağlı.

## Görev

1.7'deki sandığı 8×8 yeni bir dosyaya kopyala. Orta bandına iki göz, altına bir sıra diş ve dişlerin altına koyu bir ağız boşluğu ekle. `art/monsters/mimic.aseprite` olarak kaydet.

## Ne zaman bitti?

- Dış şekil ve ahşap renkleri 1.7'deki sandıkla aynı.
- Gözler üst bantta, dişler ve ağız orta bantta duruyor.
- Sandıkla mimic yan yana konduğunda ikisi de sandık, biri tehlikeli görünüyor; kaynak 8×8.

## Bilmen gereken küçük parça

Idle oyunda kadro büyütmenin en ucuz yolu **var olan bir nesneye anlam yüklemektir.** Mimic tam olarak budur: oyuncunun güvendiği sandık, açıldığında canavar çıkar.

İşe yaraması için sandığın sandık kalması gerekir. Dış şekli ve rengi değiştirirsen sürpriz kaybolur; oyuncu uzaktan tanıyamaz. Eklenen tek şey **yüz:** iki göz ve bir sıra diş. Küçük ölçüde yüz, bir şeyi canlandırmanın en hızlı yoludur.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/objects/chest.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="1.7'deki sıradan sandık." /></div>
    <figcaption><strong>1 · Sandık</strong><br />Değiştirmeyeceğin gövde. Dış şekil ve renkler aynen kalacak.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/monsters/mimic.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Gözleri ve dişleri olan mimic." /></div>
    <figcaption><strong>2 · Yüz</strong><br />Üst banda iki açık göz, ortaya bir sıra diş, altına koyu ağız boşluğu.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/craft/mimic-pair.svg" width="204" height="96" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Sandık ve mimic yan yana." /></div>
    <figcaption><strong>3 · Yan yana</strong><br />İkisi de sandık; biri bekliyor, biri bakıyor. Sürpriz burada saklı.</figcaption>
  </figure>
</div>

Aynı yöntem başka nesnelerde de çalışır: yüzü olan bir kitap, gözleri olan bir kaya. Kural şu — **gövdeyi tanınır bırak, yalnız yüz ekle.** Mimic'e 1.66'daki ölüm kademelerini ve 1.64'teki flash'ı uygulamak da yeni bir karar gerektirmez.

## Sınırlar

Tek kare. Açılma animasyonu, saldırı pozu ve sandıkla yer değiştirme bu göreve girmiyor.

::: details İpucu 1 — Mimic sandığa benzemiyor
Dış şekle dokunma. Göz ve diş gövdenin içine girmeli, silueti değiştirmemeli.
:::

::: details İpucu 2 — Gözler kilide benziyor
Gözleri iki ayrı pixel olarak, aralarında boşlukla yerleştir. Kilit tekti; gözler çift.
:::

::: details İpucu 3 — Tam yerleşim
Gözler 4. satırda 3. ve 6. sütunlarda. Dişler 5. satırda 2–7. sütunlar, ağız boşluğu 6. satırda.
:::

## Birincil kaynak

[Aseprite — Drawing](https://www.aseprite.org/docs/drawing/).
`RESOURCES.md` içindeki bu belge, küçük şekilleri pixel aracıyla kurmayı açıklar. Yüzün yerleşimi ve mimic fikri bu dersin seçimidir.

**Kazanım:** Kadroda artık oyuncuyu şaşırtan bir düşman var ve sıfırdan çizilmedi.

**“Pixel Art 1.61 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.62 — 16×16 boss çiz](/pixel-art/62-boss).
