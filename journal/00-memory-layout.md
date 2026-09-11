---
title: Bellek Yerleşimi Günlüğü
---

# Bellek Yerleşimi Günlüğü

## İlk tahmin

| Ölçüm | Tahmin |
| --- | --- |
| Bullet hizalaması | |
| Bullet toplam boyutu (bayt) | |

| Alan | Boyut tahmini | Hizalama tahmini | Başlangıç ofseti tahmini | Önceki padding |
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
| Bullet hizalaması | |
| Bullet toplam boyutu (bayt) | |

| Alan | Gerçek ofset | Tahminden fark | Açıklama |
| --- | --- | --- | --- |
| active | | | |
| position | | | |
| damage | | | |
| owner | | | |
| velocity | | | |
| lifetime | | | |

## Yeniden sıralama

Yeni alan sırası:


| Ölçüm | Yeni değer |
| --- | --- |
| Bullet hizalaması | |
| Bullet toplam boyutu (bayt) | |

Hangi padding baytları kayboldu ya da yer değiştirdi?

| Alan | Yeni ofset | Önceki ofsetten fark |
| --- | --- | --- |
| active | | |
| position | | |
| damage | | |
| owner | | |
| velocity | | |
| lifetime | | |


## 100.000 Bullet hesabı

| Yerleşim | Bayt | MiB | MB |
| --- | --- | --- | --- |
| İlk sıra | | | |
| Yeni sıra | | | |

## Yorum

Bu yerleşim değişikliği bellek ve cache için neyi iyileştirebilir?


Neden daha küçük struct otomatik olarak daha hızlı değildir?


## Mentor inceleme notu

İki yerleşimi çiz, padding’in konumlarını göster ve ölçümün hedefe bağlı olduğunu açıkla.
