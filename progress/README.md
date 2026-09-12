# İlerleme kaydı

Bu belge agent içindir. Kaydı, şemayı ve dashboard bağlantısını agent yönetir;
Mücahit yalnızca Odin kodunu yazar, oynar/debug eder ve işi bittiğinde inceleme
ister. Tahmin, gözlem, journal veya sohbet raporu istenmez.

`current.json` tek doğruluk kaynağıdır ve şema sürümü `2`'dir. Academy buradan
okur; tarayıcıda ayrı bir tamamlanma kaydı tutulmaz. Geliştirme sunucusu dosya
değişikliklerini izler; üretim çıktısına yansıtmak için site yeniden derlenir.

Ders adı da elle yazılmaz. `title`, `world` ve `url` alanları ders dosyasının
frontmatter'ındaki `title` alanından türetilir: `npm run academy:sync` bu üç
alanı tazeler, `npm run academy:check` fark varsa hata verir. Bir dersin adı
değişince frontmatter düzeltilir ve sync çalıştırılır; JSON elle düzenlenmez.

Güncel ders hiçbir doküman metninde elle yazılmaz. Çalışma alanı sayfası
`AcademyDashboard.vue` ile; yol haritası, çalışma rehberi ve bölüm planı
`<CurrentLesson />` bileşeni ile bu dosyadan okur. `README.md` ders adı yerine
bu dosyaya bağlanır. Yeni bir sayfa güncel dersi göstermek isterse aynı bileşeni
gömer, ders adını kopyalamaz.

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

`evidence`, `reviews` ve `openQuestions` alanlarındaki mevcut veriler tarihsel
olarak korunur; olağan ders akışında bunlara yeni kayıt eklenmez. Yeni bir ders
tamamlandığında ders durumu, `currentLessonId` ve — kanıt varsa — `skills`
güncellenir.

## Beceri kaydı

`skills`, sıradaki dersin ne olacağını belirleyen öğretim sinyalidir; bir
ilerleme sayacı değildir. Yalnızca öğrencinin kavramı gerçekten uyguladığı
durumda kayıt açılır; işlenmiş olmak yeterli değil.

| Alan | Anlamı |
| --- | --- |
| `status` | `unassessed`, `learning`, `independent`, `revisit` |
| `lessons` | Kavramı çalıştıran ders kimlikleri |
| `note` | Neyin gösterildiği, neyin gösterilmediği — tek satır |
| `lastRecallAt` | Bu kavramın en son ne zaman recall sorusuna konu olduğu |
| `evidence` | İlgili kod veya tarihsel not dosyaları |

`independent` yalnızca kavram sonraki ve farklı bir durumda doğru uygulandığında
verilir. İncelemedeki recall sorusu cevaplandığında ilgili becerinin
`lastRecallAt` değeri güncellenir; cevap zayıfsa `status` `revisit` olur ve
kavram sonraki derse dokunur. Ayrı bir tekrar egzersizi veya rapor açılmaz.
Basit çizim görevleri kod incelemesi ve compiler kontrolüyle tamamlanabilir;
görülmeyen GUI davranışı görülmüş sayılmaz.

Bir sonraki ders henüz yazılmadıysa mevcut dersi tamamlanmış olarak bırak ve
sonraki dersi hazırla; hayali bir ders kimliğine geçme. XP ve seviye puanı yok.
