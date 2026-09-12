# Mücahit'in Engine Academy'si

Odin ile oyun yaparak Game Engine Developer olma çalışma alanı. Sohbet ana mentor kanalı; Academy isteğe bağlı kısa ders okuyucusu.

## Başla

Şimdi [1.2 — Game state'i kur](academy/worlds/01-pong/02-game-state.md) dersinden
devam et. İlk raketi çizdin; sırada iki raket ile topun verisini çizim
çağrılarından ayırmak var.

Repo kökünden çalıştır:

```sh
odin run games/pong -out:/tmp/mucahit-pong
```

Bitirdiğinde kod incelemesi istemen yeterli. Kod ve compiler kontrolünden sonra
sıradaki derse geçilir. Her ders için commit atman veya rapor tutman gerekmez.

## İçerik ve sorumluluk

| Yol | İçerik |
| --- | --- |
| `academy/` | Agent'ın yönettiği dersler, roadmap ve okuyucu |
| `games/` | Senin oyun implementasyonların |
| `labs/` | İsteğe bağlı kısa Odin deneylerin |
| `journal/` | İstersen tuttuğun gözlem notları |
| `progress/` | Agent'ın yönettiği mevcut ders bilgisi |
| `AGENTS.md` | Mentorun uygulayacağı eğitim kuralları |

Pong'un 1.1–1.13 dersleri (13 ders) hazırdır. Bu paket oynanabilir maç, açık
match state, update/render ayrımı ve ilk debug overlay'e kadar gider. Sonraki
dersler, mevcut iş kontrol edildikten sonra oyunda karşılaşılan ihtiyaca göre
hazırlanır.

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
