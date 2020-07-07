AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

-- other scripts
AddCSLuaFile("round_controller/cl_round_controller.lua")
include("round_controller/sv_round_controller.lua")

AddCSLuaFile("round_controller/cl_lobby.lua")
include("round_controller/sv_lobby.lua")

--team flags
local TEAM_GNOME = 1
local TEAM_HUMAN = 2


function arrangeTeams(ply)

end


function GM:PlayerInitialSpawn(ply)

	ply:SetMaxHealth(1) -- 1 hit kills

	-- if gnomes aint full u a gnome, buddy
	if #team.GetPlayers(TEAM_GNOME) < 0 then
		print("you are a gnome")

		ply:SetTeam(TEAM_GNOME)

	else
		print("you are a human")

		ply:SetTeam(TEAM_HUMAN)		

	end


	if ply:Team() == TEAM_GNOME then
 
        ply:SetRunSpeed(1000)
		ply:SetWalkSpeed(800)
		ply:Give("weapon_crowbar")
 
    elseif ply:Team() == TEAM_GNOME then
 
        ply:SetRunSpeed(500)
		ply:SetWalkSpeed(300)
		ply:Give("weapon_physcannon")
 
    end

end
 
function team_1( ply )
 
    ply:SetTeam( TEAM_GNOME ) --Make the player join team 1
 
end
 
function team_2( ply )
 
    ply:SetTeam( TEAM_HUMAN ) --Make the player join team 2

end
 
concommand.Add( "team_1", team_1 ) --Add the command to set the players team to team 1
concommand.Add( "team_2", team_2 ) --Add the command to set the players team to team 2