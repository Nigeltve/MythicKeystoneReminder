---@type Core
local core = select(2, ...)

local addonName = "KSR"

---@type Logger
core.logger = {
	canDebug = true,
	logLevel = 0,

	Say = function(self, msg)
		print(" [|cffed1818".. addonName .."|r] Joining: " .. tostring(msg))
	end,

	LogInfo = function(self, msg)
		if (not self.canDebug) or self.logLevel > 3 then
			return
		end
		print("|cff7dfff2 ".. addonName .." INFO:|r " .. tostring(msg))
	end,

	LogDebug = function(self, msg)
		if (not self.canDebug) or self.logLevel > 2 then
			return
		end
		print("|cff7da0ff ".. addonName .." Debug:|r " .. tostring(msg))
	end,

	LogWarning = function(self, msg)
		if (not self.canDebug) or self.logLevel > 1 then
			return
		end
		print("|cfff4ff7d ".. addonName .." Warning:|r " .. tostring(msg))
	end,

	LogError = function(self, msg)
		if (not self.canDebug) or self.logLevel > 0 then
			return
		end
		print("|cffff3737 ".. addonName .." Error:|r " .. tostring(msg))
	end,
	
	Dump = function(self, tbl)
		if tbl == nil then
			print("Table is nil")
			return
		end
		DevTools_Dump(tbl)
	end
}
