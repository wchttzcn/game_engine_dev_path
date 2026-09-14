package main

import rl "vendor:raylib"

GRID_COLS :: 20
GRID_ROWS :: 20
CELL_SIZE :: 24

SCREEN_WIDTH :: GRID_COLS * CELL_SIZE
SCREEN_HEIGHT :: GRID_ROWS * CELL_SIZE

MAX_BODY :: GRID_COLS * GRID_ROWS
TICK_SECONDS :: 0.12

Game :: struct {
	body:       [MAX_BODY]Cell,
	length:     int,


	// TICK
	tick_timer: f32,
	tick_count: int,
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
		dt := rl.GetFrameTime()
		game.tick_timer += dt

		for game.tick_timer >= TICK_SECONDS {
			game.tick_timer -= TICK_SECONDS
			game.tick_count += 1
		}

		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)

		rl.DrawText(rl.TextFormat("tick: %d", game.tick_count), 10, 10, 20, rl.GREEN)

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
