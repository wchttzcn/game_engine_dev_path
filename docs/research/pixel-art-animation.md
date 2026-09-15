# Pixel art animasyon araştırması

Bu not, toplam başlangıç seviyesinde 8×8 sprite için 2–4 frame'lik hareketleri
hedefler. Amaç bir oyun animasyonunun okunmasını denemek; ileri renk teorisi
ve çok-frame'li tam walk cycle bu kapsamın dışında. Dersler iki pozlu yerinde
adımlamayı ve farklı küçük skill VFX örneklerini ayrı görevler olarak kullanır.

## Doğrulanan Aseprite akışı

Yerel kurulum: Aseprite 1.3.18.3-arm64. Aşağıdaki menü ve kısayollar, kurulu
paketteki `Contents/Resources/data/gui.xml` ile; davranışlar Aseprite'ın resmi
belgeleriyle çapraz doğrulandı.

1. `View > Timeline` (`Tab`) ile Timeline görünür. `Frame > New Frame`
   (`Alt+N`) yeni frame ekler. Timeline, layer'ları ve frame'leri gösterir.
   [Resmi Timeline belgesi](https://www.aseprite.org/docs/timeline/).
2. Değişecek bir çizim için `Frame > Duplicate Cels` (`Alt+D`) seçilir:
   kurulumdaki komut parametresi `celcopies`'dır. `Duplicate Linked Cels`
   (`Alt+Shift+D`) ise `cellinked` kullanır. Linked cel'ler aynı image ve
   `xy` konumunu paylaşır; birini değiştirmek hepsini değiştirir. Bu yüzden
   başlangıç alıştırmasında çizimi değiştirilecek frame için **Duplicate Cels**,
   sabit arka planı tekrar etmek için linked cel uygundur.
   [Linked Cels](https://www.aseprite.org/docs/linked-cels/) ve
   [Continuous Layers](https://www.aseprite.org/docs/continuous-layers/).
3. Frame seçiliyken `Frame > Frame Properties` (`P`) içinden duration
   değiştirilir; resmi belge duration'ı frame'in ekranda kalacağı milisaniye
   olarak tanımlar. İlk deneme için tüm frame'lerde **100 ms** ile başlanır;
   bu bir öğretim seçimi, resmi öneri değildir.
   [Frame Duration](https://www.aseprite.org/docs/frame-duration/) ve
   [Sprite structure](https://www.aseprite.org/docs/sprite/).
4. `Enter` ile playback aç/kapatılır (yerel `gui.xml`: `PlayAnimation`).
   Önce sadece frame sırasını ve hareketin okunmasını kontrol et; timing
   ayarını sonra değiştir. `F3` ya da Timeline'daki onion-skin düğmesi önceki
   ve sonraki frame'leri aynı anda referans olarak gösterir.
   [Onion Skinning](https://www.aseprite.org/docs/onion-skinning/).
5. Kaynak dosyayı `.aseprite` olarak sakla. Sonra `File > Export > Export As`
   ile `.gif` dışa aktar; resmi belgede aynı yolun GIF veya PNG dizisi
   ürettiği belirtilir. 8×8 GIF görünmüyorsa Export penceresindeki `Resize`
   alanında **800%** kullanmak, paylaşım önizlemesi içindir; oyun asset'inin
   boyutunu değiştirmek için değildir.
   [Exporting](https://www.aseprite.org/docs/exporting/).

## Başlangıç için üç küçük ders

### 1. İki frame'lik parıltı

**Fikir:** Aynı nesneyi baştan çizmek yerine, bir frame'de tek bir pikselin
varlığı/konumu bile hareket hissi verir. 8×8 alanda 2 frame: küçük `+` parıltı,
sonra merkezde tek piksel. 100 ms ile oynat; sonra ikinci frame'i 200 ms yapıp
hangisinin daha okunur olduğuna bak. Kabul: GIF döngüde okunuyor ve sprite
canvas dışına taşmıyor.

### 2. Üç frame'lik mermi

**Fikir:** hazırlık → action → dağılım, küçük bir efektin anlatı sırasıdır.
Frame 1: kaynakta bir piksel/parıltı; frame 2: hedef yönünde 2–3 piksel çizgi;
frame 3: çizgi yerine iki ayrık piksel. Onion skin ile merkezin yerini koru.
Kabul: yön, yalnız GIF'e bakarak seçilebilir.

### 3. Dört frame'lik kılıç izi

**Fikir:** anticipation ana hareketten önce ters yönde küçük bir hazırlıktır;
action en belirgin pozdur; dissipation iz/etkinin sönmesidir. Frame 1: silah
ucu bir piksel geri; frame 2: kısa çapraz iz; frame 3: en geniş çapraz iz;
frame 4: iki seyrek piksel. Bu sırayı önce silhouette ile yap, renk eklemeyi
zorunlu tutma. Kabul: 4 frame'in her biri farklı bir görev taşıyor; linked cel
üzerinde yanlışlıkla çizim değiştirilmemiş.

Healing için aynı üçlü, saldırı izi yerine yukarı büyüyen küçük `+`/damla ile
uygulanabilir. Kullanıcının dört sınıf için isteği doğrultusunda derslerde
projectile yönü, slash yayı, healing yükselişi ve impact dağılımı ayrı küçük
görevler oldu; hazır renklerle, aynı 8×8 sınırında kalıyorlar.

## Artist kaynakları ve sınırlar

Güncel erişilebilir makale: [Saint11 — A Basic Aseprite Animation](https://saint11.art/pixel_art_articles/article3/).
Bu doğrudan kaynak frame sırası, süre, basit pozlar ve export'u açıklar.
32×32 top örneği bizim 8×8 derslerinin ölçü sınırı değildir; kendi karakter
örneklerimiz kullanılır. Derslerde menüler güncel resmî Aseprite belgeleriyle
eşleştirildi. Aşağıdaki Patreon bağlantısı tarihsel yayın kaydıdır.

Bu çalışma, "anticipation/action/dissipation"ı evrensel bir Aseprite kuralı ya
da frame sayısı reçetesi olarak sunmaz. 2–4 frame ve 100 ms başlangıç değerleri
ders kapsamı için seçildi. Artist önerileri, kaynak sahibinin pratik yaklaşımıdır;
ölçülebilir teknik standart değildir.

- [Pedro Medeiros (Saint11), *How to start making pixel art #3 — A basic
  Aseprite animation*](https://www.patreon.com/saint11/posts/how-to-start-art-21021932)
  (27 Ağustos 2018), yazının özellikle yeni başlayanlar için olduğunu ve basit
  Aseprite animasyonunu anlattığını belirtir. Bu, araç-temelli ilk ders için
  doğrudan kaynaktır. Medeiros'un bağladığı özgün makale:
  [Medium](https://medium.com/pixel-grimoire/how-to-start-making-pixel-art-3-c9eb70270fa1).
- [Gabriel Aguiar'ın kurs açıklaması](https://gabrielaguiarproductions.artstation.com/projects/QzbeVd),
  spark ile başlayıp anticipation, climax, dissipation ve projectile örneklerine
  ilerlediğini söyler. Kaynak sanatçıya aittir ancak 3D/engine VFX bağlamındadır;
  burada yalnız efektin üç aşamalı öğretim sırası için referans alınabilir.
- [Jason Lee, slash kavramı](https://jasontomlee.itch.io/slashfx/devlog/555428/tutorial-1-how-to-concept-a-slash)
  çizimden önce motion, size ve shape seçmeyi; sonra tek bir eskiz frame'ini
  temizlemeyi önerir. [Slash shape devamı](https://jasontomlee.itch.io/slashfx/devlog/629732/tutorial-2-slash-shape-fundamentals),
  dar arka ucun hız/zaman izlenimi verdiğini ve slash climax'inin yalnız 1–2
  frame sürebileceğini söyler. Bu, dört frame'lik slash dersindeki en güçlü
  kaynak sınırıdır; bütün efektlerin 1–2 frame olması sonucu çıkarılamaz.
- [Jason Lee'nin spark varyasyonları](https://jasontomlee.itch.io/hitspark-fx/devlog/613192/2-batch-1-spark-variations)
  artistin kendi pixel-art hitspark setinden görsel referanstır; timing dersi
  olarak kullanılmamalıdır. [Zakhan'ın particle pack'i](https://zakhanvfx.com/pixel-art-particles-pack/)
  slash, spark, projectile ve healing efektlerini aynı artistin örnekleri olarak
  listeler; asset vitrini olduğundan uygulama tarifi değildir.

## Kaynakların sahipliği

- Aseprite resmi belgeleri: yukarıdaki doğrudan `aseprite.org/docs/` bağlantıları.
- Yerel UI doğrulaması: `/Users/mtezcan/Library/Application Support/Steam/steamapps/common/Aseprite/Aseprite.app/Contents/Resources/data/gui.xml`, satır 104–132, 152 ve 941–965. Bu dosya yerel sürümün menü/komut eşleşmesini doğrular; davranış iddialarının kaynağı resmi belgelerdir.
