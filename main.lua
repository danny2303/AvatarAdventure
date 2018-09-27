function love.load()
	math.randomseed(os.time())
	--love.mouse.setVisible(false)
	love.window.setFullscreen(true)
	screenWidth=love.graphics.getWidth()
	screenHeight=love.graphics.getHeight()

	--requiring a module runs all the code in it that isn't in a function - requiring a module in main requires it for all other modules
	require "camera"
	require "input"
	require "player"
	require "logic"
	require "Images/images"

	camera.zoomCenter={x=screenWidth/2,y=screenHeight/2}--set the zoom center to the middle of the screen
	camera.rotationCenter={x=screenWidth/2,y=screenHeight/2}--sets the rotation center to the middle of the screen
end

function love.update(dt)
    input.update(dt)
    player.update(dt)
    camera.follow={x=player.x,y=player.y} --centers the camera on the player
    camera.update(dt)
end

function love.draw()
	camera.translate()

	--draw everything:
	for x=1,100 do
		for y=1,100 do
			love.graphics.setColor(1,1,1)
			if (x+y)%2==0 then love.graphics.setColor(0.8,0.8,0.8) end
			love.graphics.draw(normalTile,x*120,y*120)
		end
	end

	love.graphics.draw(aangImg,player.x-aangImg:getWidth()/2,player.y-aangImg:getHeight()/2,player.facing,1,1,25.5,49.5)

	love.graphics.pop()
end
