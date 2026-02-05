---@type Core
local core = select(2, ...)

local function HandleEvents(_, event, args1)
    if event == core.enums.events.LFG_LIST_ACTIVE_ENTRY_UPDATE then    
        if args1 then
            return
        end

        ---@type LfgEntryData
        local entryData = C_LFGList.GetActiveEntryInfo()

        if not entryData then
            return
        end

        ---@type number
        local activityID = nil

        for i, id in ipairs(entryData.activityIDs) do
            activityID = id
            break;
        end

        if not activityID then
            return
        end

        ---@type GroupFinderActivityInfo
        local activityInfo = C_LFGList.GetActivityInfoTable(activityID)

        if not activityInfo then
            return
        end

        if not activityInfo.isMythicPlusActivity and not activityInfo.isMythicActivity then
            return
        end

        local fullName = activityInfo.fullName
        
        core.keyName = fullName
        core.logger:Say("|cff0be65b"..fullName.."|r")
    end
    
    if event == core.enums.events.GROUP_LEFT then
        core.keyName = nil
    end
end


local initFrame = CreateFrame("Frame", nil, UIParent)
initFrame:RegisterEvent(core.enums.events.ADDON_LOADED)
initFrame:RegisterEvent(core.enums.events.PLAYER_LOGOUT)
initFrame:RegisterEvent(core.enums.events.LFG_LIST_JOINED_GROUP)
initFrame:RegisterEvent(core.enums.events.LFG_LIST_ACTIVE_ENTRY_UPDATE)
initFrame:RegisterEvent(core.enums.events.GROUP_LEFT)
initFrame:SetScript("OnEvent", HandleEvents)