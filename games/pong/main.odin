package main

import rl "vendor:raylib"

SCREEN_WIDTH :: 800
SCREEN_HEIGHT :: 450

OPPONENT_DEAD_ZONE :: 10.0
WIN_SCORE :: 5

Game :: struct {
	player, opponent:             Paddle,
	ball:                         Ball,
	player_score, opponent_score: i32,
	match_state:                  Match_State,
	debug_visible:                bool,
}
Paddle :: struct {
	x, y, width, height: f32,
	speed:               f32,
	rect:                rl.Rectangle,
}
Ball :: struct {
	x, y, radius:           f32,
	velocity_x, velocity_y: f32,
	color:                  rl.Color,
}
Match_State :: enum {
	Serving,
	Playing,
	Match_Over,
}

game_reset :: proc(game: ^Game) {
	game.player_score = 0
	game.opponent_score = 0
	ball_reset(&game.ball, 1)
	game.match_state = .Serving
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
		match_state = .Serving,
	}
	game_reset(&game)

	for !rl.WindowShouldClose() {
		dt := rl.GetFrameTime()
		update_game(&game, dt)

		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)
		draw_game(&game)
		if game.debug_visible {
			draw_debugui(&game)
		}
		rl.EndDrawing()
	}
}

update_game :: proc(game: ^Game, dt: f32) {
	if rl.IsKeyPressed(.F1) {
		game.debug_visible = !game.debug_visible
	}

	if rl.IsKeyDown(.W) {
		game.player.y -= game.player.speed * dt
	}
	if rl.IsKeyDown(.S) {
		game.player.y += game.player.speed * dt
	}

	if rl.IsKeyPressed(.R) {
		game_reset(game)
	}

	if game.player.y + game.player.height > SCREEN_HEIGHT {
		game.player.y = SCREEN_HEIGHT - game.player.height
	}
	if game.player.y < 0 {
		game.player.y = 0
	}

	opponent_center := game.opponent.y + game.opponent.height / 2
	diff := game.ball.y - opponent_center
	if diff > OPPONENT_DEAD_ZONE {
		game.opponent.y += game.opponent.speed * dt
	} else if diff < -OPPONENT_DEAD_ZONE {
		game.opponent.y -= game.opponent.speed * dt
	}

	game.opponent.y = clamp(game.opponent.y, 0, SCREEN_HEIGHT - game.opponent.height)

	game.player.rect = rl.Rectangle {
		game.player.x,
		game.player.y,
		game.player.width,
		game.player.height,
	}
	game.opponent.rect = rl.Rectangle {
		game.opponent.x,
		game.opponent.y,
		game.opponent.width,
		game.opponent.height,
	}
	game.ball.color = rl.WHITE

	switch game.match_state {
	case .Serving:
		if rl.IsKeyPressed(.SPACE) do game.match_state = .Playing

	case .Playing:
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
			game.match_state = .Serving
			if game.opponent_score == WIN_SCORE {
				game.match_state = .Match_Over
			}
		}
		if game.ball.x - game.ball.radius > SCREEN_WIDTH {
			ball_reset(&game.ball, 1)
			game.player_score += 1
			game.match_state = .Serving
			if game.player_score == WIN_SCORE {
				game.match_state = .Match_Over
			}
		}

		if rl.CheckCollisionCircleRec(
			rl.Vector2{game.ball.x, game.ball.y},
			game.ball.radius,
			game.opponent.rect,
		) {
			game.ball.color = rl.RED
			game.ball.x = game.opponent.x - game.ball.radius
			game.ball.velocity_x = -abs(game.ball.velocity_x)
		}
		if rl.CheckCollisionCircleRec(
			rl.Vector2{game.ball.x, game.ball.y},
			game.ball.radius,
			game.player.rect,
		) {
			game.ball.color = rl.RED
			game.ball.x = game.player.x + game.player.width + game.ball.radius
			game.ball.velocity_x = abs(game.ball.velocity_x)
		}
	case .Match_Over:
	}
}

draw_game :: proc(game: ^Game) {
	switch game.match_state {
	case .Playing, .Serving:
		rl.DrawText(rl.TextFormat("%d", game.player_score), 150, 40, 32, rl.WHITE)
		rl.DrawText(rl.TextFormat("%d", game.opponent_score), 650, 40, 32, rl.WHITE)
		rl.DrawLineEx(
			rl.Vector2{SCREEN_WIDTH / 2, 0},
			rl.Vector2{SCREEN_WIDTH / 2, SCREEN_HEIGHT},
			1,
			rl.WHITE,
		)

		rl.DrawRectangleRec(game.player.rect, rl.WHITE)
		rl.DrawRectangleRec(game.opponent.rect, rl.WHITE)
		rl.DrawCircleV(rl.Vector2{game.ball.x, game.ball.y}, game.ball.radius, game.ball.color)
	case .Match_Over:
		rl.DrawText(
			rl.TextFormat(
				"%d - %d %s Won",
				game.player_score,
				game.opponent_score,
				game.player_score == WIN_SCORE ? "Player" : "AI",
			),
			SCREEN_WIDTH / 2,
			SCREEN_HEIGHT / 2,
			32,
			rl.WHITE,
		)
	}
}

draw_debugui :: proc(game: ^Game) {
	rl.DrawFPS(10, 10)
	rl.DrawText(rl.TextFormat("Ball:posX : %.1f", game.ball.x), 10, 30, 8, rl.GREEN)
	rl.DrawText(rl.TextFormat("Ball:posY : %.1f", game.ball.y), 10, 40, 8, rl.GREEN)
	rl.DrawText(rl.TextFormat("Ball:velocity_x : %f", game.ball.velocity_x), 10, 50, 8, rl.GREEN)
	rl.DrawText(rl.TextFormat("Ball:velocity_y : %f", game.ball.velocity_y), 10, 60, 8, rl.GREEN)
	rl.DrawText(rl.TextFormat("Match State : %v", game.match_state), 10, 70, 8, rl.GREEN)

	rl.DrawRectangleLinesEx(game.player.rect, 2, rl.GREEN)
	rl.DrawRectangleLinesEx(game.opponent.rect, 2, rl.GREEN)
	rl.DrawCircleLinesV(rl.Vector2{game.ball.x, game.ball.y}, game.ball.radius, rl.GREEN)
}
