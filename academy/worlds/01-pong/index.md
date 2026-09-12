# Dünya 1 — Pong

Pong, oyun geliştirme yolunun başlangıcı. Her ders tek bir oyun problemini çözer;
aynı `games/pong/main.odin` dosyası adım adım oynanabilir maça dönüşür.

## Şimdi

<CurrentLesson />

```sh
odin run games/pong -out:/tmp/mucahit-pong
```

## Hazır dersler

### Temel hareket

1. [1.1 — İlk raketi çiz](/worlds/01-pong/01-first-paddle)
2. [1.2 — Game state'i kur](/worlds/01-pong/02-game-state)
3. [1.3 — Player input](/worlds/01-pong/03-player-input)
4. [1.4 — Delta time](/worlds/01-pong/04-delta-time)
5. [1.5 — Ball velocity](/worlds/01-pong/05-ball-velocity)

### Oynanış

6. [1.6 — Duvar sekmesi](/worlds/01-pong/06-wall-bounce)
7. [1.7 — Paddle collision](/worlds/01-pong/07-paddle-collision)
8. [1.8 — Collision response](/worlds/01-pong/08-collision-response)
9. [1.9 — Rakip AI](/worlds/01-pong/09-opponent-ai)
10. [1.10 — Skor ve servis](/worlds/01-pong/10-score-and-reset)
11. [1.11 — Servis state'i](/worlds/01-pong/11-serve-state)
12. [1.12 — Maç sonu ve restart](/worlds/01-pong/12-match-over)

### Kod sınırları ve araç

13. [1.13 — Update / render](/worlds/01-pong/13-update-render)
14. [1.14 — Debug overlay](/worlds/01-pong/14-debug-overlay)
15. [1.15 — Collision shape'lerini çiz](/worlds/01-pong/15-collision-shapes)

Bu paket bittiğinde maç oynanabilir, yeniden başlatılabilir; önemli state ve
collision shape'leri F1 ile görünür olur. Ses ve game-feel adımları sonraki
paket için açık kalır.
