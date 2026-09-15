---
title: "1.90 — Kadro kurma ekranını kur"
description: "1.86–1.89'da çizdiğin parçaları tek bir kadro ekranına yerleştir."
section: Idle oyun · guild ve parti
---

# {{ $frontmatter.title }}

**Hedef:** Ayrı ayrı çizdiğin parçaları, tek cümle söyleyen bir ekrana yerleştir.

**Önce şu teknik:** [1.21 — 9-slice çerçeve kur](/pixel-art/21-nine-slice) — Ekranın paneli, düğmeleri ve şeritleri aynı çerçeveden çıkar.

## Görev

160×96 bir dosyada kadro ekranı kur. Üstte 12 satırlık bir durum şeridi: solda `ROSTER` başlığı, sağda guild ikonu, guild seviyesi ve altın sayacı. Ortada dört 24×32 kart yan yana — biri seçili, biri sahipli, biri alınabilir, biri parası yetmeyen. Altta `PARTY` etiketi, dört parti slotu, `HIRE` ve `AUTO` düğmeleri. En altta tek satır bilgi yazısı. `art/idle-ui/roster-screen.aseprite` olarak kaydet.

## Ne zaman bitti?

- Dört kart aynı satırda, aralarındaki boşluk eşit ve ekranın iki yanındaki boşluk eşit.
- Durum şeridi ile kart alanı arasında bir ayırıcı çizgi var.
- En parlak iki öğe `HIRE` düğmesi ve alınabilir kart.
- Bütün parçalar önceki derslerden geldi; ekran için yeni bir parça çizilmedi.

## Bilmen gereken küçük parça

Bu ders yeni bir parça öğretmiyor. Dört derstir çizdiğin kart, rozet ve slot burada **yerleşime** giriyor.

Ekranın söylemesi gereken tek cümle var: *şu kadar altının var, şu guild seviyesindesin, şunları alabilirsin.* Yerleşim bu cümleyi kurar. Durum şeridi üstte, çünkü her karar oradaki iki sayıya bakılarak veriliyor. Kartlar ortada, çünkü seçim orada yapılıyor. Mevcut parti altta, çünkü o bir sonuç, bir seçenek değil.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/screens/roster.svg" width="640" height="384" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:4px 4px;outline:1px solid #486452" alt="160×96 kadro ekranı: üstte ROSTER başlığı, guild seviyesi ve altın; ortada dört karakter kartı; altta parti sırası, HIRE ve AUTO düğmeleri." /></div>
    <figcaption><strong>Kadro ekranı</strong><br />Üstte durum, ortada seçim, altta sonuç ve eylem.</figcaption>
  </figure>
</div>

| Bölge | Parça | Dersi |
| --- | --- | --- |
| Durum şeridi | Guild ikonu ve seviyesi | [1.88 — Guild seviye rozetini çiz](/pixel-art/88-guild-badge) |
| Durum şeridi | Altın sayacı | [1.8 — 8×8 coin çiz](/pixel-art/08-coin) ve [1.22 — 3×5 rakam seti çiz](/pixel-art/22-digits) |
| Başlık ve etiketler | Yazı | [1.23 — 3×5 harf seti çiz](/pixel-art/23-letters) |
| Kart alanı | Seçili ve sahipli kart | [1.86 — Karakter seçim kartını çiz](/pixel-art/86-hero-card) |
| Kart alanı | Kilitli ve fiyatlı kart | [1.87 — Kilitli üyeyi ve fiyatını göster](/pixel-art/87-recruit-price) |
| Parti sırası | Dört slot durumu | [1.89 — Parti sırasının dört slotunu çiz](/pixel-art/89-party-row) |
| Düğmeler | Çerçeve ve dolgu | [1.21 — 9-slice çerçeve kur](/pixel-art/21-nine-slice) |

Dört kartın ekranda ortalanması gözle değil sayıyla yapılır: dört kart 96 pixel, üç boşluk 24 pixel, toplam 120; kalan 40 pixel ikiye bölününce iki yana 20'şer düşer. Bu tür bir hesabı bir kez yapıp not etmek, her yeni ekranda yeniden göz kararı vermekten hızlıdır.

Alttaki tek satır bilgi yazısı da bilinçli: ekranda cevaplanmayan tek soru **bir sonraki slot ne zaman açılır** sorusudur, ve o soru bir cümleyle kapanır.

## Sınırlar

Tek ekran ölçüsü ve tek yerleşim. Kaydırma, sekmeler, karakter detay paneli ve basılı düğme hâli bu göreve girmiyor.

::: details İpucu 1 — Ekran kalabalık duruyor
Muhtemelen parçalar arası boşluk parçaların kendisinden küçük. Bölgeler arasına en az dört pixel, bölge içindeki parçalar arasına iki pixel bırak.
:::

::: details İpucu 2 — Gözün nereye gideceği belli değil
Birden fazla şey en parlak renkte demektir. Ekranda `#e3ab52` ve `#ffe5a3` yalnız iki yerde bulunsun: alınabilir kart ve `HIRE` düğmesi.
:::

::: details İpucu 3 — Tam yerleşim
Durum şeridi 2–13. satırlar, altında 14. satırda ayırıcı çizgi. Kartlar 19. satırdan başlar, 21. sütundan itibaren 32 pixel aralıkla dizilir. `PARTY` etiketi 57. satır. Parti slotları 65–76. satırlar, 7. sütundan itibaren 14 pixel aralıkla. Düğmeler aynı satırlarda, 69. ve 101. sütunlarda. Bilgi satırı 86. satır.
:::

## Birincil kaynak

[Pedro Medeiros — Cluster Sketching and Painting](https://saint11.art/pixel_art_articles/article2/).
`RESOURCES.md` içindeki bu kaynak, ayrıntıdan önce büyük alanlarla yerleşim kurmayı açıklar; ekranın üç bölgeye ayrılması için kullanıldı. Bölgelerin sırası ve ölçüleri bu dersin seçimidir.

**Kazanım:** Ayrı ayrı çizdiğin parçaları tek bir işi olan bir ekranda birleştirebiliyorsun.

**“Pixel Art 1.90 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.91 — Beş stat ikonu çiz](/pixel-art/91-stat-icons).
