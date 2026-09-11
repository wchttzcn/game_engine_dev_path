# Dünya 1 — Pong: Works → Feels → Engine Thinking

İlk oyun açılacak, oynanacak, bitecek ve yeniden başlayacak. Önce bir frame’in akışını anlayacak, ardından vuruşu okunur ve hissedilir kılacak, son olarak bu tepkilerin kodda nasıl bağlandığını inceleyeceksin.

**Durum:** Aşağıdaki satırların her biri ayrı, kısa bir ders planıdır. Henüz Pong dersleri, başlangıç projesi veya otomatik kontroller hazırlanmadı. Şu anki görev [0.1 — Yerleşimi ölç](/worlds/00-systems/01-memory-layout). Gelecekteki bu görevlerin tamamını şimdi yapman beklenmez.

Görevi sohbette alıp kendi editöründe uygularsın; burada bölümün yönünü görebilirsin. Pencere/çizim/ses desteği ve macOS kurulumu ilk ders hazırlanırken doğrulanacak. Başlangıçta tam editör veya Dear ImGui kurulumu yok; Pong’un ilk aracı basit debug yazısı ve overlay olacak.

## Pong v0 — It Works

Her ders bir davranış ekler. Tahmin, küçük uygulama ve gözlemden sonra sonraki adıma geçilir.

| Ders — planlandı | Tek görev | Kabul kanıtı |
| --- | --- | --- |
| 1.1 — Pencere ömrü | Pencere aç ve normal kapat. | Oluşturma ve kapanış noktalarını göster. |
| 1.2 — Oyun alanı | Sabit iki raket ve top çiz. | Bir koordinatı değiştir; ekrandaki sonucu önceden tahmin et. |
| 1.3 — Raket input’u | Bir raketi tuşlarla alan içinde hareket ettir. | Sınır ve zıt tuş davranışını göster. |
| 1.4 — Top ve zaman | Hızı geçen zamanla konuma uygula. | Aynı süre içindeki hareketi iki çalışma hızında karşılaştır. |
| 1.5 — İlk debug overlay | `dt`, top konumu ve hızını görünür yap. | Oyun sürerken bir beklenmedik değeri görüntüden takip et. |
| 1.6 — Duvar teması | Topun duvardan sekmesini sağla. | Temas yerini çiz; son temas bilgisini overlay’e ekle. |
| 1.7 — Raket teması | Topu raketten sektir. | Raket içinde sıkışma ve tekrarlı yön değişimini araştır; denenen hız aralığını belirt. |
| 1.8 — Sayı ve servis | Top dışarı çıktığında sayı ver ve servis durumuna dön. | Bir çıkışın yalnız bir sayı yazdığını göster. |
| 1.9 — İkinci oyuncu | İkinci rakete ayrı kontrol bağla. | İki oyuncunun eşzamanlı input’unu göster. |
| 1.10 — Maç sonu | Skor sınırında maçı bitir ve yeniden başlat. | Önceki maçın skor ve servis durumunun taşınmadığını doğrula. |
| 1.11 — Duraklama | Oyunu duraklatıp sürdür. | Hangi durumların durduğunu ve devam ederken ne olduğunu açıkla. |

Zaman dersinde fixed ve variable timestep farkına küçük karşılaştırmayla giriş yapılır; ayrıntılı simülasyon ve interpolasyon sonraki platformer görevlerinde derinleşir. Kontroller derleme sonucuyla sınırlı değildir: temas çizimi ve davranış gözlemi de gerekir.

## Pong v1 — It Feels Good

Her etki tek başına açılıp kapatılabilir olmalı; bu kısıt etkisini karşılaştırmak içindir. “Daha iyi” demek yerine hangi olayın daha okunur olduğunu veya hangi zamanlamanın kontrolü etkilediğini anlat.

| Ders — planlandı | Tek görev | Kabul kanıtı |
| --- | --- | --- |
| 1.12 — Vuruş sesi | Rakete temasta ses üret. | Tek vuruşta tek tepkiyi ve sessiz sürümle farkı göster. |
| 1.13 — Ses varyasyonu | Vuruş sesine kontrollü pitch çeşitliliği ekle. | İki ayarı karşılaştır; tekrarın algısını açıklayıp sınırları seç. |
| 1.14 — Hit pause | Temasa kısa duraklama ekle. | İki süreyi karşılaştır; hangi zamanlayıcıların durduğunu açıkla. |
| 1.15 — Top izi | Hareketi iz ile göster. | İz açık/kapalıyken topun okunabilirliğini karşılaştır. |
| 1.16 — Parçacık | Temasta kısa ömürlü parçacık üret. | Doğum/bitme noktalarını ve tekrarlanan vuruşlarda nesne sayısını göster. |
| 1.17 — Kamera tepkisi | Temasa küçük ekran sarsıntısı ekle. | Görsel hareketin çarpışma konumunu istemeden değiştirmediğini kontrol et. |
| 1.18 — Squash/stretch | Vuruşa kısa biçim tepkisi ekle. | Görsel boyut ve çarpışma şekli kararını açıklayarak etkiyi karşılaştır. |

Juice burada geri bildirim tasarımıdır. Breakout’ta bu deneyler daha çok nesneye ve ilk Dear ImGui runtime tuning paneline taşınacak. Bu panel geliştirici aracıdır; oyuncuya sunulacak menünün varsayılan çözümü değildir.

## Pong v2 — Engine Thinking

Artık çalışan sistemin bağımlılıklarına bakabilirsin. Kamera sarsıntısı neden top kodunda? Ses ve parçacık hangi olayı dinliyor? Bunlar önce soru ve küçük düzenleme görevleridir; bütün oyunlara uygun mimari çıkarma ödevi değildir.

| Ders — planlandı | Tek görev | Kabul kanıtı |
| --- | --- | --- |
| 1.19 — Frame’in izi | Input → update → render akışını kendi kodundan çiz. | Tek vuruşun skor, ses ve çizime hangi sırayla ulaştığını göster. |
| 1.20 — Tek bağımlılığı düzenle | Gereksiz bulduğun bir tepki bağımlılığını sadeleştir. | Önce/sonra davranışın aynı kaldığını göster; kararını açıkla. |
| 1.21 — Kaynak incelemesi | Bir kaynak veya nesnenin yaşam süresini izle. | Nerede oluşturulduğunu, kim kullandığını ve ne zaman bittiğini göster. |
| 1.22 — Bağımsız aktarım | Yeni bir servis veya skor kuralı seç ve uygula. | Önce kabul koşulunu yaz; sonra yeni davranışı göster. |

Ortak engine modülü, başka oyunlarda da aynı ihtiyaç görüldüğünde gerekçelendirilir. Şimdilik tekrar adaylarını teknik günlüğe kaydet. Bölüm teslimi; oynanabilir maç, kısa çalıştırma talimatı, davranış kontrol listesi, his karşılaştırması ve açık sorulardır. Başkasının oyunu çalıştırabilmesi ile senin sistemi açıklayabilmen birlikte değerlendirilir.
