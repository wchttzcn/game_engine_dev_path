---
title: "1.69 — Level up parıltısı çiz"
description: "Yukarı doğru açılan kısa bir parıltıyla ilerleme anını kutla."
section: Idle oyun · eşya ve monster
---

# {{ $frontmatter.title }}

**Hedef:** İyi bir olayı, yukarı doğru genişleyen bir hareketle anlat.

**Önce şu teknik:** [1.17 — Aynı frame'leri üç farklı süreyle dene](/pixel-art/17-timing) — Yükselişin hızı ve bitişi süreyle kurulur.

## Görev

8×8 transparent RGB dosyada dört frame'lik level up parıltısı çiz. Tek renk `#f6d394` kullan. Frame süreleri 90, 90, 120 ve 350 ms olsun. `art/fx/level-up.aseprite` olarak kaydet.

## Ne zaman bitti?

- Parıltı alttan başlayıp yukarı doğru ilerliyor ve genişliyor.
- Üçüncü frame en geniş; dördüncü frame boş.
- Parçacık sayısı her frame'de artıyor; kaynak 8×8 ve kaydedilmiş.

## Bilmen gereken küçük parça

Idle oyunun oyuncuyu elinde tuttuğu an ilerlemedir. Hasar aşağı ve içe doğru okunur; ilerleme ise **yukarı ve dışa.** Yön tek başına duyguyu taşır.

1.37'deki iyileştirme de yukarı gidiyordu ama dar kalıyordu: bir kişiye yapılan bir iş. Level up ise genişler; olay karakterden taşar. Aynı yönü farklı genişlikle kullanmak, iki efekti birbirinden ayırmaya yeter.

<PixelAnimation title="Level up" :frames='[{"src":"/pixel-art/fx/levelup-1.svg","label":"Kıvılcım","duration":90,"alt":"Alt tarafta tek bir açık pixel."},{"src":"/pixel-art/fx/levelup-2.svg","label":"Yükselme","duration":90,"alt":"İki parçacık yukarı doğru ayrılmış."},{"src":"/pixel-art/fx/levelup-3.svg","label":"Açılma","duration":120,"alt":"Parçacıklar üst yarıda genişleyerek dağılmış."},{"src":"/pixel-art/fx/levelup-4.svg","label":"Bitiş","duration":350,"alt":"Frame tamamen transparent."}]' />

Parıltı karakterden ayrı bir sprite; oyunda karakterin üstüne çizilir. Aynı efekti yeni bir eşya bulunduğunda veya bir yükseltme tamamlandığında da kullanabilirsin. Boş son frame, efektin bir kez oynayıp biteceğini söyler.

## Sınırlar

Tek renk ve dört frame. Yazı, ışık halkası, renk geçişi ve karakterin pozu bu göreve girmiyor.

::: details İpucu 1 — Parıltı iyileştirmeye benziyor
Üst frame'lerde parçacıkları yanlara aç. İyileştirme dar kalır, level up genişler.
:::

::: details İpucu 2 — Hareket yukarı okunmuyor
Her frame'de parçacıklar bir önceki frame'den yukarıda olmalı; aynı satırda kalan pixel bırakma.
:::

::: details İpucu 3 — Tam yerleşim
İlk frame 7. satırda 4. sütun. İkinci frame 5. satırda 4. sütun ile 6. satırda 3. ve 5. sütunlar. Üçüncü frame 1–4. satırlara yayılan altı parçacık.
:::

## Birincil kaynak

[Aseprite — New Frame](https://www.aseprite.org/docs/new-frame/).
`RESOURCES.md` içindeki bu belge, boş ve kopyalanmış frame eklemeyi açıklar. Parıltının yönü, genişlemesi ve süreleri bu dersin özgün seçimidir.

**Kazanım:** Idle oyununun üç temel geri bildirimi tamam: vuruş, ölüm ve ilerleme.

**“Pixel Art 1.69 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.70 — 32×8 can barı çiz](/pixel-art/70-health-bar).
