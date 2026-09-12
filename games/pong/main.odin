package main

import rl "vendor:raylib"

Game :: struct {
	player, opponent: Paddle,
	ball:             Ball,
	score:            f32,
}

Paddle :: struct {
	x, y, width, height: f32,
}
Ball :: struct {
	x, y, radius: f32,
}

main :: proc() {
	rl.InitWindow(800, 450, "Pong")
	defer rl.CloseWindow()
	rl.SetTargetFPS(60)

	game := Game {
		player = Paddle{x = 40, y = 160, width = 20, height = 100},
		opponent = Paddle{x = 740, y = 160, width = 20, height = 100},
		ball = Ball{x = 400, y = 225, radius = 5},
	}

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


	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)

		rl.DrawRectangleRec(player_rect, rl.WHITE)
		rl.DrawRectangleRec(opponent_rect, rl.WHITE)
		rl.DrawCircleV(rl.Vector2{game.ball.x, game.ball.y}, game.ball.radius, rl.WHITE)

		rl.EndDrawing()
	}
}
