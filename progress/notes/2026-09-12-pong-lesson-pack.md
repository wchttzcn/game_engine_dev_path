# Pong 1.2–1.13 ders paketi

Hazırlanma zamanı: 2026-09-12T09:24:26Z.

Mücahit hızlı ilerleyebileceğini belirterek World 1 için en az 12 sonraki dersin
hazırlanmasını istedi. 1.2–1.13 arasında 12 yeni ders yazıldı ve hazır dersler
olarak `progress/current.json` kaydına eklendi. Aktif ders 1.2'ye taşındı; bu bir
öğrenci girişimi veya tamamlanma kanıtı değildir.

Paketin sırası:

1. Oyun state'i
2. Player input
3. Delta time
4. Ball velocity
5. Üst/alt duvar response'u
6. İki paddle için collision detection
7. İki paddle için penetration correction ve collision response
8. Sınırlı hızlı opponent AI
9. Skor ve deterministic servis
10. Explicit match state
11. Update/render procedure sınırı
12. F1 debug overlay

Dersler aynı `games/pong/main.odin` implementasyonu üzerinde kümülatif ilerler.
Top bütün pakette merkez `x/y`, `radius` ve velocity ile temsil edilir; `Game`
state iki paddle ile topun owner'ıdır. Rapor, journal, tahmin ve trivial değer
değişikliği geçme koşulu değildir. Her ders bir ana fikir, checkable kabul
koşulları, üç kapalı ipucu ve optional Deep Dive içerir.

Yerel Odin dev-2026-08 raylib binding'inde kullanılan `IsKeyDown`,
`IsKeyPressed`, `GetFrameTime`, `CheckCollisionCircleRec`, `DrawCircleV`,
`DrawCircleLinesV`, `DrawRectangleLines`, `DrawText`, `DrawFPS`, `TextFormat`,
`GetFPS`, `Rectangle` ve `Vector2` API'leri kontrol edildi. Ses ve daha geniş game-feel paketi 1.13
sonrasında, oynanabilir temel sürümden doğan ihtiyaca bırakıldı.
