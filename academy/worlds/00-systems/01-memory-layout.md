---
title: "0.1 — Memory layout"
description: "Bullet field'ları arasında boşluk var mı? Tahmin et, ölç, padding'i göster."
---

# 0.1 — Merminin arasındaki boşluk

Bu ders isteğe bağlı kaynak. Şu an [Pong 1.1](/worlds/01-pong/01-first-paddle)
ile başlıyoruz; bu çalışmayı bitirmen gerekmiyor. İleride dönersen journal
yerine tahminini ve gözlemini sohbette paylaşabilirsin.

**Hedef:** `Bullet` field'larının memory'de nerede başladığını ölç ve aradaki boşlukları açıkla.

## Görev

`labs/00-memory-layout/main.odin` dosyasındaki `Bullet` ile çalış.

1. **Çalıştırmadan önce** toplam size'ı, alignment'ı ve altı field'ın başlangıç
   offset'ini tahmin et. `journal/00-memory-layout.md` içindeki **İlk tahmin**
   bölümüne yaz; bilmediğin type özellikleri için varsayımını belirt.
2. Ölçüm kodunu kendin ekle, çalıştır ve **İlk ölçüm** tablosuna sonuçları kaydet.
3. Field'ları ve boşlukları bir byte çizimiyle göster. Tahmininden farklı bir
   sonucu veya tahmininin neden tuttuğunu 2–3 cümleyle açıkla.

## Geçme koşulu

- Tahmin ve gerçek sonuç birlikte duruyor.
- Altı field'ın offset'i, struct size'ı ve alignment'ı ölçüldü.
- Çizimde field'ların kapladığı byte'lar ve varsa aradaki/sondaki padding gösterildi.
- Bir boşluğun nedenini kendi cümlenle açıklayabiliyorsun.

## Kısa bağlam ve ölçüm araçları

Bir merminin field size'larını toplamak struct'ın gerçek size'ını vermeyebilir.
**Alignment**, bir değerin başlangıç adresinin hangi sayının katı olması
gerektiğini belirtir. Alignment 4 byte ise adres 4'ün katı olmalıdır; bu,
değerin size'ının 4 byte olduğu anlamına gelmez. Compiler'ın bu koşulu sağlamak
için bıraktığı boşluk **padding** olur. Array'deki sonraki instance'ın alignment
koşulunu sağlamak için struct sonunda da boşluk bulunabilir.

`size_of(T)` size'ı, `align_of(T)` alignment'ı, `offset_of(T, field)` field'ın
başlangıç offset'ini verir; sonuçlar byte cinsindendir. Repo kökünde çalıştır:

```sh
odin run labs/00-memory-layout -out:labs/00-memory-layout/lab
```

**Sınır:** Verilen `Bullet` declaration'ını koru; aynı layout'u tahmin edip ölçüyoruz.
Yeniden sıralama TODO'su ve journal'ın sonraki bölümleri 0.2–0.3'e ait.
Journal'daki cache soruları bu derslerin parçası değil.

::: details İpucu 1 — Sıradaki field nerede başlayabilir?
Bir field bittikten sonra sonraki field'ın alignment sınırına bak. Sonraki field
hemen başlayabiliyor mu, yoksa birkaç byte ilerlemek mi gerekiyor?
:::

::: details İpucu 2 — Type'ın size'ını bilmiyorsan
Varsayımını kaydet, sonra `size_of(bool)` ve `align_of(bool)` gibi ölçümler yap.
`u8` bir, `u16` iki, `f32` dört byte'tır; `[2]f32` iki elemanı yan yana tutar.
`offset_of` field adını tırnaksız alır. Bunları `fmt.println` ile yazdırabilirsin.
:::

::: details İpucu 3 — Boşlukları nasıl çıkarırsın?
Her field için bitişi `başlangıç offset'i + field size'ı` ile bul. Sonraki field'ın
offset'inden bu bitişi çıkar; fark aradaki padding'dir. Son field'ın bitişini de
struct'ın toplam size'ından çıkar. Çizimde bu aralıkları boşluk olarak işaretle.
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

Natural layout'ta `u32` 4, `u16` 2 byte alignment istediğinde:

```text
offset  0     1–3       4–7        8–9      10–11
        marker padding sequence   tag      padding
```

`marker` bitince offset 1'deyiz. `sequence` için 4'e ilerleriz; bu üç byte
field'lar arası boşluktur. `tag` bitince offset 10'dayız. Toplamı 12'ye tamamlayan
iki byte, sonraki Packet'ın alignment koşulunu sağlar.

Bu örnek macOS arm64 üzerinde Odin dev-2026-08 ile ölçüldü. Kendi hedefindeki
sonucu compiler ile doğrula. Burada yalnızca layout'u inceliyoruz; performance ölçmüyoruz.

Başvuru: [size_of](https://pkg.odin-lang.org/base/builtin/#size_of),
[align_of](https://pkg.odin-lang.org/base/builtin/#align_of),
[offset_of](https://pkg.odin-lang.org/base/builtin/#offset_of).
:::

**Kazanım:** Artık data ile padding'i ölçümünde ayırabilirsin. İnceleme için
**“0.1 denememi değerlendir”** yaz. Sonraki küçük problem:
[0.2 — Field sırasını değiştir](/worlds/00-systems/02-field-order).
