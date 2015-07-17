local myHero = nil
local myHeroPos = nil

function AfterObjectLoopEvent(myHer0)
    myHero = myHer0
    myHeroPos = GetOrigin(myHero)
	
	local unit = GetCurrentTarget()
	if KeyIsDown(0x20) then 
	    if ValidTarget(unit, 900) then
			if CanUseSpell(myHero, _W) == READY and GetDistance(GetOrigin(unit), GetOrigin(myHero)) < 375*375 then
				CastTargetSpell(myHero, _W)
			end
			if CanUseSpell(myHero, _E) == READY and GetDistance(GetOrigin(unit), GetOrigin(myHero)) < 625*625 then
				CastTargetSpell(unit, _E)
			end
			if CanUseSpell(myHero, _R) == READY and GetDistance(GetOrigin(unit), GetOrigin(myHero)) < 375*375 then
				CastTargetSpell(unit, _R)
			end
	  	end
	end	
end

function ValidTarget(unit, range)
	if GetOrigin(unit) == nil or IsDead(unit) or GetTeam(unit) == GetTeam(myHero) or GetDistance(GetOrigin(unit)) > range*range then return false end
	return true
end

function GetDistance(p1,p2)
	p2 = p2 or myHeroPos
	local dx = p1.x - p2.x
	local dz = (p1.z or p1.y) - (p2.z or p2.y)
	return dx*dx + dz*dz

end