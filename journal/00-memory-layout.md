---
title: Memory Layout Günlüğü
---

# Memory Layout Günlüğü

## İlk tahmin

| Ölçüm | Tahmin |
| --- | --- |
| Bullet alignment | |
| Bullet size (byte) | |

| Field | Size tahmini | Alignment tahmini | Başlangıç offset tahmini | Önceki padding |
| --- | --- | --- | --- | --- |
| active | | | | |
| position | | | | |
| damage | | | | |
| owner | | | | |
| velocity | | | | |
| lifetime | | | | |

## İlk ölçüm

| Ölçüm | Gerçek |
| --- | --- |
| Bullet alignment | |
| Bullet size (byte) | |

| Field | Gerçek offset | Tahminden fark | Açıklama |
| --- | --- | --- | --- |
| active | | | |
| position | | | |
| damage | | | |
| owner | | | |
| velocity | | | |
| lifetime | | | |

## Yeniden sıralama

Yeni field sırası:


| Ölçüm | Yeni değer |
| --- | --- |
| Bullet alignment | |
| Bullet size (byte) | |

Hangi padding byte'ları kayboldu ya da yer değiştirdi?

| Field | Yeni offset | Önceki offset'ten fark |
| --- | --- | --- |
| active | | |
| position | | |
| damage | | |
| owner | | |
| velocity | | |
| lifetime | | |


## 100.000 Bullet hesabı

| Layout | Byte | MiB | MB |
| --- | --- | --- | --- |
| İlk sıra | | | |
| Yeni sıra | | | |

## Yorum

Bu layout değişikliği memory kullanımı ve cache için neyi iyileştirebilir?


Neden daha küçük struct otomatik olarak daha hızlı değildir?


## Mentor inceleme notu

İki layout'u çiz, padding’in konumlarını göster ve ölçümün hedefe bağlı olduğunu açıkla.
