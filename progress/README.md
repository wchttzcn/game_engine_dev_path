# İlerleme kaydı

Bu belge agent içindir. Kaydı, şemayı ve dashboard bağlantısını agent yönetir;
Mücahit yalnızca Odin kodunu yazar, oynar/debug eder ve işi bittiğinde inceleme
ister. Tahmin, gözlem, journal veya sohbet raporu istenmez.

`current.json` tek doğruluk kaynağıdır. Academy buradan okur; tarayıcıda ayrı
bir tamamlanma kaydı tutulmaz. Geliştirme sunucusu dosya değişikliklerini izler;
üretim çıktısına yansıtmak için site yeniden derlenir.

## Basit akış

1. Mücahit mevcut dersi uygular ve bittiğini söyler.
2. Agent learner code'u ve ilgili oyun davranışını inceler, gerekli kontrolleri çalıştırır.
3. Kabul ölçütleri karşılanıyorsa dersi `completed` yapar.
4. Sıradaki gerekli ders hazır değilse yazar; `currentLessonId` değerini o derse taşır.

Bu akış için commit, journal, manuel progress düzenlemesi veya ayrı rapor gerekmez.
Git geçmişi ilerleme mekanizması değildir.

## Dersler

`lessons` yalnızca hazır dersleri içerir. Roadmap'teki taslak aşamalar tamamlanma
oranına katılmaz. `currentLessonId`, bu dizideki bir derse işaret eder.

Yeni hazırlanan dersler `not_started` olarak kataloğa eklenir; bu bir öğrenci
ilerlemesi değildir. `description`, çalışma alanında gösterilen tek görevlik
özettir. Ders bölünürken mevcut girişim ve kanıt korunur.

| Durum | Anlamı |
| --- | --- |
| `not_started` | Henüz öğrenci girişimi yok |
| `in_progress` | Öğrencinin kod denemesi veya sorusu gözlemlendi |
| `review_needed` | Öğrenci değerlendirme istedi; kanıtları incelenmeyi bekliyor |
| `completed` | Dersin kabul ölçütleri incelendi ve karşılandı |

`evidence`, `skills`, `reviews` ve `openQuestions` alanlarındaki mevcut veriler
tarihsel olarak korunur; olağan ders akışında bunlara yeni kayıt eklenmez. Yeni
bir ders tamamlandığında yalnızca ders durumu ve `currentLessonId` güncellenir.
Basit çizim görevleri kod incelemesi ve compiler kontrolüyle tamamlanabilir;
görülmeyen GUI davranışı görülmüş sayılmaz.

Bir sonraki ders henüz yazılmadıysa mevcut dersi tamamlanmış olarak bırak ve
sonraki dersi hazırla; hayali bir ders kimliğine geçme. XP ve seviye puanı yok.
