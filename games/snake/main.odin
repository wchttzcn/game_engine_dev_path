package main

import "core:math/rand"
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
	head:           int,
	state:          Game_State,
	occupied:       [GRID_ROWS][GRID_COLS]bool,
	food:           Cell,
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

Game_State :: enum {
	Playing,
	Dead,
}

cell_rect :: proc(col, row: i32) -> rl.Rectangle {
	return rl.Rectangle {
		x = f32(col) * CELL_SIZE,
		y = f32(row) * CELL_SIZE,
		height = CELL_SIZE,
		width = CELL_SIZE,
	}
}

game_reset :: proc(game: ^Game) {
	game.tick_count = 0
	game.tick_timer = 0
	game.state = .Playing

	game.next_direction = .Right
	game.direction = .Right

	game.occupied = {}
	game.head = 0
	game.length = 5
	for i in 0 ..< game.length {
		cell := Cell {
			col = i32(GRID_COLS / 2 - i),
			row = GRID_ROWS / 2,
		}

		idx := body_index(game, i)
		game.body[idx] = cell
		game.occupied[cell.row][cell.col] = true
	}

	food_spawn(game)
}

food_spawn :: proc(game: ^Game) {
	empty_count := 0
	for row in 0 ..< GRID_ROWS {
		for col in 0 ..< GRID_COLS {
			if !game.occupied[row][col] do empty_count += 1
		}
	}
	if empty_count == 0 do return

	target := rand.int_max(empty_count)
	for row in 0 ..< GRID_ROWS {
		for col in 0 ..< GRID_COLS {
			if game.occupied[row][col] do continue
			if target == 0 {
				game.food = {
					col = i32(col),
					row = i32(row),
				}
				return
			}
			target -= 1
		}
	}
}

body_index :: proc(game: ^Game, i: int) -> int {
	return (game.head + i) % MAX_BODY
}

main :: proc() {
	rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Mucahit - Snake")
	defer rl.CloseWindow()
	rl.SetTargetFPS(60)


	game := Game{}
	game_reset(&game)


	opposite := [Direction]Direction {
		.Up    = .Down,
		.Down  = .Up,
		.Left  = .Right,
		.Right = .Left,
	}

	for !rl.WindowShouldClose() {
		switch game.state {
		case .Playing:
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

				old_head := game.body[game.head]
				new_head := Cell {
					col = (old_head.col + delta_col + GRID_COLS) % GRID_COLS,
					row = (old_head.row + delta_row + GRID_ROWS) % GRID_ROWS,
				}
				grow := new_head == game.food

				if !grow {
					tail := game.body[body_index(&game, game.length - 1)]
					game.occupied[tail.row][tail.col] = false
				} else {
					game.length += 1
				}

				game.head = (game.head - 1 + MAX_BODY) % MAX_BODY
				game.body[game.head] = new_head
				if game.occupied[new_head.row][new_head.col] {
					game.state = .Dead
					break
				}
				game.occupied[new_head.row][new_head.col] = true

				if grow do food_spawn(&game)
			}
		case .Dead:
			if rl.IsKeyPressed(.R) {
				game_reset(&game)
			}
		}

		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)

		for col in 0 ..< GRID_COLS {
			for row in 0 ..< GRID_ROWS {
				rl.DrawRectangleLinesEx(
					cell_rect(i32(col), i32(row)),
					1,
					rl.Color{255, 255, 255, 30},
				)
			}
		}

		for i in 0 ..< game.length {
			cell := game.body[body_index(&game, i)]
			rl.DrawRectangleRec(cell_rect(cell.col, cell.row), i == 0 ? rl.LIME : rl.GREEN)
		}

		for col in 0 ..< GRID_COLS {
			for row in 0 ..< GRID_ROWS {
				if game.occupied[row][col] {
					rl.DrawRectangleLinesEx(cell_rect(i32(col), i32(row)), 1, rl.YELLOW)
				}
			}
		}

		rl.DrawRectangleRec(cell_rect(game.food.col, game.food.row), rl.RED)

		if game.state == .Dead {
			rl.DrawText(
				rl.TextFormat("Game Over Score: %d", game.length),
				SCREEN_WIDTH / 2 - 100,
				SCREEN_HEIGHT / 2,
				20,
				rl.RED,
			)
		}

		rl.DrawText(rl.TextFormat("tick: %d", game.tick_count), 10, 10, 20, rl.GREEN)
		rl.EndDrawing()
	}
}
