---@class Utils: table
---@field InGroup fun(self: Utils) : boolean
-------------------------------------------------------------------

---@class Logger: table
---@field canDebug boolean
---@field logLevel number
---@field Say fun(self: Logger, msg: string)
---@field LogInfo fun(self: Logger, msg: string)
---@field LogDebug fun(self: Logger, msg: string)
---@field LogWarning fun(self: Logger, msg: string)
---@field LogError fun(self: Logger, msg: string)
---@field Dump fun(self: Logger, tbl: table)

-------------------------------------------------------------------

---@class Enums: table
---@field commands Commands
---@field events Events

---@class Events: table
---@field ADDON_LOADED  string
---@field PLAYER_LOGOUT string
---@field GROUP_LEFT string
---@field LFG_LIST_ACTIVE_ENTRY_UPDATE string

---@class Commands: table
---@field Help string
---@field Test string
---@field Remind string

-------------------------------------------------------------------

---@class Core: table
---@field logger Logger
---@field utils Utils
---@field enums Enums
---@field keyName string?
