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
    GROUP_LEFT = "GROUP_LEFT",
    LFG_LIST_JOINED_GROUP = "LFG_LIST_JOINED_GROUP",
    LFG_LIST_ACTIVE_ENTRY_UPDATE = "LFG_LIST_ACTIVE_ENTRY_UPDATE",
    ACCOUNT_CHARACTER_CURRENCY_DATA_RECEIVED = "ACCOUNT_CHARACTER_CURRENCY_DATA_RECEIVED"
}
