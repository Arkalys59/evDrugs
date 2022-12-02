TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

---------------- Yamsoo / Evann Rework

-- Compte Membre LSPD et BCSO 

local CopsConnected = 0

function CountCops()
	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i = 1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		if xPlayer and xPlayer.job.name == 'police' and xPlayer.job.name == 'sheriff' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountCops)
end

CountCops()







-- Coke



RegisterNetEvent('recoltecoke')
AddEventHandler('recoltecoke', function()
    local item = "coke"
    local limiteitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if nbitemdansinventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "Tu n'a plus de place dans ton inventaire !")
        recoltyescoke = false
    elseif CopsConnected < Config.Cops then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.Cops.." ~s~Membres des forces de l'ordre en ville !")
        recoltyescoke = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Récolte de ~r~Coke~s~ en cours...")
		return
    end
end)


RegisterNetEvent('traitementcoke')
AddEventHandler('traitementcoke', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local coke = xPlayer.getInventoryItem('coke').count
    local coke_pooch = xPlayer.getInventoryItem('coke_pooch').count

    if coke_pooch > 100 then
        TriggerClientEvent('esx:showNotification', source, 'Il semble que tu ne puisses plus porter de Pochons de ~r~Coke')
        traityescoke = false
    elseif CopsConnected < Config.Cops then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.Cops.. " ~s~Membres des forces de l'ordre en ville !")
        traityescoke = false
    elseif coke < 3 then
        TriggerClientEvent('esx:showNotification', source, 'Pas assez de ~r~Coke~s~ pour traiter...')
        traityescoke = false
    else
        xPlayer.removeInventoryItem('coke', 3)
        xPlayer.addInventoryItem('coke_pooch', 1)
    end
end)



RegisterNetEvent('ventecoke')
AddEventHandler('ventecoke', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local coke_pooch = xPlayer.getInventoryItem('coke_pooch').count
    
    if coke_pooch < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de ~r~Pochon de Coke~s~ à vendre...')
    elseif CopsConnected < Config.Cops then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.Cops.. " ~s~Membres des forces de l'ordre en ville !")
        ventepossible = false    
    else
        xPlayer.removeInventoryItem('coke_pooch', 1)
        xPlayer.addAccountMoney('black_money', Config.VenteCoke)
        TriggerClientEvent('esx:showNotification', source, 'Vous avez vendu 1 ~r~Pochon de Coke~s~ pour ~r~'..Config.VenteCoke..'$')
    end
end)






-- Weed



RegisterNetEvent('recolteweed')
AddEventHandler('recolteweed', function()
    local item = "weed"
    local limiteitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if nbitemdansinventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "Tu n'a plus de place dans ton inventaire !")
        recoltyesweed = false
    elseif CopsConnected < Config.Cops then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.Cops.." ~s~Membres des forces de l'ordre en ville !")
        recoltyesweed = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Récolte de ~r~Weed~s~ en cours...")
		return
    end
end)


RegisterNetEvent('traitementweed')
AddEventHandler('traitementweed', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local weed = xPlayer.getInventoryItem('weed').count
    local weed_pooch = xPlayer.getInventoryItem('weed_pooch').count

    if weed_pooch > 100 then
        TriggerClientEvent('esx:showNotification', source, 'Il semble que tu ne puisses plus porter de Pochons de ~r~Weed')
        traityesweed = false
    elseif CopsConnected < Config.Cops then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.Cops.. " ~s~Membres des forces de l'ordre en ville !")
        traityesweed = false
    elseif weed < 3 then
        TriggerClientEvent('esx:showNotification', source, 'Pas assez de ~r~Weed~s~ pour traiter...')
        traityesweed = false
    else
        xPlayer.removeInventoryItem('weed', 3)
        xPlayer.addInventoryItem('weed_pooch', 1)
    end
end)



RegisterNetEvent('venteweed')
AddEventHandler('venteweed', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local weed_pooch = xPlayer.getInventoryItem('weed_pooch').count
    
    if weed_pooch < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de ~r~Pochon de Weed~s~ à vendre...')
    elseif CopsConnected < Config.Cops then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.Cops.. " ~s~Membres des forces de l'ordre en ville !")
        ventepossible2 = false    
    else
        xPlayer.removeInventoryItem('weed_pooch', 1)
        xPlayer.addAccountMoney('black_money', Config.VenteWeed)
        TriggerClientEvent('esx:showNotification', source, 'Vous avez vendu 1 ~r~Pochon de Weed~s~ pour ~r~'..Config.VenteWeed..'$')
    end
end)




-- Crack



RegisterNetEvent('recoltecrack')
AddEventHandler('recoltecrack', function()
    local item = "crack"
    local limiteitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if nbitemdansinventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "Tu n'a plus de place dans ton inventaire !")
        recoltyesCrack = false
    elseif CopsConnected < Config.Cops then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.Cops.." ~s~Membres des forces de l'ordre en ville !")
        recoltyesCrack = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Récolte de ~r~Crack~s~ en cours...")
		return
    end
end)


RegisterNetEvent('traitementcrack')
AddEventHandler('traitementcrack', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local crack = xPlayer.getInventoryItem('crack').count
    local crack_pooch = xPlayer.getInventoryItem('crack_pooch').count

    if crack_pooch > 100 then
        TriggerClientEvent('esx:showNotification', source, 'Il semble que tu ne puisses plus porter de Pochons de ~r~Crack')
        traityesCrack = false
    elseif CopsConnected < Config.Cops then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.Cops.. " ~s~Membres des forces de l'ordre en ville !")
        traityesCrack = false
    elseif crack < 3 then
        TriggerClientEvent('esx:showNotification', source, 'Pas assez de ~r~Crack~s~ pour traiter...')
        traityesCrack = false
    else
        xPlayer.removeInventoryItem('crack', 3)
        xPlayer.addInventoryItem('crack_pooch', 1)
    end
end)



RegisterNetEvent('ventecrack')
AddEventHandler('ventecrack', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local crack_pooch = xPlayer.getInventoryItem('crack_pooch').count
    
    if crack_pooch < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de ~r~Pochon de Crack~s~ à vendre...')
    elseif CopsConnected < Config.Cops then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.Cops.. " ~s~Membres des forces de l'ordre en ville !")
        ventepossible3 = false    
    else
        xPlayer.removeInventoryItem('crack_pooch', 1)
        xPlayer.addAccountMoney('black_money', Config.VenteCrack)
        TriggerClientEvent('esx:showNotification', source, 'Vous avez vendu 1 ~r~Pochon de Crack~s~ pour ~r~'..Config.VenteCrack..'$')
    end
end)




-- Opium



RegisterNetEvent('recolteopium')
AddEventHandler('recolteopium', function()
    local item = "opium"
    local limiteitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if nbitemdansinventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "Tu n'a plus de place dans ton inventaire !")
        recoltyesOpium = false
    elseif CopsConnected < Config.Cops then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.Cops.." ~s~Membres des forces de l'ordre en ville !")
        recoltyesOpium = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Récolte d ~r~Opium~s~ en cours...")
		return
    end
end)


RegisterNetEvent('traitementopium')
AddEventHandler('traitementopium', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local opium = xPlayer.getInventoryItem('opium').count
    local opium_pooch = xPlayer.getInventoryItem('opium_pooch').count

    if opium_pooch > 100 then
        TriggerClientEvent('esx:showNotification', source, 'Il semble que tu ne puisses plus porter de Pochons d ~r~Opium')
        traityesOpium = false
    elseif CopsConnected < Config.Cops then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.Cops.. " ~s~Membres des forces de l'ordre en ville !")
        traityesOpium = false
    elseif opium < 3 then
        TriggerClientEvent('esx:showNotification', source, 'Pas assez d ~r~Opium~s~ pour traiter...')
        traityesOpium = false
    else
        xPlayer.removeInventoryItem('opium', 3)
        xPlayer.addInventoryItem('opium_pooch', 1)
    end
end)



RegisterNetEvent('venteopium')
AddEventHandler('venteopium', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local opium_pooch = xPlayer.getInventoryItem('opium_pooch').count
    
    if opium_pooch < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de ~r~Pochon d Opium~s~ à vendre...')
    elseif CopsConnected < Config.Cops then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.Cops.. " ~s~Membres des forces de l'ordre en ville !")
        ventepossible4 = false    
    else
        xPlayer.removeInventoryItem('opium_pooch', 1)
        xPlayer.addAccountMoney('black_money', Config.VenteOpium)
        TriggerClientEvent('esx:showNotification', source, 'Vous avez vendu 1 ~r~Pochon de Crack~s~ pour ~r~'..Config.VenteOpium..'$')
    end
end)
