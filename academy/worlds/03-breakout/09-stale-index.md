---
title: "3.9 — Ölü slota tutunan index"
description: "Havuzdaki bir slotun yeniden kullanılmasıyla ortaya çıkan bayat referansı görünür kıl ve çöz."
section: Nesne ömrü
---

# 3.9 — Ölü slota tutunan index

**Hedef:** Aktif güçlendirme etkisinin havuzdaki yanlış slotu okumaya
başladığı hatayı görünür kıl, sonra çöz.

## Görev

3.8'de yazdığın süreli etkiye bak: etki süresi boyunca hangi güçlendirme
türünü uyguladığını hâlâ o slotun index'inden okuyorsa (`game.active_powerup`
gibi bir alanda sadece index tutuyorsa), bir sorun var. Etki sürerken o slot
havuzda yeniden kullanılabilir — başka bir güçlendirme aynı index'e doğabilir.
O anda etkin index hâlâ eski değerini tutuyor, ama artık orada duran nesne
başka bir şey.

Önce bunu **görünür** yap: bir debug tuşuyla güçlendirmeleri art arda,
üst üste doğur (aynı slotu hızla boşaltıp dolduracak kadar sık) ve ekranda
küçük bir debug satırında tutulan index'i ve o index'teki slotun neyi
gösterdiğini yaz. Sonra hatayı çöz.

## Ne zaman bitti?

- Bir debug tuşu güçlendirmeleri normalden çok daha sık doğurabiliyor, hatayı
  tetiklemek kolaylaşıyor.
- Ekranda (örneğin F1 ile açılan bir debug satırında) etkin güçlendirmenin
  index'i ve o slotun güncel içeriği görünüyor.
- Bayat index okuma sorunu çözüldü: bir slot yeniden kullanıldığında, süren
  etki artık o slotu izlemiyor veya yanlış veri okumuyor.
- `odin check games/breakout` geçiyor.

## Bilmen gereken küçük parça

Bu hatanın tehlikeli tarafı, derleyicinin hiçbir şey söylememesi. `index`
geçerli bir sayı, array sınırları aşılmıyor, program çökmüyor — sadece o
index'teki slot artık beklediğin nesne değil. Sessizce yanlış davranış, en
kötü hata türü: onu bulman için önce **görmen** gerekiyor. 2.12'de grid debug
görünümünü aynı sebeple yazmıştın; occupied grid'in içini gözle görülür
kılmak, hatayı tahmin etmek yerine ekranda okumak.

Kökün nedeni şu: index bir slotu işaret ediyor, ama slotun **kimliğini**
değil. Havuzdaki bir eleman öldüğünde slot boşalır ve numarası aynı kalır —
3.7'de tam olarak bunu istemiştin, ölü bir slotun yeniden kullanılabilir
olmasını. Ama biri o slotu “bu nesneyi izliyorum” diye uzun süre elinde
tutuyorsa, slot kendisinden habersiz el değiştirebilir.

Bu, 2.7'deki `occupied` grid hatasıyla aynı hastalık değil — orada iki ayrı
temsil (gövde ve grid) birbirinden ayrışmıştı, biri güncellenip diğeri
unutulmuştu. Burada tek bir temsil var (havuz); sorun onun **bir slotuna
tutunan bayat bir referans**. Belirti benzer — veri okunduğunda yanlış şeyi
gösteriyor — ama kaynağı farklı.

## Sınırlar

- Debug tuşunun ürettiği aşırı hızlı doğurma yalnız hatayı görünür kılmak
  için; normal oynanışta böyle bir hız yok, bu tuşu oyunun geri kalanına
  karıştırma.
- Genel amaçlı, her senaryoyu kapsayan bir referans sistemi kurmuyorsun; bu
  oyundaki tek somut bayat referansı çözmen yeterli.

::: details İpucu 1 — Hatayı önce ekranda göster
2.12'de `occupied` grid'ini, ring index'lerini ve sayaçları F1 overlay'inde
gösterdiğin refleksin aynısı. Debug satırına şunu yaz: etkin güçlendirmenin
tuttuğu index, ve o index'teki slotun şu an `alive`/`occupied` mi ve neyi
tuttuğu. Sonra bir tuşa (örneğin `P`) basınca art arda birkaç güçlendirme
doğur — gerçek bir tuğla kırmayı beklemeden. Aynı slotu hızla boşaltıp
doldurunca debug satırında index sabit kalırken slotun içeriğinin değiştiğini
göreceksin.
:::

::: details İpucu 2 — Veriyi kopyala, index'i tutma
En basit çözüm: etkinin ihtiyaç duyduğu veriyi (örneğin güçlendirmenin türü)
yakalama anında slottan **kopyala** ve ayrı bir alanda tut. Etki süresi
boyunca artık havuza hiç bakmıyorsun — index'in o an geçerli olup olmadığını
sormana gerek kalmıyor, çünkü zaten ona tutunmuyorsun.

```odin
// yakalama anında
game.active_powerup_kind = powerup.kind
game.powerup_timer = 6.0
```

Etkiyi güncellerken veya bitirirken `game.active_powerup_kind`'a bakıyorsun,
havuzdaki slota değil.
:::

::: details İpucu 3 — Generation ile doğrulanan Handle
Kopyalamanın yetmeyeceği durumlarda (etkinin havuzdaki nesneyi sürekli
güncellemesi, örneğin nesnenin konumunu okuması gerekiyorsa) index tek başına
yetersiz kalır. Çözüm, index'e bir kimlik numarası eklemek:

```odin
Handle :: struct {
	index:      int,
	generation: int,
}
```

Her slot kendi `generation` sayacını tutar; slot yeniden kullanıldığında
(yeni bir nesne doğduğunda) o slotun `generation`'ı bir artar. Bir `Handle`
tutan kod, okumadan önce elindeki `generation`'ın slotun güncel
`generation`'ıyla eşleşip eşleşmediğini kontrol eder — eşleşmiyorsa nesne
artık orada değil demektir, okuma güvenle reddedilir.

Bu oyun için İpucu 2 yeterli; `Handle`'ı burada zorunlu tutmuyoruz, ama
Deep Dive'da ne zaman gerekli olduğunu tartışıyoruz.
:::

::: details Deep Dive — Kopyalama ne zaman yetmez?
Bu oyunda kopyalama yeterli çünkü etkinin ihtiyacı olan tek şey — güçlendirme
türü — yakalama anında sabitleniyor, sonrasında havuzdaki nesneyle hiç
konuşması gerekmiyor. Etki kendi kopyasıyla yaşıyor, havuzdan koptu.

`Handle`/`generation` deseni asıl gücünü, referansın **canlı** nesneyle sürekli
konuşması gerektiğinde gösterir: bir mermi başka bir mermiyi hedef alıyorsa,
bir kamera bir düşmanı takip ediyorsa, bir görev sistemi belirli bir NPC'yi
izliyorsa. Bu durumlarda veriyi bir kere kopyalamak yetmez — nesnenin güncel
konumunu, güncel durumunu her frame okumak gerekir, ve nesne o sırada ölüp
slotu başka bir nesneye devretmiş olabilir. `generation` kontrolü, “bu index
hâlâ benim izlediğim nesne mi?” sorusunu her okumada ucuza cevaplar.

Breakout'ta böyle sürekli-canlı bir referans hiç yok — güçlendirmeler
yakalandığı anda etkilerini bırakıp havuzdan çıkıyorlar. Bu yüzden burada
`Handle` inşa etmek, ihtiyaç doğmadan bir soyutlama eklemek olurdu; 3.7'nin
Deep Dive'ındaki “vazgeç” kararıyla aynı mantık — kapasiteyi büyütmek yerine
sessizce vazgeçmek nasıl bu oyunun ihtiyacına yetiyorsa, index'i handle'a
çevirmek yerine kopyalamak da burada yetiyor. Motor büyüyüp gerçek zamanlı
nesne referansları gerektiğinde bu desen tekrar karşına çıkacak.
:::

## Birincil kaynak

[Game Programming Patterns — Object Pool](https://gameprogrammingpatterns.com/object-pool.html).
Kitabın kendisi havuzdaki slotların dışarıdan tutulan referanslarla
yeniden kullanılmasının tehlikesini açıkça tartışıyor; bu dersin kurgusu
tam olarak o uyarının somutlaşmış hali.

**Kazanım:** Artık “derleyici sessiz kaldı ama davranış yanlış” sınıfındaki
bir hatayı önce görünür kılıp sonra çözebiliyorsun. Bu, ileride havuz
kullanan her sistemde (mermiler, efektler, ağ nesneleri) karşına çıkacak bir
dikkat — bir index veya pointer'ın işaret ettiği şeyin hâlâ **aynı** nesne
olduğundan emin olmak.

**“Breakout 3.9 denememi değerlendir”** yaz; kodunu inceleyelim.

Sonraki adım oyun hissine geçmek: [3.10 — Hitstop](/worlds/03-breakout/10-hitstop).
