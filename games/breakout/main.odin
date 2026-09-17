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
		case .Lost:
		}

		text: cstring = "You lost - Press R to reset"
		measure_text := SCREEN_WIDTH / 2 - rl.MeasureText(text, 32) / 2

		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)

		for brick in game.bricks {
			if brick.alive {
				rl.DrawRectangleRec(brick.rect, rl.WHITE)
			}
		}

		rl.DrawCircleV(game.ball.pos, game.ball.radius, rl.WHITE)
		rl.DrawRectangleRec(game.player.rect, rl.WHITE)
		if game.state == .Lost {
			rl.DrawText(text, measure_text, SCREEN_HEIGHT / 2, 32, rl.RED)
		}
		rl.EndDrawing()
	}
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
