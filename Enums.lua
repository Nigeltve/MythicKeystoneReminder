---@type Core
local core = select(2, ...)

core.enums = core.enums or {}

---@type Commands
core.enums.commands = {
    Help = "help",
    Test = "test",
    Remind = "remind"
}

---@type Events
core.enums.events = {
    ADDON_LOADED  = "ADDON_LOADED",
    PLAYER_LOGOUT = "PLAYER_LOGOUT",
    GROUP_LEFT = "GROUP_LEFT",
    LFG_LIST_ACTIVE_ENTRY_UPDATE = "LFG_LIST_ACTIVE_ENTRY_UPDATE",
}
