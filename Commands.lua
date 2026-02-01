---@type Core
local core = select(2, ...)


SLASH_KSR1 = '/ksr'

function SlashCmdList.KSR(msg, _)
    local args = {}

    for token in string.gmatch(msg or "", "%S+") do
        table.insert(args, strlower(token))
    end

    local cmd = args[1]

    if cmd == "test" then
        core.logger:Say("|cff0be65b".. "Ara-Kara, City of Echoes (Mythic Keystone)" .."|r")
        return
    end

    if cmd == nil or cmd == core.enums.commands.Help then
        core.logger:LogInfo("ksr Commands")
		core.logger:LogInfo("/ksr help – Display Help Commands")
		core.logger:LogInfo("/ksr test – Displays Test Text")
		core.logger:LogInfo("/ksr remind – Reminds what key you are apart of")
        return
    end

    if not core.utils:InGroup() then
        core.logger:LogError("You are not in a group... look in your own bag for your key...")
        return
    end

    if not core.keyName then
         core.logger:LogWarning("You are in a group but didnt manage to register key name")
         return
    end

    if cmd == core.enums.commands.Remind then
        core.logger:Say("|cff0be65b".. core.keyName .."|r")
    end
end
