---
title: "1.40 — Archer için isabet parıltısı çiz"
description: "Temas noktasından dışa yayılan kısa bir impact oluştur."
section: Idle oyun · archer
---

# {{ $frontmatter.title }}

**Hedef:** Bir temasın merkezden dışa dağılan, kısa ömürlü izini çiz.

**Önce şu teknik:** [1.17 — Aynı frame'leri üç farklı süreyle dene](/pixel-art/17-timing) — Isabetin kısa, bitişin uzun olması süreyle kurulur.

## Görev

8×8 transparent RGB dosyada archer'ın oku hedefe değdiğinde görünecek dört frame'lik impact çiz. Tek renk `#F6D394` kullan; `art/fx/archer-impact.aseprite` olarak kaydet.

## Ne zaman bitti?

- Aynı temas noktası önce beliriyor, sonra büyük bir parıltıya dönüşüyor.
- Üçüncü frame'de merkez boşalıp parçalar dışa ayrılıyor; dördüncü frame boş.
- Frame süreleri 80, 70, 160, 450 ms; kaynak 8×8 ve kaydedilmiş.

## Bilmen gereken küçük parça

Impact, okun uçuşu boyunca taşınan bir şekil değil; hedefe değdiği anda çıkan kısa bir tepki. Bu yüzden sabit bir merkezden açılıp bitmesini çiziyoruz. Priest parıltısından farkı, bütün şeklin yukarı taşınması yerine parçaların temas merkezinden farklı yönlere ayrılması.

<PixelAnimation title="Archer — ok isabeti" :frames='[{"src":"/pixel-art/animation/impact-1.svg","label":"Temas","duration":80,"alt":"Okun değdiği noktada tek pixel beliriyor."},{"src":"/pixel-art/animation/impact-2.svg","label":"Kısa patlama","duration":70,"alt":"Temas noktasından dört yöne açılan kısa bir yıldız parlaması."},{"src":"/pixel-art/animation/impact-3.svg","label":"Uzaklaşan parçalar","duration":160,"alt":"Merkez boşalmış; dört parçacık dışa doğru uzaklaşıyor."},{"src":"/pixel-art/animation/impact-4.svg","label":"Efekt yok","duration":450,"alt":"Impact kaybolmuş; frame tamamen transparent."}]' />

Büyük parlamayı seç: merkez 4. sütun ve 4. satırda. Sonraki frame'de yalnız dışarı açılan uçlar kalıyor. Bu boşalan merkez, ilk şeklin giderek küçülmesinden farklı bir dağılma hissi verir.

1. İlk frame'de temas noktasını çiz. `Frame > New Empty Frame` ile ikinci frame'i ekle; aynı merkezin dört yönüne ikişer pixel uzat.
2. Üçüncü frame'de merkez ve iç çizgiler boş kalsın. Yalnız dört uç daha dışarıda görünsün; dördüncü frame tamamen boş olsun.
3. Süreleri ayarla, oynat ve kaydet. Önizleme öğrenmek için tekrar eder; oyunda bu görsel her isabette bir kez oynatılabilir.

## Sınırlar

Okun uçuşunu ve hedefi aynı dosyaya eklemiyoruz; bu küçük görevde yalnız temasın kısa geri bildirimini çiziyoruz.

::: details İpucu 1 — Yıldız hep açık kalıyor
Üçüncü frame'in merkezini sil ve dördüncü frame'i boş bırak. Efektin bitişi de animasyonun bir parçası.
:::

::: details İpucu 2 — Dağılma yana kayıyor
Parçalar aynı merkezden dört yöne uzaklaşmalı; tüm yıldızı sağa taşıma.
:::

::: details İpucu 3 — Son parçalar nereye?
Üçüncü frame'de yalnız şu noktalar dolu: 4. sütun 1. satır; 1. ve 7. sütun 4. satır; 4. sütun 7. satır.
:::

::: details Deep Dive — Başka hangi skill çıkabilir?
[Skill fikirleri rehberi](/pixel-art/skill-guide), bu dört küçük efekti
ateş, koruma veya güçlü atış gibi fikirlere nasıl dönüştürebileceğini gösterir.
Yeni bir sprite zorunlu değil; önce bu tek impact yeterli.
:::

## Birincil kaynak

[Aseprite — Animation](https://www.aseprite.org/docs/animation/).
`RESOURCES.md` içindeki bu kaynak, frame sırası ve playback için kullanıldı.
Impact'in merkezden dağılması, süreleri ve 8×8 çizimleri bu ders için
hazırlanmış özgün bir görsel denemedir.

**Kazanım:** Bir karakterin skill'ine başlangıcı, belirgin etkisi ve bitişi olan küçük bir VFX ürettin. Bundan sonra istediğin karakter veya skill üzerinde 8×8'de kalabiliriz.

**“Pixel Art 1.40 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.41 — Efekt karakterin neresinden çıkar?](/pixel-art/41-effect-origin).

