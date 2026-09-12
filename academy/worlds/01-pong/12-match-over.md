---
title: "1.12 — Maç sonu ve restart"
description: "Kazanma skorunda maçı bitir, kazananı göster ve R ile temiz bir yeni maç başlat."
---

# 1.12 — Maç sonu ve restart

**Hedef:** Maçın bittiği anı üçüncü bir state olarak tanımla, kazananı göster ve
`R` ile sıfırdan yeni bir maça dön.

## Görev

1.11'de kurduğun enum'a üçüncü üyeyi ekle: `Match_Over`. Kazanma hedefi için bir
constant tanımla (`WIN_SCORE :: 5` gibi). Sayı verdiğin yerde skor bu hedefe
ulaştıysa state'i `Serving` yerine `Match_Over` yap. `Match_Over` sırasında top
hareket etmesin, skor artmasın; ekranda kazananın kim olduğu yazsın. `R` her
state'ten temiz bir yeni maç başlatsın: iki skor da sıfır, top merkezde, state
`Serving`.

## Bilmen gereken küçük parça

Restart bir state transition değil, state'in tamamının yeniden kurulmasıdır. Bu
yüzden `R` kontrolü `switch`in içinde bir kola değil, `switch`ten önce gelir:
hangi state'te olursan ol aynı işi yapar. `Match_Over` ekranında kilitlenmiş bir
oyundan çıkışın tek yolu da budur.

Skorları sıfırlarken topu da 1.11'deki yola sokmayı unutma; yalnızca sayıları
sıfırlarsan yeni maç, önceki maçın son servis yönüyle ve yarı yolda kalmış bir
topla başlar. Reset procedure'ı zaten elinde — restart onu çağırsın, kendi
position/velocity atamalarını kopyalamasın.

Kazananı ayrı bir field'da saklaman gerekmiyor. `Match_Over` state'inde iki
skoru karşılaştırmak yeterli bilgi verir; kazananın kimliği başka kurallara
(istatistik, seri takibi) girdi olduğunda saklamanın bir nedeni doğar.

## Sınırlar

- Kazanma hedefi sabit bir constant olsun; ayar menüsü, config dosyası veya
  komut satırı parametresi ekleme.
- Restart'ı tek yerde topla. İki ayrı `R` kontrolü yazarsan biri zamanla
  diğerinden farklı bir maç kurar.
- `Match_Over` sırasında top update'i ve skor artışı çalışmamalı; bitmiş maçta
  hareket eden bir top state'in yalan söylediğinin işaretidir.
- Kazanan metni için şimdilik `rl.DrawText` yeterli. Menü, buton veya ekran
  geçişi efekti bu dersin konusu değil.

## Ne zaman bitti?

- Bir oyuncu `WIN_SCORE` değerine ulaştığında maç bitiyor ve top duruyor.
- Ekranda hangi oyuncunun kazandığı okunuyor.
- `R`, `Serving`, `Playing` ve `Match_Over` state'lerinin üçünden de sıfır–sıfır
  ve merkezdeki topla yeni bir maç başlatıyor.
- Yeni maç ilk servisi yine Space ile bekliyor.
- `odin check games/pong` geçiyor.

::: details İpucu 1 — Kazanma kontrolü nereye girer?
Skoru artırdığın satırın hemen ardına. O an elinde yeni skor var; hedefe
ulaştıysa `Match_Over`, ulaşmadıysa `Serving`.
:::

::: details İpucu 2 — R'nin yeri
`update_game` içinde `switch game.match_state` satırından **önce**
`if rl.IsKeyPressed(.R)` bloğunu koy. Blok skorları sıfırlar, reset'i çağırır,
state'i `Serving` yapar.
:::

::: details İpucu 3 — Kazananı yazdırmak
`rl.TextFormat` ile metni kurup `rl.DrawText` ile çiz. Hangi metni yazacağını
`game.score_left > game.score_right` karşılaştırması seçer; ayrı bir `winner`
alanına gerek yok.
:::

::: details Deep Dive — Bu enum nereye kadar büyür?
Üç state ve aralarındaki geçişler artık küçük bir finite state machine. Serve
countdown, pause veya replay eklediğinde her yeni durumun hangi input'a ve
hangi update'e izin verdiği tek `switch`te görünür kalır. State sayısı
büyüdüğünde sorun `switch` değil, geçiş kurallarının dağılmasıdır: transition'ı
her yerde değil, tek bir yerde yapan bir procedure o noktada anlam kazanır.
Pong'un buna ihtiyacı yok; framework çıkarmak için erken.
:::

## Birincil kaynak

[Odin vendor:raylib — `IsKeyPressed`](https://pkg.odin-lang.org/vendor/raylib/#IsKeyPressed).
`R` tuşunun `KeyboardKey` üyesi olarak yazılışı ve tek seferlik basış
semantiği burada; kazanan metnini çizeceğin `DrawText` ile `TextFormat` de aynı
binding sayfasında.

**Kazanım:** Maç artık başlayıp bitiyor ve yeniden başlıyor — Pong oynanabilir.
Sonraki adım bu büyüyen update kodunu çizimden ayırmak:
[1.13 — Update ve render sınırı](/worlds/01-pong/13-update-render).
