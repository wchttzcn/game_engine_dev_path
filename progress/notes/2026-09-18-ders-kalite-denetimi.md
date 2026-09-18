# Ders kalite denetimi — üç dünya, 43 ders

Tarih: 2026-09-18. Kapsam: `academy/worlds/01-pong` (15), `02-snake` (13),
`03-breakout` (15) + üç `index.md`. Ölçüt: `AGENTS.md:35-95` ders yazım
sözleşmesi, `academy/workflow.md` "Ders biçimi", `scripts/lesson-shape.test.mjs`.

## Tek cümlelik sonuç

İçerik iyi, biçim borcu büyük: 43 dersin 28'i (dünya 1 ve 2'nin tamamı) yeni
biçimin dışında ve hiçbir test onları görmüyor; dünya 3 biçime uyuyor ama testin
denetlemediği dört gerçek defekt taşıyor — biri derlenmeyen kod.

## 1. Biçim uçurumu

`scripts/lesson-shape.test.mjs:16`:

```js
const SHAPED = { '03-breakout': [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15] };
```

`npm test` 30/30 geçiyor çünkü dünya 1 ve 2 kapsam dışı. Fiili durum:

| | Dünya 1 (15) | Dünya 2 (13) | Dünya 3 (15) |
|---|---|---|---|
| `## Elindekiler` | yok | yok | var |
| `## Kaynak` | yok (`Birincil kaynak`) | yok (`Birincil kaynak`) | var |
| `## Kazanım` H2 | yok (satır içi) | yok (satır içi) | var |
| Yasaklı başlık | 15/15 | 13/13 | 0 |
| İpucu 3'te kod | 0/15 | 11/13 (kısmi) | 15/15 |

En ağır sonuç `## Elindekiler`'in yokluğu değil, **İpucu 3'ün rolü**: dünya 1'de
15 dersin hiçbirinin İpucu 3'ünde kod bloğu yok, ortalama 21-38 kelime. Sözleşme
"tam çözüm — gövdeler ve çağrı yeri, saklanan hiçbir şey kalmaz" diyor; pong
ipuçları genelden özele daralan bir zincir, yeni biçimin sabit rol ayrımı
(adımlar / tuzak / tam kod) hiçbirinde yok. Dünya 2'de kod var ama kısa (34-97
kelime), çoğu yalnız kritik formülü veriyor.

## 2. Gerçek defektler (öğrenciyi tıkar)

| Yer | Sorun | Düzeltme |
|---|---|---|
| `03-breakout/14-tuning-panel.md:84` | `vel = normalize(yön) * ...` — `normalize` Odin builtin değil (`core:math/linalg`'de, derste import yok). `odin check`: "Undeclared name: normalize" | `rl.Vector2Normalize(yön)` — ek import istemez |
| `03-breakout/09-stale-index.md:78` | `active_powerup_pos: rl.Vector2` ilk kez İpucu 3'te doğuyor; `Elindekiler:36` yalnız `active_powerup: int` veriyor. İki-şey-gizli ihlali | Alanı `Elindekiler`'e taşı |
| `03-breakout/index.md:10,29` | İki yerde "Dear ImGui paneli"; 3.14 raygui kullanıyor, `RESOURCES.md` boşluğu raygui ile kapatılmış | "raygui" yaz |
| `03-breakout/14-tuning-panel.md` | `Ne zaman bitti?` "top hızı tuning'den okuyor" diyor, İpucu 3 bu geçişi hiç göstermiyor | İpucu 3'e gövdeyi ekle |
| `01-pong/10-score-and-reset.md:104` | `Sınırlar` reset'i bir procedure'a toplamayı zorunlu kılıyor, İpucu 2 `^Ball` öneriyor; proc tanımlama 1.1-1.9'da hiç geçmiyor, pointer parametre 1.13'te öğretiliyor | `^Ball`'u kaldır, değer döndüren biçim öner ya da zorunluluğu 1.13'e kaydır |
| `02-snake/08-food-and-growth.md:18` | `length` artışının kaydırma döngüsüne göre sırası hiç yazılmamış; İpucu 3 de vermiyor | Görev + İpucu 3'e sıralı iskelet: length artışı → kaydırma → head → koşullu kuyruk |
| `01-pong/15-collision-shapes.md:64` | `DrawRectangleLinesEx`, `DrawCircleLinesV`, `DrawLineEx` imzaları ilk kez İpucu 2/3'te | Gövdeye taşı |
| `01-pong/14-debug-overlay.md:56` | `rl.DrawFPS` ve `%v` ilk kez İpucu 2'de | Gövdeye taşı |

## 3. Öğrencinin gerçek hataları — ders yeterli miydi?

`progress/current.json` reviews/skills notlarıyla çapraz kontrol:

- **2.8, `length` sırası** — ders eksikti. Metin sırayı hiç söylemiyor; hata
  ders boşluğunun doğrudan sonucu.
- **3.7/3.8, `game_reset` havuzu temizlemiyor** — ders eksikti, iki kez. Her iki
  dersin `Ne zaman bitti?` listesinde bu kriter yok. 3.3'te kurulan "R oyunu
  baştan kursun" sözleşmesi yeni state alanlarına genişletilmemiş. Öğrenci aynı
  hatayı iki derste yaptı çünkü ders iki kez hatırlatmadı.
- **3.8, olasılık eşiğinin ters yönü** — ders kısmen yeterliydi. `Elindekiler`
  "eşikten küçükse doğur" diyor ama kod örneği yok; İpucu 2 başka bir tuzağı
  (genişlik katlama) kapsıyor.
- **3.7, kapasite/patlama boyutu** — ders kısmen yeterliydi. İpucu 2 ayrımı
  anlatıyor, somut senaryo (art arda kırılan iki tuğla) yalnız incelemede çıktı.
- **3.4, `i % BRICK_ROWS`** — ders yeterliydi. İpucu 1 doğru formülü veriyor.
- **2.7, başlangıç düzenini iki yerde yazma** — ders yeterliydi.

Örüntü: öğrencinin tekrarlayan hataları, kabul ölçütünün yeni state alanını
kapsamadığı yerlerde çıkıyor. Havuz ekleyen her ders `game_reset` maddesini
taşımalı.

## 4. Kaynak rolü karışıklığı

Sözleşme: `## Kaynak` zorunlu ve Odin API (ders *sırasında*), `## Daha derine`
kavramsal (ders *bittikten sonra*). İhlaller:

- Dünya 1'de 6/15 ders (1.4, 1.5, 1.8, 1.9, 1.11, 1.13) zorunlu kaynağa
  kavramsal içerik koymuş (Gaffer On Games, Game Programming Patterns, MDN);
  kullandıkları gerçek Odin çağrısı (`GetFrameTime`, `clamp`, pointer sözdizimi)
  hiç kaynaklanmamış.
- `02-snake/03-tick-timer.md:73` zorunlu kaynak olarak "Fix Your Timestep!"
  gösteriyor — tanım gereği `Daha derine` içeriği.
- `02-snake/04-direction-step.md:73` negatif modulo davranışını Odin dil turu
  `#for-statement` anchor'ına bağlıyor; o sayfa bunu belgelemiyor (doğrulanmadı,
  anchor listesi üzerinden).

Teknik doğruluk tarafı sağlam: dünya 1'in 15 raylib/builtin imzası kurulu
derleyiciyle birebir eşleşti; dünya 3'ün raylib/raygui/audio imzaları derlenerek
doğrulandı. Tek gerçek imza hatası 3.14'teki `normalize`. Küçük eksik:
`02-snake/09-food-placement.md:45` `int_max` imzasını `gen` parametresi olmadan
veriyor (çağrı çalışır, imza eksik).

## 5. Kelime bütçesi (600, kod hariç)

Aşanlar — hepsi denetlenmeyen dünyalarda, sözleşmeye göre "iki fikir sıkışmış":

| Ders | ~Kelime | Sıkışan iki fikir |
|---|---|---|
| `02-snake/10-ring-buffer` | 1141 | formül + altı entegrasyon noktası / `head`'in `-1` yönü + negatif modulo |
| `02-snake/07-occupancy-grid` | 1012 | dosyada açıkça "Tur A" ve "Tur B" |
| `01-pong/09-opponent-ai` | 865 | controller / dead zone + zorluk ayarı |
| `02-snake/11-allocation-counter` | 761 | + İpucu 3 yeni mimari öneri sızdırıyor |
| `01-pong/10-score-and-reset` | 691 | |
| `02-snake/06-self-collision` | 623 | |
| `01-pong/11-serve-state` | 614 | |

Dünya 3'te aşan yok; `07-particle-pool` sınıra en yakın.

## 6. Testin göremedikleri

Biçim testi başlık/sıra/kelime sayıyor; şunları denetlemiyor:

- İpucu 1/2/3'ün gerçekten adım/tuzak/tam-çözüm rolünü taşıyıp taşımadığı
  (`03-breakout/04-brick-wall` İpucu 1 düz yazı yerine doğrudan kod veriyor)
- Kod bloklarının derlenip derlenmediği (`normalize` bu yüzden sessiz kaldı)
- `Elindekiler` ile İpucu'lar arasında ilk kez doğan struct alanı/imza
- `index.md` dosyaları (SHAPED yalnız numaralı dersleri kapsıyor)
- Dersler arası referansların (ör. "2.12'deki gibi") gerçekten var olması

## 7. Öncelik sırası

**Şimdi (küçük, yüksek etki) — bu commit'te uygulandı:**

1. ~~`03-breakout/14-tuning-panel.md`~~ — `normalize` → `rl.Vector2Normalize`;
   imza `Elindekiler` kod bloğuna eklendi.
2. ~~`03-breakout/index.md`~~ — iki "Dear ImGui" → "raygui".
3. ~~`03-breakout/09-stale-index.md`~~ — `active_powerup_pos` `Elindekiler`'e
   taşındı, naif alanla çözüm alanı yan yana ve etiketli.
4. ~~`03-breakout/07` ve `08`~~ — `Ne zaman bitti?`'ye `R` sıfırlama maddesi
   eklendi. 3.7 bununla 598/600 kelimeye çıktı; bu ders artık bölünmeden
   büyüyemez.
5. ~~`01-pong/10-score-and-reset.md`~~ — procedure zorunluluğu kaldırıldı,
   `^Ball` ipucu yerine servis yönü değişkeniyle tek sıfırlama yolu; procedure'a
   çıkarma 1.13'e havale edildi.
6. ~~`02-snake/08-food-and-growth.md`~~ — `length` artışının kaydırma
   döngüsünden önce geldiği hem `Görev`'e hem İpucu 3'e yazıldı; İpucu 3 artık
   tick'in tam sırasını kod olarak veriyor.

Kalan (bu commit'te yapılmadı):

- `03-breakout/14-tuning-panel.md` İpucu 3 hâlâ top hızının tuning'den okunma
  gövdesini göstermiyor, `Ne zaman bitti?` bunu istiyor.
- `03-breakout/08` İpucu 2 hâlâ eşik yönü tuzağını kapsamıyor.
- `03-breakout/04-brick-wall` İpucu 1 hâlâ düz yazı yerine kod veriyor.
- `01-pong/15` ve `14`: ipucunda ilk kez doğan API imzaları.

**Sonra (biçim dönüşümü, dünya 2 önce — 3'e daha yakın):**

7. `02-snake/07` ve `10`'u ikiye böl (bölme numaralandırmayı etkiler, erken yap)
8. `02-snake`'in kalan 11 dersini yeni biçime çevir, `SHAPED`'e ekle
9. `01-pong/09-opponent-ai`'yi ikiye böl
10. `01-pong`'un 15 dersini çevir; İpucu 3'lere gerçek kod yaz (en büyük iş)
11. Kaynak rolü düzeltmesi: 8 derste kavramsal linki `Daha derine`'ye taşı

**Testi güçlendir:**

12. `SHAPED`'e dünya eklendikçe; ayrıca kod bloklarını `odin check`'ten geçiren
    bir test, `Elindekiler`'de olmayan `game.<alan>` referanslarını ipuçlarında
    arayan bir kontrol ve `index.md` kapsaması.

## Yöntem notu

Üç dünya üç alt ajana paralel denetletildi; C-sınıfı bulguların tamamı bu
oturumda dosyadan ve kurulu derleyiciden ayrıca doğrulandı. Doğrulanmayan tek
iddia: Odin dil turu anchor'larının (`#arrays`, `#structs`, `#for-statement`)
iddia edilen içeriği kapsayıp kapsamadığı — sayfalar çekilmedi.
