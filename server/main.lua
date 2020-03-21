RegisterServerEvent('explicit:sendEfterlysning')
AddEventHandler('explicit:sendEfterlysning', function(result)
    TriggerClientEvent('chatMessage', -1, "^0[^5Polis Efterlysning^0]", { 255, 255, 255}, result)
end)

RegisterServerEvent('explicit:sendKallelse')
AddEventHandler('explicit:sendKallelse', function(result2)
    TriggerClientEvent('chatMessage', -1, "^0[^5Polis Kallelse^0]", { 255, 255, 255 }, result2)
end)

RegisterServerEvent('explicit:sendTwitter')
AddEventHandler('explicit:sendTwitter', function(result3)
    TriggerClientEvent('chatMessage', -1, "^0[^5Twitter^0] (^5@Polisen^0)", { 255, 255, 255 }, result3)
end)