local MainFrame = CreateFrame("Frame", "BasicFrame", UIParent, "InsetFrameTemplate")
MainFrame:SetSize(600, 600)
MainFrame:SetPoint("CENTER")

local FontString = MainFrame:CreateFontString("TitleFontString", "OVERLAY", "GameFontNormalMed3")
FontString:SetText("MyAddon")
FontString:SetPoint("TOP", 0, -12)

function ScrollFrame_OnMouseWheel(self, delta)
  local newValue = self:GetVerticalScroll() - (delta * 20);
  if (newValue < 0) then
    newValue = 0;
  elseif (newValue > self:GetVerticalScrollRange()) then
    newValue = self:GetVerticalScrollRange();
  end
  self:SetVerticalScroll(newValue);
end
local ScrollFrame = CreateFrame("ScrollFrame", "BasicScrollFrame", MainFrame, "UIPanelScrollFrameTemplate")
ScrollFrame:SetScript("OnMouseWheel", ScrollFrame_OnMouseWheel)
ScrollFrame:SetPoint("TOP", -12, -30)
ScrollFrame:SetSize(568, 550)
local InnerFrame = CreateFrame("Frame", "ScrollFrame InnerFrame", ScrollFrame, nil)
InnerFrame:SetSize(570, 1000)
ScrollFrame:SetScrollChild(InnerFrame)

local Button = CreateFrame("Button", "FirstButton", InnerFrame, "UIPanelButtonTemplate")
Button:SetText("First Button")
Button:SetPoint("TOP", 10, -10)
Button:SetWidth(110)
Button:SetScript("OnClick", function(self, button, down)
  if (button == "LeftButton" and down == false) then
    print("First Button clicked!")
  end
end)

local CheckBtnGroup = CreateFrame("Frame", "CheckBtnGroup", InnerFrame)
CheckBtnGroup:SetPoint("TOPLEFT", 0, -45)
CheckBtnGroup:SetSize(100, 100)
local CheckBtn1 = CreateFrame("CheckButton", "CheckBtn1", CheckBtnGroup, "UICheckButtonTemplate")
CheckBtn1:SetPoint("TOPLEFT")
CheckBtn1.Text:SetText("Check Button 1")
CheckBtn1:SetScript("OnClick", function(self, button, down)
  if (button == "LeftButton") then
    print(self:GetChecked())
  end
end)
local CheckBtn2 = CreateFrame("CheckButton", "CheckBtn2", CheckBtnGroup, "UICheckButtonTemplate")
CheckBtn2:SetPoint("LEFT")
CheckBtn2.Text:SetText("Check Button 2")
CheckBtn2:SetScript("OnClick", function(self, button, down)
  if (button == "LeftButton") then
    print(self:GetChecked())
  end
end)
local CheckBtn3 = CreateFrame("CheckButton", "CheckBtn3", CheckBtnGroup, "UICheckButtonTemplate")
CheckBtn3:SetPoint("BOTTOMLEFT")
CheckBtn3.Text:SetText("Check Button 3")
CheckBtn3:SetScript("OnClick", function(self, button, down)
  if (button == "LeftButton") then
    print(self:GetChecked())
  end
end)

local function PrintRadioBtns(currentRadioBtn) 
  print(RadioBtn1:GetChecked(), RadioBtn2:GetChecked(), RadioBtn3:GetChecked())
  -- currentRadioBtn:SetChecked(currentRadioBtn:GetChecked())

--  if (RadioBtn1 ~= currentRadioBtn) then RadioBtn1:SetChecked(false) end
--  if (RadioBtn2 ~= currentRadioBtn) then RadioBtn2:SetChecked(false) end
--  if (RadioBtn3 ~= currentRadioBtn) then RadioBtn3:SetChecked(false) end
end

local RadioBtnGroup = CreateFrame("Frame", "RadioBtnGroup", InnerFrame)
RadioBtnGroup:SetPoint("TOPLEFT", InnerFrame, "TOP", 10, -45)
RadioBtnGroup:SetSize(100, 100)
local RadioBtn1 = CreateFrame("CheckButton", "RadioBtn1", RadioBtnGroup, "UIRadioButtonTemplate")
RadioBtn1:SetPoint("TOPLEFT")
RadioBtn1.text:SetText("Radio Button 1")
RadioBtn1:SetScript("OnClick", function(self, button, down)
  if (button == "LeftButton") then
    PrintRadioBtns(self)
  end
end)
local RadioBtn2 = CreateFrame("CheckButton", "RadioBtn2", RadioBtnGroup, "UIRadioButtonTemplate")
RadioBtn2:SetPoint("LEFT")
RadioBtn2.text:SetText("Radio Button 2")
RadioBtn2:SetScript("OnClick", function(self, button, down)
  if (button == "LeftButton") then
    PrintRadioBtns(self)
  end
end)
local RadioBtn3 = CreateFrame("CheckButton", "RadioBtn3", RadioBtnGroup, "UIRadioButtonTemplate")
RadioBtn3:SetPoint("BOTTOMLEFT")
RadioBtn3.text:SetText("Radio Button 3")
RadioBtn3:SetScript("OnClick", function(self, button, down)
  if (button == "LeftButton") then
    PrintRadioBtns(self)
  end
end)

local TabGroup = CreateFrame("Frame", "TabGroup", InnerFrame)
TabGroup:SetPoint("TOP", 10, -165)
TabGroup:SetSize(300, 200)
local BasicTabs = CreateFrame("Frame", "BasicTabs", TabGroup)
BasicTabs:SetPoint("TOP")
BasicTabs:SetSize(300, 100)
local BasicTab1 = CreateFrame("Button", "BasicTab1", BasicTabs, "TabButtonTemplate")
BasicTab1:SetPoint("TOPLEFT")
BasicTab1:SetSize(100, 25)
BasicTab1.Text:SetText("Top Tab 1")
local BasicTab2 = CreateFrame("Button", "BasicTab2", BasicTabs, "TabButtonTemplate")
BasicTab2:SetPoint("TOPLEFT", 100, 0)
BasicTab2:SetSize(100, 25)
BasicTab2.Text:SetText("Top Tab 2")
local BasicTab3 = CreateFrame("Button", "BasicTab3", BasicTabs, "TabButtonTemplate")
BasicTab3:SetPoint("TOPLEFT", 200, 0)
BasicTab3:SetSize(100, 25)
BasicTab3.Text:SetText("Top Tab 3")
BasicTab3.HighlightTexture:Hide()
BasicTab3.Left:Hide()
BasicTab3.LeftDisabled:Hide()
BasicTab3.Middle:Hide()
BasicTab3.MiddleDisabled:Hide()
BasicTab3.Right:Hide()
BasicTab3.RightDisabled:Hide()
local BottomTabs = CreateFrame("Frame", "BottomTabs", TabGroup)
BottomTabs:SetPoint("CENTER")
BottomTabs:SetSize(300, 100)
local BottomTab1 = CreateFrame("Button", "BottomTab1", BottomTabs, "PanelTabButtonTemplate")
BottomTab1:SetPoint("TOPLEFT")
BottomTab1:SetScale(.5)
BottomTab1.Text:SetText("Bottom Tab 1")
local BottomTab2 = CreateFrame("Button", "BottomTab2", BottomTabs, "PanelTabButtonTemplate")
BottomTab2:SetPoint("TOPLEFT", 200, 0)
BottomTab2:SetScale(.5)
BottomTab2.Text:SetText("Bottom Tab 2")
local BottomTab3 = CreateFrame("Button", "BottomTab3", BottomTabs, "PanelTabButtonTemplate")
BottomTab3:SetPoint("TOPLEFT", 400, 0)
BottomTab3:SetScale(.5)
BottomTab3.Text:SetText("Bottom Tab 3")
local TopTabs = CreateFrame("Frame", "TopTabs", TabGroup)
TopTabs:SetPoint("BOTTOM")
TopTabs:SetSize(300, 100)
local TopTab1 = CreateFrame("Button", "TopTab1", TopTabs, "PanelTopTabButtonTemplate")
TopTab1:SetPoint("TOPLEFT")
TopTab1:SetSize(100, 25)
TopTab1.Text:SetText("Panel Top Tab 1")
local TopTab2 = CreateFrame("Button", "TopTab2", TopTabs, "PanelTopTabButtonTemplate")
TopTab2:SetPoint("TOPLEFT", 100, 0)
TopTab2:SetSize(100, 25)
TopTab2.Text:SetText("Panel Top Tab 2")
local TopTab3 = CreateFrame("Button", "TopTab3", TopTabs, "PanelTopTabButtonTemplate")
TopTab3:SetPoint("TOPLEFT", 200, 0)
TopTab3:SetSize(100, 25)
TopTab3.Text:SetText("Panel Top Tab 3")

local SquareIconBtn = CreateFrame("Button", "Square Icon Button", InnerFrame, "SquareIconButtonTemplate")
SquareIconBtn:SetPoint("TOPLEFT", 10, -300)
SquareIconBtn.Icon:SetTexture("Interface\\ICONS\\Ability_Mage_HotStreak")

local Slider = CreateFrame("Slider", "BasicSlider", InnerFrame, "UISliderTemplate")
Slider:SetPoint("TOPLEFT", 10, -365)
Slider:SetSize(300, 20)
Slider:SetValueStep(25)
Slider:SetMinMaxValues(1, 200)
Slider:SetValue(1)
Slider:SetObeyStepOnDrag(true)
Slider:SetOrientation("HORIZONTAL")
Slider:SetScript("OnValueChanged", function(self, value)
  print("Slider Sliding!")
end)

local FontString2 = InnerFrame:CreateFontString("Font String Texture", "OVERLAY", "GameFontNormalMed3")
FontString2:SetPoint("TOPLEFT", 10, -400)
FontString2:SetText("Font String Texture!")

local Texture = InnerFrame:CreateTexture("Art Texture")
Texture:SetPoint("TOPLEFT", 10, -420)
Texture:SetSize(50,50)
Texture:SetTexture("Interface\\PaperDoll\\UI-PaperDoll-Slot-Head")

local TextureForMask = InnerFrame:CreateTexture("Base for Mask")
TextureForMask:SetPoint("TOPLEFT", 10, -480)
TextureForMask:SetSize(50,50)
TextureForMask:SetTexture("Interface\\ICONS\\Ability_Warrior_Bladestorm")
local TextureMask = InnerFrame:CreateMaskTexture()
TextureMask:SetAllPoints(TextureForMask)
TextureMask:SetTexture("Interface/CHARACTERFRAME/TempPortraitAlphaMask")
TextureForMask:AddMaskTexture(TextureMask)

local Line = InnerFrame:CreateLine()
Line:SetStartPoint("TOPLEFT", InnerFrame, 0, -540)
Line:SetEndPoint("TOPRIGHT", InnerFrame, 0, -540)
Line:SetThickness(4)
Line:SetColorTexture(1,0,0,1)




SLASH_MYADDONSHOW1 = "/mas"
SlashCmdList.MYADDONSHOW = function()
  MainFrame:Show()
end

local ExitBtn = CreateFrame("Button", "ExitBtn", MainFrame, "UIPanelCloseButtonDefaultAnchors")

MainFrame:SetClampedToScreen(true)
MainFrame:SetMovable(true)
MainFrame:EnableMouse(true)
MainFrame:RegisterForDrag("LeftButton")
MainFrame:SetScript("OnDragStart", function()
  if IsShiftKeyDown() then MainFrame:StartMoving() end
end)
MainFrame:SetScript("OnDragStop", MainFrame.StopMovingOrSizing)
MainFrame:SetResizable(true)
local ResizeBtn = CreateFrame("Button", "ResizeBtn", MainFrame)
ResizeBtn:SetPoint("BOTTOMRIGHT", -7, 6)
ResizeBtn:SetSize(16, 16)
ResizeBtn:EnableMouse(true)
ResizeBtn:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
ResizeBtn:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
ResizeBtn:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
ResizeBtn:SetScript("OnMouseDown", function(self)
  self:GetParent():StartSizing("BOTTOMRIGHT") 
end)
ResizeBtn:SetScript("OnMouseUp", function()
  MainFrame:StopMovingOrSizing("BOTTOMRIGHT")
  local XRatio = MainFrame:GetWidth() / 600
  local YRatio = MainFrame:GetHeight() / 600
  print("XRatio == " .. XRatio .. ", YRatio == " .. YRatio)
end)
