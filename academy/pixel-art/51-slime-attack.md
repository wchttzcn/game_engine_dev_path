---
title: "1.51 — Slime'ın saldırı pozunu çiz"
description: "Gövdeyi hedefe doğru uzatarak tek karelik bir saldırı kur."
section: Idle oyun · eşya ve monster
---

# {{ $frontmatter.title }}

**Hedef:** Bir düşmanın saldırdığını tek kareyle göster.

**Önce şu teknik:** [1.9 — Silüet testi yap](/pixel-art/09-silhouette-test) — Uzayan gövde silüette hâlâ slime görünmeli.

## Görev

1.48'deki slime'ı 8×8 yeni bir dosyaya kopyala ve gövdesini sağa doğru uzat. Göz hedefe yakın tarafta kalsın. `art/monsters/slime-attack.aseprite` olarak kaydet.

## Ne zaman bitti?

- Gövde sağa doğru uzamış; sol taraf daralmış.
- Göz duran pozdaki gibi gövdenin sol üst bölgesinde.
- Gövde alt kenara yaslı; kaynak 8×8 ve kaydedilmiş.

## Bilmen gereken küçük parça

Bir saldırı iki parçadan oluşur: saldıranın pozu ve efekt. Karakterler için efektleri çizdik; düşman tarafında ise **poz tek başına yeterli olabilir.**

Yumuşak bir gövde için saldırı, hedefe doğru uzamaktır. Toplam hacim aynı kalır: bir yandan uzarken diğer yandan daralır. Bu korunum, şeklin büyümüş değil hareket etmiş gibi okunmasını sağlar.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/monsters/slime-idle.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Duran slime; gövde ortalanmış." /></div>
    <figcaption><strong>1 · Duran poz</strong><br />1.48'deki slime. Gövde iki yana eşit dağılmış.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/monsters/slime-attack.svg" width="128" height="128" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:16px 16px;outline:1px solid #486452" alt="Gövdesi sağa uzamış slime." /></div>
    <figcaption><strong>2 · Saldırı pozu</strong><br />Sağ taraf iki pixel uzadı, sol taraf daraldı. Göz yerinde kaldı.</figcaption>
  </figure>
</div>

Bu poz 1.52'deki flash ile birlikte kullanıldığında sıra belli olur: slime uzanır, karakter yanıp söner. İki küçük çizim, tek satır kod yazmadan bir çarpışmanın hikâyesini anlatır.

## Sınırlar

Tek kare. Geri dönüş pozu, zıplama ve hedefe değme efekti bu göreve girmiyor.

::: details İpucu 1 — Slime büyümüş gibi duruyor
Bir yandan uzatırken diğer yandan daralt. Toplam genişlik fazla artmamalı.
:::

::: details İpucu 2 — Hangi yöne saldırdığı belli değil
Uzayan taraf ile gözün baktığı taraf aynı olmalı.
:::

::: details İpucu 3 — Tam yerleşim
Gövde 3–7. satırlar arasında; 5. ve 6. satırlarda sağ kenara kadar uzanır. Göz 5. satırda 2. sütunda kalır.
:::

## Birincil kaynak

[Aseprite — Drawing](https://www.aseprite.org/docs/drawing/).
`RESOURCES.md` içindeki bu belge, pixel ve dikdörtgen araçlarıyla şekil düzenlemeyi açıklar. Saldırı pozunun oranları bu dersin seçimidir.

**Kazanım:** Düşman tarafı da artık bir şey yapıyor. Kadro, tier ve saldırı pozuyla birlikte bir dövüş kurulabilir.

**“Pixel Art 1.51 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.52 — Hasar flash'ı çiz](/pixel-art/52-hit-flash).
