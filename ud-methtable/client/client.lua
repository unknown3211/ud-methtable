local QBCore = exports['qb-core']:GetCoreObject()
local deleteobj = false

RegisterNetEvent('ud-methtable:Createtable', function(spawnedObj)
  local ped = GetPlayerPed(PlayerId())
  local inveh = IsPedInAnyVehicle(ped)
if deleteobj == false and not inveh then
  FreezeEntityPosition(ped, true)
  TriggerEvent('animations:client:EmoteCommandStart', {"pickup"})
  Wait(300)
  FreezeEntityPosition(ped, false)
    local modelHash = Config.prop 
    local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(player)))
    local heading = GetEntityHeading(GetPlayerPed(GetPlayerFromServerId(player)))
    local forward = GetEntityForwardVector(PlayerPedId())
    local x, y, z = table.unpack(coords + forward * 0.5)
    local spawnedObj = CreateObject(modelHash, x, y, z, true, false, false)
    PlaceObjectOnGroundProperly(spawnedObj)
    SetEntityHeading(spawnedObj, heading)
    FreezeEntityPosition(spawnedObj, modelHash)
    deleteobj = true
end
end)

Citizen.CreateThread(function()
Wait(200)
local models = {
  Config.prop,
  }
  exports['qb-target']:AddTargetModel(models, {
    options = {
      {
        num = 1,
        type = "client",
        event = "ud-methtable:MakeMethBaggy",
        icon = 'fas fa-cannabis',
        label = 'Lets Cook!',
      },
      {
        num = 2,
        type = "client",
        event = "ud-methtable:DeleteTable",
        icon = 'fas fa-hand',
        label = 'Pickup Table',
      },
    },
    distance = 1.5,
  })
end)

RegisterNetEvent('ud-methtable:DeleteTable', function()
  local ped = GetPlayerPed(PlayerId())
    if deleteobj == true then
      local obj = QBCore.Functions.GetClosestObject(spawnedObj)
    TriggerEvent('animations:client:EmoteCommandStart', {"medic"})
    Wait(500)
    DeleteObject(obj)
    QBCore.Functions.Notify('Picked Up Table!', 'success', 7500)
    deleteobj = false
    Wait(500)
    ClearPedTasks(ped)
  end
end)

RegisterNetEvent("ud-methtable:MakeMethBaggy")
AddEventHandler("ud-methtable:MakeMethBaggy", function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            exports['ps-ui']:Circle(function(success)
                if success then
                    MakeMethBaggy()
                else
                    QBCore.Functions.Notify("Failed to complete minigame", "error")
                end
            end, 2, 20)
        else
            QBCore.Functions.Notify("You don't have any ingredients bruh..", "error")
        end
    end, 'acetone')
end)

function MakeMethBaggy()
    TriggerServerEvent('ud-methtable:server:removeIngred')
    QBCore.Functions.Progressbar("pickup", "Making Some Of That Good Shit..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('ud-methtable:server:addMethBaggy')
    QBCore.Functions.Notify("You made some bomb as shit bruh", "success")
end
