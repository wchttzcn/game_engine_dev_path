package main

import rl "vendor:raylib"

SCREEN_HEIGHT :: 600
SCREEN_WIDTH :: 800

PADDLE_WIDTH :: 100

BRICK_COLS :: 10
BRICK_ROWS :: 5
BRICK_WIDTH :: SCREEN_WIDTH / BRICK_COLS
BRICK_HEIGHT :: 20
BRICK_TOP :: 70
BRICK_PAD :: 4

Game :: struct {
	player: Paddle,
	ball:   Ball,
	state:  Game_State,
	bricks: [BRICK_ROWS * BRICK_COLS]Brick,
}

Paddle :: struct {
	rect:  rl.Rectangle,
	speed: f32,
}
Ball :: struct {
	pos, vel: rl.Vector2,
	radius:   f32,
}
Brick :: struct {
	rect:  rl.Rectangle,
	alive: bool,
}

Game_State :: enum {
	Playing,
	Lost,
	Won,
}

main :: proc() {
	rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Breakout")
	defer rl.CloseWindow()
	rl.SetTargetFPS(60)

	game: Game
	game_reset(&game)

	for !rl.WindowShouldClose() {
		dt := rl.GetFrameTime()

		if rl.IsKeyPressed(.R) {
			game_reset(&game)
		}

		switch game.state {
		case .Playing:
			if rl.IsKeyDown(.A) {
				game.player.rect.x -= game.player.speed * dt
			}
			if rl.IsKeyDown(.D) {
				game.player.rect.x += game.player.speed * dt
			}

			if game.player.rect.x < 0 do game.player.rect.x = 0
			if game.player.rect.x + game.player.rect.width > SCREEN_WIDTH do game.player.rect.x = SCREEN_WIDTH - game.player.rect.width

			game.ball.pos += game.ball.vel * dt

			// left
			if game.ball.pos.x - game.ball.radius < 0 {
				game.ball.pos.x = game.ball.radius
				game.ball.vel.x = -game.ball.vel.x
			}
			// right
			if game.ball.pos.x + game.ball.radius > SCREEN_WIDTH {
				game.ball.pos.x = SCREEN_WIDTH - game.ball.radius
				game.ball.vel.x = -game.ball.vel.x
			}
			// top
			if game.ball.pos.y - game.ball.radius < 0 {
				game.ball.pos.y = game.ball.radius
				game.ball.vel.y = -game.ball.vel.y
			}
			// bottom
			if game.ball.pos.y + game.ball.radius > SCREEN_HEIGHT {
				// drop one health.
				game.state = .Lost
			}

			if game.ball.vel.y > 0 &&
			   rl.CheckCollisionCircleRec(game.ball.pos, game.ball.radius, game.player.rect) {
				game.ball.pos.y = game.player.rect.y - game.ball.radius
				game.ball.vel.y = -game.ball.vel.y
			}

			for &brick in game.bricks {
				if !brick.alive do continue
				if rl.CheckCollisionCircleRec(game.ball.pos, game.ball.radius, brick.rect) {
					dx := game.ball.pos.x - (brick.rect.x + brick.rect.width / 2)
					dy := game.ball.pos.y - (brick.rect.y + brick.rect.height / 2)
					overlap_x := (brick.rect.width / 2 + game.ball.radius) - abs(dx)
					overlap_y := (brick.rect.height / 2 + game.ball.radius) - abs(dy)
					if overlap_x < overlap_y {
						game.ball.vel.x = -game.ball.vel.x
					} else {
						game.ball.vel.y = -game.ball.vel.y
					}
					brick.alive = false
					break
				}
			}
			alive_count := 0
			for brick in game.bricks {
				if brick.alive do alive_count += 1
			}
			if alive_count == 0 do game.state = .Won

		case .Lost:
		case .Won:
		}

		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)
		for brick in game.bricks {
			if brick.alive {
				rl.DrawRectangleRec(brick.rect, rl.WHITE)
			}
		}

		rl.DrawCircleV(game.ball.pos, game.ball.radius, rl.WHITE)
		rl.DrawRectangleRec(game.player.rect, rl.WHITE)
		switch game.state {
		case .Playing:
		case .Lost:
			draw_center_text("You lost - Press R to reset", 32, rl.RED)
		case .Won:
			draw_center_text("You win - Press R to reset", 32, rl.GREEN)
		}
		rl.EndDrawing()
	}
}

draw_center_text :: proc(text: cstring, font_size: i32, color: rl.Color) {
	text_x := SCREEN_WIDTH / 2 - rl.MeasureText(text, font_size) / 2
	rl.DrawText(text, text_x, SCREEN_HEIGHT / 2, font_size, color)
}

game_reset :: proc(game: ^Game) {
	game.state = .Playing
	game.player = Paddle {
		speed = 400.0,
		rect = {
			x = (SCREEN_WIDTH / 2) - (PADDLE_WIDTH / 2),
			y = SCREEN_HEIGHT - 60,
			width = PADDLE_WIDTH,
			height = 20,
		},
	}
	game.ball = Ball {
		radius = 10,
		pos    = {SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2},
		vel    = {220, -260},
	}

	for i in 0 ..< len(game.bricks) {
		row := i / BRICK_COLS
		col := i % BRICK_COLS
		game.bricks[i] = {
			rect = {
				x = f32(col) * BRICK_WIDTH + BRICK_PAD,
				y = BRICK_TOP + f32(row) * BRICK_HEIGHT + BRICK_PAD,
				width = BRICK_WIDTH - BRICK_PAD * 2,
				height = BRICK_HEIGHT - BRICK_PAD * 2,
			},
			alive = true,
		}
	}
}
