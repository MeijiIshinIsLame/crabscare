AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

-- other scripts
-- AddCSLuaFile("round_controller/cl_round_controller.lua")
-- include("round_controller/sv_round_controller.lua")

-- AddCSLuaFile("round_controller/cl_lobby.lua")
-- include("round_controller/sv_lobby.lua")

--team flags
local TEAM_GNOME = 1
local TEAM_HUMAN = 2

--other vars
local GNOME_RUN_SPEED = 1000
local GNOME_WALK_SPEED = 700

local PLAYER_RUN_SPEED = 100
local PLAYER_WALK_SPEED = 300

local IN_RUN = 4096

function arrangeTeams(ply)

	if #team.GetPlayers(TEAM_GNOME) == 1 then
		ply:SetModel( "GnomeBoi" ) --ur a gnome lel
		print("you are a gnome")
		ply:SetTeam(TEAM_GNOME)

	else
		
		print("you are a human")
		ply:SetTeam(TEAM_HUMAN)		

	end

	ply:StripWeapons() -- This command strips all weapons from the player.


	if ply:Team() == TEAM_GNOME then
 
        ply:SetRunSpeed(GNOME_RUN_SPEED)
		ply:SetWalkSpeed(GNOME_WALK_SPEED)
		ply:Give("weapon_crowbar")
 
    elseif ply:Team() == TEAM_HUMAN then
 
        ply:SetRunSpeed(PLAYER_RUN_SPEED) -- this will actually serve as valorant style sneaking
		ply:SetWalkSpeed(PLAYER_WALK_SPEED)
		ply:Give("weapon_physcannon")
 
	end
	
end


function GM:PlayerSpawn(ply)

	ply:SetMaxHealth(1) -- 1 hit kills

	arrangeTeams(ply)

	print(ply:GetRunSpeed())
	print(ply:GetWalkSpeed())

end

--if player, cancel footsteps on walk/sneak
--returning true cancels default sound, false does nothing
function GM:PlayerFootstep( ply, pos, foot, sound, volume, rf )

	print(ply:KeyDown( IN_RUN ))

	if ply:KeyDown( IN_RUN ) then
		print("pressing shift")
		return true -- Don't allow default footsteps
	end
	
	return false

end
 
function team_1( ply )
 
    ply:SetTeam( TEAM_GNOME ) --Make the player join team 1
 
end
 
function team_2( ply )
 
    ply:SetTeam( TEAM_HUMAN ) --Make the player join team 2

end
 
concommand.Add( "team_1", team_1 ) --Add the command to set the players team to team 1
concommand.Add( "team_2", team_2 ) --Add the command to set the players team to team 2