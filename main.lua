--Made by Rob Chiocchio with love :3
love.window.setMode(1024,768, {vsync=true, borderless=true})

love.filesystem.load("tiledmap.lua")()

	love.graphics.setBackgroundColor(0x80,0x80,0x80)
	TiledMap_DrawNearCam(gCamX,gCamY)

function love.load()
	TiledMap_Load("map/map01.tmx")
end

--player.onGround = true
--player.velY = 0
--player.velX = 0

os_string = love.system.getOS( )
if os_string == "OS X" or "Windows" or "Linux" then
	keyboard = true
	showButtons = false
else
	keyboard = false
	showButtons = true
end

function love.keyreleased( key )
	gKeyPressed[key] = nil
end

function love.keypressed( key, unicode ) 
	gKeyPressed[key] = true 
	if (key == "escape") then os.exit(0) end
	if (key == " ") then -- space = next mal
		gMapNum = (gMapNum or 1) + 1
		if (gMapNum > 10) then gMapNum = 1 end
		TiledMap_Load(string.format("map/map%02d.tmx",gMapNum))
		gCamX,gCamY = 100,100
	end
end

function love.update( dt )
	local s = 500*dt
	if (gKeyPressed.up) then gCamY = gCamY - s end
	if (gKeyPressed.down) then gCamY = gCamY + s end
	if (gKeyPressed.left) then gCamX = gCamX - s end
	if (gKeyPressed.right) then gCamX = gCamX + s end
end

function love.draw()
	love.graphics.print('arrow-keys=scroll, space=next map', 50, 50)
    love.graphics.setBackgroundColor(0x80,0x80,0x80)
    TiledMap_DrawNearCam(gCamX,gCamY)
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