# Mücahit’in Odin ile oyun motoru geliştirme rotası

Oyun yaparak oyunların altındaki sistemleri öğreneceksin. React ve TypeScript deneyimin karar verme, debugging ve ürün geliştirme için temel; yeni çalışma alanın memory, simulation, oyun hissi ve araçlar. Dil Odin, ortam macOS, kod yazma yeri kendi editörün. Takvim veya haftalık kota yok.

**Ana mentor arayüzü sohbet.** Burada görev alır, tahminini ve denemeni paylaşırsın. Yerel araçlarla kod, derleme ve davranış incelenir. Mevcut academy sitesi isteğe bağlı ders okuyucusudur; ilerlemek için siteyi geliştirmen gerekmez. Egzersizleri ve oyunları sen yazarsın.

**Şimdi:** [Pong 1.1 — İlk raketi çiz](/worlds/01-pong/01-first-paddle). Dünya 0'daki memory deneyleri optional reference'tır; Pong için bitirilmeleri veya journal'a yazılmaları gerekmez. İlk Pong dersinden sonrası, karşılaşacağın oyun problemlerine göre hazırlanır.

## Ders döngüsü

Bir ders bir ana fikir ve küçük bir görev taşır: hedef, kısa bağlam, tahmin, deneme, kabul koşulu. İpuçları kademeli açılır; ayrıntılı teori isteğe bağlıdır. İnceleme gözlenen kanıtla ve tek odaklı soruyla başlar. Derlenmesi, doğru davranması ve nedenini açıklayabilmen ayrı değerlendirilir. Bir çözümü gördükten sonra bağımsızlık, yeni bir aktarım göreviyle sınanır.

Oyun problemi → küçük kavram → tahmin → uygulama → gözlem → inceleme → kısa değerlendirme → tekrarlanan ihtiyaç → ortak engine sistemi. Başta görev ve sınırlar verilir; ortada arayüzleri sen tasarlarsın; ileride görevi ve ölçüm yöntemini de sen çıkarırsın. İlerlemeyi mentor gözlenmiş kanıtla kaydeder. Academy bakımı ve ilerleme dosyalarının yönetimi agente aittir.

## Sekiz beceri hattı

| Hat | Oyunlarda tekrar döneceğin sorular |
| --- | --- |
| Systems | Data'nın owner'ı kim? Allocation nerede? Memory layout ve erişim maliyeti ne? |
| Gameplay | Hareket, collision, dövüş ve kurallar nasıl davranmalı? |
| Engine | Game loop, entity, events ve resource'lar hangi sınırlarla birlikte çalışıyor? |
| Juice / Game Feel | Oyuncu bir olayı nasıl fark ediyor; zamanlama neyi değiştiriyor? |
| Simulation | Hangi state kaydediliyor, tekrar üretiliyor veya geri sarılıyor? |
| Multiplayer | Kim otorite sahibi, hangi bilgi hangi oyuncuya gidiyor? |
| Tools | Görünmeyen hangi state'i ölçen veya gösteren araç gerekiyor? |
| Rendering | Dünya nasıl görüntüye dönüşüyor; resource ve çizim maliyeti ne? |

Juice sonradan eklenen süs değildir; geri bildirimin bir parçasıdır. Araç geliştirme de ayrı bir mezuniyet projesini beklemez. Her oyunda küçük bir araç, o oyunun sorusunu görünür kılar. Dear ImGui geliştirici inceleme ve ayar panelleri için planlanır; varsayılan oyuncu arayüzü değildir. Binding, kurulum ve API seçimi ilgili ders yazılırken güncel birincil kaynaklarla doğrulanacak; bu plan bunların kurulu olduğunu iddia etmez.

Araçlar küçük adımlarla büyür: debug yazısı → overlay → Dear ImGui runtime tuning → inspector → profiler → rule inspector → rewind timeline → network debugger → küçük editör araçları. Bu sıra yaklaşık bir yöndür; her araç mevcut oyundaki bir soruyu cevaplamak için yazılır.

## Oyun sırası

| Dünya | Küçük proje | Araç teslimi |
| --- | --- | --- |
| 1 | Pong | İlk raket; sonra ihtiyaçla debug text ve overlay |
| 0 | Optional memory reference | İstenirse küçük ölçüm deneyi |
| 2 | Snake | Grid görünümü, state ve memory sayaçları |
| 3 | Breakout / Juice Laboratory | İlk Dear ImGui runtime ayar paneli |
| 4 | Precision Platformer / Dead Cells DNA | Player inspector ve hitbox çizimleri |
| 5 | Baba-like: değişen kurallar | Rule inspector |
| 6 | Braid-like: geri sarılabilir dünya | Timeline debugger |
| 7 | PICO PARK: yerel co-op | Oyuncu ve input eşleştirme görünümü |
| 8 | BOKURA: iki gerçeklik | Simulation / Player A / Player B görünümleri |
| 9 | We Were Here: ağ üzerinden bulmaca | Gecikme, paket kaybı ve durum karşılaştırması |
| 10 | Storyteller: ilişkiler ve olaylar | İlişki ve değerlendirme izi |

Bu isimler mekanik ilhamını belirtir; ilgili oyunların iç mimarisi hakkında iddia değildir. Sıra ve kapsam, öğrendiklerine ve keyif aldığın mekaniklere göre değişebilir. İlerideki dünyalar yaklaştıkça küçük derslere bölünecek; aylarca sürecek görevleri şimdiden sabitlemiyoruz.

## Dünya 0 — Optional memory reference

[Dünya planı](/worlds/00-systems/). Bu deneyler erişilebilir bir reference olarak korunur; Pong'a geçişi engellemez. Memory layout, pointer, slice veya allocation bilgisi bir oyun problemiyle gerektiğinde kısa bir görev olarak açılır. Cache ve AoS/SoA, Snake’te somut erişim deneyine bırakılır.

**Soru:** “Bu oyun problemi memory hakkında hangi soruyu doğuruyor?” Kısa gözlem sohbette yeterlidir; journal tablosu veya tamamlanma kapısı yoktur. İleri allocator tasarımı, ECS, SIMD ve ileri profiling oyun ihtiyacını bekler.

## Dünya 1 — Pong

[Dünya planı](/worlds/01-pong/). İlk hazır ders [1.1 — İlk raketi çiz](/worlds/01-pong/01-first-paddle): hazır pencereye bir raket çizerek screen coordinates ile çalış. Sonraki tek problem, bu denemeden sonra seçilir. Çalışan maç, ses, parçacık, hit pause, iz, kamera tepkisi ve debug overlay; ihtiyaç geldikçe ayrı küçük görevlerdir.

**Soru:** “Top kodu neden kamera sarsıntısını biliyor?” **Kanıt:** Tamamlanıp yeniden başlayan maç, efektlerin açılıp kapatıldığı karşılaştırma ve bağımsız bir kural değişikliği. Engine Thinking burada bağımlılıkları fark etmektir; evrensel motor API’si çıkarma zorunluluğu değildir.

## Dünya 2 — Snake

Grid, occupancy, array ve ring buffer üzerinden yılanın gövdesini temsil edersin. Baş/kuyruk sırası, kapasite ve allocation davranışını grid debug görünümü ve memory sayaçlarıyla izlersin. Ayrı erişim deneylerinde contiguous memory, cache locality ve AoS/SoA seçeneklerini ölçersin; küçük struct’ın otomatik hız garantisi olduğunu varsaymazsın.

**Soru:** “Bu hareket hangi veriyi taşıyor, hangi frame allocation yapıyor?” **Kanıt:** Tekrarlanabilir hareket dizisi, dolu grid davranışı ve iki veri temsilinin karşılaştırması. Oynanış sırasında heap allocation yapmama kısıtı, kapasiteyi önceden planlama deneyi olarak kullanılabilir; genel bir yasak değildir. Juice hedefi input tamponlama, ritim ve yem tepkisidir.

## Dünya 3 — Breakout / Juice Laboratory

Tuğla, parçacık ve tek güçlendirmeyle nesnelerin oluşturulma ve silinme sırasını araştırırsın. İlk Dear ImGui paneli top hızı, hitstop, kamera sarsıntısı, parçacık lifetime'ı ve ses varyasyonu gibi değerleri runtime'da ayarlamayı hedefler. Ayar profili kaydetme sonraki küçük genişleme olabilir.

**Soru:** “Hissi değiştirmek için neden her seferinde yeniden derliyorum?” **Kanıt:** Aynı karşılaşmanın iki ayar profiliyle oynanması, etkilerin ayrı karşılaştırılması ve silinen nesneye erişim hatasının görünür kılınması. Pool veya arena, geçici nesnelerin ölçülmüş ihtiyacı varsa incelenir.

## Dünya 4 — Precision Platformer / Dead Cells DNA

İki bölüm vardır: önce hareket parkuru, sonra tek odalık dövüş. İvme, değişken zıplama, coyote time, jump buffer ve dash; ardından startup/active/recovery, hitbox/hurtbox, knockback ve iptal pencereleri gelir. Player inspector durum, hız, grounded bilgisi ve zamanlayıcıları gösterir; debug çizimleri temasları görünür kılar.

**Soru:** “Simulation doğruysa bu zıplama veya vuruş neden kötü hissettiriyor?” **Kanıt:** İki kontrol ayarının karşılaştırması, köşe/iniş deneyleri ve bir saldırının timeline'ı. Bütün yetenekler tek derste verilmez; yeni hareket önceki kontrolü bozmadan eklenir.

## Dünya 5 — Baba-like / Rules as Data

Snake’in grid deneyiminden hamle bazlı küçük bir bulmacaya geçersin. Undo, değişebilir özellikler, kural sırası ve çelişkiler ayrı görevlerdir. Rule inspector etkin kuralları, seçili entity’nin özelliklerini ve bunların hangi kuraldan geldiğini gösterir. ECS ancak mevcut temsilin gerçek sorununu tartışırken seçenek olur.

**Soru:** “ROCK IS YOU değiştiğinde hangi data yeniden evaluate edilmeli?” **Kanıt:** Birkaç kurallı oynanabilir bulmaca, yeni bir rule'un eklenmesi ve hamleyi geri alma kontrolü. Juice, değişen rule ile sonuç arasındaki bağı okunur kılar.

## Dünya 6 — Braid-like / Rewindable World

Hamle bazlı undo’yu sürekli simulation'a genişletirsin. Önce basit snapshot yaklaşımı, ardından memory ölçümü ve gerekçeli iyileştirme gelir. Ring buffer, serialization, entity kimliği, determinism ve replay ihtiyaç oldukça işlenir. Timeline debugger frame seçme, ileri/geri adımlama, snapshot sayısı/memory'si ve entity/RNG state'ini incelemeni sağlar.

**Soru:** “Ses, parçacık, animasyon ve RNG’nin hangisi geri sarılmalı?” **Kanıt:** Seçilen ortam ve koşullarda kaydet–geri yükle–tekrar oynat karşılaştırması; unutulmuş durum alanının teşhisi. Geri sarma yönü ve kayıt sınırı oyuncuya anlaşılır geri bildirimle gösterilir.

## Dünya 7 — PICO PARK / Local Co-op

Ortak düğme, kapı veya taşıma görevi içeren küçük yerel bulmaca kurarsın. Input soyutlaması, cihaz/oyuncu eşleşmesi, katılma/ayrılma, ortak kamera ve checkpoint ayrı adımlardır. Oyuncu numarası başına kopyalanan mantığın yerine ortak davranışı nasıl temsil edeceğini araştırırsın.

**Soru:** “Bir kontrolcü ayrıldığında oyuncuya ve ortak göreve ne olur?” **Kanıt:** İki oyuncunun birlikte çözdüğü oda, eşzamanlı input ve yeniden doğma kontrolü. Input görünümü hatanın cihaz eşleştirmesinde mi oyun kuralında mı olduğunu ayırmaya yardım eder.

## Dünya 8 — BOKURA / Two Realities

Ortak bir entity, bir oyuncuya hayvan diğerine robot olarak görünür. Simulation identity'sini, oyuncuya özel presentation'ı, görünürlük ve information ownership'ini ayırırsın. Debug görünümü Simulation, Player A ve Player B arasında geçer.

**Soru:** “Aynı nesnenin görüntüsünü değiştirmek hangi oyun durumunu değiştirmemeli?” **Kanıt:** İki bakıştan çözülen küçük bulmaca ve bir durum değişikliğinin her temsile doğru yansıması. Görsel tepki her oyuncunun kendi algısıyla anlaşılır kalmalıdır. Bu aşama önce yerelde sınanır.

## Dünya 9 — We Were Here / Networked Puzzle

Biri ipucunu, diğeri mekanizmayı gören bulmacayı iki client'a taşırsın. Önce mesajlaşma deneyi; sonra authority, serialization, replication, connection kopması ve yeniden bağlanma görevleri gelir. Network debugger latency, packet loss, gönderim/alım ve client state'lerini görünür kılar.

**Soru:** “Oyuncunun bilmemesi gereken veri neden istemcisine gönderilsin?” **Kanıt:** İstemciye giden alanların incelemesi, yapay gecikme/kayıp deneyi ve kopma sonrası tanımlı davranış. Prediction veya rollback, bulmacanın ihtiyacı gösterilirse eklenir. Bağlantı ve ortak eylem geri bildirimi de oyun hissinin parçasıdır.

## Dünya 10 — Storyteller / Combinatorial Logic

Üç sahnede karakter yerleştirmelerinden ilişkiler ve sonuçlar üretirsin. Graph, dependency, condition, event ve evaluation order çalışılır. Frontend deneyiminle bağlantı, değişen state’in bağımlı sonuçları yeniden üretmesidir; burada sonuç simulation'dır. Küçük araç hangi event'in hangi ilişkiyi değiştirdiğini gösterir.

**Soru:** “Önceki sahne değişince hangi sonuçlar geçerliliğini kaybediyor?” **Kanıt:** Yeni bir ilişki kuralı, sahne değişikliği sonrası değerlendirme izi ve okunaklı animasyon geçişleri. Değerlendirme sırası koddan takip edilebilmelidir.

## Oyunlara paralel motor teslimleri

Bu teslimler, birkaç oyundaki tekrar görünür oldukça küçük adımlarla planlanır. Favori mekaniklere geçmeden önce bitirilmesi gereken büyük bir motor aşaması oluşturmazlar.

- **İlk ortak modül:** İki oyunda gerçekten tekrarlanan ihtiyaç seç; sınırını gerekçelendir; ikinci oyunda çalıştığını göster. Klasör veya soyutlama sayısı başarı ölçütü değildir.
- **Asset pipeline:** Kaynak kimliği, yükleme ve bırakma davranışı; eksik/bozuk dosya geri bildirimi; gerektiğinde yeniden yükleme. Teslim, oyun tarafından kullanılan ve hatası gözlenebilen küçük yükleme hattıdır.
- **Kendi 2D renderer’ın:** Transform, camera, texture, shader, buffer ve batching deneyleriyle önceki oyunlardan birinin seçili render path'ini devral. Doğru görüntü ve resource lifetime'ını doğrula; maliyeti ölç. Grafik API’si ilgili aşamada macOS koşullarına göre seçilir.
- **Profiler ve editör:** Önce ölçüm sorusu olan profiler görünümü; sonra entity/world veya seviye düzenleyici. Kaydettiğin içeriği oyunda yeniden yükleyerek teslimi doğrula.
- **İleri Rendering dalı:** Kamera, matris, mesh, derinlik, malzeme ve ışıkla küçük bir 3D sahne; ardından tek oynanış hedefi. OS katmanı, iş parçacıkları ve ileri allocator tasarımları da somut ihtiyaçla açılır.

## Özgün oyun yönü

Uzun vadede ortak simulation, farklı algılar, değişen rules ve zaman mekanikleri birleşebilir; final tasarım sabit değildir. İlk vertical slice en fazla iki ana mekanik taşır: örneğin yerel co-op ve farklı bilgi ya da hareket ve geri sarma. Küçük, başı ve sonu olan oynanabilir sonuç çıkarırsın.

Teslim; çalıştırma talimatı, dışarıdan oynama bulguları, performans ölçümleri ve teknik değerlendirmedir. Günlükte “hangi abstraction erkendi, hangi araç eksikti, hangi allocation beklenmedikti?” sorularını yanıtlarsın. Sonraki kapsamı bu kanıtlar belirler.
