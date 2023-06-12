local QBCore = exports[Config.CoreName]:GetCoreObject()

RegisterNetEvent('mt-ScooterRental:server:GiveItem', function(item, amount, price)
    local Player = QBCore.Functions.GetPlayer(source)
    local CanCarryItem = nil
    if Config.InventoryName == 'ox_inventory' then
        CanCarryItem = exports.ox_inventory:CanCarryItem(source, item, amount)
    else
        CanCarryItem = true
    end
    if CanCarryItem then
        Player.Functions.AddItem(item, amount)
        if Config.InventoryName ~= 'ox_inventory' then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add", amount)
        end
    else
        TriggerClientEvent('QBCore:Notify', source, Config.Lang[Config.LangActive].CannotCarryItem, "error", 5000)
        if Config.InventoryName == 'ox_inventory' then
            Player.Functions.AddItem('cash', price)
        else
            Player.Functions.GiveMoney('cash', price)
        end
    end
end)

RegisterNetEvent('mt-ScooterRental:server:RemoveItem', function(ItemName, ItemAmount, ItemSlot)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(ItemName, ItemAmount, ItemSlot)
    if Config.InventoryName ~= 'ox_inventory' then
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[ItemName], "remove", ItemAmount)
    end
end)

lib.callback.register('mt-ScooterRental:server:HasMoney', function(source, Amount)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetMoney('cash') >= Amount then
        Player.Functions.RemoveMoney('cash', Amount)
        return true
    elseif Player.Functions.GetMoney('bank') >= Amount then
        Player.Functions.RemoveMoney('bank', Amount)
        return true
    else 
        return false
    end
end)

QBCore.Functions.CreateUseableItem('eletric_scooter', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('mt-ScooterRental:client:UseScooter', source)
    end
end)