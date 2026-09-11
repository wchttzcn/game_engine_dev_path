# Dünya 1 — Pong

Pong, oyun geliştirme yolunun başlangıcı. Önce ekrana bir raket koyarız; sonra oyunda ortaya çıkan sıradaki problemi küçük bir lesson'a dönüştürürüz.

## Şimdi

[1.1 — İlk raketi çiz](/worlds/01-pong/01-first-paddle)

Tek fikir: screen coordinate'leri. Hazır pencereye bir rectangle çiz, `x` coordinate'ini değiştir ve sonucun neden o tarafta göründüğünü açıkla.

```sh
odin run games/pong -out:/tmp/mucahit-pong
```

## Sonra

Sonraki lesson, bu denemeden sonra gelecek. Muhtemel sıradaki oyun problemi: game area'ya top veya ikinci raket eklemek. Input, timing, collision ve debug text; oyun bunları gerektirdikçe ayrı küçük dersler olur.

World 0 optional reference'tır; Pong için bir kapı değildir.
