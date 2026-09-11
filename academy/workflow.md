---
title: Nasıl çalışır?
---

# Küçük görev, gerçek kod

Sohbet ana mentor kanalın. **“Mevcut dersten devam edelim”** dediğinde tek bir
görevle ilerleriz. Academy aynı dersleri tarayıcıdan okumak için isteğe bağlı
arşivin; kodu her durumda kendi editöründe yazarsın.

## Şimdi ne yapacağım?

1. [0.1 — Bellek yerleşimi](/worlds/00-systems/01-memory-layout) görevini oku
   veya sohbette 0.1'i iste.
2. `labs/00-memory-layout/main.odin` ile `journal/00-memory-layout.md` dosyalarını aç.
3. Önce tahminini yaz. Sonra yalnızca **mevcut dersin** ölçüm kodunu ekle.
4. Repo kökünden çalıştır:

```sh
odin run labs/00-memory-layout -out:labs/00-memory-layout/lab
```

5. Sonucu ve kısa açıklamanı journal'ın ilgili bölümüne ekle. **“0.1 denememi
   değerlendir; kodumu değiştirme, önce tek ipucu ver”** yaz.

## Bir dersin boyutu

**Hedef → kısa bağlam → görev → sınırlar → geçme koşulu.** Bir ders tek ana fikir
taşır. Açılır ipuçları ve Deep Dive bölümleri isteğe bağlıdır; hepsini okumak
tamamlanma şartı değildir. Takıldığında yalnızca eksik kavramı birlikte açarız.

İlk bellek çalışması üç küçük derse ayrıldı:

| Ders | Görev | Journal bölümü |
| --- | --- | --- |
| [0.1](/worlds/00-systems/01-memory-layout) | Yerleşimi tahmin et, ölç, padding'i göster | İlk tahmin / İlk ölçüm |
| [0.2](/worlds/00-systems/02-field-order) | Aynı alanları başka sırayla karşılaştır | Yeniden sıralama |
| [0.3](/worlds/00-systems/03-memory-budget) | Ölçtüğün boyutla 100.000 merminin maliyetini hesapla | 100.000 Bullet hesabı |

Aynı lab ve journal kullanılır. Dosyada sonraki görevin TODO'sunu görmen, onu
şimdi çözmen gerektiği anlamına gelmez. Cache ve AoS/SoA, Snake'te ayrı erişim
deneyleriyle ele alınacak; journal'daki ilgili sorular başlangıç derslerinin kapısı değil.

## Yardım ve değerlendirme

İpucu 1 bir düşünme sorusu; ipucu 2 daha dar bir yön; ipucu 3 küçük bir örnek veya
uygulanabilir yol gösterir. İstediğinde tam açıklama alabilirsin. Ardından farklı
bir örnekte desteksiz deneme, kavramı bağımsız kullanabildiğini gösterir.

Değerlendirmede önce çalışan tarafları, sonra kavramsal riskleri ve eksik
ölçümleri inceleriz. Sonraki adım bir odak sorusudur; çözümü sen geliştirirsin.

`npm run lab:check` yalnızca derleyici kontrolüdür. İlerleme, dersin kabul
ölçütleri incelendikten sonra kaydedilir. Ders tamamlanması, bağımsız beceri
ve değerlendirme geçmişi ayrı tutulur.

## Araçlar da dersin parçası

Pong'da debug değerlerini görürsün; Breakout'ta Dear ImGui paneliyle juice
parametrelerini oyun çalışırken ayarlarsın. Sonra rule inspector, timeline ve
ağ hata ayıklama araçları gelir. Kullandığın aracın hangi soruyu cevapladığını
açıklarsın. Oyuncunun menü ve HUD sistemi ayrı bir konudur.

[Büyük resmi görmek istediğinde yol haritasını aç →](/roadmap)
