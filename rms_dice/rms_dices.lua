local RSGCore = exports['rsg-core']:GetCoreObject()


RegisterCommand('dice', function(source, args, rawCommand)
    if source == 0 or source == "Console" then return end

    local dices, c = tonumber(args[1]), 1
    if dices then
        if dices > 3 then
            RSGCore.Functions.Notify(source, 'You can choose a number between 1 and 3 only', 'error', 5000)
            return
        end
        local dice = {}
        while c <= dices do
            table.insert(dice, { dicenum = math.random(1, 6)})
            c = c + 1
        end
        TriggerClientEvent('rms_dice:ToggleDiceAnim', source)
        Citizen.Wait(2000)
        TriggerClientEvent('rms_dice:ToggleDisplay', -1, source, dice, "dices")
    end
end, false)

RegisterCommand('rockpaperscissors', function(source, args, rawCommand)
	if source == 0 or source == "Console" then return end
	TriggerClientEvent('rms_dice:TogglerpsAnim', source)
	Citizen.Wait(2000)
	anim = tonumber(args[1])
	if not anim then
		TriggerClientEvent('rms_dice:ToggleDisplay', -1, source, math.random(1, 3), "rps")
	elseif anim == 1 then
		TriggerClientEvent('rms_dice:ToggleDisplay', -1, source, 1, "rps")
	elseif anim == 2 then
		TriggerClientEvent('rms_dice:ToggleDisplay', -1, source, 3, "rps")
	elseif anim == 3 then
		TriggerClientEvent('rms_dice:ToggleDisplay', -1, source, 2, "rps")
	end

end, false)





-- usuable item

RSGCore.Functions.CreateUseableItem("oldcoin", function(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 0, item.slot) then
        TriggerClientEvent("rms_dice:TogglecoinAnim", source, item.name)
		Citizen.Wait(2000)
	anim = nil
	if not anim then
		TriggerClientEvent('rms_dice:ToggleDisplay', -1, source, math.random(1, 2), "coin")
	end
    end
end)
