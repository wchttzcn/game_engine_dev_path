# Mücahit'in Engine Academy'si

Odin ile oyun geliştirerek bellek, simülasyon ve oyun motoru tasarımı öğrenmek
için kişisel çalışma alanı. Sohbet ana mentor kanalı; Academy isteğe bağlı ders
arşivi, alıştırmalar kendi editöründe.

## Başla

Sohbette **“0.1 dersinden devam edelim”** yaz. İlk görev yalnızca Bullet
yerleşimini tahmin edip ölçmek. Yeniden sıralama 0.2, 100.000 mermi hesabı 0.3.
Üçü aynı lab ve journal dosyasını kullanır; yalnızca aktif görevi yap.

## İsteğe bağlı ders sitesi

Node.js ve npm ile, repo kökünde:

```sh
npm install
npm run academy:dev
```

Terminalin gösterdiği yerel adresi aç. Varsayılan adres
`http://127.0.0.1:5173`. İlk görev: **0.1 — Bellek yerleşimi**.

Odin'in `PATH` üzerinde bulunması gerekir. Bu ilk kurulum macOS arm64 üzerinde
Node v24.14.1 ve Odin dev-2026-08 kullanır.

```sh
odin version
npm run lab:check
```

`lab:check` ilk alıştırmanın derleyici kontrolüdür; dersi geçtiğini söylemez.
Tahminlerini yazdıktan ve ölçüm kodunu ekledikten sonra:

```sh
odin run labs/00-memory-layout -out:labs/00-memory-layout/lab
```

## İçerik ve sorumluluk

| Yol | İçerik |
| --- | --- |
| `academy/` | Dersler, roadmap, çalışma rehberi ve tarayıcı arayüzü |
| `labs/` | Senin kısa Odin deneylerin |
| `journal/` | Tahminlerin, gözlemlerin ve değerlendirme notların |
| `progress/` | Kalıcı ders ve beceri durumu |
| `AGENTS.md` | Mentorun uygulayacağı eğitim kuralları |
| `chatgpt/` | Kullanıcının sağladığı yedi dosyalık özgün bağlam paketi |

Oyunlar başladığında `games/`, ortak sistemler ortaya çıktığında `engine/`
eklenecek. 0.1–0.3 mikro dersleri hazır; sonraki aşamalar roadmap ve bölüm planıdır.

İlerleme yerel JSON kaydından okunur. Tarayıcıda bir sayfayı açmak tamamlanma
işaretlemez. Mentor değerlendirmesinden sonra kayıt güncellenir. Kaydın şeması ve
durum geçişleri `progress/README.md` içinde açıklanır.

## Doğrulama

VitePress `2.0.0-alpha.20` sürümüne sabitlenmiştir. Bu bir ön sürümdür; V0'ın
yerel kullanımı için build ve gezinme kontrolleriyle değerlendirilir. 1.6.4'ün
eski Vite bağımlılığı npm denetiminde açık bildirdiği için güncel hat seçilmiştir.

```sh
npm run academy:build
npm run lab:check
```

İlk komut siteyi üretir ve dahili Markdown bağlantılarını kontrol eder. İkincisi
Odin sözdizimi/tip kontrolü yapar. Üretilen siteyi incelemek için
`npm run academy:preview` kullanabilirsin.

## Kaynaklar

- [VitePress başlangıç rehberi](https://vitepress.dev/guide/getting-started)
- [Odin dil rehberi](https://odin-lang.org/docs/overview/)

Sürüm kontrolü henüz başlatılmadı; bu klasörde Git geçmişi veya otomatik commit yok.
