# Idle RPG — oyun tasarımı özeti

Bu belge, Pixel Art paketinin ikinci fazının (1.25–1.108) hizalandığı oyunu
tanımlar. Amaç bir yapım planı değil; **hangi asset'in neden var olduğunu**
tek yerde tutmak. Odin tarafındaki implementasyon Mücahit'e aittir; burada
yalnız oyunun kuralları ve her kuralın görsel karşılığı yazılıdır.

## Tek cümle

Oyuncu tek bir karakterle başlar, guild'i büyüttükçe parti üyesi satın alır,
her karakteri kendi statları, ekipmanı ve skill ağacıyla geliştirir; savaş
kendiliğinden döner ve skill'ler barları dolduğunda otomatik tetiklenir.

## Döngü

1. **Seç.** Oyun dört karakterden biriyle başlar (mage, warrior, priest, archer).
2. **Dövüş.** Savaş oyuncunun girdisi olmadan döner; hasar, ödül ve altın birikir.
3. **Harca.** Altın ekipmana, parti üyesine ve skill puanına gider.
4. **Büyü.** Guild seviyesi yükselir, yeni parti slotu ve yeni karakter açılır.
5. **Başa dön.** Prestige, döngüyü çarpanla yeniden başlatır.

## Sistemler ve görsel karşılıkları

| Sistem | Kural | Görsel karşılığı |
| --- | --- | --- |
| Karakter seçimi | Oyun tek karakterle başlar | Karakter kartı ve seçili hâli (1.86) |
| Kadro | Guild seviyesi ve altın yettikçe üye alınır | Kilitli kart, fiyat rengi, parti slotları (1.87, 1.89) |
| Guild | Açılan slot sayısını belirleyen ana sayaç | Guild rozeti ve binası (1.88) |
| Stat | Her karakterin kendi ATK/DEF/HP/SPD/CRIT değeri var | Beş ikon, hizalanmış satır, fark oku (1.91–1.93) |
| Envanter | Eşyalar tier'lıdır; üç slot kuşanılır | Ekipman slotları ve tier çerçeveleri (1.94, 1.73) |
| Kuşanma | Eşya değişince karakter de değişir | Birkaç pixel'in renk değişimi (1.95) |
| Skill | Her karakterin kendi skill'i vardır | Karaktere özel skill ikonu (1.97) |
| Otomasyon | Bar dolunca skill kendiliğinden çıkar | Dolan bar, cooldown, AUTO zinciri (1.98–1.100) |
| Skill tree | Küçük, karaktere özel, tek seferde tek karar | Düğüm hâlleri, hatlar, ağaç ekranı (1.101–1.103) |
| Durum etkileri | Karakterin üstünde görünür, listede değil | Palet değişimi, aura, kabuk, rozet şeridi (1.104–1.107) |
| İlerleme | Prestige, çarpan, başarım, offline kazanç | 1.77–1.81 |

## Görsel kurallar

- **Ölçüyü parçanın işi belirler.** Karakter, monster ve eşya ikonu 8×8; slot
  12×12; kart 24×32; bar 32×4, 32×6 veya 32×8; ekran 160×96.
- **Kötü durum paleti değiştirir, iyi durum katman ekler.** Zehir, yanma ve
  donma karakterin rampasını değiştirir; buff ve kalkan karakterin altına ve
  dışına eklenir. Stun ikisini de yapmaz, yalnız işaret koyar.
- **Anlamı kenar taşır, içeriği orta taşır.** Slot ve kartlarda durum kenar
  renginden okunur; içerik orta bölgeye ait kalır.
- **Ekranda en parlak şey yapılacak iştir.** `HIRE`, alınabilir kart ve altın
  kenarlı skill düğümü dışında `#e3ab52` ve `#ffe5a3` kullanılmaz.
- **Bir kalıp bir kez çizilir, çok yerde kullanılır.** 12×12 slot envanterde,
  parti sırasında, skill barında ve skill ağacında aynı kalıptır.

## Kasıtlı sınırlar

Bunlar eksik değil, **kapsam dışı**: kaydırılabilir listeler, sürükle bırak,
eşya bilgi kutusu, dört yönlü karakter setleri, particle sistemi, shader,
büyük canvas ve asset pipeline. Gerekli olduklarında tek tek ders olarak
eklenirler; hiçbiri başlangıç ödevi değildir.

## Nerede yaşıyor?

- Ders paketi: `academy/pixel-art/` (yol haritası: `academy/pixel-art/roadmap.md`)
- Ekran örnekleri: `academy/pixel-art/idle-kit.md`
- Öğrenci çizimleri: `art/` (Mücahit'e ait)
- Oyun kodu: Odin tarafındaki ilgili oyun dizini (Mücahit'e ait)
