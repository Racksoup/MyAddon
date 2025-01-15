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
local CheckBtn2 = CreateFrame("CheckButton", "CheckBtn2", CheckBtnGroup, "UICheckButtonTemplate")
CheckBtn2:SetPoint("LEFT")
CheckBtn2.Text:SetText("Check Button 2")
local CheckBtn3 = CreateFrame("CheckButton", "CheckBtn3", CheckBtnGroup, "UICheckButtonTemplate")
CheckBtn3:SetPoint("BOTTOMLEFT")
CheckBtn3.Text:SetText("Check Button 3")

local RadioBtnGroup = CreateFrame("Frame", "RadioBtnGroup", InnerFrame)
RadioBtnGroup:SetPoint("TOPLEFT", InnerFrame, "TOP", 10, -45)
RadioBtnGroup:SetSize(100, 100)
local RadioBtn1 = CreateFrame("CheckButton", "RadioBtn1", RadioBtnGroup, "UIRadioButtonTemplate")
RadioBtn1:SetPoint("TOPLEFT")
RadioBtn1.text:SetText("Radio Button 1")
local RadioBtn2 = CreateFrame("CheckButton", "RadioBtn2", RadioBtnGroup, "UIRadioButtonTemplate")
RadioBtn2:SetPoint("LEFT")
RadioBtn2.text:SetText("Radio Button 2")
local RadioBtn3 = CreateFrame("CheckButton", "RadioBtn3", RadioBtnGroup, "UIRadioButtonTemplate")
RadioBtn3:SetPoint("BOTTOMLEFT")
RadioBtn3.text:SetText("Radio Button 3")

local Slider = CreateFrame("Slider", "BasicSlider", InnerFrame, "UISliderTemplate")
Slider:SetPoint("TOPLEFT", 10, -165)
Slider:SetSize(300, 20)
Slider:SetValueStep(25)
Slider:SetMinMaxValues(1, 200)
Slider:SetValue(1)
Slider:SetObeyStepOnDrag(true)
Slider:SetOrientation("HORIZONTAL")
Slider:SetScript("OnValueChanged", function(self, value)
  print("Slider Sliding!")
end)

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
