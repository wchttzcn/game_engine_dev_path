# Oyun üzerinden çalışma tercihi

Karar zamanı: 2026-09-11T23:23:27Z.

Mücahit zorunlu tahmin/gözlem yazmayı, mentor için rapor üretmeyi ve anlamı
zaten açık olan x değiştirme gibi görevleri istemediğini belirtti. Deneyleri
oyun mekaniklerinde yapmak; gerektiğinde Dear ImGui ile davranışları açıp
kapatmak istiyor. Bu tercih sohbet raporları için de geçerli.

Akış: kısa kavram → oyun kodu → oynama/debugging → ihtiyaç olduğunda inceleme.
Agent kodu ve gerekli davranışı inceler, ilerlemeyi kendisi kaydeder. Sorular ve
parametre deneyleri somut bir mekanik, hata veya karar için yararlı olduğunda
kullanılır. Journal isteğe bağlı kişisel not olarak kalır.

## Güncel değerlendirme

Pong 1.1 tamamlandı. Önceki incelemede doğru `DrawRectangle` çağrısı ve çizim
döngüsü görülmüş, compiler kontrolü geçmişti. Kullanıcı da çalışmayı bitirdiğini
bildirmişti. Basit çizim görevinin yeni kabul koşulları bu kanıtla karşılanıyor;
x=100 denemesi veya gözlem raporu beklenmiyor. GUI burada çalıştırılmış sayılmaz.
Screen coordinates becerisi için bağımsızlık iddiası eklenmedi.

World 0 geçmiş değerlendirmelerindeki tahmin, çizim ve açıklama raporu eksikleri
artık tamamlanma engeli değil. Teknik olarak kalanlar: 0.1'de eksik field offset
ölçümleri ve journal'da görülen iki hatalı offset; 0.2'de programın iki struct için
tüm field offset'lerini yazdırmaması; 0.3'te MB böleni ve MiB integer division.
Bunlar optional reference çalışmasının notlarıdır; Pong'a devam etmek için
düzeltme veya rapor borcu oluşturmaz. Öğrenci kodu ve journal korunmuştur.

Önceki inceleme kayıtları tarihsel bağlamdır; yeni tercih eski rapor taleplerinin
yerini alır. Bu değişiklikte yeni oyun dersi hazırlanmadı.
