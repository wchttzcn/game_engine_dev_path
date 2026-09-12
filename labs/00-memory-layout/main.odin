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

Bullet_Reordered :: struct {
	damage:   u16,
	active:   bool,
	velocity: [2]f32,
	lifetime: f32,
	owner:    u8,
	position: [2]f32,
}

main :: proc() {
	fmt.println("TODO: Bullet yerleşimini tahmin et, sonra ölç.")
	fmt.println("Bullet size_of", size_of(Bullet))
	fmt.println("Bullet align_of", align_of(Bullet))
	fmt.println("Bullet offset_of", offset_of(Bullet, position))

	fmt.println("Bullet_Reordered size_of", size_of(Bullet_Reordered))
	fmt.println("Bullet_Reordered align_of", align_of(Bullet_Reordered))
	fmt.println("Bullet_Reordered offset_of", offset_of(Bullet_Reordered, damage))
	fmt.println("Bullet_Reordered offset_of", offset_of(Bullet_Reordered, owner))
	fmt.println("Bullet_Reordered offset_of", offset_of(Bullet_Reordered, velocity))
	fmt.println("Bullet_Reordered offset_of", offset_of(Bullet_Reordered, lifetime))

	b := [100000]Bullet{}
	b2 := [100000]Bullet_Reordered{}
	fmt.println("B size_of", size_of(b))
	fmt.println("B align_of", align_of(b))
	fmt.println("B2 size_of", size_of(b2))
	fmt.println("B2 align_of", align_of(b2))

  record_count := 100000
  // total_bytes = record_size_bytes * record_count
  // MiB = total_bytes / 1.048.576
  total_bytes := size_of(Bullet) * record_count
  mib := total_bytes / 1048576
  mb := total_bytes / record_count
	fmt.println("MIB", mib)
	fmt.println("total_bytes", total_bytes)
	fmt.println("mb", mb)
}
