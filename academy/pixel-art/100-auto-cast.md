---
title: "1.100 — AUTO tetiklenmesini göster"
description: "Barın dolması, ikonun parlaması ve skill'in çıkması zincirini dört karede kur."
section: Idle oyun · skill ve auto
---

# {{ $frontmatter.title }}

**Hedef:** Oyuncunun basmadığı bir eylemi, yine de onun anladığı bir olaya çevir.

**Önce şu teknik:** [1.18 — Hazırlık karesiyle ağırlık ver](/pixel-art/18-chest-weight) — Otomatik bir eylemin de hazırlığı, çıkışı ve yerleşmesi olmalı.

## Görev

48×16 bir dosyada dört kare kur. Solda 1.99'daki 12×12 skill slotu, sağında 1.98'deki barın 24 pixel'lik hâli dursun. Sırayla: bar üçte bir dolu ve slot bekliyor; bar dörtte üç dolu ve slot hâlâ bekliyor; bar dolu ve slot hazır; slot tetiklendi, bar sıfırlandı ve sağda skill belirdi. Frame süreleri 300, 300, 400 ve 200 ms olsun. `art/idle-ui/auto-cast.aseprite` olarak dört frame kaydet.

## Ne zaman bitti?

- Dört karede de slot ve barın yeri birebir aynı.
- Üçüncü karede hem bar hem slot aynı anda parlak hâle geçiyor.
- Dördüncü karede bar sıfırlanmış ve skill sağda görünmüş.
- Dördüncü kare diğerlerinden kısa sürüyor.

## Bilmen gereken küçük parça

Bu oyunda skill'leri oyuncu tetiklemez; bar dolduğunda **kendiliğinden** çıkarlar. Bu, tasarım açısından rahatlatıcı ama görsel açıdan risklidir: oyuncunun basmadığı bir olayı fark etmesi gerekir, yoksa ekranda rastgele şeyler oluyormuş gibi görünür.

Çözüm, otomatik eylemi bir **zincir** olarak çizmek. Önce bir hazırlık — bar dolar. Sonra bir eşik — bar ve slot birlikte parlar. Sonra çıkış — skill görünür ve bar sıfırlanır. Oyuncu bir kez bu zinciri gördükten sonra barın dolmasını izlemeye başlar; ne olacağını bilir.

<PixelAnimation title="AUTO tetiklenmesi" :columns="48" :rows="16" :frames='[{"src":"/pixel-art/skills/auto-1.svg","label":"Doluyor","duration":300,"alt":"Bar üçte bir dolu; skill ikonu sönük ve üstünde karartma var."},{"src":"/pixel-art/skills/auto-2.svg","label":"Yaklaşıyor","duration":300,"alt":"Bar dörtte üç dolu; ikon hâlâ sönük."},{"src":"/pixel-art/skills/auto-3.svg","label":"Hazır","duration":400,"alt":"Bar doldu ve altın rengine döndü; ikon tam renginde ve kenarı altın."},{"src":"/pixel-art/skills/auto-4.svg","label":"Çıktı","duration":200,"alt":"Slot beyaz flash’ta, bar sıfırlanmış, sağda skill belirmiş."}]' />

Üçüncü kare zincirin bel kemiği. Bar ve slot **aynı anda** renk değiştirir; ikisi ayrı zamanlarda parlarsa aralarındaki neden sonuç bağı kopar. Oyuncunun kurması gereken cümle şu: *bar doldu, bu yüzden skill çıktı.* İki olay aynı karede olursa cümle kendiliğinden kurulur.

Dördüncü karenin kısa olması da aynı sebeple. Çıkış bir andır; uzun tutulursa hazır hâlin kendisi gibi okunur ve zincir ikinci turda anlamını yitirir. Barın o karede **hemen** sıfırlanması ise döngünün yeniden başladığını söyler.

1.79'da çizdiğin `AUTO` anahtarı bu zincirin açık ya da kapalı olduğunu gösterir. Anahtar kapalıyken bar yine dolar ama üçüncü karede beklemeye devam eder; skill oyuncu dokunana kadar çıkmaz.

## Sınırlar

Tek skill ve tek zincir. Birden çok skill'in sıraya girmesi, öncelik kuralları ve hedef seçimi bu göreve girmiyor.

::: details İpucu 1 — Skill'in neden çıktığı anlaşılmıyor
Bar ile slot farklı karelerde parlıyor olabilir. İkisini aynı karede değiştir; neden ve sonuç aynı anda görünmeli.
:::

::: details İpucu 2 — Zincir döngüye girince karışıyor
Son karede bar sıfırlanmamış olabilir. Dolu bir barla başlayan ikinci tur, birinci turun devamı gibi okunur ve döngü kaybolur.
:::

::: details İpucu 3 — Tam yerleşim
Slot 3–14. satırlarda, 1–12. sütunlarda. Bar 6–11. satırlarda, 15–38. sütunlarda. Çıkan skill 5–12. satırlarda, 41–48. sütunlarda. Dört karede de slot ve bar bu koordinatlarda kalır; yalnız renkler ve dolum uzunluğu değişir.
:::

## Birincil kaynak

[Aseprite — Animation](https://www.aseprite.org/docs/animation/).
`RESOURCES.md` içindeki bu belge, frame sırası ve playback için kullanıldı; [Frame Duration](https://www.aseprite.org/docs/frame-duration/) kare sürelerinin ayrı ayrı verilmesi içindir. Hazırlık, eşik ve çıkış zincirinin dört kareye bölünmesi bu dersin seçimidir.

**Kazanım:** Oyuncunun tetiklemediği bir olayı, yine de takip edilebilir bir zincire çevirebiliyorsun.

**“Pixel Art 1.100 denememi değerlendir”** yaz; çizimini inceleyelim.

Sonraki adım: [1.101 — Skill tree düğümünün dört hâlini çiz](/pixel-art/101-tree-node).
