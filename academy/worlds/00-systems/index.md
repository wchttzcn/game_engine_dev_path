# Dünya 0 — Belleği görünür kıl

**Şimdi yapacağın iş:** [0.1’de Bullet yerleşimini tahmin et, sonra ölç](/worlds/00-systems/01-memory-layout). Yeniden sıralama ve bütçe hesabı ayrı derslerdir; hepsini ilk oturumda bitirmen beklenmez.

Bu dünya kısa bellek deneylerinden Pong’a geçiş içindir. Çalışmalarını kendi editöründe yapar, tahmin ve çıktını sohbette mentor incelemesine getirirsin. Bu sayfa isteğe bağlı yol göstericidir.

**Durum:** 0.1, 0.2 ve 0.3 hazırlanmıştır. Aktif ders 0.1’dir; henüz gözlenmiş deneme veya tamamlanma yoktur. Diğer adımlar planlanmıştır. Derleme başarısı, doğru açıklama ve bağımsız uygulama ayrı değerlendirilir.

## Hazır mikro dersler

İlk üç ders aynı `labs/00-memory-layout` laboratuvarını kullanır. Her seferinde tek yeni soru sorulur; ilk ölçümler sonraki karşılaştırma için korunur.

| Ders | Tek görev | İncelemeye getireceğin kanıt |
| --- | --- | --- |
| [0.1 — Yerleşimi ölç](/worlds/00-systems/01-memory-layout) | Mevcut `Bullet` için boyut, hizalama ve alan ofsetlerini tahmin et; ölç. | İlk tahmin, çıktı ve farkın kısa açıklaması. |
| [0.2 — Alan sırasını değiştir](/worlds/00-systems/02-field-order) | Aynı alanları ve türleri farklı sıraya koy; iki yerleşimi karşılaştır. | Yeni tahmin, iki ölçüm ve padding’in nerede değiştiği. |
| [0.3 — Bellek bütçesini hesapla](/worlds/00-systems/03-memory-budget) | İki yerleşimin 100.000 örnek için veri alanını hesapla. | Bayt ve MiB sonuçları, isteğe bağlı MB; hesabın neyi kapsadığının açıklaması. |

0.2’de alan ve türleri korumak, yalnız alan sırasının etkisini incelemek içindir. 0.3 için gerçekten 100.000 nesne ayırman gerekmez; bu ders teorik veri alanı hesabıdır. Cache, AoS/SoA ve benchmark bu üç derse ek görev değildir; Snake’te erişim maliyeti doğduğunda ayrı deneyler olacak.

## Sonraki kısa dersler — planlandı

**0.4 — Değer, pointer ve değişiklik.** Küçük oyuncu durumunun bir fonksiyon çağrısından sonra değişip değişmeyeceğini tahmin et. Önce/sonra çıktısı getir. Odak sorusu: “Hangi veriye erişiliyor, hangisi kopyalanıyor?”

**0.5 — Slice ve yaşam süresi.** Veri deposunu ve ona erişen görünümü çiz. Güvenli bir paylaşım örneği göster. Odak sorusu: “Verinin sahibi kim, görünüm ne zamana kadar kullanılabilir?” Geçersiz erişim üretmek dersin hedefi değildir.

**0.6 — Allocation ve kaynak ömrü.** Küçük bir kaynağın oluşturulma, kullanım ve bırakılma noktalarını göster. Odak sorusu: “Bu kaynak hangi yolda, kim tarafından bırakılıyor?” Özel allocator yazmak bu aşamanın şartı değildir; arena ve pool sonraki oyunlarda ihtiyaçla ele alınır.

## Pong’a geçiş — planlandı

Konum ve hız taşıyan birkaç nesnenin durumunu güncelleyen küçük konsol programı kur. Sonra tek bir güncelleme kuralını bağımsız değiştir. İncelemeye çalışan çıktı ve verinin sahiplik/yaşam süresi açıklamasını getir. Amaç yeni bir altyapı projesi başlatmak değil, temel modeli oyun döngüsüne taşıyabildiğini görmek.

Sonraki dünya: [Pong](/worlds/01-pong/).
