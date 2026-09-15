---
title: "1.96 — Karakter sayfasını kur"
description: "Portre, statlar, ekipman ve skill slotlarını tek bir karakter sayfasında topla."
section: Idle oyun · skill ve auto
---

# {{ $frontmatter.title }}

**Hedef:** Bir karakterin bütün bilgisini tek ekranda, iki sütuna ayırarak göster.

**Önce şu teknik:** [1.21 — 9-slice çerçeve kur](/pixel-art/21-nine-slice) — Ekranın paneli, slotları ve barları aynı çerçeve mantığıyla kurulur.

## Görev

160×96 bir dosyada karakter sayfası kur. Üstte durum şeridi: karakterin adı ve altın sayacı. Sol sütunda portre, seviye, XP barı, can barı ve 1.92'deki beş satırlık stat paneli. Sağ sütunda `GEAR` etiketi ve üç ekipman slotu, altında `SKILLS` etiketi, üç skill slotu ve bir skill barı. İki sütunu dikey bir ayırıcı çizgi ayırsın. `art/idle-ui/hero-screen.aseprite` olarak kaydet.

## Ne zaman bitti?

- İki sütun dikey bir çizgiyle ayrılmış ve çizginin iki yanında eşit boşluk var.
- Sol sütunda yalnız karakterin **kendisine** ait bilgiler var: portre, seviye, canı, statları.
- Sağ sütunda yalnız **değiştirilebilir** şeyler var: ekipman ve skill'ler.
- Barlar aynı sol kenardan başlıyor.

## Bilmen gereken küçük parça

Kadro ekranı *hangi karakter* sorusunu cevaplıyordu. Karakter sayfası *bu karakter ne durumda* sorusunu cevaplar. İki soru farklı olduğu için yerleşim de farklı.

Buradaki tek büyük karar sütunlara ayırmak. Solda karakterin okunacak hâli var: kim, kaçıncı seviyede, ne kadar canı var, statları ne. Sağda ise oyuncunun **dokunabileceği** şeyler var: kuşandığı eşyalar ve skill'leri. Bilgi ile eylem karışmadığında oyuncu ekranda ne yapabileceğini aramak zorunda kalmaz.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/screens/hero.svg" width="640" height="384" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:4px 4px;outline:1px solid #486452" alt="160×96 karakter sayfası: solda portre, seviye, XP ve can barları, beş stat satırı; sağda üç ekipman slotu, üç skill slotu ve bir skill barı." /></div>
    <figcaption><strong>Karakter sayfası</strong><br />Solda okunacaklar, sağda değiştirilebilecekler, ortada bir çizgi.</figcaption>
  </figure>
</div>

| Bölge | Parça | Dersi |
| --- | --- | --- |
| Sol | Portre slotu | [1.94 — Boş ekipman slotlarını ayır](/pixel-art/94-equip-slots) |
| Sol | XP barı | [1.71 — 32×4 XP barı çiz](/pixel-art/71-xp-bar) |
| Sol | Can barı | [1.70 — 32×8 can barı çiz](/pixel-art/70-health-bar) |
| Sol | Beş stat satırı | [1.92 — Stat satırını hizala](/pixel-art/92-stat-row) |
| Sağ | Ekipman slotları | [1.94 — Boş ekipman slotlarını ayır](/pixel-art/94-equip-slots) |
| Sağ | Tier renkleri | [1.73 — Eşya slotuna tier rengi ver](/pixel-art/73-tier-frames) |
| Her yerde | Yazı ve sayı | [1.23 — 3×5 harf seti çiz](/pixel-art/23-letters) ve [1.22 — 3×5 rakam seti çiz](/pixel-art/22-digits) |

İki barın aynı sol kenardan başlaması ufak ama belirleyici bir ayrıntı. XP ve can farklı şeylerdir, ama ikisi de **bir orandır**; aynı hizada başlayan iki bar, göz tarafından aynı tür bilgi olarak okunur ve karşılaştırılabilir.

Sağ alttaki skill barı ise henüz tam anlamını kazanmadı. Onun ne anlattığını 1.98 ve 1.100'de kuracaksın; burada yalnız yerini ayırıyoruz.

## Sınırlar

Tek ekran ölçüsü ve tek yerleşim. Karakterler arası geçiş okları, eşya bilgi kutusu ve yeniden dağıtılabilen stat puanları bu göreve girmiyor.

::: details İpucu 1 — Ekran iki yarıya değil, dağınık bir kalabalığa benziyor
Ayırıcı çizgi eksik ya da fazla kısa olabilir. Çizgi iki sütunun yüksekliğince uzasın; kısa bir çizgi ayırmaz, süsler.
:::

::: details İpucu 2 — Sağ sütun boş duruyor
Etiketleri unutmuş olabilirsin. `GEAR` ve `SKILLS` yazıları bölgeleri adlandırır; onlar olmadan altı kutu tek bir yığın gibi okunur.
:::

::: details İpucu 3 — Tam yerleşim
Durum şeridi 2–13. satırlar. Ayırıcı çizgi 85. sütunda, 17–78. satırlar arası. Portre 19–30. satırlar, 7–18. sütunlar. XP barı 27. satır, 33. sütundan başlar. Can barı 36. satır, 17. sütundan başlar. Stat paneli 47. satırdan başlar. Sağda `GEAR` 20. satır, slotlar 27–38. satırlar, 93. sütundan 14 pixel aralıkla. `SKILLS` 47. satır, slotlar 54–65. satırlar. Skill barı 69–74. satırlar, 93. sütundan başlar.
:::

## Birincil kaynak

[Pedro Medeiros — Cluster Sketching and Painting](https://saint11.art/pixel_art_articles/article2/).
`RESOURCES.md` içindeki bu kaynak, ayrıntıdan önce büyük alanlarla yerleşim kurmayı açıklar; ekranın iki sütuna bölünmesi için kullanıldı. Bilgi ile eylemin sütunlara ayrılması bu dersin seçimidir.

**Kazanım:** Bir karakterin bütün durumunu, okunacaklarla yapılacakları karıştırmadan tek ekranda gösterebiliyorsun.

**“Pixel Art 1.96 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.97 — Karaktere özel skill ikonu çiz](/pixel-art/97-skill-icons).
