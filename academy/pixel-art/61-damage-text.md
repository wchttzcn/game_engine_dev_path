---
title: "1.61 — Süzülen hasar sayısını çiz"
description: "1.21'deki rakamları yukarı süzüp kaybederek vuruşu sayıyla göster."
section: Idle oyun · eşya ve monster
---

# {{ $frontmatter.title }}

**Hedef:** Bir sayıyı hareket ettirerek olayın parçası hâline getir.

**Önce şu teknik:** [1.21 — 3×5 rakam seti çiz](/pixel-art/21-digits) — Sayı yeniden çizilmez; hazır rakam seti taşınır.

## Görev

16×12 transparent RGB dosyada dört frame kur: hasar sayısı alttan başlayıp yukarı süzülsün, son frame boş olsun. Normal vuruş için `#e9dfc2`, kritik için `#e3ab52` kullan. Frame süreleri 70, 90, 120 ve 200 ms olsun. `art/idle-ui/damage-text.aseprite` olarak kaydet.

## Ne zaman bitti?

- Sayı her frame'de bir öncekinden yukarıda; son frame tamamen boş.
- Rakamlar 1.21'deki setle birebir aynı; yeniden çizilmemiş.
- Kritik varyantı yalnız renkle ayrılıyor; kaynak 16×12.

## Bilmen gereken küçük parça

Idle oyunda ekranın en çok değişen parçası sayıdır. Hasar barın içinde gizli kalırsa oyuncu vuruşun büyüklüğünü hissetmez. **Sayıyı hareket ettirmek** en ucuz çözümdür: belirir, yükselir, kaybolur.

Yeni çizim yok — 1.21'deki rakamları taşıyorsun. Yükselme, sayının olaya ait olduğunu; kaybolma ise olayın bittiğini söyler. Kritik vuruşu ayırmak için de yeni bir çizim gerekmez: **aynı rakamlar, farklı renk.** Biçimi değiştirmek yerine rengi değiştirmek okunurluğu korur.

<PixelAnimation title="Hasar sayısı" :frames='[{"src":"/pixel-art/craft/damage-1.svg","label":"Belirme","duration":70,"alt":"Sayı alt satırda belirdi."},{"src":"/pixel-art/craft/damage-2.svg","label":"Yükselme","duration":90,"alt":"Sayı canvas&#39;ın ortasına çıktı."},{"src":"/pixel-art/craft/damage-3.svg","label":"Tepe","duration":120,"alt":"Sayı üst satıra ulaştı."},{"src":"/pixel-art/craft/damage-4.svg","label":"Bitiş","duration":200,"alt":"Frame tamamen transparent."}]' />

Kritik vuruş için aynı dört frame'i altın renkle çoğalt; istersen bir pixel daha yükseğe çıkar. Oyunda sayının değeri koddan gelir; senin çizdiğin şey **hareketin biçimi** — nereden başlayıp nerede bittiği.

## Sınırlar

Yalnız yükselme ve kaybolma. Yana savrulma, büyüyüp küçülme ve sayı yığılması bu göreve girmiyor.

::: details İpucu 1 — Sayı okunmuyor
Rakamları yeniden çizme; 1.21'deki seti kopyala. Kendi elinle çizmek her seferinde farklı çıkar.
:::

::: details İpucu 2 — Hareket ani duruyor
Ortadaki frame'i atlamış olabilirsin. Üç konum ikiden çok daha akıcı okunur.
:::

::: details İpucu 3 — Tam yerleşim
Sayı 5–11. sütunlarda. İlk frame 8–12. satırlar, ikinci 5–9., üçüncü 2–6. satırlar.
:::

## Birincil kaynak

[Aseprite — Frame Duration](https://www.aseprite.org/docs/frame-duration/).
`RESOURCES.md` içindeki bu belge, her frame'e ayrı süre vermeyi açıklar; [New Frame](https://www.aseprite.org/docs/new-frame/) kopyalanmış frame içindir. Yükselme mesafesi ve kritik rengi bu dersin seçimidir.

**Kazanım:** Vuruşun büyüklüğü artık ekranda görünüyor ve bitişi var.

**“Pixel Art 1.61 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.62 — Level up parıltısı çiz](/pixel-art/62-level-up).
