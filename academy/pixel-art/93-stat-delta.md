---
title: "1.93 — Stat farkını okla göster"
description: "Bir eşyanın daha iyi mi kötü mü olduğunu renk ve yönle birlikte anlat."
section: Idle oyun · stat ve ekipman
---

# {{ $frontmatter.title }}

**Hedef:** Bir stat değişimini renk körü bir oyuncunun bile ayırt edebileceği bir işaretle göster.

**Önce şu teknik:** [1.11 — Üç value ile ayır](/pixel-art/11-value) — Orada üç gri tonla ayırdığın parçaları, burada üç renk ve üç şekille ayırıyorsun.

## Görev

3×5 üç işaret çiz: yukarı ok, aşağı ok ve düz çizgi. Sonra üç stat satırı kur: ikon, ad, eski değer (`#637980`), işaret, yeni değer (işaretin rengiyle). `art/idle-ui/stat-delta.aseprite` olarak kaydet.

## Ne zaman bitti?

- Üç işaret de 3×5: yukarı ok, aşağı ok, düz çizgi.
- Yukarı ok `#8ac982`, aşağı ok `#b87848`, düz çizgi `#637980`.
- Üç stat satırında da sıra aynı: ikon, ad, eski değer, işaret, yeni değer.
- Yeni değerin rengi işaretin rengiyle eşleşiyor.
- `art/idle-ui/stat-delta.aseprite` kaydedildi.

## Bilmen gereken küçük parça

Oyuncu bir eşyayı kuşanmadan önce tek soru sorar: daha iyi mi? Cevabı üç pixel genişliğinde bir ok verir. Yukarı ok yeşil, aşağı ok sıcak, değişmeyen için düz bir çizgi — üçü de 1.92'de kurduğun satırın sonuna, eski değerle yeni değer arasına girer.

Renk tek başına yetmez. Renk körü bir oyuncu için kırmızı ile yeşil, veya burada sıcak turuncu ile yeşil, ayırt edilemeyebilir. Bu yüzden **yön** de farklı olmalı: yukarı ok her zaman yukarı bakar, aşağı ok her zaman aşağı, düz çizginin hiç yönü yok. Şekil renkten önce anlaşılır; renk sadece onu pekiştirir.

<PixelAnimation title="Üç işaret" :columns="3" :rows="5" :frames='[{"src":"/pixel-art/stats/delta-up.svg","label":"Yükseliyor","duration":260,"alt":"Yeşil, yukarı bakan ok."},{"src":"/pixel-art/stats/delta-down.svg","label":"Düşüyor","duration":260,"alt":"Sıcak turuncu, aşağı bakan ok."},{"src":"/pixel-art/stats/delta-same.svg","label":"Değişmiyor","duration":260,"alt":"Tek pixel kalınlığında düz gri çizgi."}]' />

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/stats/compare.svg" width="464" height="208" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:8px 8px;outline:1px solid #486452" alt="Üç stat satırı: ATK 42'den 48'e yükseliyor, DEF 18'den 15'e düşüyor, SPD 9'da sabit kalıyor." /></div>
    <figcaption><strong>Üç satır bir arada</strong><br />ATK 42 → 48 yukarı, DEF 18 → 15 aşağı, SPD 9 → 9 değişmedi. Üçü de aynı yerleşimi paylaşıyor.</figcaption>
  </figure>
</div>

Bu üç satırı bir eşya karşılaştırma ekranında yan yana gördüğünde, oyuncu tek bir okuma geçişiyle üç kararı birden verir: neyi kuşanmalı, neyi çıkarmalı, hangi stat zaten aynı kalıyor.

## Sınırlar

Yalnız üç işaret ve tek satırlık karşılaştırma bu görevde. Yüzdelik fark, birden fazla eşyayı aynı anda karşılaştırma ve animasyonlu geçiş bu göreve girmiyor.

::: details İpucu 1 — Ok başı çizgiye karışıyor
Ok başını (genişleyen satır) gövdeden (tek pixel'lik sütun) ayırt edilir tut. Aşağı okta ok başı alt uçta, yukarı okta üst uçta olmalı.
:::

::: details İpucu 2 — Renk körü test
İşareti gri tonlamaya çevirdiğinde hâlâ yukarı mı aşağı mı anlaşılıyor mu, kontrol et. Anlaşılmıyorsa şekil yeterince farklı değil demektir; renk eklemeden önce şekli düzelt.
:::

::: details İpucu 3 — Tam yerleşim
Yukarı ok: 1. satırda tek pixel (2. sütun), 2. satırda tam genişlik (ok başı), 3–5. satırlarda tek pixel (2. sütun, gövde). Aşağı ok: 1–3. satırlarda tek pixel (2. sütun, gövde), 4. satırda tam genişlik (ok başı), 5. satırda tek pixel (2. sütun, uç). Düz çizgi: yalnız 3. satırda tam genişlik, diğer satırlar boş.
:::

## Birincil kaynak

[Aseprite — Drawing ve araçlar](https://www.aseprite.org/docs/drawing/).
`RESOURCES.md` içindeki bu belge, Pencil ve Filled Rectangle ile küçük şekiller kurmayı anlatır. Üç işareti birbirinden ayıran ok başı ve gövde oranı bu dersin seçimidir.

**Kazanım:** Bir stat değişimini, renk körü bir oyuncunun bile anında okuyabileceği bir işaretle gösterdin.

**“Pixel Art 1.93 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.94 — Boş ekipman slotlarını ayır](/pixel-art/94-equip-slots).
