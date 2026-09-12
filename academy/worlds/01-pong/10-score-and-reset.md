---
title: "1.10 — Sayı ve servis"
description: "Top saha dışına çıktığında skoru güncelle ve topu belirli bir yöne sıfırla."
---

# 1.10 — Sayı ve servis

**Hedef:** Top sol veya sağ sınırı geçtiğinde doğru oyuncunun skorunu artırıp
topu belirli bir servis yönüyle yeniden oyuna sok.

## Görev

Mevcut `Game` state'ine iki skor alanı ekle. Update sırasında topun tamamının
sol veya sağ sınırı geçtiğini tespit et. Sol sınırdan çıkarsa sağ oyuncunun,
sağ sınırdan çıkarsa sol oyuncunun skorunu artır. Yatay sınırlar 1.3'te
tanımladığın `SCREEN_WIDTH` sabitinden gelsin. Ardından topu sahanın merkezine
(`SCREEN_WIDTH / 2`, `SCREEN_HEIGHT / 2`) koy ve hızı, sayı kaybeden oyuncuya
doğru gidecek şekilde sabit bir değere ayarla. Skorları ekrana çiz.

## Bilmen gereken küçük parça

Sayı bir collision değildir; topun sahanın sahip olduğu çıkış kuralını
tetiklemesidir. Bu yüzden kontrol, topun merkez konumu ile radius'unu game area
sınırlarıyla karşılaştırır. Top sağdan çıktıysa sonraki servis sola gider:
oyuncu topa yetişme şansı bulur. Bu yönü rastgele seçmeyelim; şimdi amaç
tekrarlanabilir bir kural kurmak.

`Ball` ve `Game` aynı state'in parçalarıdır. Reset işlemi sadece position'ı
değil, velocity'yi de belirlemelidir; aksi halde merkezde duran ama önceki
yönde kaçmaya devam eden bir top üretirsin.

Skor sayılarını `rl.TextFormat` ile raylib'in beklediği `cstring` metnine çevirip
`rl.DrawText` ile çizebilirsin. Bu metin render state'idir; skorun kaynağı
`Game` içindeki sayısal field'lar olarak kalır.

## Sınırlar

- Sadece top tamamen sol veya sağ sınırı geçtiğinde sayı ver; üst ve alt duvar
  bu dersin konusu değil.
- Reset işlemini tek bir küçük procedure'da topla. İki çıkış kolunda aynı
  position/velocity atamalarını kopyalama; bu kuralın iki kez değişmesi
  ileride hata üretir.
- Servis hızı sabit ve yönü deterministic kalsın. Rastgelelik game feel için
  daha sonra anlamlı bir karar olacak.

## Ne zaman bitti?

- Top soldan çıkınca sağ skor bir artıyor; top sağdan çıkınca sol skor bir artıyor.
- Her sayıdan sonra top merkezde beliriyor ve kaybeden oyuncuya doğru ilerliyor.
- Skor ekranda okunuyor.
- `odin check games/pong` geçiyor.

::: details İpucu 1 — Hangi sınır geçti?
Topun sol kenarı `x - radius`, sağ kenarı `x + radius` olur. Bunları oyun
alanının yatay sınırlarıyla — `0` ve `SCREEN_WIDTH` — karşılaştır.
:::

::: details İpucu 2 — Reset procedure'ın girdisi
Procedure'a yalnızca `ball: ^Ball` ve servis yönü için bir işaret (`-1` veya
`+1`) vermek yeterli olabilir. Skor değişimi çağıranın sorumluluğunda kalsın.
:::

::: details İpucu 3 — Yön tablosu
Top sol sınırdan çıktıysa sağ oyuncu sayı aldı; servis sola gider. Top sağ
sınırdan çıktıysa sol oyuncu sayı aldı; servis sağa gider.
:::

::: details Deep Dive — Neden deterministic servis?
Deterministic davranış aynı input ve state ile aynı sonucu üretir. Burada
debugging için değerlidir: bir sayı hatası tekrarlandığında topun neden başka
bir yöne gittiğini ayırman gerekmez. Rastgele servis eklendiğinde rastgele
state'i de oyunun state'i olarak ele almak gerekir.
:::

## Birincil kaynak

[Odin vendor:raylib — `DrawText`](https://pkg.odin-lang.org/vendor/raylib/#DrawText).
Skoru çizerken kullanacağın imza; sayıyı `cstring`e çevirmek için aynı sayfadaki
[`TextFormat`](https://pkg.odin-lang.org/vendor/raylib/#TextFormat).

**Kazanım:** Sahanın sınır kuralını, skor state'ini ve tam reset'i birlikte
kurmuş oldun. Sonraki adım bu kuralların maç içinde hangi sırayla geçerli
olduğunu açıkça tanımlamak.
