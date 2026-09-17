package main

import rl "vendor:raylib"

SCREEN_HEIGHT :: 600
SCREEN_WIDTH :: 800

PADDLE_WIDTH :: 100

Game :: struct {
	player: Paddle,
	ball:   Ball,
}

Paddle :: struct {
	rect:  rl.Rectangle,
	speed: f32,
}
Ball :: struct {
	pos, vel: rl.Vector2,
	radius:   f32,
}

main :: proc() {
	rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Breakout")
	defer rl.CloseWindow()
	rl.SetTargetFPS(60)

	game := Game {
		player = Paddle {
			speed = 400.0,
			rect = {
				x = (SCREEN_WIDTH / 2) - (PADDLE_WIDTH / 2),
				y = SCREEN_HEIGHT - 60,
				width = PADDLE_WIDTH,
				height = 20,
			},
		},
		ball = Ball{radius = 5, pos = {SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2}, vel = {220, -260}},
	}


	for !rl.WindowShouldClose() {
		dt := rl.GetFrameTime()

		if rl.IsKeyDown(.A) {
			game.player.rect.x -= game.player.speed * dt
		}
		if rl.IsKeyDown(.D) {
			game.player.rect.x += game.player.speed * dt
		}

		if game.player.rect.x < 0 do game.player.rect.x = 0
		if game.player.rect.x + game.player.rect.width > SCREEN_WIDTH do game.player.rect.x = SCREEN_WIDTH - game.player.rect.width


		game.ball.pos += game.ball.vel * dt

		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)
		rl.DrawCircleV(game.ball.pos, game.ball.radius, rl.WHITE)
		rl.DrawRectangleRec(game.player.rect, rl.WHITE)
		rl.EndDrawing()
	}
}

