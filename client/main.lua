ESX   = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then

     for k, v in pairs(Config.Locations) do
        local coords = GetEntityCoords(GetPlayerPed(-1))
        local distance = GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true)
          
        if Config.Type ~= -1 and distance < Config.DrawDistance then  
        DrawMarker(Config.Type, v.x, v.y, v.z-0.95, 0, 0, 0.1, 0, 0, 0, 1.0, 1.0, 1.0, 0, 128, 255, 200, 0, 0, 0, 0)
          Draw3dtext(v.x, v.y, v.z+0.12, '[~g~E~w~] för att använda ~b~polis datorn')
          if IsControlPressed(0, 38) then
             playAnim('missheist_jewel@hacking', 'hack_loop')
             OpenMenu()
           end
        end
      end
    end
  end
end)
