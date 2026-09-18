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

Her ders önce hedefi, görevi ve kabul koşulunu gösterir. Sonra **Elindekiler**
gelir: struct'ın tamamı, proc imzaları (gövdeleri boş) ve ilk kez gördüğün her
API çağrısının imzası. Ders sana yalnız iki şeyi vermez — proc gövdeleri ve bu
procleri nereden çağıracağın. Veri modelini tasarlamak ödev değil; algoritmayı
kurmak ödev.

Ardından üç ipucu, sabit rollerle: **İpucu 1** algoritmanın adımlarını düz
yazıyla söyler, **İpucu 2** o derse özgü tuzağı gösterir, **İpucu 3** tam
çözümdür — gövdeler ve çağrı yeri, saklanan hiçbir şey kalmaz. Üçüncüsünü
açmak "pes ettim" demek değil, dersin sonunu görmek demek.

Kaynaklar rollerine göre ayrı. **Kaynak** zorunludur ve Odin'dir: dersin
kullandığı API, ders *sırasında* bakılacak yer. **Daha derine** isteğe bağlıdır
ve ders *bittikten sonra* okunur: kavram ve desen kaynakları — Game Programming
Patterns, GDC konuşmaları, C veya C++ ile yazılmış her şey. Bir dersi yapmak
için oraya bakman hiçbir zaman gerekmez; gerekiyorsa dersin gövdesi eksiktir,
bana söyle.

Bir ders bir ana fikir taşır ve 600 kelimeyi aşmaz. Aşıyorsa iki fikir
sıkışmış demektir, ders ikiye bölünür. Bu sınırlar `npm test` ile denetlenir.

## İnceleme

İncelemede kodunu, compiler sonucunu ve kontrol edebildiğim oyun davranışını
değerlendiririm. Geçerse sıradaki derse geçeriz. Somut bir hata veya karar için
yararlıysa soru ya da İpucu 1 ile ilerleriz. İstersen İpucu 2, İpucu 3 ve tam
açıklamaya geçeriz. Çözümü senin yerine yazmam; açıkça istediğinde koduna
düzenleme yaparım.

[Yol haritası →](/roadmap)
