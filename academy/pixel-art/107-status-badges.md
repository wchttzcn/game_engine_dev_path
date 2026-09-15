---
title: "1.107 — Durum rozetlerini portrede sırala"
description: "Karakterin üstündeki durumları, portrenin yanında süreleriyle birlikte özetle."
section: Idle oyun · durum etkileri
---

# {{ $frontmatter.title }}

**Hedef:** Karakterde görünen durumları, sayıyla birlikte okunur bir şeride indir.

**Önce şu teknik:** [1.9 — Silüet testi yap](/pixel-art/09-silhouette-test) — Altı rozet ancak dış şekilleri ayrıysa 5×5'te ayrılır.

## Görev

5×5 altı durum rozeti çiz: zehir damlası (`#7dbd72`), alev (`#e3ab52` ve `#ffe5a3`), buz kristali (`#9de7f5`), yıldız (`#ffe5a3`), yukarı ok (`#b7efd0`) ve kalkan (`#cdf4fb`). Sonra 12×12 bir portre slotunun yanına iki rozet ve altlarına kalan süreleri diz. Aynı şeridin altı rozetli hâlini de üret ve ikisini karşılaştır. `art/idle-ui/status-badges.aseprite` olarak kaydet.

## Ne zaman bitti?

- Altı rozet de 5×5 ve tek renge boyandığında hâlâ birbirinden ayrılıyor.
- Rozetler portre slotunun üst hizasında başlıyor.
- Süreler rozetlerin tam altında ve aynı satırda.
- İki şerit karşılaştırıldığında kalabalık olanın neden okunmadığı söylenebiliyor.

## Bilmen gereken küçük parça

1.104–1.106'da durumları karakterin üstüne taşıdın. Ama karakterin üstü tek bir şeyi iyi anlatır: **şu anda ne oluyor.** Ne kadar süre kaldığını anlatamaz, ve aynı anda üç durum varsa sahne okunmaz hâle gelir.

Bu yüzden ikisi birlikte çalışır: karakterin üstü **şimdiyi**, portrenin yanındaki rozet şeridi **muhasebeyi** gösterir. Biri diğerinin yerine geçmez.

<div class="pixel-steps">
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/status/badge-strip.svg" width="408" height="168" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:12px 12px;outline:1px solid #486452" alt="Warrior portresi ve yanında iki durum rozeti; her rozetin altında kalan süre yazılı." /></div>
    <figcaption><strong>1 · İki rozet</strong><br />Portre, sonra rozetler, sonra süreler. Üç bilgi, üç sütun.</figcaption>
  </figure>
  <figure>
    <div class="pixel-canvas"><img src="/pixel-art/status/badge-strip-crowded.svg" width="444" height="84" style="background-image:linear-gradient(to right,#486452 1px,transparent 1px),linear-gradient(to bottom,#486452 1px,transparent 1px);background-size:6px 6px;outline:1px solid #486452" alt="Aynı portre altı rozetle; şerit portrenin üç katı uzunluğa çıkmış." /></div>
    <figcaption><strong>2 · Altı rozet</strong><br />Aynı kalıp, altı kez. Şerit portreden uzun olduğu anda okunurluğunu kaybediyor.</figcaption>
  </figure>
</div>

<PixelAnimation title="Altı durum rozeti" :columns="5" :rows="5" :frames='[{"src":"/pixel-art/status/badge-poison.svg","label":"Zehir","duration":600,"alt":"Yeşil damla."},{"src":"/pixel-art/status/badge-burn.svg","label":"Yanma","duration":600,"alt":"Altın alev."},{"src":"/pixel-art/status/badge-freeze.svg","label":"Donma","duration":600,"alt":"Camgöbeği buz kristali."},{"src":"/pixel-art/status/badge-stun.svg","label":"Stun","duration":600,"alt":"Açık altın yıldız."},{"src":"/pixel-art/status/badge-buff.svg","label":"Buff","duration":600,"alt":"Açık yeşil yukarı ok."},{"src":"/pixel-art/status/badge-shield.svg","label":"Kalkan","duration":600,"alt":"Açık camgöbeği kalkan."}]' />

İkinci şerit bir hata örneği değil, bir **sınır** örneği. Kalıp aynı, hizalama aynı, hiçbir şey yanlış çizilmemiş — yine de okunmuyor. Çünkü şerit portreden uzun hâle geldiği anda göz artık bir özet değil ikinci bir liste görür.

Gerçek oyunda çözüm şeridi büyütmek değil, **sınırı koymaktır**: en fazla üç rozet göster, kalanını bir sayıyla topla. Bu bir çizim kararı değil ama çizim onu görünür kılar; bu yüzden sınırı burada, tasarım aşamasında görmek gerekir.

Rozetlerin 5×5 olması da bu sınırın bir parçası. 8×8 olsalardı üç rozet portreden geniş olurdu; 5×5'te üç rozet portrenin altına rahatça sığar.

## Sınırlar

Altı rozet ve iki şerit örneği. Rozetin üstünde geri sayan halka, rozetin bilgi kutusu ve rozetlerin sıralama kuralı bu göreve girmiyor.

::: details İpucu 1 — İki rozet karışıyor
5×5'te iç ayrıntı okunmaz. Dış şekli değiştir: damla yuvarlak, kristal çapraz uçlu, ok sivri, kalkan aşağı daralan.
:::

::: details İpucu 2 — Süreler rozetlere ait görünmüyor
Sayıyı rozetin altına ve aynı sola hizala. Sağa kayan bir sayı, bir sonraki rozete ait okunur.
:::

::: details İpucu 3 — Tam yerleşim
Portre slotu 2–13. satırlarda, 1–12. sütunlarda. İlk rozet 2–6. satırlarda, 15. sütundan başlar; rozetler 10 pixel aralıkla dizilir. Süreler 9–13. satırlarda, her rozetin başladığı sütundan başlar.
:::

## Birincil kaynak

[Aseprite — Slices](https://www.aseprite.org/docs/slices/).
`RESOURCES.md` içindeki bu belge, bir çizimin içinde adlandırılmış bölgeler tanımlamayı açıklar; portre, rozet ve süre sütunlarını sabit tutmak için kullanıldı. Şeridin portre uzunluğuyla sınırlanması bu dersin seçimidir.

**Kazanım:** Karakterin üstündeki durumları, süreleriyle birlikte okunur bir özete indirebiliyorsun.

**“Pixel Art 1.107 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.108 — Asset'lerini tek sprite sheet'e topla](/pixel-art/108-sprite-sheet).
