function ShowNotification( text )
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawNotification(false, false)
end

local ragdoll = false
function setRagdoll(flag)
  ragdoll = flag
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if ragdoll then
        
        SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
      
    end
  end
end)

ragdol = true
RegisterNetEvent("Ragdoll")
AddEventHandler("Ragdoll", function()
	if ( ragdol ) then
		setRagdoll(true)
		ShowNotification("~r~Vous dormez.")
		ragdol = false
	else
		setRagdoll(false)
		ShowNotification("~g~Vous vous levez.")
		ragdol = true
	end
end)

Citizen.CreateThread(function()
 	while true do
 		Citizen.Wait(100)
 		if ( IsControlPressed(2, 303) ) then
 			TriggerEvent("Ragdoll", source)
 		end
 	end
 end)


print("Ragdoll by 7empest loaded")
