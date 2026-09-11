# İlerleme kaydı

Bu belge agent içindir. Kaydı, şemayı ve dashboard bağlantısını agent yönetir;
Mücahit yalnızca tahminini, Odin denemesini ve gözlemini paylaşır. Platform veya
içerik denetimi öğrenci girişimi değildir; aktif ders, durumlar ve geçmiş korunur.
Öğrenci rota değişikliği istediğinde hazır bir derse geçilebilir; önceki dersler
tamamlanmış sayılmaz, girişimler ve kanıtları korunur. World 0 isteğe bağlıdır.

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

`evidence` alanları repo köküne göre dosya yollarıdır. Tamamlanma, dersin kabul
koşullarını karşılayan gözleme ve değerlendirme kaydına dayanır. Kod görevlerinde
kod yolu eklenir; davranış ve kısa sohbet açıklaması agent'ın `progress/notes/`
notuyla kaydedilebilir. Journal ve tablo doldurmak zorunlu değildir. İpuçlarıyla
tamamlanan ders de tamamlanabilir; bağımsız beceri durumu ayrıca değerlendirilir.

İsteğe bağlı World 0 dersleri aynı lab ve journal dosyasını paylaşır. Bu dosyalar
mevcut girişimi korur; tamamlanmaları Pong'a geçiş şartı değildir. Yeniden
çalışılırsa journal yerine sohbetten tahmin/gözlem kabul edilir. Kayda yalnızca
incelenen bölümü yaz; cache yorumları ve AoS/SoA ek geçme koşulu değildir.

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
