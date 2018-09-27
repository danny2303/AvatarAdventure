input = {}

mouseX,mouseY=0,0

function love.wheelmoved(x,y)
	camera.changeZoom(y)
end

function input.update(dt)
	--update global input variables
	mouseX,mouseY = love.mouse.getX(),love.mouse.getY()

	--check for keys down
	local facingAngleOffset=0
	local move=false
	if love.keyboard.isDown("w") then move=true end
    if love.keyboard.isDown("a") then move,facingAngleOffset=true,-math.pi/2 end
    if love.keyboard.isDown("s") then move,facingAngleOffset=true,math.pi end
    if love.keyboard.isDown("d") then move,facingAngleOffset=true,math.pi/2 end
    if move then
	    local x,y = carToVect(player.facing+facingAngleOffset,player.speed)
	    player.x,player.y=player.x+x,player.y+y
	end
end

return input