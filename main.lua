function love.load()
	math.randomseed(os.time())
	love.window.setFullscreen(true)
	screenWidth=love.graphics.getWidth()
	screenHeight=love.graphics.getHeight()

	--requiring a module runs all the code in it that isn't in a function - requiring a module in main requires it for all other modules
	require "camera"
	require "input"
	require "player"
	require "Images/images"

	camera.zoomCenter={x=screenWidth/2,y=screenHeight/2}--set the zoom center to the middle of the screen
	camera.rotationCenter={x=screenWidth/2,y=screenHeight/2}--sets the rotation center to the middle of the screen
end

function love.update()
    input.update()
    camera.follow={x=player.x,y=player.y} --centers the camera on the player
    camera.update()
end

function love.draw()
	camera.translate()

	--draw everything:
	for x=1,100 do
		for y=1,100 do
			love.graphics.rectangle("line",x*10,y*10,10,10)
		end
	end

	love.graphics.draw(aangImg,player.x-aangImg:getWidth()/2,player.y-aangImg:getHeight()/2)

	love.graphics.pop()
end