---
title: Nasıl çalışır?
---

# Kısa ders, gerçek oyun

Sohbet ana mentor kanalın. Academy, istersen dersleri tarayıcıda okuyacağın arşivdir; kodu kendi editöründe yazarsın.

## Şimdi ne yapacağım?

1. Güncel dersi aç:

<CurrentLesson />

2. Dersin görevini o dünyanın oyun dosyasında uygula: Pong için
   `games/pong/main.odin`, Snake için `games/snake/main.odin`.
3. Çalıştır:

```sh
odin run games/pong -out:/tmp/mucahit-pong
odin run games/snake -out:/tmp/mucahit-snake
```

4. Bitirdiğinde kod incelemesi iste. Kod ve compiler kontrolünden geçerse sıradaki
   derse geçilir.
5. İnceleme geçtikten sonra ders commit'lenir: oyun dosyası ve `progress/current.json`
   birlikte, `world(2.1): done - Grid'i çiz` biçiminde. Commit'i ben hazırlarım ama
   atmadan önce her zaman sana sorarım.

Ders başına ayrı journal veya rapor gerekmez. Progress JSON, CSS ve VitePress
bakımını ben yaparım; ara denemelerde ilerleme dosyasını değiştirmem. Okuyucuda
sorun varsa sohbette bildir; onarımı ben üstlenirim.

## Ders biçimi

Her ders önce hedefi, görevi ve kabul koşulunu gösterir. Ardından yalnız göreve
yetecek kadar açıklama gelir. İpuçları ve Deep Dive isteğe bağlıdır. Bir ders
bir ana fikir taşır; sonraki sorun için gerekmeyen teori sonraya kalır.

## İnceleme

İncelemede kodunu, compiler sonucunu ve kontrol edebildiğim oyun davranışını
değerlendiririm. Geçerse sıradaki derse geçeriz. Somut bir hata veya karar için
yararlıysa soru ya da İpucu 1 ile ilerleriz. İstersen İpucu 2, İpucu 3 ve tam
açıklamaya geçeriz. Çözümü senin yerine yazmam; açıkça istediğinde koduna
düzenleme yaparım.

[Yol haritası →](/roadmap)
