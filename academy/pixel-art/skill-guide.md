---
title: 8×8 skill fikirleri
description: Küçük bir oyun olayından karakter hareketi ve VFX fikri çıkar.
---

# 8×8 skill fikirleri

Bir skill fikrine “kaç parçacık koymalıyım?” diye başlamak zorunda değilsin.
Önce **oyuncunun göreceği tek olayı seç:** büyü çıkıyor, kılıç savruluyor,
karakter iyileşiyor veya ok hedefe değiyor. Sonra bu olayı taşıyacak küçük
şekli çiz. Bu sayfa fikir seçmek için; ayrı bir ödev değil.

## Bir skill'in görselini nasıl kurarım?

Örneğin mage için kısa bir büyü atışı düşün:

| Parça | Görsel karar |
| --- | --- |
| Karakter hareketi | Elin veya asanın atış yönüne dönmesi. Bu paketten sonra tek pozluk bir çalışma olabilir. |
| Efektin başlangıcı | Elden çıkacak yerde küçük ışık toplanması. |
| Belirgin olay | Sağa uzanan uç ve arkasında ince kuyruk. |
| Bitiş | Kuyruğun kopması, birkaç parçanın kalması ve sonra boş görüntü. |

Her skill'in bütün bu parçalarını aynı anda çizmen gerekmiyor. Hazır VFX
derslerinde karakterin dosyası ayrı kalır; yalnız efektin frame'lerini üretirsin.
Karakter **8×8**, efekt de **8×8** olabilir. Oyunda nerede gösterilecekleri,
canvas'ın içinde ne kadar yer kapladıklarından ayrı bir karardır.

Örnekteki boş son frame, efektin görünmediği anı öğretir. Ders önizlemesi
öğrenmek için döngüde oynar. Oyunda bir saldırı veya impact gerektiğinde
bir kez oynatılabilir; idle ve yürüyüş ise farklı bir tekrar ihtiyacıdır.

## Hazır örnekten yeni ne çıkabilir?

| Karakter | Hazır küçük çalışma | Daha sonra tek bir yeni deneme |
| --- | --- | --- |
| Mage | [1.25 — Mage için büyü atışı çiz](/pixel-art/25-mage-bolt) | Ateş için kıvrılan kuyruk; buz için köşeli uç. Önce yalnız şekli değiştir. |
| Warrior | [1.30 — Warrior için kılıç izi çiz](/pixel-art/30-warrior-slash) | Güçlü vuruş için daha uzun hazırlık; hızlı vuruş için daha kısa iz. Önce yalnız süreyi değiştir. |
| Priest | [1.34 — Priest için iyileştirme çiz](/pixel-art/34-priest-heal) | Koruma için karakterin yanında kısa süre kalan bir yay. Yukarı yükselmek yerine yerinde durmayı dene. |
| Archer | [1.40 — Archer için isabet parıltısı çiz](/pixel-art/40-archer-impact) | Sert yüzeyde kısa kıvılcım veya yerde dışa açılan toz. Önce yalnız dağılan parçaların yönünü seç. |

Bunlar tasarım önerileri; her mage ateş, her priest yeşil ışık kullanmak
zorunda değil. Aynı anda şekil, renk ve süreyi değiştirmek yerine tek
kararı denemek, etkisini görmeni kolaylaştırır.

## Hareket ile VFX nasıl buluşur?

Warrior kılıcı savururken yay biçimindeki iz o yöne bakar. Ok hedefe değdiğinde
impact hedefin yanında görünür. Bunların çizimleri Aseprite'te hazırlanabilir;
hasar, mana, cooldown ve çarpışma ise oyunun davranışlarıdır. İlgili oyunda
skill eklerken bu davranışla görselin ne zaman buluşacağını birlikte ele alırız.

Bu aşamada bir efektin okunması için particle sistemi, glow veya shader
gerekmiyor. 8×8 çizimin biçimi ve birkaç frame'in süresiyle çalışıyoruz.
60–30–10 veya sahne renkleri bu çalışmaların ön koşulu değil.

## Birincil kaynak

[Jason Lee — Slash Shape Fundamentals](https://jasontomlee.itch.io/slashfx/devlog/629732/tutorial-2-slash-shape-fundamentals).
`RESOURCES.md` içindeki bu kaynak, kılıç izinin karakterin hareket yolunu
takip etmesi için kullanıldı. Diğer skill varyasyonları bu rehberin özgün
çalışma önerileridir.
