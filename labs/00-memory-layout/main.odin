package main

import "core:fmt"

Bullet :: struct {
	active:   bool,
	position: [2]f32,
	damage:   u16,
	owner:    u8,
	velocity: [2]f32,
	lifetime: f32,
}

main :: proc() {
	// TODO: Tahminlerini journal'a yazmadan bu satırı değiştirme.
	// TODO: size_of(Bullet) ve align_of(Bullet) ölçümlerini yazdır.
	// TODO: Her Bullet alanı için offset_of(Bullet, alan_adi) sonucunu yazdır.
	// TODO: İlk ölçümden sonra Bullet_Reordered türünü kendin ekle.
	//       Bullet'ı koru; yeni türde yalnızca alan sırası değişsin. İkisini ölç.
	fmt.println("TODO: Bullet yerleşimini tahmin et, sonra ölç.")
}
