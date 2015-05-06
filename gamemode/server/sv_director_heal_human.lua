local Human = {}

local function RefreshCache()
	Human = team.GetPlayers(TEAM_HUMAN)
end
timer.Create("HU-RefreshCache", 15, 0, RefreshCache)

--Time in seconds after last hit or hurt to wait before healing
--local HealTimeout = 60
local HealTimeout = 4
local HealTimeout2 = 2

--Amount to heal per cycle
--local HealAmount = 20
local HealAmount = 1

local maxheal = 40
local maxheal2 = 30

--Interval time in seconds to heal
--local HealInterval = 4
local HealInterval = 1
local HealInterval2 = 0.25

local function Heal()
	local Time = CurTime()
		
	
	for i=1, #Human do		
		local pl = Human[i]
			if pl:GetPerk("_horse") then		
		if not IsValid(pl) or not pl:Alive() or not pl:Team() == TEAM_HUMAN or pl:Health() >= maxheal then
			continue
		end

		if Time < (pl.LastHit + HealTimeout) or Time < (pl.LastHurt + HealTimeout) then
			continue
		end
			pl:SetHealth(math.min(pl:Health() + HealAmount, maxheal))
		else	
	return
		
		end	
	end	
end
timer.Create("HU-Heal", HealInterval, 0, Heal)

local function Heal2()
	local Time = CurTime()
		
	
	for i=1, #Human do
			
		local pl = Human[i]
			if pl:GetPerk("_psychopath") then
	
	if not IsValid(pl) or not pl:Alive() or not pl:Team() == TEAM_HUMAN or pl:Health() >= maxheal2 then
			continue
		end

		

		if Time < (pl.LastHit + HealTimeout2) or Time < (pl.LastHurt + HealTimeout2) then
			continue
		end

		pl:SetHealth(math.min(pl:Health() + HealAmount, maxheal2))
		else	
	return
		
	end
	
	
	end
	
end
timer.Create("HU-Heal2", HealInterval2, 0, Heal2)


