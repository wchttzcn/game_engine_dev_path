package main

import rl "vendor:raylib"

main :: proc() {
	rl.InitWindow(800, 450, "Mucahit - Pong")
	defer rl.CloseWindow()
	rl.SetTargetFPS(60)

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)

		rl.DrawRectangle(40, 160, 20, 100, rl.WHITE)

		rl.EndDrawing()
	}
}
