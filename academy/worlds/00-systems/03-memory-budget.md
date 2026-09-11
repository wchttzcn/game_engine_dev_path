---
title: Bellek Bütçesi
---

# 0.3 — 100.000 mermi ne kadar yer kaplar?

## Hedef

Bir önceki derste iki gerçek `size_of` sonucu elde ettin. Şimdi bu ölçümleri oyun ölçeğine taşıyacaksın: bir mermi tanımı küçük görünür; on binlercesi ise açık bir bellek bütçesidir.

**Hedef:** Ölçülmüş bir örnek boyutundan veri için gereken alanı hesaplamak.
Bu kısa görev journal'da çözülür.

## Challenge

Journal’daki ilk `Bullet` ve `Bullet_Reordered` ölçümlerini kullan. Hesaplamadan
önce 100.000 örnekte farkın nasıl büyümesini beklediğini tek cümleyle yaz.
Her biri için gereken alanı hesapla ve mevcut “100.000 Bullet hesabı” tablosunu doldur.

Formül, herhangi bir kayıt türü için şöyledir:

```text
toplam_bayt = kayıt_boyutu_bayt * kayıt_sayısı
MiB = toplam_bayt / 1.048.576
```

Buradaki `kayıt_boyutu_bayt`, ölçtüğün `size_of` sonucudur; tahmin veya alan boyutlarının ham toplamı değildir. İstersen ondalık MB sütununu da doldur: 1 MB = 1.000.000 bayt. MiB ile MB’yi aynı birim gibi yazma.

Sonra iki yerleşimin farkını bir veya iki cümleyle açıkla: 100.000 örnekte hangi düzen daha az yer kaplıyor ve fark nereden geliyor? Eğer ölçümlerin eşitse, bunu da kanıt olarak yaz; eşit sonuç geçerlidir.

## Sınırlar

- Yeni Odin kodu, dizi veya allocation ekleme.
- Yeni ölçüm uydurma; 0.2’de kaydettiğin gerçek değerleri kullan.
- Toplam footprint’i süreç RAM’i, oyun RAM’i veya performans süresi diye adlandırma. Bu yalnızca bu veri dizisinin teorik eleman alanıdır.

## Kabul kanıtı

- Journal tablosunda iki düzen için bayt ve MiB değeri var.
- Hesap `size_of` ölçümüne dayanıyor.
- MB sütunu doldurulduysa birimi doğru etiketli.
- Kısa yorum, farkı padding/örnek boyutuyla bağlıyor.

Mentor incelemesinde kendi ölçümünden toplam alanı nasıl türettiğini göster.
`npm run lab:check` kullanabilirsin; bu derste kod değişmediği için tekrar
çalıştırmak geçme koşulu değil, matematik yorumunu da doğrulamaz.

::: details İpucu 1 — tek birimden başla
İlk olarak yalnızca bayt hesabını yap. Birim dönüşümünü ikinci adımda yapınca yanlış daha kolay görünür.
:::

::: details İpucu 2 — hangi sayı kaynak?
Alanların tek tek boyutlarını toplama. Struct içindeki padding de `size_of` sonucunun parçasıdır.
:::

::: details İpucu 3 — yorum sorusu
İki örnek boyutu arasındaki fark, 100.000 kayıt için kaç kez tekrar eder? Bu ilişkiyi cümlede kullan.
:::

::: details Deep Dive — MB ve MiB
MB ondalık ölçüdür: 1.000.000 bayt. MiB ikili ölçüdür: 1.048.576 bayt. Araçlar ikisini farklı kullanabilir; bu yüzden sonuç yanında birimi yazmak, sayıyı tek başına yazmaktan daha değerlidir.
:::

## Sonraki

[0.2 — Alan sırası](/worlds/00-systems/02-field-order) ölçümlerine dönmen gerekirse geri dön. Sonraki planlanan adım için [Dünya 0 dizinine](/worlds/00-systems/) bak; 0.4 henüz hazırlanmış bir ders değil.
