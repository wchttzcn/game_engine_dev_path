---
title: "1.31 — Warrior için kılıç izi çiz"
description: "Kısa bir yay çizerek kılıcın sallanma yolunu görünür yap."
section: Idle oyun · warrior
---

# {{ $frontmatter.title }}

**Hedef:** Kılıcın sallanmasını izleyen, içi açık bir yay biçimi kur.

**Önce şu teknik:** [1.17 — Aynı frame'leri üç farklı süreyle dene](/pixel-art/17-timing) — İzin kısa ömürlü olması süreyle kurulur.

## Görev

Yeni 8×8 transparent RGB dosyada warrior için kısa kılıç izi çiz. Tek renk `#F8E9B0` kullan; dört frame'i `art/fx/warrior-slash.aseprite` olarak kaydet.

## Ne zaman bitti?

- Ana vuruş frame'inde sağa kıvrılan yay var; ortası dolu bir disk değil.
- İz kısaca beliriyor, genişliyor, parçalanıyor ve boş frame ile kayboluyor.
- Frame süreleri 120, 80, 140, 450 ms; canvas 8×8 ve dosya kaydedilmiş.

## Bilmen gereken küçük parça

Kılıç izi, silahın kapladığı bütün alanı kalıcı olarak doldurmaz. Bu örnekte kılıcın üstten sağa ve aşağı savrulduğunu düşün; geride kalan yay, hareket yolunu kısa süre görünür kılar. En güçlü şeklin uzun süre donması, vuruştan çok havada duran bir nesne gibi görünmesine yol açabilir.

<PixelAnimation title="Warrior — kılıç izi" :frames='[{"src":"/pixel-art/animation/slash-1.svg","label":"İzin başlangıcı","duration":120,"alt":"Üstte iki pixel&#39;lik kısa kılıç izi."},{"src":"/pixel-art/animation/slash-2.svg","label":"Geniş yay","duration":80,"alt":"Sağda kalınlaşan, içi boş kalan hilal biçiminde kılıç izi."},{"src":"/pixel-art/animation/slash-3.svg","label":"Dağılan iz","duration":140,"alt":"Sağ tarafta birbirinden ayrılan üç kılıç izi parçası."},{"src":"/pixel-art/animation/slash-4.svg","label":"Efekt yok","duration":450,"alt":"Kılıç izi kaybolmuş; frame tamamen transparent."}]' />

Ana yayı seçip durdur. Dış kenar sağa kıvrılıyor, orta alan boş kalıyor. Tek tek pixel'leri daire gibi dağıtmak yerine birbirine bağlı birkaç küçük basamak kur.

1. İlk frame'de üstteki iki pixel'lik izi çiz. `Frame > New Empty Frame` ile ana vuruş için ikinci frame'i ekle; önce yayın sağ kenarını, sonra üst ve alt uçlarını çiz.
2. Üçüncü boş frame'de yayın sağından kalan üç parçayı çiz. Dördüncüyü boş bırak. Her frame'in süresini önizlemedeki değerle ayarla.
3. Play ile yay biçiminin kısa süre okunup kaybolduğunu gör ve kaydet. Bu efekt daha sonra warrior'ın kılıç hareketiyle aynı anda gösterilebilir.

## Sınırlar

Tek yay ve tek renk, sallanma yolunu net tutmak için. Aynı anda karakterin saldırı pozu, kameranın tepkisi ve hasar hesabı eklenmiyor.

::: details İpucu 1 — Hilal dolu bir top oldu
Yayın içindeki büyük boşluğu geri aç. Bütün ara pixel'leri doldurmak gerekmiyor.
:::

::: details İpucu 2 — Yay her yerde aynı kalınlıkta
Üst başlangıç ince kalabilir; sağ ve alt dönüşte birbirine bağlı birkaç pixel kullan.
:::

::: details İpucu 3 — Ana frame nasıl?
İkinci satırda 3–5. sütunlar dolu. Üçüncü satırda 6; dördüncü ve beşincide 6–7; altıncıda 5–6; yedincide 3–5 dolu. İlk ve son satır boş.
:::

## Birincil kaynak

[Jason Lee — Slash Shape Fundamentals](https://jasontomlee.itch.io/slashfx/devlog/629732/tutorial-2-slash-shape-fundamentals).
`RESOURCES.md` içindeki bu kaynak, hareketi izleyen yay ve kısa süre görünen
ana vuruş şekli için kullanıldı. Buradaki 8×8 pixel yerleşimi ve süreler
özgün ders örneğidir; sanatçının asset'lerini kopyalamıyoruz.

**Kazanım:** Bir kılıç vuruşuna, yönü ve kısa ömrü okunabilen görsel bir iz çizdin.

**“Pixel Art 1.31 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.32 — Üç frame ile vuruşa ağırlık ver](/pixel-art/32-anticipation).

