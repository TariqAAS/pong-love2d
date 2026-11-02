function love.load()
    love.window.setTitle("Pong - Red vs Blue")
    love.window.setMode(800, 600)
    love.graphics.setBackgroundColor(0.08, 0.08, 0.12)

    W, H = love.graphics.getDimensions()

    -- Team Blue (left)
    player1 = {
        x = 30,
        y = H/2 - 50,
        width = 15,
        height = 100,
        speed = 400
    }

    -- Team Red (right)
    player2 = {
        x = W - 45,
        y = H/2 - 50,
        width = 15,
        height = 100,
        speed = 400
    }

    -- Ball
    ball = {
        x = W/2 - 8,
        y = H/2 - 8,
        width = 16,
        height = 16,
        dx = 300,
        dy = 200
    }

    -- Game Over system
    gameOver = false
    winner = ""
end

-- Check if two rectangles overlap (AABB collision)
function overlaps(a, b)
    return a.x < b.x + b.width and
           b.x < a.x + a.width and
           a.y < b.y + b.height and
           b.y < a.y + a.height
end

function love.update(dt)

    -- Stop everything when the game is over
    if gameOver then
        return
    end

    -- Team Blue movement (W and S)
    if love.keyboard.isDown("w") then
        player1.y = player1.y - player1.speed * dt
    end

    if love.keyboard.isDown("s") then
        player1.y = player1.y + player1.speed * dt
    end

    -- Team Red movement (Up and Down)
    if love.keyboard.isDown("up") then
        player2.y = player2.y - player2.speed * dt
    end

    if love.keyboard.isDown("down") then
        player2.y = player2.y + player2.speed * dt
    end

    -- Keep paddles inside the screen
    player1.y = math.max(0, math.min(H - player1.height, player1.y))
    player2.y = math.max(0, math.min(H - player2.height, player2.y))

    -- Move the ball using delta time
    ball.x = ball.x + ball.dx * dt
    ball.y = ball.y + ball.dy * dt

    -- Bounce off top and bottom walls
    if ball.y <= 0 then
        ball.y = 0
        ball.dy = -ball.dy

    elseif ball.y + ball.height >= H then
        ball.y = H - ball.height
        ball.dy = -ball.dy
    end

    -- Collision with Team Blue
    if ball.dx < 0 and overlaps(ball, player1) then
        ball.x = player1.x + player1.width
        ball.dx = -ball.dx * 1.05

    -- Collision with Team Red
    elseif ball.dx > 0 and overlaps(ball, player2) then
        ball.x = player2.x - ball.width
        ball.dx = -ball.dx * 1.05
    end

    -- Game Over when a team misses the ball
    if ball.x + ball.width < 0 then
        gameOver = true
        winner = "TEAM RED WINS!"

    elseif ball.x > W then
        gameOver = true
        winner = "TEAM BLUE WINS!"
    end
end

-- Press R to restart the game
function love.keypressed(key)
    if key == "r" and gameOver then
        love.load()
    end
end

function love.draw()

    -- Title
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf("RED VS BLUE PONG", 0, 20, W, "center")

    -- Center line
    love.graphics.setColor(0.35, 0.35, 0.4)

    for y = 60, H, 30 do
        love.graphics.rectangle("fill", W/2 - 2, y, 4, 15)
    end

    -- Team Blue paddle
    love.graphics.setColor(0.2, 0.5, 1)
    love.graphics.rectangle(
        "fill",
        player1.x,
        player1.y,
        player1.width,
        player1.height
    )

    -- Team Red paddle
    love.graphics.setColor(1, 0.2, 0.2)
    love.graphics.rectangle(
        "fill",
        player2.x,
        player2.y,
        player2.width,
        player2.height
    )

    -- White ball
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle(
        "fill",
        ball.x,
        ball.y,
        ball.width,
        ball.height
    )

    -- Game Over screen
    if gameOver then

        -- Dark overlay
        love.graphics.setColor(0, 0, 0, 0.85)
        love.graphics.rectangle("fill", 0, 0, W, H)

        -- Game Over heading
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf(
            "GAME OVER",
            0,
            H/2 - 90,
            W,
            "center"
        )

        -- Winner color
        if winner == "TEAM BLUE WINS!" then
            love.graphics.setColor(0.2, 0.5, 1)
        else
            love.graphics.setColor(1, 0.2, 0.2)
        end

        -- Display winner
        love.graphics.printf(
            winner,
            0,
            H/2 - 30,
            W,
            "center"
        )

        -- Restart instruction
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf(
            "Press R to restart",
            0,
            H/2 + 30,
            W,
            "center"
        )
    end
end