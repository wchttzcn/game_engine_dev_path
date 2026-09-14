package main

import rl "vendor:raylib"

GRID_COLS :: 20
GRID_ROWS :: 20
CELL_SIZE :: 24

SCREEN_WIDTH :: GRID_COLS * CELL_SIZE
SCREEN_HEIGHT :: GRID_ROWS * CELL_SIZE

MAX_BODY :: GRID_COLS * GRID_ROWS

Game :: struct {
	body:   [MAX_BODY]Cell,
	length: int,
}

Cell :: struct {
	col, row: i32,
}

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

	game := Game{}
	game.body[0] = {
		col = GRID_COLS / 2,
		row = GRID_ROWS / 2,
	}
	game.body[1] = {
		col = GRID_COLS / 2 - 1,
		row = GRID_ROWS / 2,
	}
	game.body[2] = {
		col = GRID_COLS / 2 - 2,
		row = GRID_ROWS / 2,
	}
	game.length = 3

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)
		for col in 0 ..< GRID_COLS {
			for row in 0 ..< GRID_ROWS {
				rl.DrawRectangleLinesEx(cell_rect(i32(col), i32(row)), 1, rl.WHITE)
			}
		}

		for i in 0 ..< game.length {
			rl.DrawRectangleRec(
				cell_rect(game.body[i].col, game.body[i].row),
				i == 0 ? rl.LIME : rl.GREEN,
			)
		}
		rl.EndDrawing()
	}
}
