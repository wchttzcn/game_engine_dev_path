# İlerleme kaydı

`current.json` tek doğruluk kaynağıdır. Academy buradan okur; tarayıcıda ayrı
bir tamamlanma kaydı tutulmaz. Geliştirme sunucusu dosya değişikliklerini izler;
üretim çıktısına yansıtmak için site yeniden derlenir.

## Dersler

`lessons` yalnızca hazır dersleri içerir. Roadmap'teki taslak aşamalar tamamlanma
oranına katılmaz. `currentLessonId`, bu dizideki bir derse işaret eder.

Yeni hazırlanan dersler `not_started` olarak kataloğa eklenir; bu bir öğrenci
ilerlemesi değildir. `description`, çalışma alanında gösterilen tek görevlik
özettir. Ders bölünürken mevcut girişim/kanıt korunur ve kendiliğinden sonraki
derse geçilmez.

| Durum | Gereken kanıt |
| --- | --- |
| `not_started` | Henüz öğrenci girişimi yok |
| `in_progress` | Öğrencinin tahmini, kod denemesi veya sorusu gözlemlendi |
| `review_needed` | Öğrenci değerlendirme istedi; kanıtları incelenmeyi bekliyor |
| `completed` | Dersin kabul ölçütleri incelendi; sonuçlar değerlendirmeye yazıldı |

`evidence` alanları repo köküne göre dosya yollarıdır. Tamamlanma için en az
alıştırma kodu, journal'ın o derse ait doldurulmuş bölümü ve değerlendirme kaydı gerekir. İpuçlarıyla
tamamlanan ders de tamamlanabilir; bağımsız beceri durumu ayrıca değerlendirilir.

0.1 ilk tahmin/ölçüm ve çizimi; 0.2 yeniden sıralamayı; 0.3 100.000 Bullet
hesabını değerlendirir. Üç ders aynı lab ve journal dosyasını paylaşır. Kayda
hangi bölümün incelendiğini yaz. Cache yorumları ve AoS/SoA bu derslerin geçme
koşulu değildir.

## Beceriler

`unassessed`, `learning`, `independent`, `revisit` durumlarını kullan.
`independent` için yeni bir örnekte veya transfer görevinde desteksiz uygulama
kanıtı gerekir. Derlenebilir kod bu kanıtın tek başına yerine geçmez.

## Değerlendirme kaydı

İnceleme bittikten sonra `reviews` dizisine bir nesne ekle:

```json
{
  "lessonId": "systems-01-memory-layout",
  "reviewedAt": "gerçek ISO 8601 zamanı",
  "outcome": "needs_revision",
  "evidence": ["journal/00-memory-layout.md"],
  "summary": "Gözlemlenen başarılar ve açık kalan konu.",
  "hintLevel": 1
}
```

Bu bir şema örneğidir, yapılmış değerlendirme değildir. `outcome` değeri
`needs_revision` veya `passed`; `hintLevel` 0–3 olur. Açık soruları
`openQuestions` dizisinde metin olarak tut. Önceki değerlendirmeleri koru.

Bir sonraki ders henüz yazılmadıysa mevcut dersi tamamlanmış olarak bırak ve
sonraki dersi hazırla; hayali bir ders kimliğine geçme. XP ve seviye puanı V0'da
yok; mevcut kayıt gözlemlenmiş öğrenme kanıtlarını takip eder.
