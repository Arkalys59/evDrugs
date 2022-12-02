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
                for k in pairs {vector3(evD.CokePoint.recolteX,evD.CokePoint.recolteY,evD.CokePoint.recolteZ)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(evD.CokePoint.recolteX,evD.CokePoint.recolteY,evD.CokePoint.recolteZ)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 5 then 
                    wait = 0
                    DrawMarker(27, evD.CokePoint.recolteX,evD.CokePoint.recolteY,evD.CokePoint.recolteZ-0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 240, 200, 80, 170, 0, 1, 2, 0, nil, nil, 0)
                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour commencer à récolter")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then
                        Citizen.CreateThread(function()
                            while true do
                                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                                local pos = {vector3(evD.CokePoint.recolteX,evD.CokePoint.recolteY,evD.CokePoint.recolteZ)}
                                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
                                

                                if dist <= 5 then
                                    TriggerServerEvent('recoltecoke')
                                else 
                                    

                                    StopRecoltecoke()

                                end
                                Citizen.Wait(Config.time)
                            end
                        end)
                        Citizen.Wait(5000) ----------------- Anti Spam by ev :)
                    end

                end 
    end
    Citizen.Wait(wait)
    end
end)








function StopRecoltecoke()
    if recoltyescoke then
    	recoltyescoke = false
    end
end




Citizen.CreateThread(function()
    while true do 
        local wait = 750
                for k in pairs {vector3(evD.CokePoint.traitX,evD.CokePoint.traitY,evD.CokePoint.traitZ)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(evD.CokePoint.traitX,evD.CokePoint.traitY,evD.CokePoint.traitZ)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 5 then 
                    wait = 0
                    DrawMarker(27, evD.CokePoint.traitX,evD.CokePoint.traitY,evD.CokePoint.traitZ-0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 240, 200, 80, 170, 0, 1, 2, 0, nil, nil, 0)
                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour commencer à traiter")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then
                        Citizen.CreateThread(function()
                            while true do
                                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                                local pos = {vector3(evD.CokePoint.traitX,evD.CokePoint.traitY,evD.CokePoint.traitZ)}
                                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
                                

                                if dist <= 5 then
                                    TriggerServerEvent('traitementcoke')
                                else 
                                    

                                    StopTraitementcoke()

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




function StopTraitementcoke()
    if traityescoke then
    	traityescoke = false
    end
end






Citizen.CreateThread(function()
    while true do 
        local wait = 750
                for k in pairs {vector3(evD.CokePoint.venteX,evD.CokePoint.venteY,evD.CokePoint.venteZ)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(evD.CokePoint.venteX,evD.CokePoint.venteY,evD.CokePoint.venteZ)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 5 then 
                    wait = 0
                    DrawMarker(27, evD.CokePoint.venteX,evD.CokePoint.venteY,evD.CokePoint.venteZ-0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 240, 200, 80, 170, 0, 1, 2, 0, nil, nil, 0)
                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour commencer à vendre")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then
                        Citizen.CreateThread(function()
                            while true do
                                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                                local pos = {vector3(evD.CokePoint.venteX,evD.CokePoint.venteY,evD.CokePoint.venteZ)}
                                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
                                

                                if dist <= 5 then
                                    TriggerServerEvent('ventecoke')
                                else 
                                    

                                    StopVentecoke()

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



function StopVentecoke()
    if ventepossible then
    	ventepossible = false
    end
end