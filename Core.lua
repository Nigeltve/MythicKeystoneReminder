---@type Core
local core = select(2, ...)


local function HandleEvents(_, event, args1)
    if event == core.enums.events.LFG_LIST_JOINED_GROUP  or event == core.enums.events.LFG_LIST_ACTIVE_ENTRY_UPDATE then
        if not args1 then
            return
        end

        ---@type LfgEntryData
        local entryData = C_LFGList.GetActiveEntryInfo()

        if not entryData then
            core.logger:LogError("Dont know how you got here!? activity entered but no LfgEntryData")
            return
        end

        ---@type number
        local activityID = nil

        for i, id in ipairs(entryData.activityIDs) do
            activityID = id
            break;
        end

        if not activityID then
            core.logger:LogError("activityID is nil")
            return
        end

        ---@type GroupFinderActivityInfo
        local activityInfo = C_LFGList.GetActivityInfoTable(activityID)

        if not activityInfo then
            core.logger:LogError("Dont know how you got here!? activity entered but no GroupFinderActivityInfo")
            return
        end

        if not activityInfo.isMythicPlusActivity and not activityInfo.isMythicActivity then
            return
        end

        local fullName = activityInfo.fullName
        
        core.keyName = fullName
        core.logger:Say("|cff0be65b"..fullName.."|r")

    elseif event == core.enums.events.GROUP_LEFT or event == core.enums.events.ACCOUNT_CHARACTER_CURRENCY_DATA_RECEIVED then
        core.keyName = nil
    end
end


local initFrame = CreateFrame("Frame", nil, UIParent)
initFrame:RegisterEvent(core.enums.events.LFG_LIST_JOINED_GROUP)
initFrame:RegisterEvent(core.enums.events.LFG_LIST_ACTIVE_ENTRY_UPDATE)
initFrame:RegisterEvent(core.enums.events.GROUP_LEFT)
initFrame:RegisterEvent(core.enums.events.ACCOUNT_CHARACTER_CURRENCY_DATA_RECEIVED)
initFrame:SetScript("OnEvent", HandleEvents)