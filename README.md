# ud-methtable
Got Bored So Made A Basic Methtable Script For QB

Discord : https://discord.gg/ud9YUt566E

option For mz-skills - function MakeMethBaggy()
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
  exports["mz-skills"]:UpdateSkill('Drug Manufacture', 1)
end
