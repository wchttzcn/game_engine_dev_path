# Dünya 0 — Optional memory reference

Bu sayfadaki kısa deneyler memory layout, padding ve data size hakkında merak uyandırmak için duruyor. **Pong için ön koşul değildir.** Şu anki başlangıç [1.1 — İlk raketi çiz](/worlds/01-pong/01-first-paddle).

Journal doldurmak veya bu dersleri sırayla bitirmek gerekmez. Pong'da bir problem pointer, slice, ownership, lifetime ya da allocation farkındalığı gerektirirse, gerekli en küçük fikri o anda ele alırız.

## Mevcut optional deneyler

| Ders | Soru |
| --- | --- |
| [0.1 — Memory layout'u ölç](/worlds/00-systems/01-memory-layout) | `Bullet` memory'de nasıl yerleşiyor? |
| [0.2 — Field sırasını değiştir](/worlds/00-systems/02-field-order) | Field order padding'i değiştirir mi? |
| [0.3 — Memory budget hesapla](/worlds/00-systems/03-memory-budget) | Çok sayıda instance ne kadar data taşır? |

Bu dosyalar ve mevcut learner notları korunur. Cache locality, AoS/SoA, ECS, SIMD ve allocator design, oyunlarda gerçek ihtiyaç oluştuğunda gelir.
