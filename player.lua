player = {x=2000,y=2000,facing=0,speed=10}

function player.update(dt)
	local a,m=vectToCar(mouseX-960+aangImg:getWidth()/2,mouseY-520+aangImg:getHeight()/2)
	player.facing=a
end

return player