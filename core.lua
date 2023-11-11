SLASH_RELOADUI1 = "/rl"
SlashCmdList.RELOADUI = ReloadUI

SLASH_FRAMESTK1 = "/fs"
SlashCmdList.FRAMESTK = function()
    LoadAddOn('Blizzard_DebugTools')
    FrameStackTooltip_Toggle()
end

for i = 1, NUM_CHAT_WINDOWS do 
    _G["ChatFrame"..i.."EditBox"]:SetAltArrowKeyMode(false)
end

local myFrame = CreateFrame("Button", myFrame, UIParent)
myFrame:SetPoint("TOP", 0, 0)
myFrame:SetWidth(25)
myFrame:SetHeight(25)

local myTexture = myFrame:CreateTexture()
myTexture:SetAllPoints(myFrame)
myTexture:SetTexture("Interface\\AddOns\\MyAddon\\images\\Smile.blp")

myFrame:SetScript("OnClick", function(self, button, down)
  print("Clicked")
  PlayMusic("Interface/AddOns/MyAddon/sounds/StaplesThatWasEasy.ogg")
  C_Timer.After(2, function()
    StopMusic()
  end)
end)




