# Red vs Blue Pong — LÖVE2D

**Name:** [Tariq AbuAlsoud]  

## About the Game

Red vs Blue Pong is a two-player arcade game created using Lua and the LÖVE2D framework. Team Blue plays on the left side and Team Red on the right side. Both teams control paddles to prevent the ball from passing them. The ball bounces off the walls and paddles, and it gets faster after each paddle hit. If a team misses the ball, the other team wins.

## How to Run

1. Install LÖVE2D from https://love2d.org/
2. Download the project.
3. Open the project folder in a terminal.
4. Run `love .` to start the game.

## Controls

| Team | Move Up | Move Down |
|---|---|---|
| Team Blue | W | S |
| Team Red | Up Arrow | Down Arrow |

Press **R** to restart after Game Over.

## My Own Changes

I added several features to personalize my game:

- **Red vs Blue theme:** Each team has a different paddle color.
- **Increasing ball speed:** The ball becomes 5% faster horizontally after each paddle collision.
- **Game Over system:** The game ends when a team misses the ball and announces the winner.
- **Restart feature:** Pressing R starts a new match.

## Screenshot

![Pong gameplay](screenshots/game.png)

## Demo Video

[Watch the gameplay demo](demo/gameplay.mp4)