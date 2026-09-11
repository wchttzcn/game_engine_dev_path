---
title: Nasıl çalışır?
---

# Kısa ders, gerçek oyun

Sohbet ana mentor kanalın. Academy, istersen dersleri tarayıcıda okuyacağın arşivdir; kodu kendi editöründe yazarsın.

## Şimdi ne yapacağım?

1. [1.1 — İlk raketi çiz](/worlds/01-pong/01-first-paddle) dersini aç.
2. `games/pong/main.odin` içindeki hazır pencereye görevi ekle.
3. Çalıştır:

```sh
odin run games/pong -out:/tmp/mucahit-pong
```

4. Gördüğünü ve `x` coordinate'i değişince ne olduğunu sohbette kısaca anlat. **“Pong 1.1 denememi değerlendir”** yaz.

Journal tutmak isteğe bağlıdır. Progress JSON, CSS ve VitePress bakımını ben
yaparım. Okuyucuda sorun varsa sohbette bildir; onarımı ben üstlenirim.

## Ders biçimi

Her ders önce hedefi, görevi ve kabul koşulunu gösterir. Ardından yalnız göreve
yetecek kadar açıklama gelir. İpuçları ve Deep Dive isteğe bağlıdır. Bir ders
bir ana fikir taşır; sonraki sorun için gerekmeyen teori sonraya kalır.

## World 0

Memory layout, pointer, slice ve allocation notları [World 0](/worlds/00-systems/) altında optional reference olarak duruyor. Pong'a başlamak için onları bitirmen, journal tablosu doldurman veya bir açıklama yazman gerekmez. Bir oyun problemi bu kavramlardan birini gerektirirse onu o anda küçük bir görevle ele alırız.

## İnceleme

İncelemede önce gözlediğim davranışı söylerim. Sonra tek önemli soruyu veya Hint 1'i veririm. İstersen Hint 2, Hint 3 ve tam açıklamaya ilerleriz. Çözümü senin yerine yazmam; açıkça istediğinde koduna düzenleme yaparım.

[Yol haritası →](/roadmap)
