---
title: "1.11 — Servis state'i"
description: "1.10'un otomatik servisini Serving ve Playing state'lerine bağla; servisi Space başlatsın."
---

# 1.11 — Servis state'i

**Hedef:** Sayı sonrası topun ne zaman hareket ettiğini skordan türetmeyi bırak;
bunu `Serving` ve `Playing` state'leriyle açıkça söyle.

## Görev

1.10'da yazdığın reset procedure'ı topu merkeze koyup **hemen** velocity
veriyor: sayıdan sonra top kendiliğinden servise çıkıyor. Bu dersin işi o
kararı görünür kılmak. `Match_State :: enum { Serving, Playing }` tipini tanımla
ve `match_state` alanını `Game` içine koy. Maç `Serving` ile başlasın. Update
içinde `switch` ile dallan: `Serving` sırasında top hiç hareket etmesin ve skor
işlemesin, yalnızca Space beklensin; Space'e basıldığında state `Playing`
olsun. `Playing` sırasında 1.5–1.10'da kurduğun top hareketi, collision ve sayı
kuralları çalışsın. Sayı verildikten sonra reset'i çağır ve state'i yeniden
`Serving` yap.

## Bilmen gereken küçük parça

Burada sessizce yeni bir davranış eklemiyorsun; bir ders önce yazdığın davranışı
açık hale getiriyorsun. 1.10'daki reset, "sayıdan sonra ne oluyor?" sorusuna
_"top anında kaybedene doğru gider"_ cevabını veriyordu ve bu cevap kodda
hiçbir yerde yazmıyordu — velocity atamasının yan etkisiydi. Skora bakarak da
bulunmaz: 3–2 skoru sana servis mi bekleniyor, top mu uçuyor söylemez. Bu
yüzden cevabı state olarak saklarız.

Reset'in kendisi değişmek zorunda değil. Servis yönünü hâlâ o belirlesin; sen
yalnızca o velocity'nin position'a **ne zaman** uygulandığını state'e bağla.
`Serving` sırasında top güncellenmediği için velocity duruyor ama etki etmiyor;
Space o beklemeyi bitirir.

Servis input'u tek seferlik bir olaydır. `rl.IsKeyPressed(.SPACE)` yalnızca
tuşun basıldığı frame'de `true` döner; `IsKeyDown` kullanırsan tuşu basılı
tutmak her frame aynı transition'ı tetikler.

## Sınırlar

- Durumları enum ile temsil et; `is_serving` gibi boolean'larla değil. İki
  boolean dört kombinasyon üretir, ikisi anlamsızdır.
- Tipi de üyeleri de Ada_Case yaz (`Match_State`, `Serving`): Odin'de
  SCREAMING_SNAKE_CASE constant'a ayrılmıştır, enum üyesine değil.
- Maç sonu bu dersin konusu değil. Şimdilik iki state yeter; `Match_Over` bir
  sonraki derste gelir.
- 1.10'un deterministic servis yönü kuralı aynı kalsın; rastgelelik ekleme.

## Ne zaman bitti?

- Oyun açıldığında top merkezde duruyor; Space'e basılana kadar kıpırdamıyor.
- Space topu 1.10'un belirlediği yöne gönderiyor ve state `Playing` oluyor.
- Sayıdan sonra top merkeze dönüyor ve yeniden Space bekliyor.
- `Serving` sırasında ne top hareket ediyor ne de skor artıyor.
- `odin check games/pong` geçiyor.

::: details İpucu 1 — State nerede yaşar?
`match_state: Match_State` alanını `Game` içine koy. Skor, top ve maç aşaması
aynı frame state'inin altında dursun; update de draw da oradan okur.
:::

::: details İpucu 2 — Switch'in iki kolu
`switch game.match_state` içinde `case .Serving:` yalnızca Space kontrolü
yapar. `case .Playing:` ise şu anda update'te olan top hareketi, collision ve
sayı bloğunu olduğu gibi sarar.
:::

::: details İpucu 3 — Reset'ten sonra ne olacak?
Sayıyı verip reset'i çağırdığın satırın hemen ardına
`game.match_state = .Serving` koy. Aynı satır dizisi maçın başlangıcında da
işini görür.
:::

::: details Deep Dive — Neden state'i skordan türetmiyoruz?
Türetilmiş state, kaynağı ile arasındaki kuralı her okuyan yerde yeniden yazmanı
ister. `score_left == 0 && score_right == 0` "maç yeni başladı" demek olabilir,
ama sayı sonrası bekleyişi anlatamaz. Saklanan state ise tek yerde değişir ve
her okuyan aynı cevabı görür. Kural şu: bir bilgi input'tan veya zamandan
doğuyorsa sakla; mevcut state'ten her seferinde aynı şekilde hesaplanıyorsa
türet.
:::

## Birincil kaynak

[State — Robert Nystrom, Game Programming
Patterns](https://gameprogrammingpatterns.com/state.html).
Finite state machine'in enum ve `switch` ile en yalın kurulumu; bölümün ilerisi
nesne tabanlı varyantlara gider, Pong'un ihtiyacı ilk kısımdır. Bu dersteki
adlandırmanın dayanağı ise [Odin adlandırma
konvansiyonu](https://github.com/odin-lang/Odin/blob/master/base/runtime/core.odin):
kuralı dilin kendi kaynak dosyası söyler.

**Kazanım:** Maçın en belirsiz anı — "top ne zaman kalkar?" — artık kodda yazılı.
Sonraki adım aynı enum'a maçın sonunu eklemek:
[1.12 — Maç sonu ve restart](/worlds/01-pong/12-match-over).
