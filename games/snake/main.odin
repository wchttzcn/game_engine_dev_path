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
	body:           [MAX_BODY]Cell,
	length:         int,
	direction:      Direction,
	next_direction: Direction,
	tick_timer:     f32,
	tick_count:     int,
}

Cell :: struct {
	col, row: i32,
}

Direction :: enum {
	Up,
	Down,
	Left,
	Right,
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


	game := Game {
		next_direction = .Right,
		direction      = .Right,
	}
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


	opposite := [Direction]Direction {
		.Up    = .Down,
		.Down  = .Up,
		.Left  = .Right,
		.Right = .Left,
	}

	for !rl.WindowShouldClose() {
		dt := rl.GetFrameTime()
		game.tick_timer += dt

		if rl.IsKeyPressed(.W) do game.next_direction = .Up
		if rl.IsKeyPressed(.S) do game.next_direction = .Down
		if rl.IsKeyPressed(.A) do game.next_direction = .Left
		if rl.IsKeyPressed(.D) do game.next_direction = .Right

		for game.tick_timer >= TICK_SECONDS {
			game.tick_timer -= TICK_SECONDS
			game.tick_count += 1

			if game.next_direction != opposite[game.direction] {
				game.direction = game.next_direction
			}

			head := game.body[0]
			for i := game.length - 1; i > 0; i -= 1 {
				game.body[i] = game.body[i - 1]
			}
			delta_col, delta_row: i32
			switch game.direction {
			case .Up:
				delta_row = -1
			case .Down:
				delta_row = 1
			case .Left:
				delta_col = -1
			case .Right:
				delta_col = 1
			}
			head.col = (head.col + delta_col + GRID_COLS) % GRID_COLS
			head.row = (head.row + delta_row + GRID_ROWS) % GRID_ROWS
			game.body[0] = head
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
