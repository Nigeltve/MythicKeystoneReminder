---@type Core
local core = select(2, ...)

core.enums = core.enums or {}

---@type Commands
core.enums.commands = {
}

---@type Events

core.enums.events = {
    ADDON_LOADED = "ADDON_LOADED",
    LFG_LIST_JOINED_GROUP = "LFG_LIST_JOINED_GROUP",
    LFG_LIST_ACTIVE_ENTRY_UPDATE = "LFG_LIST_ACTIVE_ENTRY_UPDATE"
}
