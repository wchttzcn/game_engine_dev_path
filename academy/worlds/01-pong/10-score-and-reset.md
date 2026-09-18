---
title: "1.10 — Skor ve servis"
description: "Top saha dışına çıktığında skoru güncelle ve topu belirli bir yöne sıfırla."
section: Oynanış
---

# 1.10 — Skor ve servis

**Hedef:** Top sol veya sağ sınırı geçtiğinde doğru oyuncunun skorunu artırıp
topu belirli bir servis yönüyle yeniden oyuna sok.

## Ön koşul

1.9'un sonundaki hız ayarını yaptığından emin ol: rakip topu ıskalayabiliyor
olmalı. Rakip her topa yetişiyorsa top sağ sınırdan hiç çıkmaz ve bu dersin
kabul ölçütlerinin yarısını gözleyemezsin.

## Görev

Mevcut `Game` state'ine iki skor alanı ekle. Update sırasında topun tamamının
sol veya sağ sınırı geçtiğini tespit et. Sol sınırdan çıkarsa sağ oyuncunun,
sağ sınırdan çıkarsa sol oyuncunun skorunu artır. Yatay sınırlar 1.3'te
tanımladığın `SCREEN_WIDTH` sabitinden gelsin. Ardından topu sahanın merkezine
(`SCREEN_WIDTH / 2`, `SCREEN_HEIGHT / 2`) koy ve hızı, skoru kaptıran oyuncuya
doğru gidecek şekilde sabit bir değere ayarla. Skorları ekrana çiz.

## Ne zaman bitti?

- Top soldan çıkınca sağ skor bir artıyor; top sağdan çıkınca sol skor bir artıyor.
- Her skordan sonra top merkezde beliriyor ve kaybeden oyuncuya doğru ilerliyor.
- Skor ekranda okunuyor.
- `odin check games/pong` geçiyor.

## Bilmen gereken küçük parça

Skor artışı bir collision değildir; topun sahanın sahip olduğu çıkış kuralını
tetiklemesidir. Bu yüzden kontrol, topun merkez konumu ile radius'unu game area
sınırlarıyla karşılaştırır. Top sağdan çıktıysa sonraki servis sola gider:
oyuncu topa yetişme şansı bulur. Bu yönü rastgele seçmeyelim; şimdi amaç
tekrarlanabilir bir kural kurmak.

`Ball` ve `Game` aynı state'in parçalarıdır. Reset işlemi sadece position'ı
değil, velocity'yi de belirlemelidir; aksi halde merkezde duran ama önceki
yönde kaçmaya devam eden bir top üretirsin.

### Ekrana sayı yazmak: `cstring` meselesi

Bu paketin ilk kez metin çizdiğin dersi, ve araya Odin'e özgü bir çevrim
giriyor. Kurulu binding'deki imza şu:

```odin
DrawText :: proc(text: cstring, posX, posY: c.int, fontSize: c.int, color: Color)
```

İstediği tip `string` değil, `cstring`. İkisi Odin'de farklı şeyler. Odin'in
`string` tipi uzunluğunu kendi içinde taşır. `cstring` ise C'nin temsili:
uzunluk yoktur, metnin bittiği yeri sonundaki `0` byte belirtir. raylib bir C
kütüphanesi olduğu için `cstring` bekler. Yani elindeki `i32` skoru önce metne,
sonra bu temsile çevirmen gerekiyor.

Bunu yapan hazır çağrı binding'in içinde:

```odin
TextFormat :: proc(text: cstring, args: ..any) -> cstring
```

İlk parametre bir **format string**: `printf` biçimini kullanır, `%d` tam sayı
yerine geçer. Kalan argümanlar oraya yerleşir. Dönüş değeri doğrudan
`DrawText`'e verebileceğin `cstring`. Çağrının biçimi:

```odin
rl.DrawText(rl.TextFormat("%d", game.player_score), 150, 40, 32, rl.WHITE)
```

Bu tek satır çevrimin tamamını yapar. `core:fmt` veya `core:strings` import
etmene, kendi çevrim procedure'ını yazmana gerek yok — `TextFormat` sonucu
kendi içindeki sabit buffer'a yazar, allocation yapmaz.

Bir uyarı: o buffer sabit sayıda (`MAX_TEXTFORMAT_BUFFERS`, varsayılan `4`) ve
sırayla dönüyor. Yani dönen `cstring` kalıcı değil; dört çağrı sonra üzerine
yazılır. Çiz ve unut — sakladığın bir field'a koyma.

Bu metin render state'idir; skorun kaynağı `Game` içindeki sayısal field'lar
olarak kalır.

## Sınırlar

- Sadece top tamamen sol veya sağ sınırı geçtiğinde skoru artır; üst ve alt duvar
  bu dersin konusu değil.
- İki çıkış kolunda aynı position/velocity atamalarını kopyalama; bu kuralın
  iki kez değişmesi ileride hata üretir. Hangi taraftan çıktığını bir servis
  yönü değişkenine (`-1` veya `+1`) yaz, sıfırlamayı o değişkeni okuyan tek bir
  yerde yap. Bunu ayrı bir procedure'a çıkarmak 1.13'ün konusu; burada tek yol
  yeter.
- Servis hızı sabit ve yönü deterministic kalsın. Rastgelelik game feel için
  daha sonra anlamlı bir karar olacak.

::: details İpucu 1 — Hangi sınır geçti?
Topun sol kenarı `x - radius`, sağ kenarı `x + radius` olur. “Tamamen çıktı”
demek için topun **uzak** kenarına bakarsın, yakın kenarına değil: soldan
çıkışta topun sağ kenarı `0`'ın solunda kalmalı, sağdan çıkışta sol kenarı
`SCREEN_WIDTH`'in sağında. Yakın kenarı kullanırsan top duvara değdiği anda skor
olur ve ekrandan hiç çıkmaz.
:::

::: details İpucu 2 — Sıfırlamayı tek yola indirmek
İki `if` dalının içinde yalnız skoru artır ve servis yönünü bir değişkene yaz
(`dir := f32(-1)` veya `+1`). Dalların dışında, o değişken sıfırdan farklıysa
topu merkeze koy ve hızını `dir` ile çarp. Böylece position/velocity ataması
dosyada tek bir yerde durur.
:::

::: details İpucu 3 — Yön tablosu
Top sol sınırdan çıktıysa sağ oyuncunun skoru arttı; servis sola gider. Top
sağ sınırdan çıktıysa sol oyuncunun skoru arttı; servis sağa gider.
:::

::: details Deep Dive — Neden deterministic servis?
Deterministic davranış aynı input ve state ile aynı sonucu üretir. Burada
debugging için değerlidir: bir skor hatası tekrarlandığında topun neden başka
bir yöne gittiğini ayırman gerekmez. Rastgele servis eklendiğinde rastgele
state'i de oyunun state'i olarak ele almak gerekir.
:::

## Birincil kaynak

[Odin vendor:raylib — `DrawText`](https://pkg.odin-lang.org/vendor/raylib/#DrawText).
Skoru çizerken kullanacağın imza; sayıyı `cstring`'e çevirmek için aynı sayfadaki
[`TextFormat`](https://pkg.odin-lang.org/vendor/raylib/#TextFormat).

**Kazanım:** Sahanın sınır kuralını, skor state'ini ve tam reset'i birlikte
kurmuş oldun.

**“Pong 1.10 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım bu kuralların maç içinde hangi sırayla geçerli olduğunu açıkça
tanımlamak: [1.11 — Servis state'i](/worlds/01-pong/11-serve-state).
