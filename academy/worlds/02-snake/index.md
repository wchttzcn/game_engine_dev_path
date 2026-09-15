# Dünya 2 — Snake

Pong sürekli bir dünyada geçiyordu: top her frame biraz ilerliyordu. Snake bir
grid üzerinde ve adım adım yaşıyor. Bu fark, dersleri oyunun görüntüsünden çok
**verinin nasıl temsil edildiği** sorusuna çeviriyor: gövde hangi yapıda
duruyor, bir hücrenin dolu olduğunu kim biliyor, büyüme sırasında bellek
kopyalanıyor mu, oynanış sırasında allocation oluyor mu.

## Şimdi

<CurrentLesson />

```sh
odin run games/snake -out:/tmp/mucahit-snake
```

## Hazır dersler

<LessonList track="02-snake" />

Paket bittiğinde Snake oynanabilir olacak; gövde sabit kapasiteli bir ring
buffer'da duracak, occupancy grid hücre sorularını sabit sürede cevaplayacak ve
F1 overlay'i bu temsilleri oynarken gösterecek. AoS/SoA ile cache locality
ölçümleri buradan doğan gerçek bir erişim sorusuyla `labs/` altında ayrı deney
olarak açılır.
