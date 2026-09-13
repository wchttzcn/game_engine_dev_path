package main

import rl "vendor:raylib"

SCREEN_WIDTH :: 800
SCREEN_HEIGHT :: 450

OPPONENT_DEAD_ZONE :: 10.0

Game :: struct {
	player, opponent:             Paddle,
	ball:                         Ball,
	player_score, opponent_score: i32,
}

Paddle :: struct {
	x, y, width, height: f32,
	speed:               f32,
}
Ball :: struct {
	x, y, radius:           f32,
	velocity_x, velocity_y: f32,
}

ball_reset :: proc(ball: ^Ball, dir: f32) {
	ball.x = SCREEN_WIDTH / 2
	ball.y = SCREEN_HEIGHT / 2
	ball.velocity_x = 300.0 * dir
	ball.velocity_y = 180.0
}

main :: proc() {
	rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Pong")
	defer rl.CloseWindow()
	rl.SetTargetFPS(60)

	game := Game {
		player = Paddle{x = 40, y = 160, width = 20, height = 100, speed = 400.0},
		opponent = Paddle{x = 740, y = 160, width = 20, height = 100, speed = 150.0},
		ball = Ball{radius = 5},
	}
	ball_reset(&game.ball, 1)

	for !rl.WindowShouldClose() {
		//        === Update ===
		dt := rl.GetFrameTime()

		if rl.IsKeyDown(.W) {
			game.player.y -= game.player.speed * dt
		}
		if rl.IsKeyDown(.S) {
			game.player.y += game.player.speed * dt
		}

		if game.player.y + game.player.height > SCREEN_HEIGHT {
			game.player.y = SCREEN_HEIGHT - game.player.height
		}
		if game.player.y < 0 {
			game.player.y = 0
		}

		game.ball.y += game.ball.velocity_y * dt
		game.ball.x += game.ball.velocity_x * dt

		if game.ball.y - game.ball.radius < 0 {
			game.ball.y = game.ball.radius
			game.ball.velocity_y = abs(game.ball.velocity_y)
		}
		if game.ball.y + game.ball.radius > SCREEN_HEIGHT {
			game.ball.y = SCREEN_HEIGHT - game.ball.radius
			game.ball.velocity_y = -abs(game.ball.velocity_y)
		}

		if game.ball.x + game.ball.radius < 0 {
			ball_reset(&game.ball, -1)
			game.opponent_score += 1
		}
		if game.ball.x - game.ball.radius > SCREEN_WIDTH {
			ball_reset(&game.ball, 1)
			game.player_score += 1
		}

		opponent_center := game.opponent.y + game.opponent.height / 2
		diff := game.ball.y - opponent_center
		if diff > OPPONENT_DEAD_ZONE {
			game.opponent.y += game.opponent.speed * dt
		} else if diff < -OPPONENT_DEAD_ZONE {
			game.opponent.y -= game.opponent.speed * dt
		}

		game.opponent.y = clamp(game.opponent.y, 0, SCREEN_HEIGHT - game.opponent.height)

		player_rect := rl.Rectangle {
			game.player.x,
			game.player.y,
			game.player.width,
			game.player.height,
		}
		opponent_rect := rl.Rectangle {
			game.opponent.x,
			game.opponent.y,
			game.opponent.width,
			game.opponent.height,
		}
		// hit ball logic
		ball_color := rl.WHITE

		if rl.CheckCollisionCircleRec(
			rl.Vector2{game.ball.x, game.ball.y},
			game.ball.radius,
			opponent_rect,
		) {
			ball_color = rl.RED
			game.ball.x = game.opponent.x - game.ball.radius
			game.ball.velocity_x = -abs(game.ball.velocity_x)
		}
		if rl.CheckCollisionCircleRec(
			rl.Vector2{game.ball.x, game.ball.y},
			game.ball.radius,
			player_rect,
		) {
			ball_color = rl.RED
			game.ball.x = game.player.x + game.player.width + game.ball.radius
			game.ball.velocity_x = abs(game.ball.velocity_x)
		}

		//        === Draw ===
		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)

		rl.DrawText(rl.TextFormat("%d", game.player_score), 150, 40, 32, rl.WHITE)
		rl.DrawText(rl.TextFormat("%d", game.opponent_score), 650, 40, 32, rl.WHITE)

		rl.DrawRectangleRec(player_rect, rl.WHITE)
		rl.DrawRectangleRec(opponent_rect, rl.WHITE)
		rl.DrawCircleV(rl.Vector2{game.ball.x, game.ball.y}, game.ball.radius, ball_color)

		rl.EndDrawing()
	}
}
