package main

import rl "vendor:raylib"

SCREEN_HEIGHT :: 600
SCREEN_WIDTH :: 800

PADDLE_WIDTH :: 100

Game :: struct {
	player: Paddle,
	ball:   Ball,
	state:  Game_State,
}

Paddle :: struct {
	rect:  rl.Rectangle,
	speed: f32,
}
Ball :: struct {
	pos, vel: rl.Vector2,
	radius:   f32,
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
			game.state = .Playing
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
  game. player = Paddle {
			speed = 400.0,
			rect = {
				x = (SCREEN_WIDTH / 2) - (PADDLE_WIDTH / 2),
				y = SCREEN_HEIGHT - 60,
				width = PADDLE_WIDTH,
				height = 20,
			},
		}
  game.ball = Ball{radius = 10, pos = {SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2}, vel = {220, -260}}
}
