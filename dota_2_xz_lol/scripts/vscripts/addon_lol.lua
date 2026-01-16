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
--    print(data)       --//хуй!
--	  DeepPrintTable(data)
  local killed_unit = EntIndexToHScript(data.entindex_killed)
--  print(killed_unit)  --//хуй!
  if killed_unit:GetUnitName() == 'npc_dota_creature_gnoll_assassin' then
		GameRules:SetGameWinner(DOTA_TEAM_GOODGUYS)
	end
  print(killed_unit:GetUnitName())
end

function AddonMode:AddonModeState() --не трогай мне надо для вида в консоли!
	print('пошла возня!')
end