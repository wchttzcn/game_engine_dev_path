---
title: "0.1 — Bellek yerleşimi"
description: "Bullet alanları arasında boşluk var mı? Tahmin et, ölç, padding'i göster."
---

# 0.1 — Merminin arasındaki boşluk

**Hedef:** `Bullet` alanlarının bellekte nerede başladığını ölç ve aradaki boşlukları açıkla.

Bir merminin konumu, hızı ve hasarı farklı alanlarda tutuluyor. Bu alanların
boyutlarını topladığında struct'ın gerçek boyutunu bulabilecek misin?

**Alignment**, bir değerin başlayabileceği adreslerin hizalama aralığıdır.
Örneğin 4 bayt hizalanan alan, uygun bir 4 katında başlar. Derleyicinin bu
sınırı sağlamak için bıraktığı boşluk **padding** olur. Struct sonunda da,
dizideki sonraki örneği hizalı başlatmak için boşluk bulunabilir.

## Görev

`labs/00-memory-layout/main.odin` dosyasındaki `Bullet` ile çalış.

1. **Çalıştırmadan önce** toplam boyutu, hizalamayı ve altı alanın başlangıç
   ofsetini tahmin et. `journal/00-memory-layout.md` içindeki **İlk tahmin**
   bölümüne yaz; bilmediğin tür özellikleri için varsayımını belirt.
2. Ölçüm kodunu kendin ekle. `size_of(T)` boyutu, `align_of(T)` hizalamayı,
   `offset_of(T, alan)` alanın başlangıç ofsetini verir; sonuçlar bayt cinsindendir.
3. Repo kökünde çalıştır; **İlk ölçüm** tablosuna sonuçları kaydet:

```sh
odin run labs/00-memory-layout -out:labs/00-memory-layout/lab
```

4. Alanları ve boşlukları bir bayt çizimiyle göster. Tahmininden farklı bir
   sonucu veya tahmininin neden tuttuğunu 2–3 cümleyle açıkla.

## Sınır

Verilen `Bullet` tanımını koru; aynı yerleşimi tahmin edip ölçüyoruz.
Dosyadaki yeniden sıralama TODO'su ve journal'ın sonraki bölümleri **0.2–0.3'e ait**.
Bu görev için doldurman gerekenler yalnızca ilk tahmin, ilk ölçüm ve çizim.

## Geçme koşulu

- Tahmin ve gerçek sonuç birlikte duruyor.
- Altı alanın ofseti, struct boyutu ve hizalaması ölçüldü.
- Çizimde alanların kapladığı baytlar ve varsa aradaki/sondaki padding gösterildi.
- Bir boşluğun nedenini kendi cümlenle açıklayabiliyorsun.

`npm run lab:check` derleyici kontrolüdür. Ders değerlendirmesi için **“0.1 denememi değerlendir”** yaz.

::: details İpucu 1 — Sıradaki alan nerede başlayabilir?
Bir alan bittikten sonra sonraki alanın hizalama sınırına bak. Sonraki alan
hemen başlayabiliyor mu, yoksa birkaç bayt ilerlemek mi gerekiyor?
:::

::: details İpucu 2 — Türün boyutunu bilmiyorsan
Varsayımını kaydet, sonra `size_of(bool)` ve `align_of(bool)` gibi ölçümler yap.
`u8` bir, `u16` iki, `f32` dört bayttır; `[2]f32` iki elemanı yan yana tutar.
`offset_of` alan adını tırnaksız alır. Bunları `fmt.println` ile yazdırabilirsin.
:::

::: details İpucu 3 — Sondaki boşluğu kaçırdın mı?
Son alanın başlangıç ofsetine kendi boyutunu ekle. Bulduğun bitiş ile struct'ın
toplam boyutunu karşılaştır. Fark varsa çiziminde bu bölgeye de yer ver.
:::

::: details Deep Dive — Farklı bir örneği birlikte çöz
Bu bölüm isteğe bağlıdır; Bullet'ın cevabını içermez.

```odin
Packet :: struct {
    marker: u8,
    sequence: u32,
    tag: u16,
}
```

Doğal yerleşimde `u32` 4, `u16` 2 bayt hizalama istediğinde:

```text
ofset   0     1–3       4–7        8–9      10–11
        marker padding sequence   tag      padding
```

`marker` bitince ofset 1'deyiz. `sequence` için 4'e ilerleriz; bu üç bayt
alanlar arası boşluktur. `tag` bitince ofset 10'dayız. Toplamı 12'ye tamamlayan
iki bayt, sonraki Packet'ın hizalı başlamasını sağlar.

Bu örnek macOS arm64 üzerinde Odin dev-2026-08 ile ölçüldü. Kendi hedefindeki
sonucu derleyiciyle doğrula. Burada yalnızca yerleşimi inceliyoruz; hız ölçmüyoruz.

Başvuru: [size_of](https://pkg.odin-lang.org/base/builtin/#size_of),
[align_of](https://pkg.odin-lang.org/base/builtin/#align_of),
[offset_of](https://pkg.odin-lang.org/base/builtin/#offset_of).
:::

**Sonraki küçük problem:** [0.2 — Alan sırasını değiştir](/worlds/00-systems/02-field-order).
