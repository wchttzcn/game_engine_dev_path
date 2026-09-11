# Mücahit'in Engine Academy'si

Odin ile oyun yaparak Game Engine Developer olma çalışma alanı. Sohbet ana mentor kanalı; Academy isteğe bağlı kısa ders okuyucusu.

## Başla

Şimdi [1.1 — İlk raketi çiz](academy/worlds/01-pong/01-first-paddle.md) dersinden başla veya sohbette **“Pong 1.1'den devam edelim”** yaz. Hazır pencereye tek bir `DrawRectangle` çağrısı ekle, `x` coordinate'ini değiştir ve ekrandaki sonucu gözlemle.

Repo kökünden çalıştır:

```sh
odin run games/pong -out:/tmp/mucahit-pong
```

Kısa gözlemini sohbette anlatıp inceleme iste. Journal tutmak isteğe bağlıdır.
Progress JSON ve Academy altyapısını agent yönetir. World 0 memory dersleri
isteğe bağlı kaynaktır; Pong için ön koşul değildir.

## İçerik ve sorumluluk

| Yol | İçerik |
| --- | --- |
| `academy/` | Agent'ın yönettiği dersler, roadmap ve okuyucu |
| `games/` | Senin oyun implementasyonların |
| `labs/` | İsteğe bağlı kısa Odin deneylerin |
| `journal/` | İstersen tuttuğun gözlem notları |
| `progress/` | Agent'ın kanıtla yönettiği öğrenme kaydı |
| `AGENTS.md` | Mentorun uygulayacağı eğitim kuralları |

Pong'un yalnızca ilk dersi hazırdır. Sonraki dersler, oyunda karşılaştığın gerçek problemlerden hazırlanır.

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
