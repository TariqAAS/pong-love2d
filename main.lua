
function love.load()
    -- Game window
    love.window.setTitle("Pong - Red vs Blue")
    love.window.setMode(800, 600)
    love.graphics.setBackgroundColor(0.08, 0.08, 0.12)

    W, H = love.graphics.getDimensions()

    -- Team Blue (left paddle)
    player1 = {
        x = 30,
        y = H/2 - 50,
        width = 15,
        height = 100,
        speed = 400
    }

    -- Team Red (right paddle)
    player2 = {
        x = W - 45,
        y = H/2 - 50,
        width = 15,
        height = 100,
        speed = 400
    }
end

function love.update(dt)

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

    -- Keep both paddles inside the screen
    player1.y = math.max(0, math.min(H - player1.height, player1.y))
    player2.y = math.max(0, math.min(H - player2.height, player2.y))
end

function love.draw()

    -- Game title
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf("RED VS BLUE PONG", 0, 20, W, "center")

    -- Center dashed line
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
end
