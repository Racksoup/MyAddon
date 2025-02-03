-- MainFrame, Holds all widgets inside it, Border and Background for the addon
local MainFrame = CreateFrame("Frame", "BasicFrame", UIParent, "InsetFrameTemplate")
MainFrame:SetSize(600, 600)
MainFrame:SetPoint("CENTER")

-- title FontString for addon, shows at top of MainFrame
local TitleString = MainFrame:CreateFontString("TitleFontString", "OVERLAY", "GameFontNormalMed3")
TitleString:SetText("MyAddon")
TitleString:SetPoint("TOP", 0, -12)

-- scroll function for any ScrollFrame, used OnMouseWheel scroll
function ScrollFrame_OnMouseWheel(self, delta)
  local newValue = self:GetVerticalScroll() - (delta * 20);
  if (newValue < 0) then
    newValue = 0;
  elseif (newValue > self:GetVerticalScrollRange()) then
    newValue = self:GetVerticalScrollRange();
  end
  self:SetVerticalScroll(newValue);
end
-- ScrollFrame that handles scrolling. only one widget is attached to the ScrollFrame, the inner Frame. this frame functions like a basic Frame. the inner Frame is moved when the ScrollFrame is hovered and a user scrolls. 
local ScrollFrame = CreateFrame("ScrollFrame", "BasicScrollFrame", MainFrame, "UIPanelScrollFrameTemplate")
ScrollFrame:SetScript("OnMouseWheel", ScrollFrame_OnMouseWheel)
ScrollFrame:SetPoint("TOP", -12, -30)
ScrollFrame:SetSize(568, 550)
-- inner Frame moves up and down inside the ScrollFrame. the inner Frame containes all widgets that go in the scroll area. 
local InnerFrame = CreateFrame("Frame", "ScrollFrame InnerFrame", ScrollFrame, nil)
InnerFrame:SetSize(570, 1000)
ScrollFrame:SetScrollChild(InnerFrame)

-- basic Button, has a basic Button template
local Button = CreateFrame("Button", "FirstButton", InnerFrame, "UIPanelButtonTemplate")
Button:SetText("First Button")
Button:SetPoint("TOP", 10, -10)
Button:SetWidth(110)
Button:SetScript("OnClick", function(self, button, down)
  if (button == "LeftButton" and down == false) then
    print("First Button clicked!")
  end
end)

-- Frame that holds the CheckButtons
local CheckBtnGroup = CreateFrame("Frame", "CheckBtnGroup", InnerFrame)
CheckBtnGroup:SetPoint("TOPLEFT", 0, -45)
CheckBtnGroup:SetSize(100, 100)
-- CheckButton, child widget-class of a Button. the UICheckButtonTemplate makes it a CheckButton. 
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

-- function to print information on radiobutton click. should also check and uncheck radiobuttons
local function PrintRadioBtns(currentRadioBtn) 
  print(RadioBtn1:GetChecked(), RadioBtn2:GetChecked(), RadioBtn3:GetChecked())
  -- currentRadioBtn:SetChecked(currentRadioBtn:GetChecked())

--  if (RadioBtn1 ~= currentRadioBtn) then RadioBtn1:SetChecked(false) end
--  if (RadioBtn2 ~= currentRadioBtn) then RadioBtn2:SetChecked(false) end
--  if (RadioBtn3 ~= currentRadioBtn) then RadioBtn3:SetChecked(false) end
end

-- Frame group that holds radiobuttons
local RadioBtnGroup = CreateFrame("Frame", "RadioBtnGroup", InnerFrame)
RadioBtnGroup:SetPoint("TOPLEFT", InnerFrame, "TOP", 10, -45)
RadioBtnGroup:SetSize(100, 100)
-- radiobutton uses CheckButton widget, child widget-class of a Button. the UIRadioButtonTemplate makes it a RadioButton. RadioButtons do not function together natively, you need to check and uncheck them yourself if using in group.
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

-- Frame group that holds all rows of tabs
local TabGroup = CreateFrame("Frame", "TabGroup", InnerFrame)
TabGroup:SetPoint("TOP", 10, -165)
TabGroup:SetSize(300, 200)
-- Frame group that holds basictabs
local BasicTabs = CreateFrame("Frame", "BasicTabs", TabGroup)
BasicTabs:SetPoint("TOP")
BasicTabs:SetSize(300, 100)
-- basictab, is a Button. differentiated by the template TabButtonTemplate. top facing tab. texture cannot be resized with SetSize. however the click area does resize with SetSize.
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
-- Frame group that holds bottom tabs
local BottomTabs = CreateFrame("Frame", "BottomTabs", TabGroup)
BottomTabs:SetPoint("CENTER")
BottomTabs:SetSize(300, 100)
-- bottomtab, is a Button. differentiated by the template PanelTabButtonTemplate. bottom facing template. this texture works just fine in both retail and classic :)
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
-- Frame group that holds toptabs
local TopTabs = CreateFrame("Frame", "TopTabs", TabGroup)
TopTabs:SetPoint("BOTTOM")
TopTabs:SetSize(300, 100)
-- toptab, is a Button. differentiated by the template PanelTabButtonTemplate. top facing tab. texture cannot be resized with SetSize. however the click area does resize with SetSize, so you can disable the texture, and still use it in classic. in retail the texture will resize. in retail it uses a different basetemplate so the texture shows.
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

-- Button, holds an icon. differentiated by the template SquareIconButtonTemplate
local SquareIconBtn = CreateFrame("Button", "Square Icon Button", InnerFrame, "SquareIconButtonTemplate")
SquareIconBtn:SetPoint("TOPLEFT", 10, -300)
SquareIconBtn.Icon:SetTexture("Interface\\ICONS\\Ability_Mage_HotStreak")

-- Slider. can be horizontal or vertical
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

-- all textures need to be built off another frame
-- basic FontString Texture
local FontString2 = InnerFrame:CreateFontString("Font String Texture", "OVERLAY", "GameFontNormalMed3")
FontString2:SetPoint("TOPLEFT", 10, -400)
FontString2:SetText("Font String Texture!")

-- basic Texture
local Texture = InnerFrame:CreateTexture("Art Texture")
Texture:SetPoint("TOPLEFT", 10, -420)
Texture:SetSize(50,50)
Texture:SetTexture("Interface\\PaperDoll\\UI-PaperDoll-Slot-Head")

-- basic Texture. will be cut out by the TextureMask
local TextureForMask = InnerFrame:CreateTexture("Base for Mask")
TextureForMask:SetPoint("TOPLEFT", 10, -480)
TextureForMask:SetSize(50,50)
TextureForMask:SetTexture("Interface\\ICONS\\Ability_Warrior_Bladestorm")
-- MaskTexture. overlays a Texture. uses alpha channel to hides parts of the Texture underneath. changes visibility
local MaskTexture = InnerFrame:CreateMaskTexture()
MaskTexture:SetAllPoints(TextureForMask)
MaskTexture:SetTexture("Interface/CHARACTERFRAME/TempPortraitAlphaMask")
TextureForMask:AddMaskTexture(MaskTexture)

-- Line Texture. set the start and end point to draw the line. 
local Line = InnerFrame:CreateLine()
Line:SetStartPoint("TOPLEFT", InnerFrame, 0, -540)
Line:SetEndPoint("TOPRIGHT", InnerFrame, 0, -540)
Line:SetThickness(4)
Line:SetColorTexture(1,0,0,1)



local SelectedColor = InnerFrame:CreateTexture("Selected Color")
SelectedColor:SetSize(200, 30)
SelectedColor:SetPoint("TOPLEFT", 10, -605)
SelectedColor:SetColorTexture(1,0,0,1)

local r,g,b,a = 1, 0, 0, 1;
local function myColorCallback(restore)
 local newR, newG, newB, newA;
 if restore then
  -- The user bailed, we extract the old color from the table created by ShowColorPicker.
  newR, newG, newB, newA = unpack(restore);
 else
  -- Something changed
  newA, newR, newG, newB = OpacitySliderFrame:GetValue(), ColorPickerFrame:GetColorRGB();
 end
 -- Update our internal storage.
 r, g, b, a = newR, newG, newB, newA;
 -- And update any UI elements that use this color...
 SelectedColor:SetColorTexture(newR, newG, newB, newA)
end
local function ShowColorPicker(r, g, b, a, callback)
  ColorPickerFrame.hasOpacity, ColorPickerFrame.opacity = (a ~= nil) , a
  ColorPickerFrame.previousValues = {r,g,b,a}
  ColorPickerFrame.func, ColorPickerFrame.OpacityFunc, ColorPickerFrame.cancelFunc, ColorPickerFrame.swatchFunc = callback, callback, callback, callback 
  ColorPickerFrame:SetColorRGB(r,g,b)
  ColorPickerFrame:Hide()
  ColorPickerFrame:Show()
end
local ColorPickerButton = CreateFrame("Button", "ColorPickerToggleButton", InnerFrame, "UIPanelButtonTemplate")
ColorPickerButton:SetSize(170, 25)
ColorPickerButton:SetPoint("TOPLEFT", 10, -560)
ColorPickerButton:SetText("Toggle ColorPickerFrame")
ColorPickerButton:SetScript("OnClick", function() 
    ShowColorPicker(r, g, b, a, myColorCallback)
end)

-- SimpleHTML
local SimpleHTML = CreateFrame("SimpleHTML", "Simple HTML", InnerFrame)
SimpleHTML:SetPoint("TOPLEFT", 10, -655)
SimpleHTML:SetFontObject('p', GameFontNormal)
--SimpleHTML:SetHyperlinksEnabled(true)
SimpleHTML:SetSize(290, 200)
SimpleHTML:SetText('<html><body><h1>SimpleHTML Demo: Ambush</h1><img src="Interface\\Icons\\Ability_Ambush" width="32" height="32" align="right"/><p align="center">|cffee4400"You think this hurts? Just wait."|r</p><br/><br/><p>Among every ability a rogue has at his disposal,<br/>Ambush is without a doubt the hardest hitting Rogue ability.</p></body></html>');

-- Hyperlinks
local HyperlinkFrame = CreateFrame("Frame", "Hyperlink Frame", InnerFrame)
HyperlinkFrame:SetPoint("TOPLEFT", 10, -740)
HyperlinkFrame:SetSize(200, 50)
HyperlinkFrame:SetHyperlinksEnabled(true)
HyperlinkFrame:SetScript("OnHyperlinkClick", function(self, link, text, button)
	SetItemRef(link, text, button, self)
end)
local Hyperlink = HyperlinkFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
Hyperlink:SetAllPoints()
Hyperlink:SetText(select(2,GetItemInfo(6948)))







-- slash command that opens the addon
SLASH_MYADDONSHOW1 = "/mas"
SlashCmdList.MYADDONSHOW = function()
  MainFrame:Show()
end

-- exit Button. has default anchors to place it in its parent frame. differentiated by the template UIPanelCloseButtonDefaultAnchors
local ExitBtn = CreateFrame("Button", "ExitBtn", MainFrame, "UIPanelCloseButtonDefaultAnchors")

-- addon Frame setting
MainFrame:SetClampedToScreen(true)
MainFrame:SetMovable(true)
MainFrame:EnableMouse(true)
MainFrame:RegisterForDrag("LeftButton")
MainFrame:SetScript("OnDragStart", function()
  if IsShiftKeyDown() then MainFrame:StartMoving() end
end)
MainFrame:SetScript("OnDragStop", MainFrame.StopMovingOrSizing)
MainFrame:SetResizable(true)

-- resize Button
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
