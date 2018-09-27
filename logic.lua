function vectToCar(x,y)
	return math.atan2(y,x),math.sqrt(x^2+y^2)
end

function carToVect(a,m)
	return m*math.cos(a),m*math.sin(a)
end