---@type Core
local core = select(2, ...)

local unitType = "player"

core.utils = {
    InGroup = function(self)
        return UnitInAnyGroup(unitType)
    end,
}
