---
title: Memory Budget
---

# 0.3 — 100.000 mermi ne kadar memory kaplar?

Bu ders isteğe bağlı kaynak; [Pong'a başlamak](/worlds/01-pong/01-first-paddle)
için ön koşul değil. İleride dönersen hesabını journal yerine sohbette
paylaşabilirsin.

**Hedef:** Ölçtüğün `Bullet` size'ından 100.000 instance'ın kapladığı yeri ve padding farkının toplam etkisini hesapla.

## Görev

`journal/00-memory-layout.md` içindeki `Bullet` ve `Bullet_Reordered` ölçümlerini kullan. Hesaplamadan önce, farkın 100.000 instance'ta nasıl büyüyeceğini tek cümleyle tahmin et. Mevcut **100.000 Bullet hesabı** tablosunu iki düzenin byte ve MiB değerleriyle doldur. Ardından hangi düzenin daha az memory kapladığını ve farkın padding ile instance size'ından nasıl geldiğini bir veya iki cümleyle açıkla. Ölçümler eşitse bunu da kanıt olarak yaz.

## Bitti sayılır

- Journal tablosunda iki düzen için byte ve MiB değeri var.
- Hesap, 0.2'de ölçtüğün `size_of` sonucuna dayanıyor.
- Kısa yorum farkı padding ve instance size'ıyla bağlıyor.

Bir mermi tanımı tek başına küçük görünebilir. Oyun aynı tanımdan binlerce instance taşıdığında, struct size'ındaki fark her instance'ta tekrar eder. Bu görev yeni kod yazdırmaz; önceki gerçek ölçümü bir memory budget'a çevirir.

İhtiyacın olan hesap:

```text
total_bytes = record_size_bytes * record_count
MiB = total_bytes / 1.048.576
```

Buradaki record size, field size'larının ham toplamı değil, 0.2'de ölçtüğün `size_of` sonucudur. Çünkü padding de her instance'ın parçasıdır. Tabloda decimal MB sütunu varsa onu da doldurabilirsin; 1 MB = 1.000.000 byte, 1 MiB = 1.048.576 byte'tır.

## Sınırlar

- Yeni ölçüm uydurma; 0.2’de kaydettiğin gerçek değerleri kullan.
- Bu hesap yalnızca array elemanlarının kapladığı teorik yeri gösterir; tüm process'in veya oyunun RAM kullanımı değildir, çalışma süresini de ölçmez.

::: details İpucu 1 — tek birimden başla
Önce yalnızca byte cinsinden düşün: tek instance'ın kapladığı yer kaç kez tekrar ediyor? Birim dönüşümünü sonra yap.
:::

::: details İpucu 2 — hangi sayı kaynak?
Tablodaki 0.2 ölçümünü kullan. Field'ların tek tek size'larını toplarsan padding'i kaybedersin.
:::

::: details İpucu 3 — yorum sorusu
İki `size_of` sonucu arasındaki byte farkını 100.000 ile çarp. Bu sayı yorumunda gördüğün toplam farktır.
:::

::: details Deep Dive — MB ve MiB
MB decimal ölçüdür: 1.000.000 byte. MiB binary ölçüdür: 1.048.576 byte. Araçlar ikisini farklı kullanabilir; bu yüzden sonuç yanında birimi yazmak, sayıyı tek başına yazmaktan daha değerlidir.
:::

## Sonraki

**Kazanım:** Tek instance'ın ölçümünden çok sayıda instance için gereken memory'yi hesaplayabilirsin. İstersen **“0.3 denememi değerlendir”** yaz. Aktif oyun başlangıcı [Pong 1.1](/worlds/01-pong/01-first-paddle); World 0'da devam etmen gerekmiyor.
