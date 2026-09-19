package main

import "core:math/rand"
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

// Powerups
MAX_POWERUPS :: 4
POWERUP_DROP_CHANCE :: 0.2 // %20
POWERUP_SPEED :: 120
POWERUP_DURATION :: 6

// Particle
MAX_PARTICLES :: 64
PARTICLE_BURST :: 8

// Hitstop
HITSTOP_DURATION :: 0.05 // saniye

Game :: struct {
	player:             Paddle,
	ball:               Ball,
	state:              Game_State,
	bricks:             [BRICK_ROWS * BRICK_COLS]Brick,

	// powerup
	powerups:           [MAX_POWERUPS]Powerup,
	powerup_timer:      f32,
	active_powerup_pos: rl.Vector2,

	// particles
	particles:          [MAX_PARTICLES]Particle,
	// hitstop
	hitstop:            f32,
	// debug
	debug_visible:      bool,
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
Particle :: struct {
	alive:    bool,
	life:     f32,
	pos, vel: rl.Vector2,
}
Powerup :: struct {
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

		particle_update(&game, dt)

		if rl.IsKeyPressed(.R) {
			game_reset(&game)
		}

		if rl.IsKeyPressed(.P) {
			for i in 0 ..< 3 {
				powerup_spawn(&game, {f32(200 + i * 60), 100})
			}
		}

		if rl.IsKeyPressed(.F1) {
			game.debug_visible = !game.debug_visible
		}

		switch game.state {
		case .Playing:
			if game.hitstop > 0 {
				game.hitstop -= dt
			} else {
				powerup_update(&game, dt)

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
						game.hitstop = HITSTOP_DURATION

						center := rl.Vector2 {
							brick.rect.x + brick.rect.width / 2,
							brick.rect.y + brick.rect.height / 2,
						}
						for _ in 0 ..< PARTICLE_BURST {
							particle_spawn(&game, center)
						}

						if rand.float32_range(0, 1) < POWERUP_DROP_CHANCE {
							powerup_spawn(&game, center)
						}

						break
					}
				}
				alive_count := 0
				for brick in game.bricks {
					if brick.alive do alive_count += 1
				}
				if alive_count == 0 do game.state = .Won
			}
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

		for particle in game.particles {
			if particle.alive {
				rl.DrawCircleV(particle.pos, 5, rl.WHITE)
			}
		}

		for powerup in game.powerups {
			if powerup.alive {
				rl.DrawRectangleRec(powerup.rect, rl.YELLOW)
			}
		}

		if game.powerup_timer > 0 {
			rl.DrawCircleV(game.active_powerup_pos, 4, rl.YELLOW)
		}
		if game.debug_visible {
			rl.DrawText(
				rl.TextFormat("active_powerup_pos: %v", game.active_powerup_pos),
				10,
				30,
				10,
				rl.GREEN,
			)
		}

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
	game.powerups = {}
	game.powerup_timer = 0
	game.particles = {}

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

particle_spawn :: proc(game: ^Game, pos: rl.Vector2) {
	for &p in game.particles {
		if p.life > 0 do continue
		p.pos = pos
		p.life = 1
		p.vel = {rand.float32_range(-80, 80), rand.float32_range(-80, 80)}
		p.alive = true
		return
	}
}
particle_update :: proc(game: ^Game, dt: f32) {
	for &p in game.particles {
		if p.life <= 0 {
			p.alive = false
			continue
		}
		p.pos += p.vel * dt * 3
		p.life -= dt
	}
}

powerup_spawn :: proc(game: ^Game, pos: rl.Vector2) {
	for &p in game.powerups {
		if p.alive do continue
		p.rect = {pos.x, pos.y, 16, 16}
		p.alive = true
		return
	}
}

powerup_update :: proc(game: ^Game, dt: f32) {
	for &p in game.powerups {
		if !p.alive do continue
		p.rect.y += POWERUP_SPEED * dt

		if rl.CheckCollisionRecs(p.rect, game.player.rect) {
			game.player.rect.width = PADDLE_WIDTH * 1.5
			game.powerup_timer = POWERUP_DURATION
			p.alive = false
			game.active_powerup_pos = {p.rect.x, p.rect.y}
		} else if p.rect.y > SCREEN_HEIGHT {
			p.alive = false
		}
	}

	if game.powerup_timer > 0 {
		game.powerup_timer -= dt
		if game.powerup_timer <= 0 do game.player.rect.width = PADDLE_WIDTH
	}
}
