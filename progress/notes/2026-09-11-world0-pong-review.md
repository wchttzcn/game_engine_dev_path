# World 0 ve Pong 1.1 incelemesi

İnceleme zamanı: 2026-09-11T23:18:13Z.
Mücahit World 0 ve 1.1'i bitirdiğini belirterek inceleme istedi.

## Gözlenen kanıt

- `games/pong/main.odin`: `DrawRectangle(40, 160, 20, 100, rl.WHITE)` doğru çizim döngüsünde. `odin check games/pong` başarılı. GUI çalıştırılmadı; siyah pencerede raketin görünmesi ve x=100 denemesinin tahmin/gözlemi doğrulanmadı. Dosyanın x=40 olması, x=100 denemesinin yapılmadığı anlamına gelmez.
- `labs/00-memory-layout/main.odin`: `npm run lab:check` başarılı; program çalıştırıldı ve exit code 0 döndü. Compiler, iki yerel array'in her birinin 2.800.000 byte olması nedeniyle stack overflow olasılığı uyarısı verdi; bu çalıştırmada çökme gözlenmedi. Bu hesap için instance oluşturmak gerekli değil.
- Compiler: Odin dev-2026-08:8412dc37a. Öğrenci dizinleri dışında, aynı struct declaration'larını kullanan geçici ölçüm bütün offset'leri doğruladı. Bu mentor doğrulamasıdır; öğrencinin eksik ölçümlerini tamamlamış sayılmaz.

## World 0 değerlendirmesi

0.1: İlk tahmin korunmuş. Size 28 ve alignment 4 doğru. Özgün Bullet için active, position, damage, owner, velocity, lifetime offset'leri sırasıyla 0, 4, 12, 14, 16, 24 ölçüldü. Journal'da damage=2 ve velocity=4 yanlış; program yalnız position offset'ini yazdırıyor. `[2]f32` size 8, alignment 4 ölçüldü. Padding çizimi ve öğrencinin padding açıklaması yok. Tahminlerin yanlış olması tek başına sorun değil; ölçümle farkını açıklamak henüz gözlenmedi. Sonuç: needs_revision.

0.2: Aynı altı field ve type korunarak sıra değiştirilmiş; directive yok. İkinci struct'ın size 28, alignment 4 ve journal'daki altı offset'i doğru. Ancak program ikinci struct için active ve position offset'lerini yazdırmıyor; ilk struct için de eksik ölçümler var. Yeniden sıralama öncesi tahmin kaydı, padding karşılaştırması ve neden açıklaması görülmedi. İki size'ın eşit kalması kabul edilebilir bir sonuç. Sonuç: needs_revision.

0.3: Her iki düzenin 2.800.000 byte toplamı doğru. `mib := total_bytes / 1048576` integer division nedeniyle 2 üretiyor; sonuç yaklaşık 2,6703 MiB. `mb := total_bytes / record_count` instance başına byte hesaplıyor; toplam 2,8 MB olmalı. Öğrencinin eşit toplamları instance size ve padding ile ilişkilendiren açıklaması henüz yok. Sonuç: needs_revision.

Öncelikli kavramsal konu: field size, alignment ve başlangıç offset'ini ayırmak. İpucu 1: position field'ının kapladığı aralık üzerinden sıradaki field'ın başlangıcını düşün. Birim dönüşümünde bölmenin operand type'larını ve böleni kontrol et.

## Pong ve devam

1.1'in kod kısmı uygun; tamamlanma için öğrencinin kısa tahmin/gözlem açıklaması bekleniyor. Odak soru: x'i 40'tan 100'e değiştirirken hangi yöne gitmesini bekledi, çalıştırınca ne gördü? Sonuç: needs_revision (kod düzeltmesi değil, eksik davranış ve anlayış kanıtı).

Aktif ders Pong 1.1 olarak korundu. World 0 eksikleri Pong'a devam etmeye engel değil. Cache/AoS/SoA açıklamaları istenmedi; journal doldurmak zorunlu tutulmadı. Öğrenci kodu ve journal değiştirilmedi. Hiçbir beceri için bağımsız transfer kanıtı henüz yok.
