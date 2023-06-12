Config = Config or {}

Config.CoreName = 'qbx-core'
Config.TargetName = 'qb-target'
Config.InventoryName = 'ox_inventory'
Config.LangActive = 'pt'

Config.ScooterModel = 'serv_electricscooter'

Config.Locations = {
    [1] = {
        RentPrice = 100,
        BuyPrice = 2000,
        SpawnLocation = vec4(-684.47, 5848.1, 16.92, 11.63),
        MapBlipLocation = vec3(-682.62, 5843.68, 17.28),
        UseMapBlip = true,
        MapBlipName = 'Aluguer e Venda - Trotinetes',
        MapBlipSprite = 57,
        MapBlipColor = 4,
        Scooters = {
            [1] = vec4(-681.23, 5844.9, 16.31, 53.41),
            [2] = vec4(-682.01, 5844.13, 16.29, 50.94),
            [3] = vec4(-683.66, 5842.49, 16.27, 46.94),
            [4] = vec4(-682.74, 5843.29, 16.28, 48.01),
        }
    },
}

Config.Lang = {
    ['en'] = {
        RentScooter = 'Rent Scooter',
        BuyScooter = 'Buy Scooter',
        ConfirmRentalMenu = 'Confirm Rental',
        ConfirmBuyMenu = 'Confirm Buy',
        Confirm = 'Confirm',
        Cancel = 'Cancel',
        CannotCarryItem = 'Inventory Full',
        PickScooter = 'Pick Scooter',
    },
    ['pt'] = {
        RentScooter = 'Alugar Trotinete',
        BuyScooter = 'Comprar Trotinete',
        ConfirmRentalMenu = 'Confirmar Aluguer',
        ConfirmBuyMenu = 'Confirmar Compra',
        Confirm = 'Confirmar',
        Cancel = 'Cancelar',
        CannotCarryItem = 'Inventário Cheio',
        PickScooter = 'Pegar Trotinete',
    },
}