local QBCore = exports[Config.CoreName]:GetCoreObject()
local Blip = {}

CreateThread(function()
    for k, v in pairs(Config.Locations) do
        if v.UseMapBlip then
            Blip[k] = AddBlipForCoord(v.MapBlipLocation.x, v.MapBlipLocation.y, v.MapBlipLocation.z)
            SetBlipSprite (Blip[k], v.MapBlipSprite)
            SetBlipDisplay(Blip[k], 4)
            SetBlipScale  (Blip[k], 0.6)
            SetBlipAsShortRange(Blip[k], true)
            SetBlipColour(Blip[k], v.MapBlipColor)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(tostring(v.MapBlipName))
            EndTextCommandSetBlipName(Blip[k])
        end
        for i, j in pairs(v.Scooters) do
            QBCore.Functions.SpawnVehicle(Config.ScooterModel, function(veh)
                FreezeEntityPosition(veh, true)
                exports[Config.TargetName]:AddTargetEntity(veh, {
                    options = {
                        { icon = "fas fa-biking", label = Config.Lang[Config.LangActive].RentScooter..' - '..v.RentPrice..'$', action = function() rentScooter(v.SpawnLocation, v.RentPrice) end },
                        { icon = "fas fa-biking", label = Config.Lang[Config.LangActive].BuyScooter..' - '..v.BuyPrice..'$', action = function() buyScooter(v.BuyPrice) end },
                    },
                    distance = 2.5
                })
            end, j, true)
        end
    end
end)

function rentScooter(coords, price)
    lib.registerContext({
        id = 'confirm_rental_scooter',
        title = Config.Lang[Config.LangActive].ConfirmRentalMenu,
        options = {
            {
                title = Config.Lang[Config.LangActive].Confirm,
                icon = 'check-circle',
                onSelect = function()
                    lib.callback('mt-ScooterRental:server:HasMoney', source, function(result)
                        if result then
                            QBCore.Functions.SpawnVehicle(Config.ScooterModel, function(veh)
                                SetVehicleNumberPlateText(veh, "MTFN"..tostring(math.random(1000, 9999)))
                                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                SetVehicleEngineOn(veh, true, true)
                            end, coords, true)
                        end
                    end, price)
                end,
            },
            {
                title = Config.Lang[Config.LangActive].Cancel,
                icon = 'times-circle',
                onSelect = function()
                    lib.hideContext()
                end
            },
        }
    })
    lib.showContext('confirm_rental_scooter')
end

function buyScooter(price)
    lib.registerContext({
        id = 'confirm_buy_scooter',
        title = Config.Lang[Config.LangActive].ConfirmBuyMenu,
        options = {
            {
                title = Config.Lang[Config.LangActive].Confirm,
                icon = 'check-circle',
                onSelect = function()
                    lib.callback('mt-ScooterRental:server:HasMoney', source, function(result)
                        if result then
                            TriggerServerEvent('mt-ScooterRental:server:GiveItem', 'eletric_scooter', 1, price)
                        end
                    end, price)
                end,
            },
            {
                title = Config.Lang[Config.LangActive].Cancel,
                icon = 'times-circle',
                onSelect = function()
                    lib.hideContext()
                end
            },
        }
    })
    lib.showContext('confirm_buy_scooter')
end

RegisterNetEvent('mt-ScooterRental:client:UseScooter', function()
    TriggerServerEvent('mt-ScooterRental:server:RemoveItem', 'eletric_scooter', 1)
    QBCore.Functions.SpawnVehicle(Config.ScooterModel, function(veh)
        SetVehicleNumberPlateText(veh, "MTFN"..tostring(math.random(1000, 9999)))
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
        exports[Config.TargetName]:AddTargetEntity(veh, {
            options = {
                { icon = "fas fa-biking", label = Config.Lang[Config.LangActive].PickScooter, action = function(entity) DeleteEntity(entity) TriggerServerEvent('mt-ScooterRental:server:GiveItem', 'eletric_scooter', 1, 0) end },
            },
            distance = 2.5
        })
    end, vec4(GetEntityCoords(PlayerPedId()).x-1.0, GetEntityCoords(PlayerPedId()).y-1.0, GetEntityCoords(PlayerPedId()).z, 0), true)
end)