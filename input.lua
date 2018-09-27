input = {}

mouseX,mouseY=0,0

function love.wheelmoved(x,y)
	camera.changeZoom(y)
end

function input.update()
	--update global input variables
	mouseX,mouseY = love.mouse.getX(),love.mouse.getY()

	--check for keys down
	if love.keyboard.isDown("w") then player.y = player.y - camera.panSpeed end
    if love.keyboard.isDown("a") then player.x = player.x - camera.panSpeed end
    if love.keyboard.isDown("s") then player.y = player.y + camera.panSpeed end
    if love.keyboard.isDown("d") then player.x = player.x + camera.panSpeed end
end

return input