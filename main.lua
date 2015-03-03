--Made by Rob Chiocchio with love :3

R = 0
G = 155
B = 255

--backgroundR = love.math.random(255) / 4
--backgroundG = love.math.random(255) * 2
--backgroundB = love.math.random(255) / 2
backgroundR = 255
backgroundB = 255
backgroundG = 255

--player.onGround = true
--player.velY = 0
--player.velX = 0

os_string = love.system.getOS( )
if os_string == "OS X" or "Windows" or "Linux" then
	keyJump = love.keyboard.isDown("space" or "up")
	keyLeft = love.keyboard.isDown("a" or "left")
	keyRight = love.keyboard.isDown("d" or "right")
	keyboard = true
	showButtons = false
else
	keyJump = false
	keyboard = false
	showButtons = true
end


function love.draw()
	R = love.mouse.getX()
	G = love.mouse.getY()
	B = love.mouse.getX() + love.mouse.getY()
	
	love.graphics.setBackgroundColor(backgroundR,backgroundG,backgroundB);
	
	--backgroundR = love.math.random(255)
	--backgroundG = love.math.random(255)
	--backgroundB = love.math.random(255)
	love.graphics.clear();	

	love.graphics.setColor(R,G,B);
	if keyboard == true then
    	love.graphics.print("True", 400, 300)
    else
    	love.graphics.print("False", 400, 300)
    end

end
--[[ GRAVITY
if (not player.onGround) then
	player.velY = player.velY + (3000 * dt)
else
	player.velY = 0
	if (keyJump) then
		player.velY = -1250
	end
end
player.y = player.y + (player.velY * dt)
--]]