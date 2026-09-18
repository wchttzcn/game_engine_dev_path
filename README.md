# Mücahit'in Engine Academy'si

Odin ile oyun yaparak Game Engine Developer olma çalışma alanı. Sohbet ana mentor kanalı; Academy isteğe bağlı kısa ders okuyucusu.

**Pixel Art / Aseprite** sekmesi, çizim deneyimi olmadan kendi oyun asset'lerini
üretmek için paralel bir yol sunar. [Başlangıç paketi](academy/pixel-art/index.md)
yirmi görsel dersle 8×8 nesneler, mage/warrior/priest/archer, iki frame'lik
hareketler ve dört küçük skill VFX'i sunar. Renk/gölge çalışmaları isteğe bağlıdır.
[Renk rehberi](academy/pixel-art/color-guide.md) kaynakları seçer;
[Academy Color Keys](academy/pixel-art/color-keys.md) WASD ile HSV renk ayarlamayı öğretir.
Reventure gibi sade nesnelerle başlayan [art yol haritası](academy/pixel-art/roadmap.md)
karakter ve animasyonda da 8×8'de kalır. Daha büyük canvas ve 60–30–10 sonraya
bırakılır; Samurai Jack ilgisi ileride sahne ihtiyacıyla ele alınır.

## Başla

Oyun geliştirmedeki güncel ders [`progress/current.json`](progress/current.json),
Pixel Art'taki güncel ders [`progress/pixel-art.json`](progress/pixel-art.json) içinde tutulur.
Academy okuyucusunda çalışma alanı sayfası, yol haritası ve bölüm planı
ilgili kaydı okur; burada ders adı tekrar edilmez. Hangi derste olduğunu sohbette de
sorabilirsin.

Repo kökünden çalıştır:

```sh
odin run games/pong -out:/tmp/mucahit-pong
odin run games/snake -out:/tmp/mucahit-snake
```

Bitirdiğinde kod incelemesi istemen yeterli. Kod ve compiler kontrolünden sonra
sıradaki derse geçilir. Her ders için commit atman veya rapor tutman gerekmez.

## İçerik ve sorumluluk

| Yol | İçerik |
| --- | --- |
| `academy/` | Agent'ın yönettiği dersler, roadmap ve okuyucu |
| `games/` | Senin oyun implementasyonların |
| `art/` | Senin Aseprite kaynakların ve oyun asset'lerin |
| `labs/` | İsteğe bağlı kısa Odin deneylerin |
| `journal/` | İstersen tuttuğun gözlem notları |
| `progress/` | Agent'ın yönettiği mevcut ders bilgisi |
| `AGENTS.md` | Mentorun uygulayacağı eğitim kuralları |
| `RESOURCES.md` | Derslerin dayandığı doğrulanmış kaynaklar ve topluluklar |

Pong'un 1.1–1.15 dersleri (15 ders) tamamlandı: oynanabilir maç, açık match
state, update/render ayrımı ve collision shape'lerini görünür kılan ilk debug
overlay. Snake'in 2.1–2.15 dersleri (15 ders) hazırdır; bu paket grid, sabit
kapasiteli gövde array'i, tick tabanlı zaman, occupancy grid, ring buffer ve
allocation ölçümü üzerinden oynanabilir Snake'e gider. Sonraki dersler, mevcut
iş kontrol edildikten sonra oyunda karşılaşılan ihtiyaca göre hazırlanır.

`labs/00-memory-layout/` ile `journal/00-memory-layout.md`, Pong'dan önce
denenen memory layout çalışmasının arşividir. Rotanın parçası değildir; memory
konuları artık oyun ihtiyacı doğdukça Pong ve Snake içinde gelir.

<details>
<summary>Agent için: okuyucu kurulumu ve doğrulama</summary>

Bu komutlar platform bakımı içindir; öğrenme akışının parçası değildir.

```sh
npm install
npm run academy:dev
npm run academy:build
```

</details>

## Kaynaklar

- [Odin rehberi](https://odin-lang.org/docs/overview/)
- [VitePress başlangıç rehberi](https://vitepress.dev/guide/getting-started)
