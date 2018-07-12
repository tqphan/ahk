function(progress, r1, g1, b1, a1, r2, g2, b2, a2)
    local hasTarget = UnitExists("target")
    local targetAttackable = UnitCanAttack("player","target")
    local range5m = IsSpellInRange("Kick","target")
    local range10m = CheckInteractDistance("target", 3)    
    local range20m = IsItemInRange("item:50741","target")
    
    if ((not hasTarget) or (range5m == nil)) then
        return 0, 0, 0, 1
    end
    
    if(range5m ~= 0) then
        return 0, 1, 0, 1
    elseif (range10m) then
        return 0, 0, 1, 1
    elseif (range20m) then
        return 1, 0, 0, 1
    else
        return 1, 1, 1, 1
    end
end

function(progress, r1, g1, b1, a1, r2, g2, b2, a2)
    local curpower = UnitPower("player")
    local maxpower = UnitPowerMax("player")
    if (maxpower == 0) then
        return 0, 0, 0, 0
    end
    
    local power = curpower * 100 / maxpower
    
    if (power < 20) then
        return 0, 0, 0, 1
    elseif (power < 40) then
        return 1, 0, 0, 1
    elseif (power < 60) then
        return 0, 0, 1, 1
    elseif (power < 80) then
        return 0, 1, 0, 1
    else
        return 1, 1, 1, 1
    end
end

function(progress, r1, g1, b1, a1, r2, g2, b2, a2)
    local curh = UnitHealth("player")
    local maxh = UnitHealthMax("player")
    if (maxh == 0) then
        return 0, 0, 0, 0
    end
    
    local health = curh * 100 / maxh
    if (health <= 33) then
        return 1, 0, 0, 1
    elseif (health > 25 and health <=66) then
        return 0, 0, 1, 1
    elseif (health > 66) then
        return 0, 1, 0, 1
    else
        return 0, 0, 0, 0 
    end
end

function(progress, r1, g1, b1, a1, r2, g2, b2, a2)
    local hasTarget = UnitExists("target")
    local targetAttackable = UnitCanAttack("player","target")
    local range5m = IsSpellInRange("Kick","target")
    local range10m = CheckInteractDistance("target", 3)    
    local range20m = IsItemInRange("item:50741","target")
    
    if ((not hasTarget) or (range5m == nil)) then
        return 0, 0, 0, 1
    end
    
    if(range5m ~= 0) then
        return 0, 1, 0, 1
    elseif (range10m) then
        return 0, 0, 1, 1
    elseif (range20m) then
        return 1, 0, 0, 1
    else
        return 1, 1, 1, 1
    end
end

local painbringer = UnitBuff("player", "Painbringer")
local demon_spikes = UnitBuff("player", "Demon Spikes")
local empower_wards = UnitBuff("player", "Empower Wards")
local metamorpheisis = UnitBuff("player", "Metamorpheisis")
local fiery_brand = UnitBuff("target", "Fiery Brand")

local demon_spikes_usable = IsUsableSpell("Demon Spikes")
local empower_wards_usable = IsUsableSpell("Empower Wards")
local metamorpheisis_usable = IsUsableSpell("Metamorpheisis")
local fiery_brand_usable = IsUsableSpell("Fiery Brand")

currentCharges, maxCharges, cooldownStart, cooldownDuration, chargeModRate = GetSpellCharges(spellId or "spellName")
usable, nomana = IsUsableSpell("spellName" or spellID or spellIndex[, "bookType"]);

if(painbringer or demon_spikes or empower_wards or metamorpheisis or fiery_brand) then
    return 0, 0, 0, 1
end

local charges = GetSpellCharges("Demon Spikes")
if(charges == 2) then
    return 0, 1, 0, 1
end