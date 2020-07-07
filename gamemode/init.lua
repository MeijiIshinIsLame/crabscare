AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

-- other scripts

AddCSLuaFile("round_controller/cl_round_controller.lua")
include("round_controller/sv_round_controller.lua")

function GM:PlayerSpawn(player)
	player:SetMaxHealth(1) -- 1 hit kills
	player:SetRunSpeed(500)
	player:SetWalkSpeed(300)
	player:Give("weapon_crowbar")
end