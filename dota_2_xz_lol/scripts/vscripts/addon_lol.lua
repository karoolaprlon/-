if AddonMode == nil then
	AddonMode = class({})
end

HeroExpTable = {0}
expTable = {50,50,50,100,200,300,400,500,666,700,800,900,1000,1100,1200,1300,1400,1500,1666,1700,1800,1900,2000,2100,2200,2300,2400,2500,2666,2700,3000} --31 lvl

for i=2,#expTable do
	HeroExpTable[i] = HeroExpTable[i-1] + expTable[i-1]
end

function AddonMode:InitGameMode()
	
	GameRules:SetGoldTickTime(1.0) --галда в секунду// не работает
	GameRules:SetStrategyTime(0.0) --эти 2 скип стадии планирование
	GameRules:SetShowcaseTime(0.0)

	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 5 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 0 )

	GameRules:GetGameModeEntity():SetUseCustomHeroLevels( true ) --кастом уровней
	GameRules:GetGameModeEntity():SetCustomXPRequiredToReachNextLevel( HeroExpTable )

	ListenToGameEvent('entity_killed', Dynamic_Wrap( self, 'KillEntity'), self)
	ListenToGameEvent('game_rules_state_change', Dynamic_Wrap( self, 'AddonModeStateChange'), self) --не трогать!!!
end

function AddonMode:AddonModeStateChange(data) --проверяет State-время в игре и если сейчас 0-начало игры то AddonModeState-можеш использовать его например чтобы волны крипов начились когда пробивает гонг тоесть в 00:00
	local newState = GameRules:State_Get()
	if newState == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		AddonMode:AddonModeState()
	end
end

function AddonMode:KillEntity(data)
--    print('чувак здох')
--    print(data)       --//хуй! crips_point
--	  DeepPrintTable(data)
  local killed_unit = EntIndexToHScript(data.entindex_killed)
--  print(killed_unit)  --//хуй!
  if killed_unit:GetUnitName() == 'npc_dota_creature_gnoll_assassin_2' then
		GameRules:SetGameWinner(DOTA_TEAM_GOODGUYS)
	end
  print(killed_unit:GetUnitName())
end

function AddonMode:AddonModeState() --не трогай мне надо для вида в консоли!
	print('пошла возня!')
end

function AddonMode:AddonModeState()
	--local point = Entities:FindByName(nil,"crips_point"):GetAbsOrigin()
	--CreateUnitByName("npc_dota_creature_gnoll_assassin", point, true, nil, nil, DOTA_TEAM_BADGUYS) --работает но крип провращяется в ходячий error
	self:VolnMobs()
end

function AddonMode:VolnMobs()
  local point1 = Entities:FindByName(nil, "enemy0_path1")
  local point2 = Entities:FindByName(nil, "enemy1_path1")
  local point3 = Entities:FindByName(nil, "enemy2_path1")
  local point4 = Entities:FindByName(nil, "enemy3_path1")
  local point5 = Entities:FindByName(nil, "enemy4_path1")
  local point6 = Entities:FindByName(nil, "enemy5_path1")

  for i=1,10 do 
    local unit = CreateUnitByName("npc_dota_neutral_kobold", point1:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

    unit:SetInitialGoalEntity(point1)
  end

  for i=1,10 do 
    local unit = CreateUnitByName("npc_dota_neutral_kobold", point2:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

    unit:SetInitialGoalEntity(point2)
  end

  for i=1,10 do 
    local unit = CreateUnitByName("npc_dota_neutral_kobold", point3:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

    unit:SetInitialGoalEntity(point3)
  end

  for i=1,10 do 
    local unit = CreateUnitByName("npc_dota_neutral_kobold", point4:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

    unit:SetInitialGoalEntity(point4)
  end

  for i=1,10 do 
    local unit = CreateUnitByName("npc_dota_neutral_kobold", point5:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

    unit:SetInitialGoalEntity(point5)
  end

  for i=1,10 do 
    local unit = CreateUnitByName("npc_dota_neutral_kobold", point6:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

    unit:SetInitialGoalEntity(point6)
  end

  Timers:CreateTimer(30, function()
    for i=1,20 do 
      local unit = CreateUnitByName("npc_dota_neutral_kobold", point1:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point1)
    end

    for i=1,20 do
      local unit = CreateUnitByName("npc_dota_neutral_kobold", point2:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point2)
    end

    for i=1,20 do
      local unit = CreateUnitByName("npc_dota_neutral_kobold", point3:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point3)
    end

    for i=1,20 do
      local unit = CreateUnitByName("npc_dota_neutral_kobold", point4:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point4)
    end

    for i=1,20 do
      local unit = CreateUnitByName("npc_dota_neutral_kobold", point5:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point5)
    end

    for i=1,20 do
      local unit = CreateUnitByName("npc_dota_neutral_kobold", point6:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point6)
    end
  end)

  Timers:CreateTimer(120, function()
    for i=1,10 do 
      local unit = CreateUnitByName("npc_dota_neutral_kobold_tru", point1:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point1)
    end

    for i=1,5 do
      local unit = CreateUnitByName("npc_dota_neutral_kobold_tru_lamp", point2:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point2)
    end

    for i=1,10 do
      local unit = CreateUnitByName("npc_dota_neutral_kobold_tru", point3:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point3)
    end

    for i=1,5 do
      local unit = CreateUnitByName("npc_dota_neutral_kobold_tru_lamp", point4:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point4)
    end

    for i=1,5 do
      local unit = CreateUnitByName("npc_dota_neutral_kobold_tru_lamp", point5:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point5)
    end

    for i=1,10 do
      local unit = CreateUnitByName("npc_dota_neutral_kobold_tru", point6:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point6)
    end
  end)

  Timers:CreateTimer(180, function()
    for i=1,1 do
      local unit = CreateUnitByName("npc_dota_creature_gnoll_assassin", point3:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point3)
    end
  end)

  Timers:CreateTimer(300, function()
    for i=1,10 do 
      local unit = CreateUnitByName("npc_dota_neutral_kobold_tru_2", point1:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point1)
    end

    for i=1,3 do
      local unit = CreateUnitByName("npc_dota_neutral_jungle_stalker", point2:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point2)
    end

    for i=1,10 do
      local unit = CreateUnitByName("npc_dota_neutral_kobold_tru_2", point3:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point3)
    end

    for i=1,3 do
      local unit = CreateUnitByName("npc_dota_neutral_jungle_stalker", point4:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point4)
    end

    for i=1,3 do
      local unit = CreateUnitByName("npc_dota_neutral_jungle_stalker", point5:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point5)
    end

    for i=1,10 do
      local unit = CreateUnitByName("npc_dota_neutral_kobold_tru_2", point6:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point6)
    end
  end)

  Timers:CreateTimer(420, function()
    for i=1,1 do
      local unit = CreateUnitByName("npc_dota_creature_gnoll_assassin_2", point3:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point3)
    end
  end)
end