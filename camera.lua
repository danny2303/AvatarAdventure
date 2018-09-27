camera = {x=0,y=0,zoom=1,rotation=0,lastZoom = 1,panSpeed=3,zoomSpeed=0.1,minZoom = 0.01,maxZoom = 8,zoomCenter={x=0,y=0},rotationCenter={x=0,y=0},follow=false}

--rotation and zoom centers are in moniter coordinates
--rotation is in radians - not degrees
--the follow coordinates optionally teleport the camera to move the selected game coordinates into center frame

function camera.translate()
    love.graphics.push()
    love.graphics.translate(camera.rotationCenter.x, camera.rotationCenter.y)
    love.graphics.rotate(camera.rotation)--apply camera rotation
    love.graphics.translate(-camera.rotationCenter.x, -camera.rotationCenter.y)

    love.graphics.translate(camera.x,camera.y)--apply camera position
    love.graphics.scale(camera.zoom)--apply camera zoom
end

function camera.update()
    if camera.follow~=false then
        camera.x,camera.y=960-camera.follow.x*camera.zoom,520-camera.follow.y*camera.zoom
    end

    local zoomChange = camera.zoom/camera.lastZoom
    camera.x = camera.zoomCenter.x - zoomChange*(camera.zoomCenter.x - camera.x)
    camera.y = camera.zoomCenter.y - zoomChange*(camera.zoomCenter.y - camera.y)
    camera.lastZoom = camera.zoom
end

function camera.changeZoom(y)
    if y > 0 then
        camera.zoom = camera.zoom * (1+camera.zoomSpeed)
    elseif y < 0 then
        camera.zoom = camera.zoom * (1-camera.zoomSpeed)
    end
    if camera.zoom < camera.minZoom then camera.zoom = camera.minZoom end
    if camera.zoom > camera.maxZoom then camera.zoom = camera.maxZoom end
end

function camera.getDrawnCoordinates(x,y)
    return x*camera.zoom+camera.x, y*camera.zoom+camera.y
end

function camera.getGameCoordinates(x,y)
    return (x-camera.x)/camera.zoom, (y-camera.y)/camera.zoom
end

return camera