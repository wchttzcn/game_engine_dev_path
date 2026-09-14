package main

import rl "vendor:raylib"

GRID_COLS :: 20
GRID_ROWS :: 20
CELL_SIZE :: 24

SCREEN_WIDTH :: GRID_COLS * CELL_SIZE
SCREEN_HEIGHT :: GRID_ROWS * CELL_SIZE

cell_rect :: proc(col, row: i32) -> rl.Rectangle {
	return rl.Rectangle {
		x = f32(col) * CELL_SIZE,
		y = f32(row) * CELL_SIZE,
		height = CELL_SIZE,
		width = CELL_SIZE,
	}
}

main :: proc() {
	rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Mucahit - Snake")
	defer rl.CloseWindow()
	rl.SetTargetFPS(60)

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)

		for col in 0 ..< GRID_COLS {
			for row in 0 ..< GRID_ROWS {
				rl.DrawRectangleLinesEx(cell_rect(i32(col), i32(row)), 1, rl.WHITE)
			}
		}
		rl.EndDrawing()
	}
}
