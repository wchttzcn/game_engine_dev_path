package main

import rl "vendor:raylib"

GRID_COLS :: 20
GRID_ROWS :: 20
CELL_SIZE :: 24

SCREEN_WIDTH :: GRID_COLS * CELL_SIZE
SCREEN_HEIGHT :: GRID_ROWS * CELL_SIZE

main :: proc() {
	rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Mucahit - Snake")
	defer rl.CloseWindow()
	rl.SetTargetFPS(60)

	// Hazır pencere döngüsü. Bu derste yalnızca çizim TODO'suyla çalış.
	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)

		// TODO: 2.1 — Grid hücrelerini burada çiz.

		rl.EndDrawing()
	}
}
