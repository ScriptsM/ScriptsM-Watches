TriggerEvent('chat:addSuggestion', '/time', 'Look at watches')

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		RequestAnimDict('watch@looking_at')
		ped = PlayerPedId()
		pedwatches = GetPedPropIndex(ped, 6)
		hours = GetClockHours()
		minutes = GetClockMinutes()
	end
end)

RegisterCommand('Time', function()
if pedwatches >= 0 then
	TaskPlayAnim(ped, 'watch@looking_at', 'base', 2.0, 2.0, 2000, 49, 0, false, false, false)
	exports['t-notify']:Custom({ -- Notification export
    style = 'message',
    title = 'Watches',
    message = 'Displays time:' .. ' ' .. hours .. ':' .. minutes + math.random(2),
    sound = true,
    duration = 5500
})
else
	TaskPlayAnim(ped, 'watch@looking_at', 'base', 2.0, 2.0, 5000, 49, 0, false, false, false)
	exports['t-notify']:Custom({ -- Notification export
    style = 'message',
    title = 'Character',
    message = 'I can imagine how golden watches will be on my hand...',
    sound = true,
    duration = 5500
})
end
end)

