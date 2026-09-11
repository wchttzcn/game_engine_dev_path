---
title: Field Sırası ve Padding
---

# 0.2 — Sıra değişince ne değişir?

Bu ders isteğe bağlı kaynak; [Pong'a başlamak](/worlds/01-pong/01-first-paddle)
için ön koşul değil. İleride dönersen journal yerine tahminini ve gözlemini
sohbette paylaşabilirsin.

**Hedef:** Aynı `Bullet` data'sını farklı sırada bildirip padding'in yerini ve toplam size'ı nasıl değiştirdiğini ölç.

## Görev

`labs/00-memory-layout/main.odin` içinde özgün `Bullet` declaration'ını koru. Yanına `Bullet_Reordered` adında ikinci bir `struct` ekle. Altı field'ın adı ve type'ı aynı kalmalı:

`active`, `position`, `damage`, `owner`, `velocity`, `lifetime`.

Yalnızca declaration sırasını değiştir. Çalıştırmadan önce `journal/00-memory-layout.md` içindeki **Yeniden sıralama** bölümüne yeni type'ın size'ını ve field offset'lerini tahmin et. Ardından programın iki type'ın size'ını, alignment'ını ve field offset'lerini yazdırmasını sağla. İki ölçümü tabloya kaydet; padding'in eski ve yeni yerini bir çizimle göster.

## Bitti sayılır

- Tahmin ölçümden önce journal'da duruyor.
- Program iki type'ın `size_of`, `align_of` ve field offset'lerini yazdırıyor.
- Journal iki ölçümü, padding çizimini ve değişimin nedenini kendi cümlenle içeriyor.
- Derleme geçiyor: `npm run lab:check`.

Bir önceki [0.1 ölçümün](/worlds/00-systems/01-memory-layout), natural layout'ta boşluğun nereden geldiğini göstermişti. Bu kez veri aynı; compiler'a field'ları farklı sırada bildiriyorsun. Küçük bir oyun verisinde bile birkaç byte, çok sayıda instance'ta tekrar eder. Burada en küçük size'ı aramıyorsun; field sırası ile ölçtüğün layout arasındaki ilişkiyi gözlüyorsun.

## Sınırlar

- `Bullet` tanımını değiştirme.
- `Bullet_Reordered` içindeki altı field'ın type'ını, adını veya sayısını değiştirme.
- `#packed`, `#align` ya da benzeri bir directive kullanma. Böylece yalnızca field sırasını incelersin.
- Sonucun performance hakkında bir iddia olmasın; burada yalnızca layout'u ölçüyorsun.

::: details İpucu 1 — tahmin yöntemi
0.1 çiziminde bir boşluk seç. O boşluktan sonraki field'ın önüne başka bir field gelse alignment sınırı nasıl etkilenir?
:::

::: details İpucu 2 — alignment'a göre grupla
Yüksek alignment isteyen field'ları birbirine yakın yazmayı dene. Önce yeni offset'leri tahmin et, sonra iki type'ın ölçümlerini yan yana koy. Toplam size aynı kalsa da boşlukların yeri değişebilir.
:::

::: details İpucu 3 — açıklama kontrolü
Her düzende `sonraki field'ın offset'i − (mevcut field'ın offset'i + size'ı)` aradaki boşluğu verir. Son field'ın bitişiyle toplam size arasındaki boşluğu da ekle. İki çizimde bu aralıkları karşılaştır; size farkını hangi padding değişikliklerinin oluşturduğunu açıkla.
:::

::: details Deep Dive — neden directive yok?
`#packed` ve özel alignment kuralları binary formatlar veya hardware interface'leri için gerekli olabilir. Bu derste bunlar field sırası etkisini gizler. Önce natural layout'u oku; özel layout kararlarını ihtiyaç doğduğunda tartışacağız. Odin’in [size_of](https://pkg.odin-lang.org/base/builtin/#size_of), [align_of](https://pkg.odin-lang.org/base/builtin/#align_of) ve [offset_of](https://pkg.odin-lang.org/base/builtin/#offset_of) built-in'leri ölçüm için yeterli.
:::

## Sonraki

**Kazanım:** Field sırasının padding'e etkisini kendi ölçümünle açıklayabilirsin. **“0.2 denememi değerlendir”** yaz. Sonraki küçük uygulama: [0.3 — Memory budget](/worlds/00-systems/03-memory-budget).
