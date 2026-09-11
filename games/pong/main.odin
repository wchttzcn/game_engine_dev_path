package main

import rl "vendor:raylib"

main :: proc() {
	rl.InitWindow(800, 450, "Mucahit - Pong")
	defer rl.CloseWindow()
	rl.SetTargetFPS(60)

	// Hazır pencere döngüsü. Bu derste yalnızca çizim TODO'suyla çalış.
	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)

		// TODO: 1.1 — Beyaz raketi burada çiz.

		rl.EndDrawing()
	}
}
