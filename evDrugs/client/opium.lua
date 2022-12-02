ESX = nil

local PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	PlayerData.job = job  
	Citizen.Wait(5000) 
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
end)




Citizen.CreateThread(function()
    while true do 
        local wait = 750
                for k in pairs {vector3(evD.OpiumPoint.recolteX,evD.OpiumPoint.recolteY,evD.OpiumPoint.recolteZ)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(evD.OpiumPoint.recolteX,evD.OpiumPoint.recolteY,evD.OpiumPoint.recolteZ)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 5 then 
                    wait = 0
                    DrawMarker(27, evD.OpiumPoint.recolteX,evD.OpiumPoint.recolteY,evD.OpiumPoint.recolteZ-0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour commencer à récolter")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then
                        Citizen.CreateThread(function()
                            while true do
                                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                                local pos = {vector3(evD.OpiumPoint.recolteX,evD.OpiumPoint.recolteY,evD.OpiumPoint.recolteZ)}
                                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
                                

                                if dist <= 5 then
                                    TriggerServerEvent('recolteopium')
                                else 
                                    

                                    StopRecolteOpium()

                                end
                                Citizen.Wait(Config.time)
                            end
                        end)
                        Citizen.Wait(5000)
                    end
                end 
    end
    Citizen.Wait(wait)
    end
end)









function StopRecolteOpium()
    if recoltyesOpium then
    	recoltyesOpium = false
    end
end




Citizen.CreateThread(function()
    while true do 
        local wait = 750
                for k in pairs {vector3(evD.OpiumPoint.traitX,evD.OpiumPoint.traitY,evD.OpiumPoint.traitZ)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(evD.OpiumPoint.traitX,evD.OpiumPoint.traitY,evD.OpiumPoint.traitZ)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 5 then 
                    wait = 0
                    DrawMarker(27, evD.OpiumPoint.traitX,evD.OpiumPoint.traitY,evD.OpiumPoint.traitZ-0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour commencer à traiter")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then
                        Citizen.CreateThread(function()
                            while true do
                                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                                local pos = {vector3(evD.OpiumPoint.traitX,evD.OpiumPoint.traitY,evD.OpiumPoint.traitZ)}
                                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
                                

                                if dist <= 5 then
                                    TriggerServerEvent('traitementopium')
                                else 
                                    

                                    StopTraitementOpium()

                                end
                                Citizen.Wait(Config.time)
                            end
                        end)
                        Citizen.Wait(5000)
                    end
                end 
    end
    Citizen.Wait(wait)
    end
end)




function StopTraitementOpium()
    if traityesOpium then
    	traityesOpium = false
    end
end






Citizen.CreateThread(function()
    while true do 
        local wait = 750
                for k in pairs {vector3(evD.OpiumPoint.venteX,evD.OpiumPoint.venteY,evD.OpiumPoint.venteZ)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(evD.OpiumPoint.venteX,evD.OpiumPoint.venteY,evD.OpiumPoint.venteZ)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 5 then 
                    wait = 0
                    DrawMarker(27, evD.OpiumPoint.venteX,evD.OpiumPoint.venteY,evD.OpiumPoint.venteZ-0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour commencer à vendre")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then
                        Citizen.CreateThread(function()
                            while true do
                                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                                local pos = {vector3(evD.OpiumPoint.venteX,evD.OpiumPoint.venteY,evD.OpiumPoint.venteZ)}
                                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
                                

                                if dist <= 5 then
                                    TriggerServerEvent('venteopium')
                                else 
                                    

                                    StopVenteOpium()

                                end
                                Citizen.Wait(Config.time)
                            end
                        end)
                        Citizen.Wait(5000)
                    end
                end 
    end
    Citizen.Wait(wait)
    end
end)



function StopVenteOpium()
    if ventepossible4 then
    	ventepossible4 = false
    end
end