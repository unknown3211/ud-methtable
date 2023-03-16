local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("methtable", function(source, item)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local item = 'tableblueprint'
	if Player.Functions.GetItemByName(item) ~= nil then
        TriggerClientEvent('ud-methtable:Createtable', source)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You Are Missing A Table BluePrint Dum Dum!', 'error')
	end
end)

RegisterNetEvent('ud-methtable:server:removeIngred', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem('acetone', 1) 
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["acetone"], "remove") 
end)
RegisterNetEvent('ud-methtable:server:addMethBaggy', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.AddItem('methbaggy', 1) 
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["methbaggy"], "add") 
end)