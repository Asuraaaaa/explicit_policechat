OpenMenu = function()

    ESX.UI.Menu.CloseAll()
  
    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'choose_chat',
      {
        title    = 'Polisens Dator',
        align    = 'center',
        elements = {
      {label = 'Polis Efterlysning', value = 'efterlysning'},
      {label = 'Polis Kallelse',     value = 'kallelse'},
      {label = 'Polis Twitter',      value = 'twitter'},
        },
      },
      function(data, menu)
      
          if data.current.value == 'efterlysning' then
            menu.close()
            Efterlysning()
          end
          if data.current.value == 'kallelse' then
            menu.close()
            kallelse()
          end
          if data.current.value == 'twitter' then
            menu.close()
            Twitter()
          end
      end,
      function(data, menu)
        menu.close()
      end
    )
  end
  
  Efterlysning = function()
    DisplayOnscreenKeyboard(12, "FMMC_KEY_TIP8", "", "", "", "", "", 200)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0);
        Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
        result = GetOnscreenKeyboardResult()
        TriggerServerEvent("explicit:sendEfterlysning", result)
    end
  end
  
  kallelse = function()
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "Skicka kallelse till person", "", "", "", "", 200)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0);
        Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
        result2 = GetOnscreenKeyboardResult()
        TriggerServerEvent("explicit:sendKallelse", result2)
    end
  end
  
  Twitter = function()
    DisplayOnscreenKeyboard(12, "FMMC_KEY_TIP8", "", "", "", "", "", 200)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0);
        Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
        result3 = GetOnscreenKeyboardResult()
        TriggerServerEvent("explicit:sendTwitter", result3)
    end
  end
  
  Draw3dtext = function(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = 0.5
     if onScreen then
      SetTextScale(scale, scale)
      SetTextFont(4)
      SetTextProportional(1)
      SetTextColour(255, 255, 255, 255)
      SetTextDropshadow(0, 0, 0, 0, 255)
      SetTextEdge(2, 0, 0, 0, 150) 
      SetTextDropShadow()
      SetTextOutline()
      SetTextEntry("STRING")
      SetTextCentre(1)
      AddTextComponentString(text)
      DrawText(_x,_y)
      end
  end

  playAnim = function(animDict, animName, duration)
	RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
    TaskPlayAnim(GetPlayerPed(-1), animDict, animName, 8.0, -8.0, -1, 1, 0, false, false, false)
	  RemoveAnimDict(animDict)
end