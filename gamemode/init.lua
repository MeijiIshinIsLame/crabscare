AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

-- other scripts

AddCSLuaFile("round_controller/cl_round_controller.lua")
include("round_controller/sv_round_controller.lua")

function getGnomeLimit(how_many_humans)

	return math.floor((how_many_humans + 1) / 4)

end


function GM:PlayerSpawn(ply)

	ply:SetMaxHealth(1) -- 1 hit kills

	-- if gnomes aint full u a gnome, buddy
	if #team.GetPlayers(1) < getGnomeLimit(#team.GetPlayers(2)) then
		print("you are a gnome")

		ply:SetTeam(1)

	else
		print("you are a human")

		ply:SetTeam(2)		

	end


	if ply:Team() == 1 then
 
        ply:SetRunSpeed(1000)
		ply:SetWalkSpeed(800)
		ply:Give("weapon_crowbar")
 
    elseif ply:Team() == 2 then
 
        ply:SetRunSpeed(500)
		ply:SetWalkSpeed(300)
		ply:Give("weapon_gravitygun")
 
    end

end

--[[function GM:PlayerLoadout( ply )
 
    if ply:Team() == 1 then
 
        ply:Give("weapon_crowbar")
 
    elseif ply:Team() == 2 then
 
        ply:Give("weapon_gravitygun")
 
    end
 
end]]
 
function team_1( ply )
 
    ply:SetTeam( 1 ) --Make the player join team 1
 
end
 
function team_2( ply )
 
    ply:SetTeam( 2 ) --Make the player join team 2

end
 
concommand.Add( "team_1", team_1 ) --Add the command to set the players team to team 1
concommand.Add( "team_2", team_2 ) --Add the command to set the players team to team 2