---
title: Memory Layout Günlüğü
---

# Memory Layout Günlüğü

## İlk tahmin

| Ölçüm | Tahmin |
| --- | --- |
| Bullet alignment | 2|
| Bullet size (byte) | 22 |


| Field | Size tahmini | Alignment tahmini | Başlangıç offset tahmini | Önceki padding |
| --- | --- | --- | --- | --- |
| active |1|1|1| |
| position |4|4|4| |
| damage |2|2|12| |
| owner |1|2|8| |
| velocity |4|4|4| |
| lifetime |2|2|2| |


## İlk ölçüm

| Ölçüm | Gerçek |
| --- | --- |
| Bullet alignment | 4 |
| Bullet size (byte) | 28 |


| Field | Gerçek offset | Tahminden fark | Açıklama |
| --- | --- | --- | --- |
| active |0|1| |
| position |4|0| |
| damage |2|0| |
| owner |14|6| |
| velocity |4|0| |
| lifetime |24|22| |

## Yeniden sıralama

Yeni field sırası: damage,active,velocity,lifetime,owner,position


| Ölçüm | Yeni değer |
| --- | --- |
| Bullet alignment |4|
| Bullet size (byte) |28|

Hangi padding byte'ları kayboldu ya da yer değiştirdi?

| Field | Yeni offset | Önceki offset'ten fark |
| --- | --- | --- |
| active |2|2|
| damage |0|2|
| owner |16|2|
| velocity |4|0|
| lifetime |12|12|
| position |20|16|


## 100.000 Bullet hesabı

| Layout | Byte | MiB | MB |
| --- | --- | --- | --- |
| İlk sıra |2800000|2|28|
| Yeni sıra |2800000|2|28|

## Yorum

Bu layout değişikliği memory kullanımı ve cache için neyi iyileştirebilir?


Neden daha küçük struct otomatik olarak daha hızlı değildir?


