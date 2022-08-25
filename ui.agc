// File: ui.agc
// Created: 22-08-22

type typeButton
	id as integer
	background as integer
	icon as integer
	label as integer
	name$ as string
endtype

type typeCheckbox
	id as integer
	background as integer
	container as integer
	foreground as integer
	label as integer
	name$ as string
	value as integer
endtype

type typeEditBox
	id as integer
	decimals as integer
	editbox as integer
	max as integer
	min as integer
	name$ as string
	value# as float
endtype

type typePanel
	id as integer
	background as integer
	buttons as typeButton[]
	contentHeight# as float
	contentWidth# as float
	horizontalScrollBar as integer
	invisibleDragZone as integer
	name$ as string
	verticalScrollBar as integer
endtype

type typeSlider
	id as integer
	activeTrack as integer
	activeTrackFromCentre as integer
	container as integer
	editbox as integer
	handle as integer
	inactiveTrack as integer
	label as integer
	max# as float
	min# as float
	name$ as string
	value# as float
	width# as float
endtype

type typeUI
	checkboxes as typeCheckbox[10]
	panels as typePanel[]
	sliders as typeSlider[10]
endtype

global blankButton as typeButton
global blankCheckbox as typeCheckbox
global blankIcon as typeIcon
global blankPanel as typePanel
global blankSlider as typeSlider
global buttonColors as string[]
global buttonIcons as string[]
global buttonLabels as string[]
global categoriesPanelIndex as integer
global categoriesPanelWidth# as float : categoriesPanelWidth# = 100
global codePanelIndex as integer
global defaultButtonHeight# as float : defaultButtonHeight# = 40
global defaultButtonWidth# as float : defaultButtonWidth# = 40
global defaultTextSize# as float : defaultTextSize# = 15
global maxZoom# as float : maxZoom# = 1.5
global minWindowHeight as integer : minWindowHeight = 768
global minZoom# as float : minZoom# = 0.5
global minWindowWidth as integer : minWindowWidth = 1024
global playgroundPanelIndex as integer
global propertiesPanelIndex as integer
global propertiesPanelWidth# as float : propertiesPanelWidth# = 300
global redrawPlayground as integer : redrawPlayground = 1
global redrawUI as integer : redrawUI = 1
global tabsPanelHeight# as float : tabsPanelHeight# = 40
global tabsPanelIndex as integer
global tabSelected as integer : tabSelected = 0
global topPanelHeight# as float : topPanelHeight# = 55
global topPanelIndex as integer
global ui as typeUI



for i = 0 to 9
	ui.checkboxes[i].container = CreateSprite(0)
	SetSpritePosition(ui.checkboxes[i].container, -99999, -99999)
	ui.checkboxes[i].background = CreateSprite(0)
	SetSpritePosition(ui.checkboxes[i].background, -99999, -99999)
	ui.checkboxes[i].foreground = CreateSprite(GetIconImageID("check"))
	SetSpritePosition(ui.checkboxes[i].foreground, -99999, -99999)
	ui.checkboxes[i].label = CreateText("Checkbox")
	SetTextPosition(ui.checkboxes[i].label, -99999, -99999)
	
	ui.sliders[i].container = CreateSprite(0)
	SetSpritePosition(ui.sliders[i].container, -99999, -99999)
	ui.sliders[i].inactiveTrack = CreateSprite(0)
	SetSpritePosition(ui.sliders[i].inactiveTrack, -99999, -99999)
	ui.sliders[i].activeTrack = CreateSprite(0)
	SetSpritePosition(ui.sliders[i].activeTrack, -99999, -99999)
	ui.sliders[i].handle = CreateSprite(0)
	SetSpritePosition(ui.sliders[i].handle, -99999, -99999)
	ui.sliders[i].label = CreateText("Slider")
	SetTextPosition(ui.sliders[i].label, -99999, -99999)
	ui.sliders[i].editbox = CreateEditBox()
	SetEditBoxPosition(ui.sliders[i].editbox, -99999, -99999)
next

ui.panels.insert(blankPanel)
categoriesPanelIndex = ui.panels.length
ui.panels[ui.panels.length].name$ = "Categories Panel"
ui.panels[ui.panels.length].background = CreateSprite(0)
SetSpriteColor(ui.panels[ui.panels.length].background, 51, 51, 51, 255)
SetSpriteDepth(ui.panels[ui.panels.length].background, 20)
ui.panels[ui.panels.length].invisibleDragZone = CreateSprite(0)
SetSpriteColor(ui.panels[ui.panels.length].invisibleDragZone, 0, 0, 0, 0)
SetSpriteDepth(ui.panels[ui.panels.length].invisibleDragZone, 19)
ui.panels[ui.panels.length].verticalScrollBar = CreateSprite(0)
SetSpriteSize(ui.panels[ui.panels.length].verticalScrollBar, 12, 100)
SetSpriteColor(ui.panels[ui.panels.length].verticalScrollBar, 61, 61, 61, 255)
SetSpriteDepth(ui.panels[ui.panels.length].verticalScrollBar, 17)
buttonColors = ["EA3C25", "F09333", "F09333", "FFF24A", "8CC63F"]
buttonIcons = ["category", "hdr_weak", "scatter_plot", "waves", "play_arrow"]
buttonLabels = ["2D Physics", "Cos/Sin Orbit", "Particles", "Sine Wave", "Tweens"]
for i = 0 to buttonIcons.length
	ui.panels[ui.panels.length].buttons.insert(blankButton)
	ui.panels[ui.panels.length].buttons[i].name$ = buttonLabels[i]
	ui.panels[ui.panels.length].buttons[i].icon = CreateSprite(GetIconImageID(buttonIcons[i]))
	SetSpriteColorFromHex(ui.panels[ui.panels.length].buttons[i].icon, buttonColors[i])
	SetSpriteDepth(ui.panels[ui.panels.length].buttons[i].icon, 18)
	ui.panels[ui.panels.length].buttons[i].label = CreateText(buttonLabels[i])
	SetTextAlignment(ui.panels[ui.panels.length].buttons[i].label, 1)
	SetTextBold(ui.panels[ui.panels.length].buttons[i].label, 1)
	SetTextColor(ui.panels[ui.panels.length].buttons[i].label, 170, 170, 170, 255)
	SetTextDepth(ui.panels[ui.panels.length].buttons[i].label, 18)
next

ui.panels.insert(blankPanel)
codePanelIndex = ui.panels.length
ui.panels[ui.panels.length].name$ = "Code Panel"
ui.panels[ui.panels.length].background = CreateSprite(0)
SetSpriteColor(ui.panels[ui.panels.length].background, 30, 30, 30, 0)
SetSpriteDepth(ui.panels[ui.panels.length].background, 100)
ui.panels[ui.panels.length].horizontalScrollBar = CreateSprite(0)
SetSpriteSize(ui.panels[ui.panels.length].horizontalScrollBar, 100, 12)
SetSpriteColor(ui.panels[ui.panels.length].horizontalScrollBar, 61, 61, 61, 255)
SetSpriteDepth(ui.panels[ui.panels.length].horizontalScrollBar, 7)
ui.panels[ui.panels.length].verticalScrollBar = CreateSprite(0)
SetSpriteSize(ui.panels[ui.panels.length].verticalScrollBar, 12, 100)
SetSpriteColor(ui.panels[ui.panels.length].verticalScrollBar, 61, 61, 61, 255)
SetSpriteDepth(ui.panels[ui.panels.length].verticalScrollBar, 7)
remstart
buttonIcons = ["content_copy"]
for i = 0 to buttonIcons.length
	ui.panels[ui.panels.length].buttons.insert(blankButton)
	ui.panels[ui.panels.length].buttons[i].name$ = buttonIcons[i]
	ui.panels[ui.panels.length].buttons[i].icon = CreateSprite(GetIconImageID(buttonIcons[i]))
	SetSpriteColor(ui.panels[ui.panels.length].buttons[i].icon, 170, 170, 170, 255)
	SetSpriteDepth(ui.panels[ui.panels.length].buttons[i].icon, 7)
next
remend

ui.panels.insert(blankPanel)
playgroundPanelIndex = ui.panels.length
ui.panels[ui.panels.length].name$ = "Playground Panel"
ui.panels[ui.panels.length].background = CreateSprite(0)
SetSpriteColor(ui.panels[ui.panels.length].background, 30, 30, 30, 0)
SetSpriteDepth(ui.panels[ui.panels.length].background, 100)
ui.panels[ui.panels.length].horizontalScrollBar = CreateSprite(0)
SetSpriteSize(ui.panels[ui.panels.length].horizontalScrollBar, 100, 12)
SetSpriteColor(ui.panels[ui.panels.length].horizontalScrollBar, 61, 61, 61, 255)
SetSpriteDepth(ui.panels[ui.panels.length].horizontalScrollBar, 7)
ui.panels[ui.panels.length].verticalScrollBar = CreateSprite(0)
SetSpriteSize(ui.panels[ui.panels.length].verticalScrollBar, 12, 100)
SetSpriteColor(ui.panels[ui.panels.length].verticalScrollBar, 61, 61, 61, 255)
SetSpriteDepth(ui.panels[ui.panels.length].verticalScrollBar, 7)
buttonIcons = ["zoom_in", "zoom_out"]
for i = 0 to buttonIcons.length
	ui.panels[ui.panels.length].buttons.insert(blankButton)
	ui.panels[ui.panels.length].buttons[i].name$ = buttonIcons[i]
	ui.panels[ui.panels.length].buttons[i].icon = CreateSprite(GetIconImageID(buttonIcons[i]))
	SetSpriteColor(ui.panels[ui.panels.length].buttons[i].icon, 170, 170, 170, 255)
	SetSpriteDepth(ui.panels[ui.panels.length].buttons[i].icon, 7)
next

ui.panels.insert(blankPanel)
propertiesPanelIndex = ui.panels.length
ui.panels[ui.panels.length].name$ = "Properties Panel"
ui.panels[ui.panels.length].background = CreateSprite(0)
SetSpriteColor(ui.panels[ui.panels.length].background, 51, 51, 51, 255)
SetSpriteDepth(ui.panels[ui.panels.length].background, 20)
ui.panels[ui.panels.length].invisibleDragZone = CreateSprite(0)
SetSpriteColor(ui.panels[ui.panels.length].invisibleDragZone, 0, 0, 0, 0)
SetSpriteDepth(ui.panels[ui.panels.length].invisibleDragZone, 19)
ui.panels[ui.panels.length].verticalScrollBar = CreateSprite(0)
SetSpriteSize(ui.panels[ui.panels.length].verticalScrollBar, 12, 100)
SetSpriteColor(ui.panels[ui.panels.length].verticalScrollBar, 61, 61, 61, 255)
SetSpriteDepth(ui.panels[ui.panels.length].verticalScrollBar, 17)
remstart
buttonColors = ["EA3C25", "F09333", "FFF24A", "D6DF42", "8CC63F", "4BB1F1", "273990", "92338F"]
buttonIcons = ["radio_button_checked", "radio_button_checked", "radio_button_checked", "radio_button_checked", "radio_button_checked", "radio_button_checked", "radio_button_checked", "radio_button_checked"]
buttonLabels = ["Type 01", "Type 02", "Type 03", "Type 04", "Type 05", "Type 06", "Type 07", "Type 08"]
for i = 0 to buttonIcons.length
	ui.panels[ui.panels.length].buttons.insert(blankButton)
	ui.panels[ui.panels.length].buttons[i].name$ = buttonLabels[i]
	ui.panels[ui.panels.length].buttons[i].icon = CreateSprite(GetIconImageID(buttonIcons[i]))
	SetSpriteColorFromHex(ui.panels[ui.panels.length].buttons[i].icon, buttonColors[i])
	SetSpriteDepth(ui.panels[ui.panels.length].buttons[i].icon, 19)
	ui.panels[ui.panels.length].buttons[i].label = CreateText(buttonLabels[i])
	SetTextAlignment(ui.panels[ui.panels.length].buttons[i].label, 1)
	SetTextBold(ui.panels[ui.panels.length].buttons[i].label, 1)
	SetTextColor(ui.panels[ui.panels.length].buttons[i].label, 170, 170, 170, 255)
	SetTextDepth(ui.panels[ui.panels.length].buttons[i].label, 19)
next
remend

ui.panels.insert(blankPanel)
tabsPanelIndex = ui.panels.length
ui.panels[ui.panels.length].name$ = "Tabs Panel"
ui.panels[ui.panels.length].background = CreateSprite(0)
SetSpriteColor(ui.panels[ui.panels.length].background, 0, 0, 0, 255)
SetSpriteDepth(ui.panels[ui.panels.length].background, 10)
buttonLabels = ["PLAYGROUND", "CODE"]
for i = 0 to buttonLabels.length
	ui.panels[ui.panels.length].buttons.insert(blankButton)
	ui.panels[ui.panels.length].buttons[i].name$ = buttonLabels[i]
	ui.panels[ui.panels.length].buttons[i].background = CreateSprite(0)
	SetSpriteColor(ui.panels[ui.panels.length].buttons[i].background, 26, 26, 26, 100)
	SetSpriteDepth(ui.panels[ui.panels.length].buttons[i].background, 9)
	ui.panels[ui.panels.length].buttons[i].label = CreateText(buttonLabels[i])
	SetTextAlignment(ui.panels[ui.panels.length].buttons[i].label, 1)
	SetTextBold(ui.panels[ui.panels.length].buttons[i].label, 1)
	SetTextColor(ui.panels[ui.panels.length].buttons[i].label, 170, 170, 170, 255)
	SetTextDepth(ui.panels[ui.panels.length].buttons[i].label, 9)
next

ui.panels.insert(blankPanel)
topPanelIndex = ui.panels.length
ui.panels[ui.panels.length].name$ = "Top Panel"
ui.panels[ui.panels.length].background = CreateSprite(0)
SetSpriteColor(ui.panels[ui.panels.length].background, 58, 58, 58, 255)
SetSpriteDepth(ui.panels[ui.panels.length].background, 10)
remstart
buttonIcons = ["create_new_folder", "folder_open", "save", "undo", "redo", "play_arrow", "stop"]
buttonLabels = ["NEW", "OPEN", "SAVE", "UNDO", "REDO", "PLAY", "STOP"]
for i = 0 to buttonIcons.length
	ui.panels[ui.panels.length].buttons.insert(blankButton)
	ui.panels[ui.panels.length].buttons[i].name$ = buttonLabels[i]
	ui.panels[ui.panels.length].buttons[i].icon = CreateSprite(GetIconImageID(buttonIcons[i]))
	SetSpriteColor(ui.panels[ui.panels.length].buttons[i].icon, 170, 170, 170, 255)
	SetSpriteDepth(ui.panels[ui.panels.length].buttons[i].icon, 9)
	ui.panels[ui.panels.length].buttons[i].label = CreateText(buttonLabels[i])
	SetTextAlignment(ui.panels[ui.panels.length].buttons[i].label, 1)
	SetTextBold(ui.panels[ui.panels.length].buttons[i].label, 1)
	SetTextColor(ui.panels[ui.panels.length].buttons[i].label, 170, 170, 170, 255)
	SetTextDepth(ui.panels[ui.panels.length].buttons[i].label, 9)
next
remend


function DraggingPlaygroundHorizontalScrollBar(scrollBarID as integer, trackSize# as float, contentSize# as float)
	local gripPosition# as float
	local gripPositionRatio# as float
	local gripSize# as float
	local trackScrollAreaSize# as float
	local windowPosition# as float
	local windowScrollAreaSize# as float
	local windowSize# as float
	
	ResizePlaygroundHorizontalScrollBar(scrollBarID, trackSize#, contentSize#)
	windowSize# = trackSize#
	gripSize# = GetSpriteWidth(scrollBarID)
	windowScrollAreaSize# = (contentSize# * GetViewZoom()) - windowSize#
	trackScrollAreaSize# = trackSize# - gripSize#
	gripPosition# = GetSpriteX(scrollBarID) - 380
	gripPositionRatio# = gripPosition# / trackScrollAreaSize#
	windowPosition# = (gripPositionRatio# * windowScrollAreaSize#) - 380
	SetViewOffset(windowPosition#, GetViewOffsetY())
endfunction



function DraggingPlaygroundVerticalScrollBar(scrollBarID as integer, trackSize# as float, contentSize# as float)
	local gripPosition# as float
	local gripPositionRatio# as float
	local gripSize# as float
	local trackScrollAreaSize# as float
	local windowPosition# as float
	local windowScrollAreaSize# as float
	local windowSize# as float
	
	ResizePlaygroundVerticalScrollBar(scrollBarID, trackSize#, contentSize#)
	windowSize# = trackSize#
	gripSize# = GetSpriteHeight(scrollBarID)
	windowScrollAreaSize# = (contentSize# * GetViewZoom()) - windowSize#
	trackScrollAreaSize# = trackSize# - gripSize#
	gripPosition# = GetSpriteY(scrollBarID) - 55
	gripPositionRatio# = gripPosition# / trackScrollAreaSize#
	windowPosition# = (gripPositionRatio# * windowScrollAreaSize#) - 55
	SetViewOffset(GetViewOffsetX(), windowPosition#)
endfunction



function DraggingPanelHorizontalScrollBar(scrollBarID as integer, panelID as integer, attachedTo as integer, trackSize# as float, contentSize# as float)
	local gripPosition# as float
	local gripPositionRatio# as float
	local gripSize# as float
	local trackScrollAreaSize# as float
	local windowPosition# as float
	local windowScrollAreaSize# as float
	local windowSize# as float
	
	ResizePanelHorizontalScrollBar(scrollBarID, attachedTo, trackSize#, contentSize#)
	windowSize# = trackSize#
	gripSize# = GetSpriteWidth(scrollBarID)
	windowScrollAreaSize# = contentSize# - windowSize#
	trackScrollAreaSize# = trackSize# - gripSize#
	gripPosition# = GetSpriteX(scrollBarID) - GetSpriteX(panelID)
	gripPositionRatio# = gripPosition# / trackScrollAreaSize#
	windowPosition# = (gripPositionRatio# * windowScrollAreaSize#) - GetSpriteX(panelID)
	SetSpritePosition(attachedTo, -windowPosition#, GetSpriteY(attachedTo))
endfunction



function DraggingPanelVerticalScrollBar(scrollBarID as integer, panelID as integer, attachedTo as integer, trackSize# as float, contentSize# as float)
	local gripPosition# as float
	local gripPositionRatio# as float
	local gripSize# as float
	local trackScrollAreaSize# as float
	local windowPosition# as float
	local windowScrollAreaSize# as float
	local windowSize# as float
	
	ResizePanelVerticalScrollBar(scrollBarID, attachedTo, trackSize#, contentSize#)
	contentSize# = contentSize# + ((contentSize# / 100) * 8.25)
	windowSize# = trackSize#
	gripSize# = GetSpriteHeight(scrollBarID)
	windowScrollAreaSize# = (contentSize# - windowSize#)
	trackScrollAreaSize# = trackSize# - gripSize#
	gripPosition# = GetSpriteY(scrollBarID) - GetSpriteY(panelID)
	gripPositionRatio# = gripPosition# / trackScrollAreaSize#
	windowPosition# = (gripPositionRatio# * windowScrollAreaSize#) - GetSpriteY(panelID)
	SetSpritePosition(attachedTo, GetSpriteX(attachedTo), -windowPosition#)
endfunction



function ResizePlaygroundHorizontalScrollBar(scrollBarID as integer, trackSize# as float, contentSize# as float)
	local gripSize# as float
	local windowContentRatio# as float
	local windowSize# as float
	
	windowSize# = trackSize#
	windowContentRatio# = windowSize# / (contentSize# * GetViewZoom())
	gripSize# = trackSize# * windowContentRatio#
	if (gripSize# < 50) then gripSize# = 50
	if (gripSize# > trackSize#) then gripSize# = trackSize#
	SetSpriteSize(scrollBarID, gripSize#, 12)
endfunction



function ResizePlaygroundVerticalScrollBar(scrollBarID as integer, trackSize# as float, contentSize# as float)
	local gripSize# as float
	local windowContentRatio# as float
	local windowSize# as float
	
	windowSize# = trackSize#
	windowContentRatio# = windowSize# / (contentSize# * GetViewZoom())
	gripSize# = trackSize# * windowContentRatio#
	if (gripSize# < 50) then gripSize# = 50
	if (gripSize# > trackSize#) then gripSize# = trackSize#
	SetSpriteSize(scrollBarID, 12, gripSize#)
endfunction



function ResizePanelHorizontalScrollBar(scrollBarID as integer, attachedTo as integer, trackSize# as float, contentSize# as float)
	local gripSize# as float
	local windowContentRatio# as float
	local windowSize# as float
	
	windowSize# = trackSize#
	windowContentRatio# = windowSize# / contentSize#
	gripSize# = trackSize# * windowContentRatio#
	if (gripSize# < 50) then gripSize# = 50
	if (gripSize# > trackSize#) then gripSize# = trackSize#
	SetSpriteSize(scrollBarID, gripSize#, 12)
endfunction



function ResizePanelVerticalScrollBar(scrollBarID as integer, attachedTo as integer, trackSize# as float, contentSize# as float)
	local gripSize# as float
	local windowContentRatio# as float
	local windowSize# as float
	
	windowSize# = trackSize#
	windowContentRatio# = windowSize# / contentSize#
	gripSize# = trackSize# * windowContentRatio#
	if (gripSize# < 50) then gripSize# = 50
	if (gripSize# > trackSize#) then gripSize# = trackSize#
	SetSpriteSize(scrollBarID, 12, gripSize#)
endfunction



function ScrollBarsListener()
	for a = 0 to ui.panels.length
		if (ui.panels[a].name$ = "Playground Panel" and (redrawPlayground = 1 or redrawUI = 1))
			trackSize# = GetWindowHeight() - topPanelHeight#
			UpdatePlaygroundVerticalScrollBar(ui.panels[a].verticalScrollBar, trackSize#, ui.panels[a].contentHeight#)
			FixSpriteToScreen(ui.panels[a].verticalScrollBar, 1)
			trackSize# = GetWindowWidth() - categoriesPanelWidth# - propertiesPanelWidth#
			UpdatePlaygroundHorizontalScrollBar(ui.panels[a].horizontalScrollBar, trackSize#, ui.panels[a].contentWidth#)
			FixSpriteToScreen(ui.panels[a].horizontalScrollBar, 1)
		endif
		if ((ui.panels[a].name$ = "Categories Panel" or ui.panels[a].name$ = "Properties Panel") and redrawUI = 1)
			attachedTo = ui.panels[a].invisibleDragZone
			panelID = ui.panels[a].background
			trackSize# = GetWindowHeight() - topPanelHeight#
			UpdatePanelVerticalScrollBar(ui.panels[a].verticalScrollBar, panelID, attachedTo, trackSize#, ui.panels[a].contentHeight#)
			FixSpriteToScreen(ui.panels[a].verticalScrollBar, 1)
		endif
	next
endfunction



function UpdatePlaygroundHorizontalScrollBar(scrollBarID as integer, trackSize# as float, contentSize# as float)
	local gripSize# as float
	local trackScrollAreaSize# as float
	local windowPosition# as float
	local windowPositionRatio# as float
	local windowScrollAreaSize# as float
	local windowSize# as float

	ResizePlaygroundHorizontalScrollBar(scrollBarID, trackSize#, contentSize#)
	windowSize# = trackSize#
	gripSize# = GetSpriteWidth(scrollBarID)
	windowScrollAreaSize# = (contentSize# * GetViewZoom()) - windowSize#
	
	windowPosition# = GetViewOffsetX() + 380
	windowPositionRatio# = windowPosition# / windowScrollAreaSize#
	trackScrollAreaSize# = trackSize# - gripSize#
	gripPositionOnTrack# = (trackScrollAreaSize# * windowPositionRatio#) + 380
	if ((contentSize# * GetViewZoom()) > trackSize#)
		SetSpritePosition(scrollBarID, gripPositionOnTrack#, GetWindowHeight() - 12)
	else
		SetSpritePosition(scrollBarID, -1000, -1000)
	endif
endfunction



function UpdatePlaygroundVerticalScrollBar(scrollBarID as integer, trackSize# as float, contentSize# as float)
	local gripSize# as float
	local trackScrollAreaSize# as float
	local windowPosition# as float
	local windowPositionRatio# as float
	local windowScrollAreaSize# as float
	local windowSize# as float

	ResizePlaygroundVerticalScrollBar(scrollBarID, trackSize#, contentSize#)
	windowSize# = trackSize#
	gripSize# = GetSpriteHeight(scrollBarID)
	windowScrollAreaSize# = (contentSize# * GetViewZoom()) - windowSize#
	windowPosition# = GetViewOffsetY() + 55
	windowPositionRatio# = windowPosition# / windowScrollAreaSize#
	trackScrollAreaSize# = trackSize# - gripSize#
	gripPositionOnTrack# = (trackScrollAreaSize# * windowPositionRatio#) + 55
	if ((contentSize# * GetViewZoom()) > trackSize#)
		SetSpritePosition(scrollBarID, GetWindowWidth() - 12, gripPositionOnTrack#)
	else
		SetSpritePosition(scrollBarID, -1000, -1000)
	endif
endfunction



function UpdatePanelHorizontalScrollBar(scrollBarID as integer, panelID as integer, attachedTo as integer, trackSize# as float, contentSize# as float)
	local gripSize# as float
	local trackScrollAreaSize# as float
	local windowPosition# as float
	local windowPositionRatio# as float
	local windowScrollAreaSize# as float
	local windowSize# as float

	ResizePanelHorizontalScrollBar(scrollBarID, attachedTo, trackSize#, contentSize#)
	windowSize# = trackSize#
	gripSize# = GetSpriteWidth(scrollBarID)
	windowScrollAreaSize# = contentSize# - windowSize# + GetSpriteX(panelID)
	windowPosition# = GetSpriteX(attachedTo) - GetSpriteX(panelID)
	windowPositionRatio# = windowPosition# / windowScrollAreaSize#
	trackScrollAreaSize# = trackSize# - gripSize#
	gripPositionOnTrack# = (trackScrollAreaSize# * windowPositionRatio#) - GetSpriteX(panelID)
	if (contentSize# > trackSize#)
		SetSpritePosition(scrollBarID, -gripPositionOnTrack#, GetSpriteY(attachedTo) + GetSpriteHeight(attachedTo) - 12)
	else
		SetSpritePosition(scrollBarID, -1000, -1000)
	endif
endfunction



function UpdatePanelVerticalScrollBar(scrollBarID as integer, panelID as integer, attachedTo as integer, trackSize# as float, contentSize# as float)
	local gripSize# as float
	local trackScrollAreaSize# as float
	local windowPosition# as float
	local windowPositionRatio# as float
	local windowScrollAreaSize# as float
	local windowSize# as float

	ResizePanelVerticalScrollBar(scrollBarID, attachedTo, trackSize#, contentSize#)
	windowSize# = trackSize#
	gripSize# = GetSpriteHeight(scrollBarID)
	windowScrollAreaSize# = contentSize# - windowSize# //+ GetSpriteY(panelID)
	windowPosition# = GetSpriteY(attachedTo) - GetSpriteY(panelID)
	windowPositionRatio# = windowPosition# / windowScrollAreaSize#
	trackScrollAreaSize# = trackSize# - gripSize#
	gripPositionOnTrack# = (trackScrollAreaSize# * windowPositionRatio#) - GetSpriteY(panelID)
	if (contentSize# > trackSize#)
		SetSpritePosition(scrollBarID, GetSpriteX(attachedTo) + GetSpriteWidth(attachedTo) - 12, -gripPositionOnTrack#)
	else
		SetSpritePosition(scrollBarID, -1000, -1000)
	endif
endfunction



function UpdateUIListener()
	windowHeight = GetWindowHeight()
	windowWidth = GetWindowWidth()
	if (windowHeight < minWindowHeight)
		windowHeight = minWindowHeight
		redrawUI = 1
	endif
	if (windowWidth < minWindowWidth)
		windowWidth = minWindowWidth
		redrawUI = 1
	endif
	if (windowHeight <> GetVirtualHeight() or windowWidth <> GetVirtualWidth())
		redrawUI = 1
	endif
	if (windowHeight <> GetVirtualHeight() or windowWidth <> GetVirtualWidth() or redrawPlayground = 1 or redrawUI = 1)
		SetWindowSize(windowWidth, windowHeight, 0)
		SetVirtualResolution(windowWidth, windowHeight)
		SaveLocalVariable("windowHeight", str(windowHeight))
		SaveLocalVariable("windowWidth", str(windowWidth))
		
		// Categories Panel
		if (redrawUI = 1)
			a = categoriesPanelIndex
			panelHeight# = GetWindowHeight() - topPanelHeight#
			panelWidth# = categoriesPanelWidth#
			panelX# = 0
			panelY# = topPanelHeight#
			SetSpritePosition(ui.panels[a].background, panelX#, panelY#)
			SetSpriteSize(ui.panels[a].background, panelWidth#, panelHeight#)
			FixSpriteToScreen(ui.panels[a].background, 1)
			SetSpritePosition(ui.panels[a].invisibleDragZone, panelX#, panelY#)
			SetSpriteSize(ui.panels[a].invisibleDragZone, panelWidth#, panelHeight#)
			FixSpriteToScreen(ui.panels[a].invisibleDragZone, 1)
			for b = 0 to ui.panels[a].buttons.length
				buttonHeight# = defaultButtonHeight#
				buttonWidth# = defaultButtonWidth#
				buttonX# = GetSpriteX(ui.panels[a].background) + (categoriesPanelWidth# / 2)
				buttonY# = GetSpriteY(ui.panels[a].background) + 5 + (70 * b) + (buttonHeight# / 2)
				SetSpriteSize(ui.panels[a].buttons[b].icon, buttonWidth#, buttonHeight#)
				SetSpritePositionByOffset(ui.panels[a].buttons[b].icon, buttonX#, buttonY#)
				FixSpriteToScreen(ui.panels[a].buttons[b].icon, 1)
				labelX# = GetSpriteXByOffset(ui.panels[a].buttons[b].icon)
				labelY# = GetSpriteY(ui.panels[a].buttons[b].icon) + 40
				SetTextSize(ui.panels[a].buttons[b].label, defaultTextSize#)
				SetTextPosition(ui.panels[a].buttons[b].label, labelX#, labelY#)
				FixTextToScreen(ui.panels[a].buttons[b].label, 1)
			next
			attachedTo = ui.panels[a].invisibleDragZone
			contentHeight# = ui.panels[a].contentHeight#
			panelID = ui.panels[a].background
			trackSize# = GetWindowHeight() - topPanelHeight#
			UpdatePanelVerticalScrollBar(ui.panels[a].verticalScrollBar, panelID, attachedTo, trackSize#, contentHeight#)
			FixSpriteToScreen(ui.panels[a].verticalScrollBar, 1)
		endif
		
		// Code Panel
		if (redrawPlayground = 1 or redrawUI = 1)
			a = codePanelIndex
			panelHeight# = GetWindowHeight() - topPanelHeight# - tabsPanelHeight#
			panelWidth# = GetWindowWidth() - categoriesPanelWidth# - propertiesPanelWidth#
			panelX# = categoriesPanelWidth#
			panelY# = topPanelHeight# + tabsPanelHeight#
			SetSpritePosition(ui.panels[a].background, panelX#, panelY#)
			SetSpriteSize(ui.panels[a].background, panelWidth#, panelHeight#)
			FixSpriteToScreen(ui.panels[a].background, 1)
			for b = 0 to ui.panels[a].buttons.length
				buttonHeight# = defaultButtonHeight#
				buttonWidth# = defaultButtonWidth#
				buttonX# = GetSpriteX(ui.panels[a].background) + GetSpriteWidth(ui.panels[a].background) - 80
				buttonY# = GetWindowHeight() - (buttonHeight# / 2) - (55 * (ui.panels[a].buttons.length + 1)) + (b * 55)
				labelX# = 0
				labelY# = 0
				SetSpriteSize(ui.panels[a].buttons[b].icon, buttonWidth#, buttonHeight#)
				SetSpritePositionByOffset(ui.panels[a].buttons[b].icon, buttonX#, buttonY#)
				FixSpriteToScreen(ui.panels[a].buttons[b].icon, 1)
			next
			contentHeight# = ui.panels[a].contentHeight#
			trackSize# = GetWindowHeight() - topPanelHeight#
			UpdatePlaygroundVerticalScrollBar(ui.panels[a].verticalScrollBar, trackSize#, contentHeight#)
			FixSpriteToScreen(ui.panels[a].verticalScrollBar, 1)
			contentWidth# = ui.panels[a].contentWidth#
			trackSize# = GetWindowWidth() - categoriesPanelWidth# - propertiesPanelWidth#
			UpdatePlaygroundHorizontalScrollBar(ui.panels[a].horizontalScrollBar, trackSize#, contentWidth#)
			FixSpriteToScreen(ui.panels[a].horizontalScrollBar, 1)
		endif
		
		// Playground Panel
		if (redrawPlayground = 1 or redrawUI = 1)
			a = playgroundPanelIndex
			panelHeight# = GetWindowHeight() - topPanelHeight# - tabsPanelHeight#
			panelWidth# = GetWindowWidth() - categoriesPanelWidth# - propertiesPanelWidth#
			panelX# = categoriesPanelWidth#
			panelY# = topPanelHeight# + tabsPanelHeight#
			SetSpritePosition(ui.panels[a].background, panelX#, panelY#)
			SetSpriteSize(ui.panels[a].background, panelWidth#, panelHeight#)
			FixSpriteToScreen(ui.panels[a].background, 1)
			for b = 0 to ui.panels[a].buttons.length
				buttonHeight# = defaultButtonHeight#
				buttonWidth# = defaultButtonWidth#
				buttonX# = GetSpriteX(ui.panels[a].background) + GetSpriteWidth(ui.panels[a].background) - 80
				buttonY# = GetWindowHeight() - (buttonHeight# / 2) - (55 * (ui.panels[a].buttons.length + 1)) + (b * 55)
				labelX# = 0
				labelY# = 0
				SetSpriteSize(ui.panels[a].buttons[b].icon, buttonWidth#, buttonHeight#)
				SetSpritePositionByOffset(ui.panels[a].buttons[b].icon, buttonX#, buttonY#)
				FixSpriteToScreen(ui.panels[a].buttons[b].icon, 1)
			next
			contentHeight# = ui.panels[a].contentHeight#
			trackSize# = GetWindowHeight() - topPanelHeight#
			UpdatePlaygroundVerticalScrollBar(ui.panels[a].verticalScrollBar, trackSize#, contentHeight#)
			FixSpriteToScreen(ui.panels[a].verticalScrollBar, 1)
			contentWidth# = ui.panels[a].contentWidth#
			trackSize# = GetWindowWidth() - categoriesPanelWidth# - propertiesPanelWidth#
			UpdatePlaygroundHorizontalScrollBar(ui.panels[a].horizontalScrollBar, trackSize#, contentWidth#)
			FixSpriteToScreen(ui.panels[a].horizontalScrollBar, 1)
		endif
		
		// Properties Panel
		if (redrawUI = 1)
			a = propertiesPanelIndex
			panelHeight# = GetWindowHeight() - topPanelHeight#
			panelWidth# = propertiesPanelWidth#
			panelX# = GetWindowWidth() - propertiesPanelWidth#
			panelY# = topPanelHeight#
			SetSpritePosition(ui.panels[a].background, panelX#, panelY#)
			SetSpriteSize(ui.panels[a].background, panelWidth#, panelHeight#)
			FixSpriteToScreen(ui.panels[a].background, 1)
			SetSpritePosition(ui.panels[a].invisibleDragZone, panelX#, panelY#)
			SetSpriteSize(ui.panels[a].invisibleDragZone, panelWidth#, panelHeight#)
			FixSpriteToScreen(ui.panels[a].invisibleDragZone, 1)
			attachedTo = ui.panels[a].invisibleDragZone
			contentHeight# = ui.panels[a].contentHeight#
			panelID = ui.panels[a].background
			trackSize# = GetWindowHeight() - topPanelHeight#
			UpdatePanelVerticalScrollBar(ui.panels[a].verticalScrollBar, panelID, attachedTo, trackSize#, contentHeight#)
			FixSpriteToScreen(ui.panels[a].verticalScrollBar, 1)
			for c = 0 to 9
				SetSpritePosition(ui.checkboxes[c].background, -99999, -99999)
				FixSpriteToScreen(ui.checkboxes[c].background, 1)
				SetSpritePosition(ui.checkboxes[c].container, -99999, -99999)
				FixSpriteToScreen(ui.checkboxes[c].container, 1)
				SetSpritePosition(ui.checkboxes[c].foreground, -99999, -99999)
				FixSpriteToScreen(ui.checkboxes[c].foreground, 1)
				SetTextPosition(ui.checkboxes[c].label, -99999, -99999)
				FixTextToScreen(ui.checkboxes[c].label, 1)
				
				SetSpritePosition(ui.sliders[c].container, -99999, -99999)
				FixSpriteToScreen(ui.sliders[c].container, 1)
				SetSpritePosition(ui.sliders[c].inactiveTrack, -99999, -99999)
				FixSpriteToScreen(ui.sliders[c].inactiveTrack, 1)
				SetSpritePosition(ui.sliders[c].activeTrack, -99999, -99999)
				FixSpriteToScreen(ui.sliders[c].activeTrack, 1)
				SetSpritePosition(ui.sliders[c].handle, -99999, -99999)
				FixSpriteToScreen(ui.sliders[c].handle, 1)
				SetTextPosition(ui.sliders[c].label, -99999, -99999)
				FixTextToScreen(ui.sliders[c].label, 1)
				SetEditBoxPosition(ui.sliders[c].editbox, -99999, -99999)
				FixEditBoxToScreen(ui.sliders[c].editbox, 1)
			next
			if (selectedCategory = COS_SIN_ORBIT)
				slider = 0
				ui.sliders[slider].name$ = "RadiusX"
				ui.sliders[slider].min# = 0
				ui.sliders[slider].max# = 500
				ui.sliders[slider].value# = 100
				ui.sliders[slider].activeTrackFromCentre = 0
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.panels[a].background) + 20)
				SetSpriteSize(ui.sliders[slider].container, 260, 35)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background) - 1)
				SetTextString(ui.sliders[slider].label, "Radius X")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 1)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 50, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 0)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 51, 51, 51, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 1)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 25)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 1)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 3)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 25)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 25)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 25)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				
				slider = 1
				ui.sliders[slider].name$ = "RadiusY"
				ui.sliders[slider].min# = 0
				ui.sliders[slider].max# = 500
				ui.sliders[slider].value# = 100
				ui.sliders[slider].activeTrackFromCentre = 0
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 35)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background) - 1)
				SetTextString(ui.sliders[slider].label, "Radius Y")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 1)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 50, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 0)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 51, 51, 51, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 1)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 25)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 1)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 3)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 25)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 25)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 25)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				
				slider = 2
				ui.sliders[slider].name$ = "AngleStepSize"
				ui.sliders[slider].min# = -10
				ui.sliders[slider].max# = 10
				ui.sliders[slider].value# = 2
				ui.sliders[slider].activeTrackFromCentre = 1
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 35)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background) - 1)
				SetTextString(ui.sliders[slider].label, "Angle step size")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 1)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 50, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 0)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 51, 51, 51, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 1)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 25)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 1)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 3)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 25)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 25)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 25)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 2)
			endif
			if (selectedCategory = SINE_WAVES)
				slider = 0
				ui.sliders[slider].name$ = "AngularFrequency"
				ui.sliders[slider].min# = 0
				ui.sliders[slider].max# = 10
				ui.sliders[slider].value# = 1
				ui.sliders[slider].activeTrackFromCentre = 0
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.panels[a].background) + 20)
				SetSpriteSize(ui.sliders[slider].container, 260, 35)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background) - 1)
				SetTextString(ui.sliders[slider].label, "Angular Frequency")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 1)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 50, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 0)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 51, 51, 51, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 1)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 25)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 1)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 3)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 25)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 25)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 25)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				
				slider = 1
				ui.sliders[slider].name$ = "Amplitude"
				ui.sliders[slider].min# = 0
				ui.sliders[slider].max# = 500
				ui.sliders[slider].value# = 100
				ui.sliders[slider].activeTrackFromCentre = 0
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 35)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background) - 1)
				SetTextString(ui.sliders[slider].label, "Amplitude")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 1)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 50, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 0)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 51, 51, 51, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 1)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 25)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 1)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 3)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 25)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 25)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 25)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				
				slider = 2
				ui.sliders[slider].name$ = "SpacingX"
				ui.sliders[slider].min# = 0
				ui.sliders[slider].max# = 100
				ui.sliders[slider].value# = 1
				ui.sliders[slider].activeTrackFromCentre = 0
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 35)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background) - 1)
				SetTextString(ui.sliders[slider].label, "Spacing X")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 1)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 50, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 0)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 51, 51, 51, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 1)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 25)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 1)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 3)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 25)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 25)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 25)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 2)

				checkbox = 0
				ui.checkboxes[checkbox].name$ = "RotateAlongWave"
				ui.checkboxes[checkbox].value = 1
				SetSpritePosition(ui.checkboxes[checkbox].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[2].container) + GetSpriteHeight(ui.sliders[2].container) + 14)
				SetSpriteSize(ui.checkboxes[checkbox].container, 260, 20)
				SetSpriteColor(ui.checkboxes[checkbox].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.checkboxes[checkbox].container, GetSpriteDepth(ui.panels[a].background) - 1)
				SetSpriteSize(ui.checkboxes[checkbox].background, 15, 15)
				//SetSpriteColor(ui.checkboxes[checkbox].background, 90, 90, 90, 255)
				SetSpriteColor(ui.checkboxes[checkbox].background, 211, 157, 5, 255)
				SetSpriteDepth(ui.checkboxes[checkbox].background, GetSpriteDepth(ui.checkboxes[checkbox].container) - 1)
				SetSpritePosition(ui.checkboxes[checkbox].background, GetSpriteX(ui.checkboxes[checkbox].container), GetSpriteY(ui.checkboxes[checkbox].container))
				SetSpriteSize(ui.checkboxes[checkbox].foreground, 15, 15)
				SetSpriteDepth(ui.checkboxes[checkbox].foreground, GetSpriteDepth(ui.checkboxes[checkbox].container) - 2)
				SetSpritePosition(ui.checkboxes[checkbox].foreground, GetSpriteX(ui.checkboxes[checkbox].background), GetSpriteY(ui.checkboxes[checkbox].background))
				SetTextString(ui.checkboxes[checkbox].label, "Rotate along wave")
				SetTextSize(ui.checkboxes[checkbox].label, defaultTextSize#)
				SetTextDepth(ui.checkboxes[checkbox].label, GetSpriteDepth(ui.checkboxes[checkbox].container) - 1)
				SetTextPosition(ui.checkboxes[checkbox].label, GetSpriteX(ui.checkboxes[checkbox].background) + GetSpriteWidth(ui.checkboxes[checkbox].background) + 8, GetSpriteYByOffset(ui.checkboxes[checkbox].background) - (GetTextTotalHeight(ui.checkboxes[checkbox].label) / 2))
			endif
		endif
		
		// Tabs Panel
		if (redrawUI = 1)
			a = tabsPanelIndex
			panelHeight# = tabsPanelHeight#
			panelWidth# = GetWindowWidth() - categoriesPanelWidth# - propertiesPanelWidth#
			panelX# = categoriesPanelWidth#
			panelY# = topPanelHeight#
			SetSpritePosition(ui.panels[a].background, panelX#, panelY#)
			SetSpriteSize(ui.panels[a].background, panelWidth#, panelHeight#)
			FixSpriteToScreen(ui.panels[a].background, 1)
			for b = 0 to ui.panels[a].buttons.length
				buttonHeight# = tabsPanelHeight# - 2
				buttonWidth# = GetSpriteWidth(ui.panels[a].background) / 2
				buttonX# = GetSpriteX(ui.panels[a].background) + (buttonWidth# * b)
				buttonY# = GetSpriteY(ui.panels[a].background) + 2
				if (tabSelected = b)
					SetSpriteColor(ui.panels[a].buttons[b].background, 30, 30, 30, 255)
				else
					SetSpriteColor(ui.panels[a].buttons[b].background, 15, 15, 15, 255)
				endif
				SetSpriteSize(ui.panels[a].buttons[b].background, buttonWidth#, buttonHeight#)
				SetSpritePosition(ui.panels[a].buttons[b].background, buttonX#, buttonY#)
				FixSpriteToScreen(ui.panels[a].buttons[b].background, 1)
				labelX# = GetSpriteXByOffset(ui.panels[a].buttons[b].background)
				labelY# = GetSpriteYByOffset(ui.panels[a].buttons[b].background) - (defaultTextSize# / 2)
				SetTextSize(ui.panels[a].buttons[b].label, defaultTextSize#)
				SetTextPosition(ui.panels[a].buttons[b].label, labelX#, labelY#)
				FixTextToScreen(ui.panels[a].buttons[b].label, 1)
			next
		endif
		
		// Top Panel
		if (redrawUI = 1)
			a = topPanelIndex
			panelHeight# = topPanelHeight#
			panelWidth# = GetWindowWidth()
			panelX# = 0
			panelY# = 0
			SetSpritePosition(ui.panels[a].background, panelX#, panelY#)
			SetSpriteSize(ui.panels[a].background, panelWidth#, panelHeight#)
			FixSpriteToScreen(ui.panels[a].background, 1)
			for b = 0 to ui.panels[a].buttons.length
				buttonHeight# = defaultButtonHeight#
				buttonWidth# = defaultButtonWidth#
				buttonX# = GetSpriteX(ui.panels[a].background) + (buttonWidth# * b) + (buttonWidth# / 2)
				buttonY# = GetSpriteY(ui.panels[a].background) + (buttonHeight# / 2)
				SetSpriteSize(ui.panels[a].buttons[b].icon, buttonWidth#, buttonHeight#)
				SetSpritePositionByOffset(ui.panels[a].buttons[b].icon, buttonX#, buttonY#)
				FixSpriteToScreen(ui.panels[a].buttons[b].icon, 1)
				labelX# = GetSpriteXByOffset(ui.panels[a].buttons[b].icon)
				labelY# = GetSpriteY(ui.panels[a].buttons[b].icon) + 38
				SetTextSize(ui.panels[a].buttons[b].label, defaultTextSize#)
				SetTextPosition(ui.panels[a].buttons[b].label, labelX#, labelY#)
				FixTextToScreen(ui.panels[a].buttons[b].label, 1)
			next
		endif
		
	endif
	
	for i = 0 to ui.panels[playgroundPanelIndex].buttons.length
		if (ui.panels[playgroundPanelIndex].buttons[i].name$ = "zoom_in")
			if (GetViewZoom() < 1.5)
				SetSpriteColor(ui.panels[playgroundPanelIndex].buttons[i].icon, 170, 170, 170, 255)
			else
				SetSpriteColor(ui.panels[playgroundPanelIndex].buttons[i].icon, 85, 85, 85, 255)
			endif
		endif
		if (ui.panels[playgroundPanelIndex].buttons[i].name$ = "zoom_out")
			if (GetViewZoom() > 0.5)
				SetSpriteColor(ui.panels[playgroundPanelIndex].buttons[i].icon, 170, 170, 170, 255)
			else
				SetSpriteColor(ui.panels[playgroundPanelIndex].buttons[i].icon, 85, 85, 85, 255)
			endif
		endif
	next
endfunction