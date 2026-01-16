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



	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
end

-- Evaluate the state of the game
function AddonMode:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
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