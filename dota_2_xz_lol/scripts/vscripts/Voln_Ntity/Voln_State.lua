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

  Timers:CreateTimer(90, function()
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
    return 90
  end)

  Timers:CreateTimer(250, function()
    for i=1,1 do
      local unit = CreateUnitByName("npc_dota_creature_gnoll_assassin", point3:GetAbsOrigin(), true, nil,nil , DOTA_TEAM_BADGUYS)

      unit:SetInitialGoalEntity(point3)
    end
  end)
end