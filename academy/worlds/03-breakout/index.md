# Dünya 3 — Breakout / Juice Laboratory

Snake'te soru verinin nasıl temsil edildiğiydi. Breakout'ta soru değişiyor:
oyun doğru çalışıyor ama **iyi hissettiriyor mu**, ve bunu değiştirmek için
neden her seferinde yeniden derliyorsun?

Tuğlalar oyuna sürekli nesne doğup ölmesini getiriyor — bir tuğla yok oluyor,
yerine parçacıklar doğuyor, onlar da ölüyor. Nesnelerin oluşturulma ve silinme
sırası bu dünyanın veri tarafı. Hitstop, kamera sarsıntısı, eğriler ve ses
varyasyonu da his tarafı. İkisini birbirine bağlayan şey Dear ImGui paneli:
değerleri oyun çalışırken çevirebildiğinde "iyi his" bir tahmin olmaktan çıkıp
denenebilir bir şey oluyor.

## Şimdi

<CurrentLesson />

```sh
odin run games/breakout -out:/tmp/mucahit-breakout
```

## Hazır dersler

<LessonList track="03-breakout" />

## Paket bittiğinde

Oynanabilir bir Breakout olacak: raket, top, tuğla duvarı, bölüm temizleme ve
kaybetme. Üstünde F1'le açılan bir Dear ImGui paneli top hızını, hitstop
süresini, kamera trauma'sını, parçacık lifetime'ını ve ses pitch aralığını
runtime'da ayarlayacak. Aynı karşılaşmayı iki farklı ayar profiliyle oynayıp
farkı karşılaştırabileceksin.

Raketin neresine çarptığının sekme açısını değiştirmesi, ayar profillerinin
diske kaydedilmesi ve parçacıklar için pool yerine arena denemesi bu paketten
doğan gerçek ihtiyaçla ayrı küçük görevler olarak açılır.
