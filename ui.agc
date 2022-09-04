// File: ui.agc
// Created: 22-08-22

type typeAboutWindow
	id as integer
	attributions as integer
	background as integer
	closeButton as typeButton
	copyright as integer
	description as integer
	feedbackAndIssues as integer
	kenneyLink as integer
	scrim as integer
	socialButtons as typeButton[10]
	title as integer
	version as integer
endtype

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

type typeImageLoaders
	id as integer
	container as integer
	image as integer
	imageBackground as integer
	imageBorder as integer
	importButton as typeButton
	label as integer
	name$ as string
	removeButton as typeButton
	value as integer
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
	subHeaders as typeSubHeader[]
	titleBackground as integer
	titleDivider as integer
	titleLabel as integer
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
	labelText$ as string
	max# as float
	maxEditbox as integer
	maxHandle as integer
	maxValue# as float
	min# as float
	minEditbox as integer
	minHandle as integer
	minValue# as float
	name$ as string
	rangeSlider as integer
	toLabel as integer
	value# as float
	width# as float
endtype

type typeSubHeader
	id as integer
	container as integer
	divider as integer
	label as integer
endtype

type typeUI
	aboutWindow as typeAboutWindow
	checkboxes as typeCheckbox[10]
	imageLoaders as typeImageLoaders[10]
	panels as typePanel[]
	sliders as typeSlider[10]
endtype

global blankButton as typeButton
global blankCheckbox as typeCheckbox
global blankIcon as typeIcon
global blankPanel as typePanel
global blankSlider as typeSlider
global blankSubHeader as typeSubHeader
global buttonColors as string[]
global buttonIcons as string[]
global buttonLabels as string[]
global buttonNames as string[]
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
global redrawUI as integer : redrawUI = 1
global showAboutWindow as integer : showAboutWindow = 0
global tabsPanelHeight# as float : tabsPanelHeight# = 40
global tabsPanelIndex as integer
global tabSelected as integer : tabSelected = 0
global topPanelHeight# as float : topPanelHeight# = 55
global topPanelIndex as integer
global ui as typeUI
global zoomLabel as integer



for i = 0 to 9
	ui.checkboxes[i].container = CreateSprite(0)
	SetSpritePosition(ui.checkboxes[i].container, -99999, -99999)
	ui.checkboxes[i].background = CreateSprite(0)
	SetSpritePosition(ui.checkboxes[i].background, -99999, -99999)
	ui.checkboxes[i].foreground = CreateSprite(GetIconImageID("check"))
	SetSpritePosition(ui.checkboxes[i].foreground, -99999, -99999)
	ui.checkboxes[i].label = CreateText("Checkbox")
	SetTextPosition(ui.checkboxes[i].label, -99999, -99999)
	
	ui.imageLoaders[i].container = CreateSprite(0)
	SetSpritePosition(ui.imageLoaders[i].container, -99999, -99999)
	ui.imageLoaders[i].imageBorder = CreateSprite(0)
	SetSpritePosition(ui.imageLoaders[i].imageBorder, -99999, -99999)
	ui.imageLoaders[i].imageBackground = CreateSprite(0)
	SetSpritePosition(ui.imageLoaders[i].imageBackground, -99999, -99999)
	ui.imageLoaders[i].image = CreateSprite(0)
	SetSpritePosition(ui.imageLoaders[i].image, -99999, -99999)
	ui.imageLoaders[i].importButton.background = CreateSprite(0)
	SetSpritePosition(ui.imageLoaders[i].importButton.background, -99999, -99999)
	ui.imageLoaders[i].importButton.label = CreateText("Import Image")
	SetTextPosition(ui.imageLoaders[i].importButton.label, -99999, -99999)
	ui.imageLoaders[i].label = CreateText("Image Loader")
	SetTextPosition(ui.imageLoaders[i].label, -99999, -99999)
	ui.imageLoaders[i].removeButton.background = CreateSprite(0)
	SetSpritePosition(ui.imageLoaders[i].removeButton.background, -99999, -99999)
	ui.imageLoaders[i].removeButton.label = CreateText("Remove Image")
	SetTextPosition(ui.imageLoaders[i].removeButton.label, -99999, -99999)
	
	ui.sliders[i].container = CreateSprite(0)
	SetSpritePosition(ui.sliders[i].container, -99999, -99999)
	ui.sliders[i].inactiveTrack = CreateSprite(0)
	SetSpritePosition(ui.sliders[i].inactiveTrack, -99999, -99999)
	ui.sliders[i].activeTrack = CreateSprite(0)
	SetSpritePosition(ui.sliders[i].activeTrack, -99999, -99999)
	ui.sliders[i].handle = CreateSprite(0)
	SetSpritePosition(ui.sliders[i].handle, -99999, -99999)
	ui.sliders[i].minHandle = CreateSprite(0)
	SetSpritePosition(ui.sliders[i].minHandle, -99999, -99999)
	ui.sliders[i].maxHandle = CreateSprite(0)
	SetSpritePosition(ui.sliders[i].maxHandle, -99999, -99999)
	ui.sliders[i].label = CreateText("Slider")
	SetTextPosition(ui.sliders[i].label, -99999, -99999)
	ui.sliders[i].toLabel = CreateText("to")
	SetTextPosition(ui.sliders[i].toLabel, -99999, -99999)
	ui.sliders[i].editbox = CreateEditBox()
	SetEditBoxPosition(ui.sliders[i].editbox, -99999, -99999)
	ui.sliders[i].maxEditbox = CreateEditBox()
	SetEditBoxPosition(ui.sliders[i].maxEditbox, -99999, -99999)
	ui.sliders[i].minEditbox = CreateEditBox()
	SetEditBoxPosition(ui.sliders[i].minEditbox, -99999, -99999)
next

ui.panels.insert(blankPanel)
categoriesPanelIndex = ui.panels.length
ui.panels[ui.panels.length].name$ = "Categories Panel"
ui.panels[ui.panels.length].background = CreateSprite(0)
SetSpriteColor(ui.panels[ui.panels.length].background, 51, 51, 51, 255)
SetSpriteDepth(ui.panels[ui.panels.length].background, 20)
ui.panels[ui.panels.length].titleBackground = CreateSprite(0)
SetSpriteColor(ui.panels[ui.panels.length].titleBackground, 51, 51, 51, 255)
SetSpriteDepth(ui.panels[ui.panels.length].titleBackground, 15)
ui.panels[ui.panels.length].titleLabel = CreateText("Categories")
SetTextColor(ui.panels[ui.panels.length].titleLabel, 190, 190, 190, 255)
SetTextAlignment(ui.panels[ui.panels.length].titleLabel, 1)
SetTextBold(ui.panels[ui.panels.length].titleLabel, 1)
SetTextDepth(ui.panels[ui.panels.length].titleLabel, 14)
ui.panels[ui.panels.length].titleDivider = CreateSprite(0)
SetSpriteColor(ui.panels[ui.panels.length].titleDivider, 71, 75, 76, 255)
SetSpriteDepth(ui.panels[ui.panels.length].titleDivider, 14)
ui.panels[ui.panels.length].invisibleDragZone = CreateSprite(0)
SetSpriteColor(ui.panels[ui.panels.length].invisibleDragZone, 0, 0, 0, 0)
SetSpriteDepth(ui.panels[ui.panels.length].invisibleDragZone, 19)
ui.panels[ui.panels.length].verticalScrollBar = CreateSprite(0)
SetSpriteSize(ui.panels[ui.panels.length].verticalScrollBar, 12, 100)
SetSpriteColor(ui.panels[ui.panels.length].verticalScrollBar, 61, 61, 61, 255)
SetSpriteDepth(ui.panels[ui.panels.length].verticalScrollBar, 7)
buttonColors = ["EA3C25", "F09333", "FFF24A"] // "8CC63F", "F09333"
buttonIcons = ["category", "scatter_plot", "waves"] //  "play_arrow", "hdr_weak"
buttonLabels = ["2D Particles", "Cos/Sin Orbit", "Sine Wave"] // "2D Tweens", "2D Physics"
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
ui.panels[ui.panels.length].invisibleDragZone = CreateSprite(0)
SetSpriteColor(ui.panels[ui.panels.length].invisibleDragZone, 0, 0, 0, 0)
SetSpriteDepth(ui.panels[ui.panels.length].invisibleDragZone, 99)
ui.panels[ui.panels.length].horizontalScrollBar = CreateSprite(0)
SetSpriteSize(ui.panels[ui.panels.length].horizontalScrollBar, 100, 12)
SetSpriteColor(ui.panels[ui.panels.length].horizontalScrollBar, 61, 61, 61, 255)
SetSpriteDepth(ui.panels[ui.panels.length].horizontalScrollBar, 7)
ui.panels[ui.panels.length].verticalScrollBar = CreateSprite(0)
SetSpriteSize(ui.panels[ui.panels.length].verticalScrollBar, 12, 100)
SetSpriteColor(ui.panels[ui.panels.length].verticalScrollBar, 61, 61, 61, 255)
SetSpriteDepth(ui.panels[ui.panels.length].verticalScrollBar, 7)
buttonIcons = ["unfold_less", "content_copy"]
buttonNames = ["Unfold", "Copy"]
for i = 0 to buttonIcons.length
	ui.panels[ui.panels.length].buttons.insert(blankButton)
	ui.panels[ui.panels.length].buttons[i].name$ = buttonNames[i]
	ui.panels[ui.panels.length].buttons[i].icon = CreateSprite(GetIconImageID(buttonIcons[i]))
	SetSpriteColor(ui.panels[ui.panels.length].buttons[i].icon, 170, 170, 170, 255)
	SetSpriteDepth(ui.panels[ui.panels.length].buttons[i].icon, 7)
next

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
zoomLabel = CreateText("100%")
SetTextSize(zoomLabel, defaultTextSize#)
SetTextAlignment(zoomLabel, 1)
SetTextBold(zoomLabel, 1)
SetTextColor(zoomLabel, 170, 170, 170, 255)
SetTextDepth(zoomLabel, 7)

ui.panels.insert(blankPanel)
propertiesPanelIndex = ui.panels.length
ui.panels[ui.panels.length].name$ = "Properties Panel"
ui.panels[ui.panels.length].background = CreateSprite(0)
SetSpriteColor(ui.panels[ui.panels.length].background, 51, 51, 51, 255)
SetSpriteDepth(ui.panels[ui.panels.length].background, 20)
ui.panels[ui.panels.length].titleBackground = CreateSprite(0)
SetSpriteColor(ui.panels[ui.panels.length].titleBackground, 51, 51, 51, 255)
SetSpriteDepth(ui.panels[ui.panels.length].titleBackground, 15)
ui.panels[ui.panels.length].titleLabel = CreateText("Properties")
SetTextColor(ui.panels[ui.panels.length].titleLabel, 190, 190, 190, 255)
SetTextAlignment(ui.panels[ui.panels.length].titleLabel, 1)
SetTextBold(ui.panels[ui.panels.length].titleLabel, 1)
SetTextDepth(ui.panels[ui.panels.length].titleLabel, 14)
ui.panels[ui.panels.length].titleDivider = CreateSprite(0)
SetSpriteColor(ui.panels[ui.panels.length].titleDivider, 71, 75, 76, 255)
SetSpriteDepth(ui.panels[ui.panels.length].titleDivider, 14)
ui.panels[ui.panels.length].invisibleDragZone = CreateSprite(0)
SetSpriteColor(ui.panels[ui.panels.length].invisibleDragZone, 0, 0, 0, 0)
SetSpriteDepth(ui.panels[ui.panels.length].invisibleDragZone, 19)
ui.panels[ui.panels.length].verticalScrollBar = CreateSprite(0)
SetSpriteSize(ui.panels[ui.panels.length].verticalScrollBar, 12, 100)
SetSpriteColor(ui.panels[ui.panels.length].verticalScrollBar, 61, 61, 61, 255)
SetSpriteDepth(ui.panels[ui.panels.length].verticalScrollBar, 17)
buttonColors = ["0A62E3", "0A62E3"]
buttonLabels = ["Add Color Frame", "Add Scale Frame"]
buttonNames = ["AddColorKeyFrame", "AddScaleKeyFrame"]					
for i = 0 to buttonLabels.length
	ui.panels[ui.panels.length].buttons.insert(blankButton)
	ui.panels[ui.panels.length].buttons[i].name$ = buttonNames[i]
	ui.panels[ui.panels.length].buttons[i].background = CreateSprite(0)
	SetSpriteColorFromHex(ui.panels[ui.panels.length].buttons[i].background, buttonColors[i])
	SetSpriteDepth(ui.panels[ui.panels.length].buttons[i].background, 18)
	ui.panels[ui.panels.length].buttons[i].label = CreateText(buttonLabels[i])
	SetTextAlignment(ui.panels[ui.panels.length].buttons[i].label, 1)
	SetTextBold(ui.panels[ui.panels.length].buttons[i].label, 1)
	SetTextDepth(ui.panels[ui.panels.length].buttons[i].label, 17)
next

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
ui.panels[ui.panels.length].titleLabel = CreateText("AGK Playground")
SetTextColor(ui.panels[ui.panels.length].titleLabel, 170, 170, 170, 255)
SetTextDepth(ui.panels[ui.panels.length].titleLabel, 9)
buttonIcons = ["info"]
buttonLabels = ["About"]
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

ui.aboutWindow.scrim = CreateSprite(0)
SetSpritePosition(ui.aboutWindow.scrim, -99999, -99999)
ui.aboutWindow.background = CreateSprite(0)
SetSpritePosition(ui.aboutWindow.background, -99999, -99999)
ui.aboutWindow.title = CreateText("")
SetTextPosition(ui.aboutWindow.title, -99999, -99999)
ui.aboutWindow.description = CreateText("")
SetTextPosition(ui.aboutWindow.description, -99999, -99999)
ui.aboutWindow.attributions = CreateText("")
SetTextPosition(ui.aboutWindow.attributions, -99999, -99999)
ui.aboutWindow.kenneyLink = CreateSprite(0)
SetSpritePosition(ui.aboutWindow.kenneyLink, -99999, -99999)
ui.aboutWindow.version = CreateText("")
SetTextPosition(ui.aboutWindow.version, -99999, -99999)
ui.aboutWindow.closeButton.icon = CreateSprite(0)
SetSpritePosition(ui.aboutWindow.closeButton.icon, -99999, -99999)
ui.aboutWindow.copyright = CreateText("")
SetTextPosition(ui.aboutWindow.copyright, -99999, -99999)
ui.aboutWindow.feedbackAndIssues = CreateText("")
SetTextPosition(ui.aboutWindow.feedbackAndIssues, -99999, -99999)
buttonIcons = ["", ""]
buttonLabels = ["", ""]
buttonNames = ["", ""]
for i = 0 to buttonIcons.length
	ui.aboutWindow.socialButtons.insert(blankButton)
	ui.aboutWindow.socialButtons[i].name$ = buttonNames[i]
	ui.aboutWindow.socialButtons[i].icon = CreateSprite(GetIconImageID(buttonIcons[i]))
	SetSpriteColor(ui.aboutWindow.socialButtons[i].icon, 170, 170, 170, 255)
	SetSpriteDepth(ui.aboutWindow.socialButtons[i].icon, 9)
	SetSpritePosition(ui.aboutWindow.socialButtons[i].icon, -99999, -99999)
	ui.aboutWindow.socialButtons[i].label = CreateText(buttonLabels[i])
	SetTextAlignment(ui.aboutWindow.socialButtons[i].label, 1)
	SetTextBold(ui.aboutWindow.socialButtons[i].label, 1)
	SetTextColor(ui.aboutWindow.socialButtons[i].label, 170, 170, 170, 255)
	SetTextDepth(ui.aboutWindow.socialButtons[i].label, 9)
	SetTextPosition(ui.aboutWindow.socialButtons[i].label, -99999, -99999)
next



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



function HideAboutWindow()
	SetSpritePosition(ui.aboutWindow.scrim, -99999, -99999)
	SetSpritePositionByOffset(ui.aboutWindow.background, -99999, -99999)
	SetTextPosition(ui.aboutWindow.title, -99999, -99999)
	SetSpritePosition(ui.aboutWindow.closeButton.icon, -99999, -99999)
	SetTextPosition(ui.aboutWindow.version, -99999, -99999)
	SetTextPosition(ui.aboutWindow.attributions, -99999, -99999)
	SetSpritePosition(ui.aboutWindow.kenneyLink, -99999, -99999)
	SetTextPosition(ui.aboutWindow.copyright, -99999, -99999)
	SetTextPosition(ui.aboutWindow.feedbackAndIssues, -99999, -99999)
	for i = 0 to ui.aboutWindow.socialButtons.length
		if (GetSpriteExists(ui.aboutWindow.socialButtons[i].icon))
			SetSpritePosition(ui.aboutWindow.socialButtons[i].icon, -99999, -99999)
			SetTextPosition(ui.aboutWindow.socialButtons[i].label, -99999, -99999)
		endif
	next
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
		if (ui.panels[a].name$ = "Code Panel") // and redrawUI = 1)	
			SetSpriteSize(ui.panels[a].invisibleDragZone, ui.panels[a].contentWidth#, ui.panels[a].contentHeight#)
			attachedTo = ui.panels[a].invisibleDragZone
			panelID = ui.panels[a].background
			trackSize# = GetWindowHeight() - topPanelHeight# - tabsPanelHeight#
			UpdatePanelVerticalScrollBar(ui.panels[a].verticalScrollBar, panelID, attachedTo, trackSize#, ui.panels[a].contentHeight#)
			FixSpriteToScreen(ui.panels[a].verticalScrollBar, 1)
			attachedTo = ui.panels[a].invisibleDragZone
			panelID = ui.panels[a].background
			trackSize# = GetWindowWidth() - categoriesPanelWidth# - propertiesPanelWidth#
			UpdatePanelHorizontalScrollBar(ui.panels[a].horizontalScrollBar, panelID, attachedTo, trackSize#, ui.panels[a].contentWidth#)
			FixSpriteToScreen(ui.panels[a].horizontalScrollBar, 1)
		endif
		if (ui.panels[a].name$ = "Playground Panel" and (redrawPlayground = 1 or redrawUI = 1))
			trackSize# = GetWindowHeight() - topPanelHeight#
			UpdatePlaygroundVerticalScrollBar(ui.panels[a].verticalScrollBar, trackSize#, ui.panels[a].contentHeight#)
			FixSpriteToScreen(ui.panels[a].verticalScrollBar, 1)
			trackSize# = GetWindowWidth() - categoriesPanelWidth# - propertiesPanelWidth#
			UpdatePlaygroundHorizontalScrollBar(ui.panels[a].horizontalScrollBar, trackSize#, ui.panels[a].contentWidth#)
			FixSpriteToScreen(ui.panels[a].horizontalScrollBar, 1)
		endif
		if ((ui.panels[a].name$ = "Categories Panel" or ui.panels[a].name$ = "Properties Panel")) // and redrawUI = 1)	
			SetSpriteSize(ui.panels[a].invisibleDragZone, GetSpriteWidth(ui.panels[a].invisibleDragZone), ui.panels[a].contentHeight#)
			attachedTo = ui.panels[a].invisibleDragZone
			panelID = ui.panels[a].background
			trackSize# = GetWindowHeight() - topPanelHeight#
			UpdatePanelVerticalScrollBar(ui.panels[a].verticalScrollBar, panelID, attachedTo, trackSize#, ui.panels[a].contentHeight#)
			FixSpriteToScreen(ui.panels[a].verticalScrollBar, 1)
		endif
	next
endfunction



function ShowAboutWindow()
	local buttonImages as string[]
	local buttonLabels as string[]
	local buttonNames as string[]
	
	SetSpriteSize(ui.aboutWindow.scrim, GetWindowWidth(), GetWindowHeight())
	SetSpritePosition(ui.aboutWindow.scrim, 0, 0)
	SetSpriteColor(ui.aboutWindow.scrim, 0, 0, 0, 200)
	SetSpriteDepth(ui.aboutWindow.scrim, 3)
	FixSpriteToScreen(ui.aboutWindow.scrim, 1)
	
	SetSpriteSize(ui.aboutWindow.background, 400, 300)
	SetSpritePositionByOffset(ui.aboutWindow.background, GetWindowWidth() / 2, GetWindowHeight() / 2)
	SetSpriteColor(ui.aboutWindow.background, 51, 51, 51, 255)
	SetSpriteDepth(ui.aboutWindow.background, 2)
	FixSpriteToScreen(ui.aboutWindow.background, 1)
	
	SetTextString(ui.aboutWindow.title, "AGK Playground")
	SetTextSize(ui.aboutWindow.title, defaultTextSize# + 10)
	SetTextBold(ui.aboutWindow.title, 1)
	SetTextAlignment(ui.aboutWindow.title, 1)
	SetTextPosition(ui.aboutWindow.title, GetSpriteXByOffset(ui.aboutWindow.background), GetSpriteY(ui.aboutWindow.background) + 10)
	SetTextDepth(ui.aboutWindow.title, 1)
	FixTextToScreen(ui.aboutWindow.title, 1)
	
	SetSpriteSize(ui.aboutWindow.closeButton.icon, 25, 25)
	SetSpriteImage(ui.aboutWindow.closeButton.icon, GetIconImageID("close"))
	SetSpritePosition(ui.aboutWindow.closeButton.icon, GetSpriteX(ui.aboutWindow.background) + GetSpriteWidth(ui.aboutWindow.background) - 25, GetSpriteY(ui.aboutWindow.background))
	SetSpriteDepth(ui.aboutWindow.closeButton.icon, 1)
	FixSpriteToScreen(ui.aboutWindow.closeButton.icon, 1)
	
	SetTextString(ui.aboutWindow.version, "Version " + versionNumber$)
	SetTextSize(ui.aboutWindow.version, defaultTextSize#)
	SetTextBold(ui.aboutWindow.version, 1)
	SetTextAlignment(ui.aboutWindow.version, 1)
	SetTextPosition(ui.aboutWindow.version, GetSpriteXByOffset(ui.aboutWindow.background), GetTextY(ui.aboutWindow.title) + GetTextTotalHeight(ui.aboutWindow.title) + 20)
	SetTextDepth(ui.aboutWindow.version, 1)
	FixTextToScreen(ui.aboutWindow.version, 1)
	
	SetTextString(ui.aboutWindow.attributions, "Images by kenney.nl")
	SetTextSize(ui.aboutWindow.attributions, defaultTextSize#)
	SetTextBold(ui.aboutWindow.attributions, 1)
	SetTextAlignment(ui.aboutWindow.attributions, 1)
	SetTextPosition(ui.aboutWindow.attributions, GetSpriteXByOffset(ui.aboutWindow.background), GetTextY(ui.aboutWindow.version) + GetTextTotalHeight(ui.aboutWindow.version) + 20)
	SetTextDepth(ui.aboutWindow.attributions, 1)
	FixTextToScreen(ui.aboutWindow.attributions, 1)
	for char = 10 to len(GetTextString(ui.aboutWindow.attributions))
		SetTextCharColor(ui.aboutWindow.attributions, char, 30, 229, 206, 255)
	next
	
	SetSpriteSize(ui.aboutWindow.kenneyLink, 55, defaultTextSize#)
	SetSpritePosition(ui.aboutWindow.kenneyLink, GetTextX(ui.aboutWindow.attributions) + (GetTextTotalWidth(ui.aboutWindow.attributions) / 2) - GetSpriteWidth(ui.aboutWindow.kenneyLink), GetTextY(ui.aboutWindow.attributions))
	SetSpriteColor(ui.aboutWindow.kenneyLink, 255, 255, 0, 0)
	SetSpriteDepth(ui.aboutWindow.kenneyLink, 1)
	FixSpriteToScreen(ui.aboutWindow.kenneyLink, 1)
	
	SetTextString(ui.aboutWindow.copyright, "© 2022 Digicode Labs Ltd." + chr(10) + "All Rights Reserved.")
	SetTextSize(ui.aboutWindow.copyright, defaultTextSize#)
	SetTextBold(ui.aboutWindow.copyright, 1)
	SetTextAlignment(ui.aboutWindow.copyright, 1)
	SetTextPosition(ui.aboutWindow.copyright, GetSpriteXByOffset(ui.aboutWindow.background), GetTextY(ui.aboutWindow.attributions) + GetTextTotalHeight(ui.aboutWindow.attributions) + 30)
	SetTextDepth(ui.aboutWindow.copyright, 1)
	FixTextToScreen(ui.aboutWindow.copyright, 1)
	
	SetTextString(ui.aboutWindow.feedbackAndIssues, "Bugs, Feedback, and Suggestions")
	SetTextSize(ui.aboutWindow.feedbackAndIssues, defaultTextSize#)
	SetTextBold(ui.aboutWindow.feedbackAndIssues, 1)
	SetTextAlignment(ui.aboutWindow.feedbackAndIssues, 1)
	SetTextPosition(ui.aboutWindow.feedbackAndIssues, GetSpriteXByOffset(ui.aboutWindow.background), GetTextY(ui.aboutWindow.copyright) + GetTextTotalHeight(ui.aboutWindow.copyright) + 30)
	SetTextDepth(ui.aboutWindow.feedbackAndIssues, 1)
	FixTextToScreen(ui.aboutWindow.feedbackAndIssues, 1)
	
	buttonImages = ["icons/socials/itchio.png", "icons/socials/github.png"]
	buttonLabels = ["itch.io", "GitHub"]
	buttonNames = ["itchio", "github"]
	for i = 0 to buttonIcons.length
		ui.aboutWindow.socialButtons[i].name$ = buttonNames[i]
		ui.aboutWindow.socialButtons[i].icon = CreateSprite(LoadImage(buttonImages[i]))
		SetSpriteColor(ui.aboutWindow.socialButtons[i].icon, 255, 255, 255, 255)
		SetSpriteDepth(ui.aboutWindow.socialButtons[i].icon, 1)
		SetSpriteSize(ui.aboutWindow.socialButtons[i].icon, defaultButtonWidth#, defaultButtonHeight#)
		if (i = 0)
			SetSpritePosition(ui.aboutWindow.socialButtons[i].icon, GetSpriteXByOffset(ui.aboutWindow.background) - defaultButtonWidth# - 10, GetTextY(ui.aboutWindow.feedbackAndIssues) + GetTextTotalHeight(ui.aboutWindow.feedbackAndIssues) + 10)
		else
			SetSpritePosition(ui.aboutWindow.socialButtons[i].icon, GetSpriteXByOffset(ui.aboutWindow.background) + 10, GetTextY(ui.aboutWindow.feedbackAndIssues) + GetTextTotalHeight(ui.aboutWindow.feedbackAndIssues) + 10)
		endif	
		FixSpriteToScreen(ui.aboutWindow.socialButtons[i].icon, 1)
		ui.aboutWindow.socialButtons[i].label = CreateText(buttonLabels[i])
		SetTextAlignment(ui.aboutWindow.socialButtons[i].label, 1)
		SetTextSize(ui.aboutWindow.socialButtons[i].label, defaultTextSize#)
		SetTextBold(ui.aboutWindow.socialButtons[i].label, 1)
		SetTextColor(ui.aboutWindow.socialButtons[i].label, 255, 255, 255, 255)
		SetTextDepth(ui.aboutWindow.socialButtons[i].label, 1)
		SetTextPosition(ui.aboutWindow.socialButtons[i].label, GetSpriteXByOffset(ui.aboutWindow.socialButtons[i].icon), GetSpriteY(ui.aboutWindow.socialButtons[i].icon) + GetSpriteHeight(ui.aboutWindow.socialButtons[i].icon) + 10)
		FixTextToScreen(ui.aboutWindow.socialButtons[i].label, 1)
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
		//SetSpritePosition(scrollBarID, -gripPositionOnTrack#, GetSpriteY(attachedTo) + GetSpriteHeight(attachedTo) - 12)
		SetSpritePosition(scrollBarID, -gripPositionOnTrack#, GetSpriteY(panelID) + GetSpriteHeight(panelID) - 12)
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
		//SetSpritePosition(scrollBarID, GetSpriteX(attachedTo) + GetSpriteWidth(attachedTo) - 12, -gripPositionOnTrack#)
		SetSpritePosition(scrollBarID, GetSpriteX(panelID) + GetSpriteWidth(panelID) - 12, -gripPositionOnTrack#)
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
			SetSpritePosition(ui.panels[a].titleBackground, panelX#, panelY#)
			SetSpriteSize(ui.panels[a].titleBackground, panelWidth#, 40)
			FixSpriteToScreen(ui.panels[a].titleBackground, 1)
			SetTextSize(ui.panels[a].titleLabel, defaultTextSize# + 2)
			SetTextPosition(ui.panels[a].titleLabel, GetSpriteXByOffset(ui.panels[a].titleBackground), GetSpriteYByOffset(ui.panels[a].titleBackground) - (GetTextTotalHeight(ui.panels[a].titleLabel) / 2))
			FixTextToScreen(ui.panels[a].titleLabel, 1)
			SetSpritePosition(ui.panels[a].titleDivider, panelX#, GetSpriteY(ui.panels[a].titleBackground) + GetSpriteHeight(ui.panels[a].titleBackground) - 2)
			SetSpriteSize(ui.panels[a].titleDivider, panelWidth#, 1)
			FixSpriteToScreen(ui.panels[a].titleDivider, 1)
			SetSpritePosition(ui.panels[a].invisibleDragZone, panelX#, panelY#)
			SetSpriteSize(ui.panels[a].invisibleDragZone, panelWidth#, panelHeight#)
			FixSpriteToScreen(ui.panels[a].invisibleDragZone, 1)
			for b = 0 to ui.panels[a].buttons.length
				buttonHeight# = defaultButtonHeight#
				buttonWidth# = defaultButtonWidth#
				buttonX# = GetSpriteX(ui.panels[a].background) + (categoriesPanelWidth# / 2)
				buttonY# = GetSpriteY(ui.panels[a].background) + 10 + (70 * b) + (buttonHeight# / 2) + 40
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
			if (tabSelected = 1)
				SetSpritePosition(ui.panels[a].background, panelX#, panelY#)
			else
				SetSpritePosition(ui.panels[a].background, -99999, -99999)
			endif
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
			trackSize# = GetWindowHeight() - topPanelHeight# - tabsPanelHeight#
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
			if (tabSelected = 0)
				SetSpritePosition(ui.panels[a].background, panelX#, panelY#)
			else
				SetSpritePosition(ui.panels[a].background, -99999, -99999)
			endif
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
			trackSize# = GetWindowHeight() - topPanelHeight# - tabsPanelHeight#
			UpdatePlaygroundVerticalScrollBar(ui.panels[a].verticalScrollBar, trackSize#, contentHeight#)
			FixSpriteToScreen(ui.panels[a].verticalScrollBar, 1)
			contentWidth# = ui.panels[a].contentWidth#
			trackSize# = GetWindowWidth() - categoriesPanelWidth# - propertiesPanelWidth#
			UpdatePlaygroundHorizontalScrollBar(ui.panels[a].horizontalScrollBar, trackSize#, contentWidth#)
			FixSpriteToScreen(ui.panels[a].horizontalScrollBar, 1)
			buttonX# = GetSpriteX(ui.panels[a].background) + GetSpriteWidth(ui.panels[a].background) - 80
			buttonY# = GetWindowHeight() - (buttonHeight# / 2) - (55 * (ui.panels[a].buttons.length + 1)) + (b * 55)	
			SetTextSize(zoomLabel, defaultTextSize# + 1)
			SetTextPosition(zoomLabel, GetSpriteXByOffset(ui.panels[a].buttons[0].icon), (((GetSpriteY(ui.panels[a].buttons[1].icon) + GetSpriteHeight(ui.panels[a].buttons[1].icon)) - GetSpriteY(ui.panels[a].buttons[0].icon)) / 2) + GetSpriteY(ui.panels[a].buttons[0].icon) - (GetTextTotalHeight(zoomLabel) / 2))
			FixTextToScreen(zoomLabel, 1)
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
			SetSpritePosition(ui.panels[a].titleBackground, panelX#, panelY#)
			SetSpriteSize(ui.panels[a].titleBackground, panelWidth#, 40)
			FixSpriteToScreen(ui.panels[a].titleBackground, 1)
			SetTextSize(ui.panels[a].titleLabel, defaultTextSize# + 2)
			SetTextPosition(ui.panels[a].titleLabel, GetSpriteXByOffset(ui.panels[a].titleBackground), GetSpriteYByOffset(ui.panels[a].titleBackground) - (GetTextTotalHeight(ui.panels[a].titleLabel) / 2))
			FixTextToScreen(ui.panels[a].titleLabel, 1)
			SetSpritePosition(ui.panels[a].titleDivider, panelX#, GetSpriteY(ui.panels[a].titleBackground) + GetSpriteHeight(ui.panels[a].titleBackground) - 2)
			SetSpriteSize(ui.panels[a].titleDivider, panelWidth#, 1)
			FixSpriteToScreen(ui.panels[a].titleDivider, 1)
			SetSpritePosition(ui.panels[a].invisibleDragZone, panelX#, panelY#)
			SetSpriteSize(ui.panels[a].invisibleDragZone, panelWidth#, panelHeight#)
			SetSpriteColor(ui.panels[a].invisibleDragZone, 255, 255, 0, 0)
			FixSpriteToScreen(ui.panels[a].invisibleDragZone, 1)
			for c = 0 to 9
				SetSpritePosition(ui.checkboxes[c].background, -99999, -99999)
				FixSpriteToScreen(ui.checkboxes[c].background, 1)
				SetSpritePosition(ui.checkboxes[c].container, -99999, -99999)
				FixSpriteToScreen(ui.checkboxes[c].container, 1)
				SetSpritePosition(ui.checkboxes[c].foreground, -99999, -99999)
				FixSpriteToScreen(ui.checkboxes[c].foreground, 1)
				SetTextPosition(ui.checkboxes[c].label, -99999, -99999)
				FixTextToScreen(ui.checkboxes[c].label, 1)
				
				SetSpritePosition(ui.imageLoaders[c].container, -99999, -99999)
				FixSpriteToScreen(ui.imageLoaders[c].container, 1)
				SetSpritePosition(ui.imageLoaders[c].imageBorder, -99999, -99999)
				FixSpriteToScreen(ui.imageLoaders[c].imageBorder, 1)
				SetSpritePosition(ui.imageLoaders[c].imageBackground, -99999, -99999)
				FixSpriteToScreen(ui.imageLoaders[c].imageBackground, 1)
				SetSpritePosition(ui.imageLoaders[c].image, -99999, -99999)
				FixSpriteToScreen(ui.imageLoaders[c].image, 1)
				SetSpritePosition(ui.imageLoaders[c].importButton.background, -99999, -99999)
				FixSpriteToScreen(ui.imageLoaders[c].importButton.background, 1)
				SetTextPosition(ui.imageLoaders[c].importButton.label, -99999, -99999)
				FixTextToScreen(ui.imageLoaders[c].importButton.label, 1)
				SetTextPosition(ui.imageLoaders[c].label, -99999, -99999)
				FixTextToScreen(ui.imageLoaders[c].label, 1)
				SetSpritePosition(ui.imageLoaders[c].removeButton.background, -99999, -99999)
				FixSpriteToScreen(ui.imageLoaders[c].removeButton.background, 1)
				SetTextPosition(ui.imageLoaders[c].removeButton.label, -99999, -99999)
				FixTextToScreen(ui.imageLoaders[c].removeButton.label, 1)
				
				SetSpritePosition(ui.sliders[c].container, -99999, -99999)
				SetSpriteActive(ui.sliders[c].container, 0)
				FixSpriteToScreen(ui.sliders[c].container, 1)
				SetSpritePosition(ui.sliders[c].inactiveTrack, -99999, -99999)
				FixSpriteToScreen(ui.sliders[c].inactiveTrack, 1)
				SetSpritePosition(ui.sliders[c].activeTrack, -99999, -99999)
				FixSpriteToScreen(ui.sliders[c].activeTrack, 1)
				SetSpritePosition(ui.sliders[c].handle, -99999, -99999)
				FixSpriteToScreen(ui.sliders[c].handle, 1)
				SetTextPosition(ui.sliders[c].label, -99999, -99999)
				FixTextToScreen(ui.sliders[c].label, 1)
				SetTextPosition(ui.sliders[c].toLabel, -99999, -99999)
				FixTextToScreen(ui.sliders[c].toLabel, 1)
				SetSpritePosition(ui.sliders[c].maxHandle, -99999, -99999)
				FixSpriteToScreen(ui.sliders[c].maxHandle, 1)
				SetSpritePosition(ui.sliders[c].minHandle, -99999, -99999)
				FixSpriteToScreen(ui.sliders[c].minHandle, 1)
				SetEditBoxPosition(ui.sliders[c].editbox, -99999, -99999)
				FixEditBoxToScreen(ui.sliders[c].editbox, 1)
				SetEditBoxPosition(ui.sliders[c].maxEditbox, -99999, -99999)
				FixEditBoxToScreen(ui.sliders[c].maxEditbox, 1)
				SetEditBoxPosition(ui.sliders[c].minEditbox, -99999, -99999)
				FixEditBoxToScreen(ui.sliders[c].minEditbox, 1)
			next
			for c = 0 to ui.panels[a].buttons.length
				SetSpritePosition(ui.panels[a].buttons[c].background, -99999, -99999)
				SetTextPosition(ui.panels[a].buttons[c].label, -99999, -99999)
			next
			for c = 0 to particlesKeyFrames.length
				DeleteEditbox(particlesKeyFrames[c].alphaEditbox)
				DeleteText(particlesKeyFrames[c].alphaLabel)
				DeleteEditbox(particlesKeyFrames[c].blueEditbox)
				DeleteText(particlesKeyFrames[c].blueLabel)
				DeleteSprite(particlesKeyFrames[c].container)
				DeleteSprite(particlesKeyFrames[c].deleteIcon)
				DeleteEditbox(particlesKeyFrames[c].greenEditbox)
				DeleteText(particlesKeyFrames[c].greenLabel)
				DeleteEditbox(particlesKeyFrames[c].redEditbox)
				DeleteText(particlesKeyFrames[c].redLabel)
				DeleteEditbox(particlesKeyFrames[c].scaleEditbox)
				DeleteText(particlesKeyFrames[c].scaleLabel)
				DeleteEditbox(particlesKeyFrames[c].timeEditbox)
				DeleteText(particlesKeyFrames[c].timeLabel)
			next
			//particlesKeyFrames.length = -1
			for subHeader = 0 to ui.panels[a].subHeaders.length
				DeleteSprite(ui.panels[a].subHeaders[subHeader].container)
				DeleteSprite(ui.panels[a].subHeaders[subHeader].divider)
				DeleteText(ui.panels[a].subHeaders[subHeader].label)
			next
			ui.panels[a].subHeaders.length = -1
			if (selectedCategory = CATEGORY_COS_SIN_ORBIT)
				imageLoader = 0
				ui.imageLoaders[imageLoader].name$ = "OrbitedSpriteImage"
				SetSpritePosition(ui.imageLoaders[imageLoader].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.panels[a].background) + 10 + 40)
				SetSpriteSize(ui.imageLoaders[imageLoader].container, 260, 100)
				SetSpriteColor(ui.imageLoaders[imageLoader].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.imageLoaders[imageLoader].container, GetSpriteDepth(ui.panels[a].background))
				SetTextSize(ui.imageLoaders[imageLoader].label, defaultTextSize#)
				SetTextString(ui.imageLoaders[imageLoader].label, "Orbited Sprite Image")
				SetTextPosition(ui.imageLoaders[imageLoader].label, GetSpriteX(ui.imageLoaders[imageLoader].container), GetSpriteY(ui.imageLoaders[imageLoader].container))
				SetTextDepth(ui.imageLoaders[imageLoader].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePosition(ui.imageLoaders[imageLoader].imageBorder, GetSpriteX(ui.imageLoaders[imageLoader].container), GetSpriteY(ui.imageLoaders[imageLoader].container) + 20)
				SetSpriteSize(ui.imageLoaders[imageLoader].imageBorder, 100, 80)
				SetSpriteColor(ui.imageLoaders[imageLoader].imageBorder, 116, 116, 116, 255)
				SetSpriteDepth(ui.imageLoaders[imageLoader].imageBorder, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePositionByOffset(ui.imageLoaders[imageLoader].imageBackground, GetSpriteXByOffset(ui.imageLoaders[imageLoader].imageBorder), GetSpriteYByOffset(ui.imageLoaders[imageLoader].imageBorder))
				SetSpriteSize(ui.imageLoaders[imageLoader].imageBackground, 98, 78)
				SetSpriteColor(ui.imageLoaders[imageLoader].imageBackground, 28, 24, 27, 255)
				SetSpriteDepth(ui.imageLoaders[imageLoader].imageBackground, GetSpriteDepth(ui.panels[a].background) - 3)
				SetSpritePositionByOffset(ui.imageLoaders[imageLoader].image, GetSpriteXByOffset(ui.imageLoaders[imageLoader].imageBorder), GetSpriteYByOffset(ui.imageLoaders[imageLoader].imageBorder))
				if (ui.imageLoaders[imageLoader].value > 0)
					SetSpriteSize(ui.imageLoaders[imageLoader].image, 70, 70)
				else
					SetSpriteSize(ui.imageLoaders[imageLoader].image, 50, 50)
				endif
				SetSpriteImage(ui.imageLoaders[imageLoader].image, ui.imageLoaders[imageLoader].value)
				SetSpriteDepth(ui.imageLoaders[imageLoader].image, GetSpriteDepth(ui.panels[a].background) - 4)
				SetSpriteSize(ui.imageLoaders[imageLoader].importButton.background, 145, 20)
				SetSpritePosition(ui.imageLoaders[imageLoader].importButton.background, GetSpriteX(ui.imageLoaders[imageLoader].imageBorder) + GetSpriteWidth(ui.imageLoaders[imageLoader].imageBorder) + 10, GetSpriteY(ui.imageLoaders[imageLoader].imageBorder) + 15)
				SetSpriteColor(ui.imageLoaders[imageLoader].importButton.background, 93, 89, 92, 255)
				SetSpriteDepth(ui.imageLoaders[imageLoader].importButton.background, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextAlignment(ui.imageLoaders[imageLoader].importButton.label, 1)
				SetTextSize(ui.imageLoaders[imageLoader].importButton.label, defaultTextSize#)
				SetTextPosition(ui.imageLoaders[imageLoader].importButton.label, GetSpriteXByOffset(ui.imageLoaders[imageLoader].importButton.background), GetSpriteYByOffset(ui.imageLoaders[imageLoader].importButton.background) - (GetTextTotalHeight(ui.imageLoaders[imageLoader].importButton.label) / 2))
				SetTextDepth(ui.imageLoaders[imageLoader].importButton.label, GetSpriteDepth(ui.panels[a].background) - 3)
				SetSpriteSize(ui.imageLoaders[imageLoader].removeButton.background, 145, 20)
				SetSpritePosition(ui.imageLoaders[imageLoader].removeButton.background, GetSpriteX(ui.imageLoaders[imageLoader].imageBorder) + GetSpriteWidth(ui.imageLoaders[imageLoader].imageBorder) + 10, GetSpriteY(ui.imageLoaders[imageLoader].imageBorder) + 45)
				SetSpriteColor(ui.imageLoaders[imageLoader].removeButton.background, 93, 89, 92, 255)
				SetSpriteDepth(ui.imageLoaders[imageLoader].removeButton.background, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextAlignment(ui.imageLoaders[imageLoader].removeButton.label, 1)
				SetTextSize(ui.imageLoaders[imageLoader].removeButton.label, defaultTextSize#)
				SetTextPosition(ui.imageLoaders[imageLoader].removeButton.label, GetSpriteXByOffset(ui.imageLoaders[imageLoader].removeButton.background), GetSpriteYByOffset(ui.imageLoaders[imageLoader].removeButton.background) - (GetTextTotalHeight(ui.imageLoaders[imageLoader].removeButton.label) / 2))
				SetTextDepth(ui.imageLoaders[imageLoader].removeButton.label, GetSpriteDepth(ui.panels[a].background) - 3)
				
				slider = 0
				ui.sliders[slider].name$ = "OrbitedSpriteHeight"
				ui.sliders[slider].min# = 0
				ui.sliders[slider].max# = 500
				//ui.sliders[slider].value# = 100
				ui.sliders[slider].activeTrackFromCentre = 0
				ui.sliders[slider].rangeSlider = 0
				//SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.panels[a].background) + 10 + 40)
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.imageLoaders[0].container) + GetSpriteHeight(ui.imageLoaders[0].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 37)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background))
				SetTextString(ui.sliders[slider].label, "Orbited Sprite Height")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 45, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 1)
				SetEditBoxBorderColor(ui.sliders[slider].editbox, 90, 88, 91, 255)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 61, 57, 60, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 4)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 3)
				
				imageLoader = 1
				ui.imageLoaders[imageLoader].name$ = "OrbitingImage"
				SetSpritePosition(ui.imageLoaders[imageLoader].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[0].container) + GetSpriteHeight(ui.sliders[0].container) + 10)
				SetSpriteSize(ui.imageLoaders[imageLoader].container, 260, 100)
				SetSpriteColor(ui.imageLoaders[imageLoader].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.imageLoaders[imageLoader].container, GetSpriteDepth(ui.panels[a].background))
				SetTextSize(ui.imageLoaders[imageLoader].label, defaultTextSize#)
				SetTextString(ui.imageLoaders[imageLoader].label, "Orbiting Image")
				SetTextPosition(ui.imageLoaders[imageLoader].label, GetSpriteX(ui.imageLoaders[imageLoader].container), GetSpriteY(ui.imageLoaders[imageLoader].container))
				SetTextDepth(ui.imageLoaders[imageLoader].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePosition(ui.imageLoaders[imageLoader].imageBorder, GetSpriteX(ui.imageLoaders[imageLoader].container), GetSpriteY(ui.imageLoaders[imageLoader].container) + 20)
				SetSpriteSize(ui.imageLoaders[imageLoader].imageBorder, 100, 80)
				SetSpriteColor(ui.imageLoaders[imageLoader].imageBorder, 116, 116, 116, 255)
				SetSpriteDepth(ui.imageLoaders[imageLoader].imageBorder, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePositionByOffset(ui.imageLoaders[imageLoader].imageBackground, GetSpriteXByOffset(ui.imageLoaders[imageLoader].imageBorder), GetSpriteYByOffset(ui.imageLoaders[imageLoader].imageBorder))
				SetSpriteSize(ui.imageLoaders[imageLoader].imageBackground, 98, 78)
				SetSpriteColor(ui.imageLoaders[imageLoader].imageBackground, 28, 24, 27, 255)
				SetSpriteDepth(ui.imageLoaders[imageLoader].imageBackground, GetSpriteDepth(ui.panels[a].background) - 3)
				SetSpritePositionByOffset(ui.imageLoaders[imageLoader].image, GetSpriteXByOffset(ui.imageLoaders[imageLoader].imageBorder), GetSpriteYByOffset(ui.imageLoaders[imageLoader].imageBorder))
				if (ui.imageLoaders[imageLoader].value > 0)
					SetSpriteSize(ui.imageLoaders[imageLoader].image, 70, 70)
				else
					SetSpriteSize(ui.imageLoaders[imageLoader].image, 50, 50)
				endif
				SetSpriteImage(ui.imageLoaders[imageLoader].image, ui.imageLoaders[imageLoader].value)
				SetSpriteDepth(ui.imageLoaders[imageLoader].image, GetSpriteDepth(ui.panels[a].background) - 4)
				SetSpriteSize(ui.imageLoaders[imageLoader].importButton.background, 145, 20)
				SetSpritePosition(ui.imageLoaders[imageLoader].importButton.background, GetSpriteX(ui.imageLoaders[imageLoader].imageBorder) + GetSpriteWidth(ui.imageLoaders[imageLoader].imageBorder) + 10, GetSpriteY(ui.imageLoaders[imageLoader].imageBorder) + 15)
				SetSpriteColor(ui.imageLoaders[imageLoader].importButton.background, 93, 89, 92, 255)
				SetSpriteDepth(ui.imageLoaders[imageLoader].importButton.background, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextAlignment(ui.imageLoaders[imageLoader].importButton.label, 1)
				SetTextSize(ui.imageLoaders[imageLoader].importButton.label, defaultTextSize#)
				SetTextPosition(ui.imageLoaders[imageLoader].importButton.label, GetSpriteXByOffset(ui.imageLoaders[imageLoader].importButton.background), GetSpriteYByOffset(ui.imageLoaders[imageLoader].importButton.background) - (GetTextTotalHeight(ui.imageLoaders[imageLoader].importButton.label) / 2))
				SetTextDepth(ui.imageLoaders[imageLoader].importButton.label, GetSpriteDepth(ui.panels[a].background) - 3)
				SetSpriteSize(ui.imageLoaders[imageLoader].removeButton.background, 145, 20)
				SetSpritePosition(ui.imageLoaders[imageLoader].removeButton.background, GetSpriteX(ui.imageLoaders[imageLoader].imageBorder) + GetSpriteWidth(ui.imageLoaders[imageLoader].imageBorder) + 10, GetSpriteY(ui.imageLoaders[imageLoader].imageBorder) + 45)
				SetSpriteColor(ui.imageLoaders[imageLoader].removeButton.background, 93, 89, 92, 255)
				SetSpriteDepth(ui.imageLoaders[imageLoader].removeButton.background, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextAlignment(ui.imageLoaders[imageLoader].removeButton.label, 1)
				SetTextSize(ui.imageLoaders[imageLoader].removeButton.label, defaultTextSize#)
				SetTextPosition(ui.imageLoaders[imageLoader].removeButton.label, GetSpriteXByOffset(ui.imageLoaders[imageLoader].removeButton.background), GetSpriteYByOffset(ui.imageLoaders[imageLoader].removeButton.background) - (GetTextTotalHeight(ui.imageLoaders[imageLoader].removeButton.label) / 2))
				SetTextDepth(ui.imageLoaders[imageLoader].removeButton.label, GetSpriteDepth(ui.panels[a].background) - 3)
				
				slider = 1
				ui.sliders[slider].name$ = "OrbitingSpriteHeight"
				ui.sliders[slider].min# = 0
				ui.sliders[slider].max# = 500
				//ui.sliders[slider].value# = 100
				ui.sliders[slider].activeTrackFromCentre = 0
				ui.sliders[slider].rangeSlider = 0
				//SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.panels[a].background) + 10 + 40)
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.imageLoaders[1].container) + GetSpriteHeight(ui.imageLoaders[1].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 37)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background))
				SetTextString(ui.sliders[slider].label, "Orbiting Sprite Height")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 45, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 1)
				SetEditBoxBorderColor(ui.sliders[slider].editbox, 90, 88, 91, 255)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 61, 57, 60, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 4)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 3)
				
				slider = 2
				ui.sliders[slider].name$ = "RadiusX"
				ui.sliders[slider].min# = 0
				ui.sliders[slider].max# = 500
				//ui.sliders[slider].value# = 100
				ui.sliders[slider].activeTrackFromCentre = 0
				ui.sliders[slider].rangeSlider = 0
				//SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.panels[a].background) + 10 + 40)
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 37)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background))
				SetTextString(ui.sliders[slider].label, "Radius X")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 45, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 1)
				SetEditBoxBorderColor(ui.sliders[slider].editbox, 90, 88, 91, 255)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 61, 57, 60, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 4)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 3)
				
				slider = 3
				ui.sliders[slider].name$ = "RadiusY"
				ui.sliders[slider].min# = 0
				ui.sliders[slider].max# = 500
				//ui.sliders[slider].value# = 100
				ui.sliders[slider].activeTrackFromCentre = 0
				ui.sliders[slider].rangeSlider = 0
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 37)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background))
				SetTextString(ui.sliders[slider].label, "Radius Y")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 45, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 1)
				SetEditBoxBorderColor(ui.sliders[slider].editbox, 90, 88, 91, 255)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 61, 57, 60, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 4)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 3)
				
				slider = 4
				ui.sliders[slider].name$ = "AngleStepSize"
				ui.sliders[slider].min# = -10
				ui.sliders[slider].max# = 10
				//ui.sliders[slider].value# = 2
				ui.sliders[slider].activeTrackFromCentre = 1
				ui.sliders[slider].rangeSlider = 0
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 37)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background))
				SetTextString(ui.sliders[slider].label, "Angle Step Size")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 45, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 1)
				SetEditBoxBorderColor(ui.sliders[slider].editbox, 90, 88, 91, 255)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 61, 57, 60, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 4)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 3)
			endif
			if (selectedCategory = CATEGORY_2D_PARTICLES)
				imageLoader = 0
				ui.imageLoaders[imageLoader].name$ = "ParticleImage"
				SetSpritePosition(ui.imageLoaders[imageLoader].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.panels[a].background) + 10 + 40)
				SetSpriteSize(ui.imageLoaders[imageLoader].container, 260, 100)
				SetSpriteColor(ui.imageLoaders[imageLoader].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.imageLoaders[imageLoader].container, GetSpriteDepth(ui.panels[a].background))
				SetTextSize(ui.imageLoaders[imageLoader].label, defaultTextSize#)
				SetTextString(ui.imageLoaders[imageLoader].label, "Particle Image")
				SetTextPosition(ui.imageLoaders[imageLoader].label, GetSpriteX(ui.imageLoaders[imageLoader].container), GetSpriteY(ui.imageLoaders[imageLoader].container))
				SetTextDepth(ui.imageLoaders[imageLoader].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePosition(ui.imageLoaders[imageLoader].imageBorder, GetSpriteX(ui.imageLoaders[imageLoader].container), GetSpriteY(ui.imageLoaders[imageLoader].container) + 20)
				SetSpriteSize(ui.imageLoaders[imageLoader].imageBorder, 100, 80)
				SetSpriteColor(ui.imageLoaders[imageLoader].imageBorder, 116, 116, 116, 255)
				SetSpriteDepth(ui.imageLoaders[imageLoader].imageBorder, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePositionByOffset(ui.imageLoaders[imageLoader].imageBackground, GetSpriteXByOffset(ui.imageLoaders[imageLoader].imageBorder), GetSpriteYByOffset(ui.imageLoaders[imageLoader].imageBorder))
				SetSpriteSize(ui.imageLoaders[imageLoader].imageBackground, 98, 78)
				SetSpriteColor(ui.imageLoaders[imageLoader].imageBackground, 28, 24, 27, 255)
				SetSpriteDepth(ui.imageLoaders[imageLoader].imageBackground, GetSpriteDepth(ui.panels[a].background) - 3)
				SetSpritePositionByOffset(ui.imageLoaders[imageLoader].image, GetSpriteXByOffset(ui.imageLoaders[imageLoader].imageBorder), GetSpriteYByOffset(ui.imageLoaders[imageLoader].imageBorder))
				if (ui.imageLoaders[imageLoader].value > 0)
					SetSpriteSize(ui.imageLoaders[imageLoader].image, 70, 70)
				else
					SetSpriteSize(ui.imageLoaders[imageLoader].image, 50, 50)
				endif
				SetSpriteImage(ui.imageLoaders[imageLoader].image, ui.imageLoaders[imageLoader].value)
				SetSpriteDepth(ui.imageLoaders[imageLoader].image, GetSpriteDepth(ui.panels[a].background) - 4)
				SetSpriteSize(ui.imageLoaders[imageLoader].importButton.background, 145, 20)
				SetSpritePosition(ui.imageLoaders[imageLoader].importButton.background, GetSpriteX(ui.imageLoaders[imageLoader].imageBorder) + GetSpriteWidth(ui.imageLoaders[imageLoader].imageBorder) + 10, GetSpriteY(ui.imageLoaders[imageLoader].imageBorder) + 15)
				SetSpriteColor(ui.imageLoaders[imageLoader].importButton.background, 93, 89, 92, 255)
				SetSpriteDepth(ui.imageLoaders[imageLoader].importButton.background, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextAlignment(ui.imageLoaders[imageLoader].importButton.label, 1)
				SetTextSize(ui.imageLoaders[imageLoader].importButton.label, defaultTextSize#)
				SetTextPosition(ui.imageLoaders[imageLoader].importButton.label, GetSpriteXByOffset(ui.imageLoaders[imageLoader].importButton.background), GetSpriteYByOffset(ui.imageLoaders[imageLoader].importButton.background) - (GetTextTotalHeight(ui.imageLoaders[imageLoader].importButton.label) / 2))
				SetTextDepth(ui.imageLoaders[imageLoader].importButton.label, GetSpriteDepth(ui.panels[a].background) - 3)
				SetSpriteSize(ui.imageLoaders[imageLoader].removeButton.background, 145, 20)
				SetSpritePosition(ui.imageLoaders[imageLoader].removeButton.background, GetSpriteX(ui.imageLoaders[imageLoader].imageBorder) + GetSpriteWidth(ui.imageLoaders[imageLoader].imageBorder) + 10, GetSpriteY(ui.imageLoaders[imageLoader].imageBorder) + 45)
				SetSpriteColor(ui.imageLoaders[imageLoader].removeButton.background, 93, 89, 92, 255)
				SetSpriteDepth(ui.imageLoaders[imageLoader].removeButton.background, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextAlignment(ui.imageLoaders[imageLoader].removeButton.label, 1)
				SetTextSize(ui.imageLoaders[imageLoader].removeButton.label, defaultTextSize#)
				SetTextPosition(ui.imageLoaders[imageLoader].removeButton.label, GetSpriteXByOffset(ui.imageLoaders[imageLoader].removeButton.background), GetSpriteYByOffset(ui.imageLoaders[imageLoader].removeButton.background) - (GetTextTotalHeight(ui.imageLoaders[imageLoader].removeButton.label) / 2))
				SetTextDepth(ui.imageLoaders[imageLoader].removeButton.label, GetSpriteDepth(ui.panels[a].background) - 3)
								
				slider = 0
				ui.sliders[slider].name$ = "ParticleSize"
				ui.sliders[slider].min# = 1
				ui.sliders[slider].max# = 200
				//ui.sliders[slider].value# = 50
				ui.sliders[slider].activeTrackFromCentre = 0
				ui.sliders[slider].rangeSlider = 0
				//SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.panels[a].background) + 10 + 40)
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.imageLoaders[0].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 37)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background))
				SetTextString(ui.sliders[slider].label, "Particle Size")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 45, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 1)
				SetEditBoxBorderColor(ui.sliders[slider].editbox, 90, 88, 91, 255)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 61, 57, 60, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 4)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 3)
				
				slider = 1
				ui.sliders[slider].name$ = "AngleRange"
				ui.sliders[slider].min# = 0
				ui.sliders[slider].max# = 360
				//ui.sliders[slider].value# = 20
				ui.sliders[slider].activeTrackFromCentre = 0
				ui.sliders[slider].rangeSlider = 0
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 37)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background))
				SetTextString(ui.sliders[slider].label, "Angle Range")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 45, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 1)
				SetEditBoxBorderColor(ui.sliders[slider].editbox, 90, 88, 91, 255)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 61, 57, 60, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 4)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 3)
				
				slider = 2
				ui.sliders[slider].name$ = "DirectionX"
				ui.sliders[slider].min# = -500
				ui.sliders[slider].max# = 500
				//ui.sliders[slider].value# = 0
				ui.sliders[slider].activeTrackFromCentre = 1
				ui.sliders[slider].rangeSlider = 0
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 37)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background))
				SetTextString(ui.sliders[slider].label, "Direction X")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 45, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 1)
				SetEditBoxBorderColor(ui.sliders[slider].editbox, 90, 88, 91, 255)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 61, 57, 60, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 4)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 3)
				
				slider = 3
				ui.sliders[slider].name$ = "DirectionY"
				ui.sliders[slider].min# = -500
				ui.sliders[slider].max# = 500
				//ui.sliders[slider].value# = -15
				ui.sliders[slider].activeTrackFromCentre = 1
				ui.sliders[slider].rangeSlider = 0
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 37)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background))
				SetTextString(ui.sliders[slider].label, "Direction Y")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 45, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 1)
				SetEditBoxBorderColor(ui.sliders[slider].editbox, 90, 88, 91, 255)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 61, 57, 60, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 4)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 3)
			
				slider = 4
				ui.sliders[slider].name$ = "Frequency"
				ui.sliders[slider].min# = 1
				ui.sliders[slider].max# = 2000
				//ui.sliders[slider].value# = 100
				ui.sliders[slider].activeTrackFromCentre = 0
				ui.sliders[slider].rangeSlider = 0
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 37)
				SetSpriteColor(ui.sliders[slider].container, 255, 0, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background))
				SetTextString(ui.sliders[slider].label, "Frequency")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 45, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 1)
				SetEditBoxBorderColor(ui.sliders[slider].editbox, 90, 88, 91, 255)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 61, 57, 60, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 4)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 3)
				
				slider = 5
				ui.sliders[slider].name$ = "ParticleLife"
				ui.sliders[slider].min# = 0
				ui.sliders[slider].max# = 20
				//ui.sliders[slider].value# = 6
				ui.sliders[slider].activeTrackFromCentre = 0
				ui.sliders[slider].rangeSlider = 0
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 37)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background))
				SetTextString(ui.sliders[slider].label, "Particle Life (seconds)")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 45, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 1)
				SetEditBoxBorderColor(ui.sliders[slider].editbox, 90, 88, 91, 255)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 61, 57, 60, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 4)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 3)
				
				slider = 6
				ui.sliders[slider].name$ = "VelocityRange"
				ui.sliders[slider].min# = 0
				//ui.sliders[slider].minValue# = 2
				ui.sliders[slider].max# = 20
				//ui.sliders[slider].maxValue# = 4
				ui.sliders[slider].value# = 0
				ui.sliders[slider].activeTrackFromCentre = 0
				ui.sliders[slider].rangeSlider = 1
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 37)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background))
				SetTextString(ui.sliders[slider].label, "Velocity Range")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				if (ui.sliders[slider].rangeSlider = 0)
					SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
					SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
					SetEditBoxSize(ui.sliders[slider].editbox, 45, GetEditBoxHeight(ui.sliders[slider].editbox))
					SetEditBoxBorderSize(ui.sliders[slider].editbox, 1)
					SetEditBoxBorderColor(ui.sliders[slider].editbox, 90, 88, 91, 255)
					SetEditBoxInputType(ui.sliders[slider].editbox, 1)
					SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 61, 57, 60, 255)
					SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
					SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 2)
				endif
				if (ui.sliders[slider].rangeSlider = 1)
					SetEditBoxText(ui.sliders[slider].minEditbox, str(ui.sliders[slider].minValue#, 0))
					SetEditBoxPosition(ui.sliders[slider].minEditbox, GetSpriteX(ui.sliders[slider].container) + 260 - 115, GetSpriteY(ui.sliders[slider].container))
					SetEditBoxSize(ui.sliders[slider].minEditbox, 45, GetEditBoxHeight(ui.sliders[slider].minEditbox))
					SetEditBoxBorderSize(ui.sliders[slider].minEditbox, 1)
					SetEditBoxBorderColor(ui.sliders[slider].minEditbox, 90, 88, 91, 255)
					SetEditBoxInputType(ui.sliders[slider].minEditbox, 1)
					SetEditBoxBackgroundColor(ui.sliders[slider].minEditbox, 61, 57, 60, 255)
					SetEditBoxTextColor(ui.sliders[slider].minEditbox, 255, 255, 255)
					SetEditBoxDepth(ui.sliders[slider].minEditbox, GetSpriteDepth(ui.panels[a].background) - 2)
					SetTextString(ui.sliders[slider].toLabel, "to")
					SetTextAlignment(ui.sliders[slider].toLabel, 1)
					SetTextSize(ui.sliders[slider].toLabel, defaultTextSize#)
					SetTextDepth(ui.sliders[slider].toLabel, GetSpriteDepth(ui.panels[a].background) - 2)
					SetTextPosition(ui.sliders[slider].toLabel, GetSpriteX(ui.sliders[slider].container) + 260 - 60, GetSpriteY(ui.sliders[slider].container))	
					SetEditBoxText(ui.sliders[slider].maxEditbox, str(ui.sliders[slider].maxValue#, 0))
					SetEditBoxPosition(ui.sliders[slider].maxEditbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
					SetEditBoxSize(ui.sliders[slider].maxEditbox, 45, GetEditBoxHeight(ui.sliders[slider].maxEditbox))
					SetEditBoxBorderSize(ui.sliders[slider].maxEditbox, 1)
					SetEditBoxBorderColor(ui.sliders[slider].maxEditbox, 90, 88, 91, 255)
					SetEditBoxInputType(ui.sliders[slider].maxEditbox, 1)
					SetEditBoxBackgroundColor(ui.sliders[slider].maxEditbox, 61, 57, 60, 255)
					SetEditBoxTextColor(ui.sliders[slider].maxEditbox, 255, 255, 255)
					SetEditBoxDepth(ui.sliders[slider].maxEditbox, GetSpriteDepth(ui.panels[a].background) - 2)
				endif
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				if (ui.sliders[slider].rangeSlider = 0)
					SetSpriteSize(ui.sliders[slider].handle, 15, 15)
					percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
					handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
					SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
					SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
					SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 4)
				endif
				if (ui.sliders[slider].rangeSlider = 1)
					SetSpriteSize(ui.sliders[slider].minHandle, 15, 15)
					percentage# = ((ui.sliders[slider].minValue# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
					handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].minHandle)) / 100.0) * percentage#
					SetSpritePositionByOffset(ui.sliders[slider].minHandle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].minHandle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
					SetSpriteColor(ui.sliders[slider].minHandle, 147, 145, 147, 255)
					SetSpriteDepth(ui.sliders[slider].minHandle, GetSpriteDepth(ui.panels[a].background) - 4)
					SetSpriteSize(ui.sliders[slider].maxHandle, 15, 15)
					percentage# = ((ui.sliders[slider].maxValue# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
					handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].maxHandle)) / 100.0) * percentage#
					SetSpritePositionByOffset(ui.sliders[slider].maxHandle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].maxHandle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
					SetSpriteColor(ui.sliders[slider].maxHandle, 147, 145, 147, 255)
					SetSpriteDepth(ui.sliders[slider].maxHandle, GetSpriteDepth(ui.panels[a].background) - 5)
				endif
				if (ui.sliders[slider].rangeSlider = 0)
					if (ui.sliders[slider].activeTrackFromCentre = 0)
						SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
					else
						SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
						if (ui.sliders[slider].value# < 0)
							SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
						else
							SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
						endif	
					endif
				endif
				if (ui.sliders[slider].rangeSlider = 1)
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].maxHandle) - GetSpriteXByOffset(ui.sliders[slider].minHandle)), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].minHandle), GetSpriteY(ui.sliders[slider].container) + 27)
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 3)
				
				slider = 7
				ui.sliders[slider].name$ = "StartZoneX"
				ui.sliders[slider].min# = -400
				//ui.sliders[slider].minValue# = -30
				ui.sliders[slider].max# = 400
				//ui.sliders[slider].maxValue# = 30
				ui.sliders[slider].value# = 0
				ui.sliders[slider].activeTrackFromCentre = 0
				ui.sliders[slider].rangeSlider = 1
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 37)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background))
				SetTextString(ui.sliders[slider].label, "Start Zone X")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				if (ui.sliders[slider].rangeSlider = 0)
					SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
					SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
					SetEditBoxSize(ui.sliders[slider].editbox, 45, GetEditBoxHeight(ui.sliders[slider].editbox))
					SetEditBoxBorderSize(ui.sliders[slider].editbox, 1)
					SetEditBoxBorderColor(ui.sliders[slider].editbox, 90, 88, 91, 255)
					SetEditBoxInputType(ui.sliders[slider].editbox, 1)
					SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 61, 57, 60, 255)
					SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
					SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 2)
				endif
				if (ui.sliders[slider].rangeSlider = 1)
					SetEditBoxText(ui.sliders[slider].minEditbox, str(ui.sliders[slider].minValue#, 0))
					SetEditBoxPosition(ui.sliders[slider].minEditbox, GetSpriteX(ui.sliders[slider].container) + 260 - 115, GetSpriteY(ui.sliders[slider].container))
					SetEditBoxSize(ui.sliders[slider].minEditbox, 45, GetEditBoxHeight(ui.sliders[slider].minEditbox))
					SetEditBoxBorderSize(ui.sliders[slider].minEditbox, 1)
					SetEditBoxBorderColor(ui.sliders[slider].minEditbox, 90, 88, 91, 255)
					SetEditBoxInputType(ui.sliders[slider].minEditbox, 1)
					SetEditBoxBackgroundColor(ui.sliders[slider].minEditbox, 61, 57, 60, 255)
					SetEditBoxTextColor(ui.sliders[slider].minEditbox, 255, 255, 255)
					SetEditBoxDepth(ui.sliders[slider].minEditbox, GetSpriteDepth(ui.panels[a].background) - 2)
					SetTextString(ui.sliders[slider].toLabel, "to")
					SetTextAlignment(ui.sliders[slider].toLabel, 1)
					SetTextSize(ui.sliders[slider].toLabel, defaultTextSize#)
					SetTextDepth(ui.sliders[slider].toLabel, GetSpriteDepth(ui.panels[a].background) - 2)
					SetTextPosition(ui.sliders[slider].toLabel, GetSpriteX(ui.sliders[slider].container) + 260 - 60, GetSpriteY(ui.sliders[slider].container))	
					SetEditBoxText(ui.sliders[slider].maxEditbox, str(ui.sliders[slider].maxValue#, 0))
					SetEditBoxPosition(ui.sliders[slider].maxEditbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
					SetEditBoxSize(ui.sliders[slider].maxEditbox, 45, GetEditBoxHeight(ui.sliders[slider].maxEditbox))
					SetEditBoxBorderSize(ui.sliders[slider].maxEditbox, 1)
					SetEditBoxBorderColor(ui.sliders[slider].maxEditbox, 90, 88, 91, 255)
					SetEditBoxBorderSize(ui.sliders[slider].maxEditbox, 0)
					SetEditBoxInputType(ui.sliders[slider].maxEditbox, 1)
					SetEditBoxBackgroundColor(ui.sliders[slider].maxEditbox, 61, 57, 60, 255)
					SetEditBoxTextColor(ui.sliders[slider].maxEditbox, 255, 255, 255)
					SetEditBoxDepth(ui.sliders[slider].maxEditbox, GetSpriteDepth(ui.panels[a].background) - 2)
				endif
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				if (ui.sliders[slider].rangeSlider = 0)
					SetSpriteSize(ui.sliders[slider].handle, 15, 15)
					percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
					handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
					SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
					SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
					SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 4)
				endif
				if (ui.sliders[slider].rangeSlider = 1)
					SetSpriteSize(ui.sliders[slider].minHandle, 15, 15)
					percentage# = ((ui.sliders[slider].minValue# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
					handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].minHandle)) / 100.0) * percentage#
					SetSpritePositionByOffset(ui.sliders[slider].minHandle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].minHandle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
					SetSpriteColor(ui.sliders[slider].minHandle, 147, 145, 147, 255)
					SetSpriteDepth(ui.sliders[slider].minHandle, GetSpriteDepth(ui.panels[a].background) - 4)
					SetSpriteSize(ui.sliders[slider].maxHandle, 15, 15)
					percentage# = ((ui.sliders[slider].maxValue# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
					handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].maxHandle)) / 100.0) * percentage#
					SetSpritePositionByOffset(ui.sliders[slider].maxHandle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].maxHandle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
					SetSpriteColor(ui.sliders[slider].maxHandle, 147, 145, 147, 255)
					SetSpriteDepth(ui.sliders[slider].maxHandle, GetSpriteDepth(ui.panels[a].background) - 5)
				endif
				if (ui.sliders[slider].rangeSlider = 0)
					if (ui.sliders[slider].activeTrackFromCentre = 0)
						SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
					else
						SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
						if (ui.sliders[slider].value# < 0)
							SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
						else
							SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
						endif	
					endif
				endif
				if (ui.sliders[slider].rangeSlider = 1)
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].maxHandle) - GetSpriteXByOffset(ui.sliders[slider].minHandle)), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].minHandle), GetSpriteY(ui.sliders[slider].container) + 27)
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 3)
				
				slider = 8
				ui.sliders[slider].name$ = "StartZoneY"
				ui.sliders[slider].min# = -400
				//ui.sliders[slider].minValue# = -20
				ui.sliders[slider].max# = 400
				//ui.sliders[slider].maxValue# = 20
				ui.sliders[slider].value# = 0
				ui.sliders[slider].activeTrackFromCentre = 0
				ui.sliders[slider].rangeSlider = 1
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 37)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background))
				SetTextString(ui.sliders[slider].label, "Start Zone Y")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				if (ui.sliders[slider].rangeSlider = 0)
					SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
					SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
					SetEditBoxSize(ui.sliders[slider].editbox, 45, GetEditBoxHeight(ui.sliders[slider].editbox))
					SetEditBoxBorderSize(ui.sliders[slider].editbox, 1)
					SetEditBoxBorderColor(ui.sliders[slider].editbox, 90, 88, 91, 255)
					SetEditBoxInputType(ui.sliders[slider].editbox, 1)
					SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 61, 57, 60, 255)
					SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
					SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 2)
				endif
				if (ui.sliders[slider].rangeSlider = 1)
					SetEditBoxText(ui.sliders[slider].minEditbox, str(ui.sliders[slider].minValue#, 0))
					SetEditBoxPosition(ui.sliders[slider].minEditbox, GetSpriteX(ui.sliders[slider].container) + 260 - 115, GetSpriteY(ui.sliders[slider].container))
					SetEditBoxSize(ui.sliders[slider].minEditbox, 45, GetEditBoxHeight(ui.sliders[slider].minEditbox))
					SetEditBoxBorderSize(ui.sliders[slider].minEditbox, 1)
					SetEditBoxBorderColor(ui.sliders[slider].minEditbox, 90, 88, 91, 255)
					SetEditBoxInputType(ui.sliders[slider].minEditbox, 1)
					SetEditBoxBackgroundColor(ui.sliders[slider].minEditbox, 61, 57, 60, 255)
					SetEditBoxTextColor(ui.sliders[slider].minEditbox, 255, 255, 255)
					SetEditBoxDepth(ui.sliders[slider].minEditbox, GetSpriteDepth(ui.panels[a].background) - 2)
					SetTextString(ui.sliders[slider].toLabel, "to")
					SetTextAlignment(ui.sliders[slider].toLabel, 1)
					SetTextSize(ui.sliders[slider].toLabel, defaultTextSize#)
					SetTextDepth(ui.sliders[slider].toLabel, GetSpriteDepth(ui.panels[a].background) - 2)
					SetTextPosition(ui.sliders[slider].toLabel, GetSpriteX(ui.sliders[slider].container) + 260 - 60, GetSpriteY(ui.sliders[slider].container))	
					SetEditBoxText(ui.sliders[slider].maxEditbox, str(ui.sliders[slider].maxValue#, 0))
					SetEditBoxPosition(ui.sliders[slider].maxEditbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
					SetEditBoxSize(ui.sliders[slider].maxEditbox, 45, GetEditBoxHeight(ui.sliders[slider].maxEditbox))
					SetEditBoxBorderSize(ui.sliders[slider].maxEditbox, 1)
					SetEditBoxBorderColor(ui.sliders[slider].maxEditbox, 90, 88, 91, 255)
					SetEditBoxInputType(ui.sliders[slider].maxEditbox, 1)
					SetEditBoxBackgroundColor(ui.sliders[slider].maxEditbox, 61, 57, 60, 255)
					SetEditBoxTextColor(ui.sliders[slider].maxEditbox, 255, 255, 255)
					SetEditBoxDepth(ui.sliders[slider].maxEditbox, GetSpriteDepth(ui.panels[a].background) - 2)
				endif
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				if (ui.sliders[slider].rangeSlider = 0)
					SetSpriteSize(ui.sliders[slider].handle, 15, 15)
					percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
					handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
					SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
					SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
					SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 4)
				endif
				if (ui.sliders[slider].rangeSlider = 1)
					SetSpriteSize(ui.sliders[slider].minHandle, 15, 15)
					percentage# = ((ui.sliders[slider].minValue# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
					handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].minHandle)) / 100.0) * percentage#
					SetSpritePositionByOffset(ui.sliders[slider].minHandle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].minHandle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
					SetSpriteColor(ui.sliders[slider].minHandle, 147, 145, 147, 255)
					SetSpriteDepth(ui.sliders[slider].minHandle, GetSpriteDepth(ui.panels[a].background) - 4)
					SetSpriteSize(ui.sliders[slider].maxHandle, 15, 15)
					percentage# = ((ui.sliders[slider].maxValue# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
					handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].maxHandle)) / 100.0) * percentage#
					SetSpritePositionByOffset(ui.sliders[slider].maxHandle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].maxHandle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
					SetSpriteColor(ui.sliders[slider].maxHandle, 147, 145, 147, 255)
					SetSpriteDepth(ui.sliders[slider].maxHandle, GetSpriteDepth(ui.panels[a].background) - 5)
				endif
				if (ui.sliders[slider].rangeSlider = 0)
					if (ui.sliders[slider].activeTrackFromCentre = 0)
						SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
					else
						SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
						if (ui.sliders[slider].value# < 0)
							SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
						else
							SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
						endif	
					endif
				endif
				if (ui.sliders[slider].rangeSlider = 1)
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].maxHandle) - GetSpriteXByOffset(ui.sliders[slider].minHandle)), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].minHandle), GetSpriteY(ui.sliders[slider].container) + 27)
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 3)
				
				remstart
				checkbox = 0
				ui.checkboxes[checkbox].name$ = "FaceDirectionMoving"
				ui.checkboxes[checkbox].value = 1
				SetSpritePosition(ui.checkboxes[checkbox].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[8].container) + GetSpriteHeight(ui.sliders[8].container) + 14)
				SetSpriteSize(ui.checkboxes[checkbox].container, 260, 20)
				SetSpriteColor(ui.checkboxes[checkbox].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.checkboxes[checkbox].container, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpriteSize(ui.checkboxes[checkbox].background, 15, 15)
				//SetSpriteColor(ui.checkboxes[checkbox].background, 90, 90, 90, 255)
				SetSpriteColor(ui.checkboxes[checkbox].background, 211, 157, 5, 255)
				SetSpriteDepth(ui.checkboxes[checkbox].background, GetSpriteDepth(ui.checkboxes[checkbox].container) - 2)
				SetSpritePosition(ui.checkboxes[checkbox].background, GetSpriteX(ui.checkboxes[checkbox].container), GetSpriteY(ui.checkboxes[checkbox].container))
				SetSpriteSize(ui.checkboxes[checkbox].foreground, 15, 15)
				SetSpriteDepth(ui.checkboxes[checkbox].foreground, GetSpriteDepth(ui.checkboxes[checkbox].container) - 3)
				SetSpritePosition(ui.checkboxes[checkbox].foreground, GetSpriteX(ui.checkboxes[checkbox].background), GetSpriteY(ui.checkboxes[checkbox].background))
				SetTextString(ui.checkboxes[checkbox].label, "Face Direction Moving")
				SetTextSize(ui.checkboxes[checkbox].label, defaultTextSize#)
				SetTextDepth(ui.checkboxes[checkbox].label, GetSpriteDepth(ui.checkboxes[checkbox].container))
				SetTextPosition(ui.checkboxes[checkbox].label, GetSpriteX(ui.checkboxes[checkbox].background) + GetSpriteWidth(ui.checkboxes[checkbox].background) + 8, GetSpriteYByOffset(ui.checkboxes[checkbox].background) - (GetTextTotalHeight(ui.checkboxes[checkbox].label) / 2))
				remend
				
				checkbox = 0
				ui.checkboxes[checkbox].name$ = "DebugShowStartingZone"
				//ui.checkboxes[checkbox].value = 0
				//SetSpritePosition(ui.checkboxes[checkbox].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.checkboxes[checkbox - 1].container) + GetSpriteHeight(ui.checkboxes[checkbox - 1].container) + 14)
				SetSpritePosition(ui.checkboxes[checkbox].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[8].container) + GetSpriteHeight(ui.sliders[8].container) + 14)
				SetSpriteSize(ui.checkboxes[checkbox].container, 260, 20)
				SetSpriteColor(ui.checkboxes[checkbox].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.checkboxes[checkbox].container, GetSpriteDepth(ui.panels[a].background))
				FixSpriteToScreen(ui.checkboxes[checkbox].container, 1)
				SetSpriteSize(ui.checkboxes[checkbox].background, 15, 15)
				SetSpriteColor(ui.checkboxes[checkbox].background, 90, 90, 90, 255)
				//SetSpriteColor(ui.checkboxes[checkbox].background, 211, 157, 5, 255)
				SetSpriteDepth(ui.checkboxes[checkbox].background, GetSpriteDepth(ui.checkboxes[checkbox].container) - 2)
				SetSpritePosition(ui.checkboxes[checkbox].background, GetSpriteX(ui.checkboxes[checkbox].container), GetSpriteY(ui.checkboxes[checkbox].container))
				FixSpriteToScreen(ui.checkboxes[checkbox].background, 1)
				SetSpriteSize(ui.checkboxes[checkbox].foreground, 15, 15)
				SetSpriteDepth(ui.checkboxes[checkbox].foreground, GetSpriteDepth(ui.checkboxes[checkbox].container) - 3)
				SetSpritePosition(ui.checkboxes[checkbox].foreground, GetSpriteX(ui.checkboxes[checkbox].background), GetSpriteY(ui.checkboxes[checkbox].background))
				FixSpriteToScreen(ui.checkboxes[checkbox].foreground, 1)
				SetTextString(ui.checkboxes[checkbox].label, "Debug: Show Starting Zone")
				SetTextSize(ui.checkboxes[checkbox].label, defaultTextSize#)
				SetTextDepth(ui.checkboxes[checkbox].label, GetSpriteDepth(ui.checkboxes[checkbox].container) - 2)
				SetTextPosition(ui.checkboxes[checkbox].label, GetSpriteX(ui.checkboxes[checkbox].background) + GetSpriteWidth(ui.checkboxes[checkbox].background) + 8, GetSpriteYByOffset(ui.checkboxes[checkbox].background) - (GetTextTotalHeight(ui.checkboxes[checkbox].label) / 2))
				FixTextToScreen(ui.checkboxes[checkbox].label, 1)
				
				for subHeader = 0 to ui.panels[a].subHeaders.length
					DeleteSprite(ui.panels[a].subHeaders[subHeader].container)
					DeleteText(ui.panels[a].subHeaders[subHeader].label)
					DeleteSprite(ui.panels[a].subHeaders[subHeader].divider)
				next
				
				ui.panels[a].subHeaders.insert(blankSubHeader)
				subHeader = ui.panels[a].subHeaders.length
				ui.panels[a].subHeaders[subHeader].container = CreateSprite(0)
				SetSpriteSize(ui.panels[a].subHeaders[subHeader].container, panelWidth#, 30)
				SetSpriteColor(ui.panels[a].subHeaders[subHeader].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.panels[a].subHeaders[subHeader].container, GetSpriteDepth(ui.panels[a].background))
				SetSpritePosition(ui.panels[a].subHeaders[subHeader].container, GetSpriteX(ui.panels[a].background), GetSpriteY(ui.checkboxes[0].container) + GetSpriteHeight(ui.checkboxes[0].container) + 10)
				FixSpriteToScreen(ui.panels[a].subHeaders[subHeader].container, 1)
				ui.panels[a].subHeaders[subHeader].label = CreateText("Key Frames")
				SetTextSize(ui.panels[a].subHeaders[subHeader].label, defaultTextSize# + 2)
				//SetTextColor(ui.panels[a].subHeaders[subHeader].label, 190, 190, 190, 255)
				//SetTextBold(ui.panels[a].subHeaders[subHeader].label, 1)
				SetTextDepth(ui.panels[a].subHeaders[subHeader].label, GetSpriteDepth(ui.panels[a].subHeaders[subHeader].container) - 2)
				//SetTextAlignment(ui.panels[a].subHeaders[subHeader].label, 0)
				SetTextPosition(ui.panels[a].subHeaders[subHeader].label, GetSpriteX(ui.panels[a].background) + 20, GetSpriteYByOffset(ui.panels[a].subHeaders[subHeader].container) - (GetTextTotalHeight(ui.panels[a].subHeaders[subHeader].label) / 2))
				FixTextToScreen(ui.panels[a].subHeaders[subHeader].label, 1)
				//ui.panels[a].subHeaders[subHeader].divider = CreateSprite(0)
				//SetSpriteColor(ui.panels[a].subHeaders[subHeader].divider, 71, 75, 76, 255)
				//SetSpriteDepth(ui.panels[a].subHeaders[subHeader].divider, GetSpriteDepth(ui.panels[a].subHeaders[subHeader].container) - 2)
				//SetSpriteSize(ui.panels[a].subHeaders[subHeader].divider, panelWidth#, 1)
				//SetSpritePosition(ui.panels[a].subHeaders[subHeader].divider, GetSpriteX(ui.panels[a].background), GetSpriteY(ui.panels[a].subHeaders[subHeader].container) + GetSpriteHeight(ui.panels[a].subHeaders[subHeader].container))
				//FixSpriteToScreen(ui.panels[a].subHeaders[subHeader].divider, 1)
				
				for keyFrame = 0 to particlesKeyFrames.length
					if (particlesKeyFrames[keyFrame].group$ = "Color")
						particlesKeyFrames[keyFrame].alphaMin# = 0
						particlesKeyFrames[keyFrame].alphaMax# = 255
						particlesKeyFrames[keyFrame].blueMin# = 0
						particlesKeyFrames[keyFrame].blueMax# = 255
						particlesKeyFrames[keyFrame].greenMin# = 0
						particlesKeyFrames[keyFrame].greenMax# = 255
						particlesKeyFrames[keyFrame].redMin# = 0
						particlesKeyFrames[keyFrame].redMax# = 255
						particlesKeyFrames[keyFrame].timeMin# = 0
						particlesKeyFrames[keyFrame].timeMax# = 999
						particlesKeyFrames[keyFrame].container = CreateSprite(0)
						SetSpriteSize(particlesKeyFrames[keyFrame].container, 260, 38)
						if (keyFrame = 0)
							SetSpritePosition(particlesKeyFrames[keyFrame].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.panels[a].subHeaders[0].container) + GetSpriteHeight(ui.panels[a].subHeaders[0].container) + 10)
						else
							SetSpritePosition(particlesKeyFrames[keyFrame].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(particlesKeyFrames[keyFrame - 1].container) + GetSpriteHeight(particlesKeyFrames[keyFrame - 1].container) + 12)
						endif
						SetSpriteColor(particlesKeyFrames[keyFrame].container, 255, 0, 0, 0)
						SetSpriteDepth(particlesKeyFrames[keyFrame].container, GetSpriteDepth(ui.panels[a].background))
						FixSpriteToScreen(particlesKeyFrames[keyFrame].container, 1)
						particlesKeyFrames[keyFrame].timeLabel = CreateText("Time")
						SetTextSize(particlesKeyFrames[keyFrame].timeLabel, defaultTextSize#)
						SetTextPosition(particlesKeyFrames[keyFrame].timeLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 0), GetSpriteY(particlesKeyFrames[keyFrame].container))
						SetTextDepth(particlesKeyFrames[keyFrame].timeLabel, GetSpriteDepth(ui.panels[a].background) - 2)
						FixTextToScreen(particlesKeyFrames[keyFrame].timeLabel, 1)
						particlesKeyFrames[keyFrame].timeEditbox = CreateEditBox()
						SetEditBoxText(particlesKeyFrames[keyFrame].timeEditbox, str(particlesKeyFrames[keyFrame].timeValue#, 2))
						SetEditBoxSize(particlesKeyFrames[keyFrame].timeEditbox, 41, GetEditBoxHeight(particlesKeyFrames[keyFrame].timeEditbox))
						SetEditBoxPosition(particlesKeyFrames[keyFrame].timeEditbox, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 0), GetSpriteY(particlesKeyFrames[keyFrame].container) + GetSpriteHeight(particlesKeyFrames[keyFrame].container) - GetEditBoxHeight(particlesKeyFrames[keyFrame].timeEditbox))
						SetEditBoxBorderSize(particlesKeyFrames[keyFrame].timeEditbox, 1)
						SetEditBoxBorderColor(particlesKeyFrames[keyFrame].timeEditbox, 90, 88, 91, 255)
						SetEditBoxInputType(particlesKeyFrames[keyFrame].timeEditbox, 1)
						SetEditBoxBackgroundColor(particlesKeyFrames[keyFrame].timeEditbox, 61, 57, 60, 255)
						SetEditBoxTextColor(particlesKeyFrames[keyFrame].timeEditbox, 255, 255, 255)
						SetEditBoxDepth(particlesKeyFrames[keyFrame].timeEditbox, GetSpriteDepth(ui.panels[a].background) - 2)
						FixEditBoxToScreen(particlesKeyFrames[keyFrame].timeEditbox, 1)
						particlesKeyFrames[keyFrame].redLabel = CreateText("Red")
						SetTextSize(particlesKeyFrames[keyFrame].redLabel, defaultTextSize#)
						SetTextPosition(particlesKeyFrames[keyFrame].redLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 1), GetSpriteY(particlesKeyFrames[keyFrame].container))
						SetTextDepth(particlesKeyFrames[keyFrame].redLabel, GetSpriteDepth(ui.panels[a].background) - 2)
						FixTextToScreen(particlesKeyFrames[keyFrame].redLabel, 1)
						particlesKeyFrames[keyFrame].redEditbox = CreateEditBox()
						SetEditBoxText(particlesKeyFrames[keyFrame].redEditbox, str(particlesKeyFrames[keyFrame].redValue#, 0))
						SetEditBoxSize(particlesKeyFrames[keyFrame].redEditbox, 41, GetEditBoxHeight(particlesKeyFrames[keyFrame].redEditbox))
						SetEditBoxPosition(particlesKeyFrames[keyFrame].redEditbox, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 1), GetSpriteY(particlesKeyFrames[keyFrame].container) + GetSpriteHeight(particlesKeyFrames[keyFrame].container) - GetEditBoxHeight(particlesKeyFrames[keyFrame].redEditbox))
						SetEditBoxBorderSize(particlesKeyFrames[keyFrame].redEditbox, 1)
						SetEditBoxBorderColor(particlesKeyFrames[keyFrame].redEditbox, 90, 88, 91, 255)
						SetEditBoxInputType(particlesKeyFrames[keyFrame].redEditbox, 1)
						SetEditBoxBackgroundColor(particlesKeyFrames[keyFrame].redEditbox, 61, 57, 60, 255)
						SetEditBoxTextColor(particlesKeyFrames[keyFrame].redEditbox, 255, 255, 255)
						SetEditBoxDepth(particlesKeyFrames[keyFrame].redEditbox, GetSpriteDepth(ui.panels[a].background) - 2)
						FixEditBoxToScreen(particlesKeyFrames[keyFrame].redEditbox, 1)
						particlesKeyFrames[keyFrame].greenLabel = CreateText("Green")
						SetTextSize(particlesKeyFrames[keyFrame].greenLabel, defaultTextSize#)
						SetTextPosition(particlesKeyFrames[keyFrame].greenLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 2), GetSpriteY(particlesKeyFrames[keyFrame].container))
						SetTextDepth(particlesKeyFrames[keyFrame].greenLabel, GetSpriteDepth(ui.panels[a].background) - 2)
						FixTextToScreen(particlesKeyFrames[keyFrame].greenLabel, 1)
						particlesKeyFrames[keyFrame].greenEditbox = CreateEditBox()
						SetEditBoxText(particlesKeyFrames[keyFrame].greenEditbox, str(particlesKeyFrames[keyFrame].greenValue#, 0))
						SetEditBoxSize(particlesKeyFrames[keyFrame].greenEditbox, 41, GetEditBoxHeight(particlesKeyFrames[keyFrame].greenEditbox))
						SetEditBoxPosition(particlesKeyFrames[keyFrame].greenEditbox, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 2), GetSpriteY(particlesKeyFrames[keyFrame].container) + GetSpriteHeight(particlesKeyFrames[keyFrame].container) - GetEditBoxHeight(particlesKeyFrames[keyFrame].greenEditbox))
						SetEditBoxBorderSize(particlesKeyFrames[keyFrame].greenEditbox, 1)
						SetEditBoxBorderColor(particlesKeyFrames[keyFrame].greenEditbox, 90, 88, 91, 255)
						SetEditBoxInputType(particlesKeyFrames[keyFrame].greenEditbox, 1)
						SetEditBoxBackgroundColor(particlesKeyFrames[keyFrame].greenEditbox, 61, 57, 60, 255)
						SetEditBoxTextColor(particlesKeyFrames[keyFrame].greenEditbox, 255, 255, 255)
						SetEditBoxDepth(particlesKeyFrames[keyFrame].greenEditbox, GetSpriteDepth(ui.panels[a].background) - 2)
						FixEditBoxToScreen(particlesKeyFrames[keyFrame].greenEditbox, 1)
						particlesKeyFrames[keyFrame].blueLabel = CreateText("Blue")
						SetTextSize(particlesKeyFrames[keyFrame].blueLabel, defaultTextSize#)
						SetTextPosition(particlesKeyFrames[keyFrame].blueLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 3), GetSpriteY(particlesKeyFrames[keyFrame].container))
						SetTextDepth(particlesKeyFrames[keyFrame].blueLabel, GetSpriteDepth(ui.panels[a].background) - 2)
						FixTextToScreen(particlesKeyFrames[keyFrame].blueLabel, 1)
						particlesKeyFrames[keyFrame].blueEditbox = CreateEditBox()
						SetEditBoxText(particlesKeyFrames[keyFrame].blueEditbox, str(particlesKeyFrames[keyFrame].blueValue#, 0))
						SetEditBoxSize(particlesKeyFrames[keyFrame].blueEditbox, 41, GetEditBoxHeight(particlesKeyFrames[keyFrame].blueEditbox))
						SetEditBoxPosition(particlesKeyFrames[keyFrame].blueEditbox, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 3), GetSpriteY(particlesKeyFrames[keyFrame].container) + GetSpriteHeight(particlesKeyFrames[keyFrame].container) - GetEditBoxHeight(particlesKeyFrames[keyFrame].blueEditbox))
						SetEditBoxBorderSize(particlesKeyFrames[keyFrame].blueEditbox, 1)
						SetEditBoxBorderColor(particlesKeyFrames[keyFrame].blueEditbox, 90, 88, 91, 255)
						SetEditBoxInputType(particlesKeyFrames[keyFrame].blueEditbox, 1)
						SetEditBoxBackgroundColor(particlesKeyFrames[keyFrame].blueEditbox, 61, 57, 60, 255)
						SetEditBoxTextColor(particlesKeyFrames[keyFrame].blueEditbox, 255, 255, 255)
						SetEditBoxDepth(particlesKeyFrames[keyFrame].blueEditbox, GetSpriteDepth(ui.panels[a].background) - 2)
						FixEditBoxToScreen(particlesKeyFrames[keyFrame].blueEditbox, 1)
						particlesKeyFrames[keyFrame].alphaLabel = CreateText("Alpha")
						SetTextSize(particlesKeyFrames[keyFrame].alphaLabel, defaultTextSize#)
						SetTextPosition(particlesKeyFrames[keyFrame].alphaLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 4), GetSpriteY(particlesKeyFrames[keyFrame].container))
						SetTextDepth(particlesKeyFrames[keyFrame].alphaLabel, GetSpriteDepth(ui.panels[a].background) - 2)
						FixTextToScreen(particlesKeyFrames[keyFrame].alphaLabel, 1)
						particlesKeyFrames[keyFrame].alphaEditbox = CreateEditBox()
						SetEditBoxText(particlesKeyFrames[keyFrame].alphaEditbox, str(particlesKeyFrames[keyFrame].alphaValue#, 0))
						SetEditBoxSize(particlesKeyFrames[keyFrame].alphaEditbox, 41, GetEditBoxHeight(particlesKeyFrames[keyFrame].alphaEditbox))
						SetEditBoxPosition(particlesKeyFrames[keyFrame].alphaEditbox, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 4), GetSpriteY(particlesKeyFrames[keyFrame].container) + GetSpriteHeight(particlesKeyFrames[keyFrame].container) - GetEditBoxHeight(particlesKeyFrames[keyFrame].alphaEditbox))
						SetEditBoxBorderSize(particlesKeyFrames[keyFrame].alphaEditbox, 1)
						SetEditBoxBorderColor(particlesKeyFrames[keyFrame].alphaEditbox, 90, 88, 91, 255)
						SetEditBoxInputType(particlesKeyFrames[keyFrame].alphaEditbox, 1)
						SetEditBoxBackgroundColor(particlesKeyFrames[keyFrame].alphaEditbox, 61, 57, 60, 255)
						SetEditBoxTextColor(particlesKeyFrames[keyFrame].alphaEditbox, 255, 255, 255)
						SetEditBoxDepth(particlesKeyFrames[keyFrame].alphaEditbox, GetSpriteDepth(ui.panels[a].background) - 2)
						FixEditBoxToScreen(particlesKeyFrames[keyFrame].alphaEditbox, 1)
						particlesKeyFrames[keyFrame].deleteIcon = CreateSprite(GetIconImageID("delete"))
						SetSpriteColor(particlesKeyFrames[keyFrame].deleteIcon, 147, 145, 147, 255)
						SetSpriteSize(particlesKeyFrames[keyFrame].deleteIcon, 20, 20)
						SetSpritePosition(particlesKeyFrames[keyFrame].deleteIcon, GetSpriteX(particlesKeyFrames[keyFrame].container) + GetSpriteWidth(particlesKeyFrames[keyFrame].container) - GetSpriteWidth(particlesKeyFrames[keyFrame].deleteIcon), GetEditBoxY(particlesKeyFrames[keyFrame].alphaEditbox) + (GetEditBoxHeight(particlesKeyFrames[keyFrame].alphaEditbox) / 2) - (GetSpriteHeight(particlesKeyFrames[keyFrame].deleteIcon) / 2))
						FixSpriteToScreen(particlesKeyFrames[keyFrame].deleteIcon, 1)
					endif
					if (particlesKeyFrames[keyFrame].group$ = "Scale")
						particlesKeyFrames[keyFrame].scaleMin# = 0
						particlesKeyFrames[keyFrame].scaleMax# = 255
						particlesKeyFrames[keyFrame].timeMin# = 0
						particlesKeyFrames[keyFrame].timeMax# = 999
						particlesKeyFrames[keyFrame].container = CreateSprite(0)
						SetSpriteSize(particlesKeyFrames[keyFrame].container, 260, 38)
						if (keyFrame = 0)
							SetSpritePosition(particlesKeyFrames[keyFrame].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.panels[a].subHeaders[0].container) + GetSpriteHeight(ui.panels[a].subHeaders[0].container) + 10)
						else
							SetSpritePosition(particlesKeyFrames[keyFrame].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(particlesKeyFrames[keyFrame - 1].container) + GetSpriteHeight(particlesKeyFrames[keyFrame - 1].container) + 12)
						endif
						SetSpriteColor(particlesKeyFrames[keyFrame].container, 255, 0, 0, 0)
						SetSpriteDepth(particlesKeyFrames[keyFrame].container, GetSpriteDepth(ui.panels[a].background))
						FixSpriteToScreen(particlesKeyFrames[keyFrame].container, 1)
						particlesKeyFrames[keyFrame].timeLabel = CreateText("Time")
						SetTextSize(particlesKeyFrames[keyFrame].timeLabel, defaultTextSize#)
						SetTextPosition(particlesKeyFrames[keyFrame].timeLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 0), GetSpriteY(particlesKeyFrames[keyFrame].container))
						SetTextDepth(particlesKeyFrames[keyFrame].timeLabel, GetSpriteDepth(ui.panels[a].background) - 2)
						FixTextToScreen(particlesKeyFrames[keyFrame].timeLabel, 1)
						particlesKeyFrames[keyFrame].timeEditbox = CreateEditBox()
						SetEditBoxText(particlesKeyFrames[keyFrame].timeEditbox, str(particlesKeyFrames[keyFrame].timeValue#, 2))
						SetEditBoxSize(particlesKeyFrames[keyFrame].timeEditbox, 41, GetEditBoxHeight(particlesKeyFrames[keyFrame].timeEditbox))
						SetEditBoxPosition(particlesKeyFrames[keyFrame].timeEditbox, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 0), GetSpriteY(particlesKeyFrames[keyFrame].container) + GetSpriteHeight(particlesKeyFrames[keyFrame].container) - GetEditBoxHeight(particlesKeyFrames[keyFrame].timeEditbox))
						SetEditBoxBorderSize(particlesKeyFrames[keyFrame].timeEditbox, 1)
						SetEditBoxBorderColor(particlesKeyFrames[keyFrame].timeEditbox, 90, 88, 91, 255)
						SetEditBoxInputType(particlesKeyFrames[keyFrame].timeEditbox, 1)
						SetEditBoxBackgroundColor(particlesKeyFrames[keyFrame].timeEditbox, 61, 57, 60, 255)
						SetEditBoxTextColor(particlesKeyFrames[keyFrame].timeEditbox, 255, 255, 255)
						SetEditBoxDepth(particlesKeyFrames[keyFrame].timeEditbox, GetSpriteDepth(ui.panels[a].background) - 2)
						FixEditBoxToScreen(particlesKeyFrames[keyFrame].timeEditbox, 1)
						particlesKeyFrames[keyFrame].scaleLabel = CreateText("Scale")
						SetTextSize(particlesKeyFrames[keyFrame].scaleLabel, defaultTextSize#)
						SetTextPosition(particlesKeyFrames[keyFrame].scaleLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 1), GetSpriteY(particlesKeyFrames[keyFrame].container))
						SetTextDepth(particlesKeyFrames[keyFrame].scaleLabel, GetSpriteDepth(ui.panels[a].background) - 2)
						FixTextToScreen(particlesKeyFrames[keyFrame].scaleLabel, 1)
						particlesKeyFrames[keyFrame].scaleEditbox = CreateEditBox()
						SetEditBoxText(particlesKeyFrames[keyFrame].scaleEditbox, str(particlesKeyFrames[keyFrame].scaleValue#, 2))
						SetEditBoxSize(particlesKeyFrames[keyFrame].scaleEditbox, 41, GetEditBoxHeight(particlesKeyFrames[keyFrame].scaleEditbox))
						SetEditBoxPosition(particlesKeyFrames[keyFrame].scaleEditbox, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 1), GetSpriteY(particlesKeyFrames[keyFrame].container) + GetSpriteHeight(particlesKeyFrames[keyFrame].container) - GetEditBoxHeight(particlesKeyFrames[keyFrame].scaleEditbox))
						SetEditBoxBorderSize(particlesKeyFrames[keyFrame].scaleEditbox, 1)
						SetEditBoxBorderColor(particlesKeyFrames[keyFrame].scaleEditbox, 90, 88, 91, 255)
						SetEditBoxInputType(particlesKeyFrames[keyFrame].scaleEditbox, 1)
						SetEditBoxBackgroundColor(particlesKeyFrames[keyFrame].scaleEditbox, 61, 57, 60, 255)
						SetEditBoxTextColor(particlesKeyFrames[keyFrame].scaleEditbox, 255, 255, 255)
						SetEditBoxDepth(particlesKeyFrames[keyFrame].scaleEditbox, GetSpriteDepth(ui.panels[a].background) - 2)
						FixEditBoxToScreen(particlesKeyFrames[keyFrame].scaleEditbox, 1)
						particlesKeyFrames[keyFrame].deleteIcon = CreateSprite(GetIconImageID("delete"))
						SetSpriteColor(particlesKeyFrames[keyFrame].deleteIcon, 147, 145, 147, 255)
						SetSpriteSize(particlesKeyFrames[keyFrame].deleteIcon, 20, 20)
						SetSpritePosition(particlesKeyFrames[keyFrame].deleteIcon, GetSpriteX(particlesKeyFrames[keyFrame].container) + GetSpriteWidth(particlesKeyFrames[keyFrame].container) - GetSpriteWidth(particlesKeyFrames[keyFrame].deleteIcon), GetEditBoxY(particlesKeyFrames[keyFrame].scaleEditbox) + (GetEditBoxHeight(particlesKeyFrames[keyFrame].scaleEditbox) / 2) - (GetSpriteHeight(particlesKeyFrames[keyFrame].deleteIcon) / 2))
						FixSpriteToScreen(particlesKeyFrames[keyFrame].deleteIcon, 1)
					endif
				next
				
				for b = 0 to ui.panels[a].buttons.length
					buttonHeight# = 20
					buttonWidth# = 120
					buttonX# = GetSpriteX(ui.panels[a].invisibleDragZone) + 20 + (buttonWidth# * b) + (b * 10)
					if (particlesKeyFrames.length >= 0)
						buttonY# = GetSpriteY(particlesKeyFrames[particlesKeyFrames.length].container) + GetSpriteHeight(particlesKeyFrames[particlesKeyFrames.length].container) + 20
					else
						buttonY# = GetSpriteY(ui.panels[a].subHeaders[0].container) + GetSpriteHeight(ui.panels[a].subHeaders[0].container) + 10
					endif	
					labelX# = 0
					labelY# = 0
					SetSpriteSize(ui.panels[a].buttons[b].background, buttonWidth#, buttonHeight#)
					SetSpritePosition(ui.panels[a].buttons[b].background, buttonX#, buttonY#)
					FixSpriteToScreen(ui.panels[a].buttons[b].background, 1)
					SetTextAlignment(ui.panels[a].buttons[b].label, 1)
					SetTextSize(ui.panels[a].buttons[b].label, defaultTextSize#)
					SetTextPosition(ui.panels[a].buttons[b].label, GetSpriteXByOffset(ui.panels[a].buttons[b].background), GetSpriteYByOffset(ui.panels[a].buttons[b].background) - (GetTextTotalHeight(ui.panels[a].buttons[b].label) / 2))
					FixTextToScreen(ui.panels[a].buttons[b].label, 1)
					ui.panels[a].contentHeight# = GetSpriteY(ui.panels[a].buttons[b].background) + GetSpriteHeight(ui.panels[a].buttons[b].background) + 200
				next
				
				SetSpriteSize(ui.panels[a].invisibleDragZone, GetSpriteWidth(ui.panels[a].invisibleDragZone), ui.panels[a].contentHeight#)
				attachedTo = ui.panels[a].invisibleDragZone
				contentHeight# = ui.panels[a].contentHeight#
				panelID = ui.panels[a].background
				trackSize# = GetWindowHeight() - topPanelHeight#
				UpdatePanelVerticalScrollBar(ui.panels[a].verticalScrollBar, panelID, attachedTo, trackSize#, contentHeight#)
				FixSpriteToScreen(ui.panels[a].verticalScrollBar, 1)
	
				remstart
				ui.sliders[slider].name$ = "StartZoneY"
				ui.sliders[slider].min# = -400
				ui.sliders[slider].minValue# = -20
				ui.sliders[slider].max# = 400
				ui.sliders[slider].maxValue# = 20
				ui.sliders[slider].value# = 0
				ui.sliders[slider].activeTrackFromCentre = 0
				ui.sliders[slider].rangeSlider = 1
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 37)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background))
				SetTextString(ui.sliders[slider].label, "Start Zone Y")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				if (ui.sliders[slider].rangeSlider = 0)
					SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
					SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
					SetEditBoxSize(ui.sliders[slider].editbox, 45, GetEditBoxHeight(ui.sliders[slider].editbox))
					SetEditBoxBorderSize(ui.sliders[slider].editbox, 0)
					SetEditBoxInputType(ui.sliders[slider].editbox, 1)
					SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 90, 88, 91, 255)
					SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
					SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 2)
				endif
				if (ui.sliders[slider].rangeSlider = 1)
					SetEditBoxText(ui.sliders[slider].minEditbox, str(ui.sliders[slider].minValue#, 0))
					SetEditBoxPosition(ui.sliders[slider].minEditbox, GetSpriteX(ui.sliders[slider].container) + 260 - 115, GetSpriteY(ui.sliders[slider].container))
					SetEditBoxSize(ui.sliders[slider].minEditbox, 45, GetEditBoxHeight(ui.sliders[slider].minEditbox))
					SetEditBoxBorderSize(ui.sliders[slider].minEditbox, 0)
					SetEditBoxInputType(ui.sliders[slider].minEditbox, 1)
					SetEditBoxBackgroundColor(ui.sliders[slider].minEditbox, 90, 88, 91, 255)
					SetEditBoxTextColor(ui.sliders[slider].minEditbox, 255, 255, 255)
					SetEditBoxDepth(ui.sliders[slider].minEditbox, GetSpriteDepth(ui.panels[a].background) - 2)
					SetTextString(ui.sliders[slider].toLabel, "to")
					SetTextAlignment(ui.sliders[slider].toLabel, 1)
					SetTextSize(ui.sliders[slider].toLabel, defaultTextSize#)
					SetTextDepth(ui.sliders[slider].toLabel, GetSpriteDepth(ui.panels[a].background) - 2)
					SetTextPosition(ui.sliders[slider].toLabel, GetSpriteX(ui.sliders[slider].container) + 260 - 60, GetSpriteY(ui.sliders[slider].container))	
					SetEditBoxText(ui.sliders[slider].maxEditbox, str(ui.sliders[slider].maxValue#, 0))
					SetEditBoxPosition(ui.sliders[slider].maxEditbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
					SetEditBoxSize(ui.sliders[slider].maxEditbox, 45, GetEditBoxHeight(ui.sliders[slider].maxEditbox))
					SetEditBoxBorderSize(ui.sliders[slider].maxEditbox, 0)
					SetEditBoxInputType(ui.sliders[slider].maxEditbox, 1)
					SetEditBoxBackgroundColor(ui.sliders[slider].maxEditbox, 90, 88, 91, 255)
					SetEditBoxTextColor(ui.sliders[slider].maxEditbox, 255, 255, 255)
					SetEditBoxDepth(ui.sliders[slider].maxEditbox, GetSpriteDepth(ui.panels[a].background) - 2)
				endif
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				if (ui.sliders[slider].rangeSlider = 0)
					SetSpriteSize(ui.sliders[slider].handle, 15, 15)
					percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
					handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
					SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
					SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
					SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 4)
				endif
				if (ui.sliders[slider].rangeSlider = 1)
					SetSpriteSize(ui.sliders[slider].minHandle, 15, 15)
					percentage# = ((ui.sliders[slider].minValue# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
					handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].minHandle)) / 100.0) * percentage#
					SetSpritePositionByOffset(ui.sliders[slider].minHandle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].minHandle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
					SetSpriteColor(ui.sliders[slider].minHandle, 147, 145, 147, 255)
					SetSpriteDepth(ui.sliders[slider].minHandle, GetSpriteDepth(ui.panels[a].background) - 4)
					SetSpriteSize(ui.sliders[slider].maxHandle, 15, 15)
					percentage# = ((ui.sliders[slider].maxValue# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
					handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].maxHandle)) / 100.0) * percentage#
					SetSpritePositionByOffset(ui.sliders[slider].maxHandle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].maxHandle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
					SetSpriteColor(ui.sliders[slider].maxHandle, 147, 145, 147, 255)
					SetSpriteDepth(ui.sliders[slider].maxHandle, GetSpriteDepth(ui.panels[a].background) - 5)
				endif
				if (ui.sliders[slider].rangeSlider = 0)
					if (ui.sliders[slider].activeTrackFromCentre = 0)
						SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
					else
						SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
						if (ui.sliders[slider].value# < 0)
							SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
						else
							SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
						endif	
					endif
				endif
				if (ui.sliders[slider].rangeSlider = 1)
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].maxHandle) - GetSpriteXByOffset(ui.sliders[slider].minHandle)), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].minHandle), GetSpriteY(ui.sliders[slider].container) + 27)
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 3)
				remend
				
				
				remstart
				AddParticlesForce ( ID, starttime, endtime, x, y )
				AddParticlesScaleKeyFrame ( ID, time, scale )
				SetParticlesRotationRange ( ID, angle1, angle2 )
				SetParticlesStartZone ( ID, x1, y1, x2, y2 )
				SetParticlesVelocityRange ( ID, v1, v2 )
				remend
			endif
			if (selectedCategory = CATEGORY_SINE_WAVES)
				imageLoader = 0
				ui.imageLoaders[imageLoader].name$ = "Image"
				SetSpritePosition(ui.imageLoaders[imageLoader].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.panels[a].background) + 10 + 40)
				SetSpriteSize(ui.imageLoaders[imageLoader].container, 260, 100)
				SetSpriteColor(ui.imageLoaders[imageLoader].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.imageLoaders[imageLoader].container, GetSpriteDepth(ui.panels[a].background))
				SetTextSize(ui.imageLoaders[imageLoader].label, defaultTextSize#)
				SetTextString(ui.imageLoaders[imageLoader].label, "Image")
				SetTextPosition(ui.imageLoaders[imageLoader].label, GetSpriteX(ui.imageLoaders[imageLoader].container), GetSpriteY(ui.imageLoaders[imageLoader].container))
				SetTextDepth(ui.imageLoaders[imageLoader].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePosition(ui.imageLoaders[imageLoader].imageBorder, GetSpriteX(ui.imageLoaders[imageLoader].container), GetSpriteY(ui.imageLoaders[imageLoader].container) + 20)
				SetSpriteSize(ui.imageLoaders[imageLoader].imageBorder, 100, 80)
				SetSpriteColor(ui.imageLoaders[imageLoader].imageBorder, 116, 116, 116, 255)
				SetSpriteDepth(ui.imageLoaders[imageLoader].imageBorder, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePositionByOffset(ui.imageLoaders[imageLoader].imageBackground, GetSpriteXByOffset(ui.imageLoaders[imageLoader].imageBorder), GetSpriteYByOffset(ui.imageLoaders[imageLoader].imageBorder))
				SetSpriteSize(ui.imageLoaders[imageLoader].imageBackground, 98, 78)
				SetSpriteColor(ui.imageLoaders[imageLoader].imageBackground, 28, 24, 27, 255)
				SetSpriteDepth(ui.imageLoaders[imageLoader].imageBackground, GetSpriteDepth(ui.panels[a].background) - 3)
				SetSpritePositionByOffset(ui.imageLoaders[imageLoader].image, GetSpriteXByOffset(ui.imageLoaders[imageLoader].imageBorder), GetSpriteYByOffset(ui.imageLoaders[imageLoader].imageBorder))
				if (ui.imageLoaders[imageLoader].value > 0)
					SetSpriteSize(ui.imageLoaders[imageLoader].image, 70, 70)
				else
					SetSpriteSize(ui.imageLoaders[imageLoader].image, 50, 50)
				endif
				SetSpriteImage(ui.imageLoaders[imageLoader].image, ui.imageLoaders[imageLoader].value)
				SetSpriteDepth(ui.imageLoaders[imageLoader].image, GetSpriteDepth(ui.panels[a].background) - 4)
				SetSpriteSize(ui.imageLoaders[imageLoader].importButton.background, 145, 20)
				SetSpritePosition(ui.imageLoaders[imageLoader].importButton.background, GetSpriteX(ui.imageLoaders[imageLoader].imageBorder) + GetSpriteWidth(ui.imageLoaders[imageLoader].imageBorder) + 10, GetSpriteY(ui.imageLoaders[imageLoader].imageBorder) + 15)
				SetSpriteColor(ui.imageLoaders[imageLoader].importButton.background, 93, 89, 92, 255)
				SetSpriteDepth(ui.imageLoaders[imageLoader].importButton.background, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextAlignment(ui.imageLoaders[imageLoader].importButton.label, 1)
				SetTextSize(ui.imageLoaders[imageLoader].importButton.label, defaultTextSize#)
				SetTextPosition(ui.imageLoaders[imageLoader].importButton.label, GetSpriteXByOffset(ui.imageLoaders[imageLoader].importButton.background), GetSpriteYByOffset(ui.imageLoaders[imageLoader].importButton.background) - (GetTextTotalHeight(ui.imageLoaders[imageLoader].importButton.label) / 2))
				SetTextDepth(ui.imageLoaders[imageLoader].importButton.label, GetSpriteDepth(ui.panels[a].background) - 3)
				SetSpriteSize(ui.imageLoaders[imageLoader].removeButton.background, 145, 20)
				SetSpritePosition(ui.imageLoaders[imageLoader].removeButton.background, GetSpriteX(ui.imageLoaders[imageLoader].imageBorder) + GetSpriteWidth(ui.imageLoaders[imageLoader].imageBorder) + 10, GetSpriteY(ui.imageLoaders[imageLoader].imageBorder) + 45)
				SetSpriteColor(ui.imageLoaders[imageLoader].removeButton.background, 93, 89, 92, 255)
				SetSpriteDepth(ui.imageLoaders[imageLoader].removeButton.background, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextAlignment(ui.imageLoaders[imageLoader].removeButton.label, 1)
				SetTextSize(ui.imageLoaders[imageLoader].removeButton.label, defaultTextSize#)
				SetTextPosition(ui.imageLoaders[imageLoader].removeButton.label, GetSpriteXByOffset(ui.imageLoaders[imageLoader].removeButton.background), GetSpriteYByOffset(ui.imageLoaders[imageLoader].removeButton.background) - (GetTextTotalHeight(ui.imageLoaders[imageLoader].removeButton.label) / 2))
				SetTextDepth(ui.imageLoaders[imageLoader].removeButton.label, GetSpriteDepth(ui.panels[a].background) - 3)
				
				slider = 0
				ui.sliders[slider].name$ = "SpriteHeight"
				ui.sliders[slider].min# = 0
				ui.sliders[slider].max# = 500
				//ui.sliders[slider].value# = 100
				ui.sliders[slider].activeTrackFromCentre = 0
				ui.sliders[slider].rangeSlider = 0
				//SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.panels[a].background) + 10 + 40)
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.imageLoaders[0].container) + GetSpriteHeight(ui.imageLoaders[0].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 37)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background))
				SetTextString(ui.sliders[slider].label, "Sprite Height")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 45, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 1)
				SetEditBoxBorderColor(ui.sliders[slider].editbox, 90, 88, 91, 255)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 61, 57, 60, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 4)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 3)
				
				slider = 1
				ui.sliders[slider].name$ = "AngularFrequency"
				ui.sliders[slider].min# = 0
				ui.sliders[slider].max# = 10
				//ui.sliders[slider].value# = 1
				ui.sliders[slider].activeTrackFromCentre = 0
				ui.sliders[slider].rangeSlider = 0
				//SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.panels[a].background) + 10 + 40)
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 37)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background))
				SetTextString(ui.sliders[slider].label, "Angular Frequency")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 45, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 0)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 61, 57, 60, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 4)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 3)
				
				slider = 2
				ui.sliders[slider].name$ = "Amplitude"
				ui.sliders[slider].min# = 0
				ui.sliders[slider].max# = 500
				//ui.sliders[slider].value# = 100
				ui.sliders[slider].activeTrackFromCentre = 0
				ui.sliders[slider].rangeSlider = 0
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 37)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background))
				SetTextString(ui.sliders[slider].label, "Amplitude")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 45, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 0)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 61, 57, 60, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 4)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 3)
				
				slider = 3
				ui.sliders[slider].name$ = "SpacingX"
				ui.sliders[slider].min# = -25
				ui.sliders[slider].max# = 25
				//ui.sliders[slider].value# = 1
				ui.sliders[slider].activeTrackFromCentre = 1
				ui.sliders[slider].rangeSlider = 0
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
				SetSpriteSize(ui.sliders[slider].container, 260, 37)
				SetSpriteColor(ui.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.sliders[slider].container, GetSpriteDepth(ui.panels[a].background))
				SetTextString(ui.sliders[slider].label, "Spacing X")
				SetTextSize(ui.sliders[slider].label, defaultTextSize#)
				SetTextDepth(ui.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 2)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				SetEditBoxText(ui.sliders[slider].editbox, str(ui.sliders[slider].value#, 0))
				SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				SetEditBoxSize(ui.sliders[slider].editbox, 45, GetEditBoxHeight(ui.sliders[slider].editbox))
				SetEditBoxBorderSize(ui.sliders[slider].editbox, 0)
				SetEditBoxInputType(ui.sliders[slider].editbox, 1)
				SetEditBoxBackgroundColor(ui.sliders[slider].editbox, 61, 57, 60, 255)
				SetEditBoxTextColor(ui.sliders[slider].editbox, 255, 255, 255)
				SetEditBoxDepth(ui.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				SetSpriteSize(ui.sliders[slider].inactiveTrack, 260 - 15, 4)
				SetSpriteColor(ui.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(ui.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpriteSize(ui.sliders[slider].handle, 15, 15)
				percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				SetSpriteColor(ui.sliders[slider].handle, 147, 145, 147, 255)
				SetSpriteDepth(ui.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 4)
				if (ui.sliders[slider].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteX(ui.sliders[slider].inactiveTrack), 4)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				else
					SetSpriteSize(ui.sliders[slider].activeTrack, abs(GetSpriteXByOffset(ui.sliders[slider].handle) - GetSpriteXByOffset(ui.sliders[slider].inactiveTrack)), 4)
					if (ui.sliders[slider].value# < 0)
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					else
						SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
					endif	
				endif
				SetSpriteColor(ui.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(ui.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 3)

				checkbox = 0
				ui.checkboxes[checkbox].name$ = "RotateAlongWave"
				//ui.checkboxes[checkbox].value = 1
				SetSpritePosition(ui.checkboxes[checkbox].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.sliders[2].container) + GetSpriteHeight(ui.sliders[3].container) + 14)
				SetSpriteSize(ui.checkboxes[checkbox].container, 260, 20)
				SetSpriteColor(ui.checkboxes[checkbox].container, 255, 255, 0, 0)
				SetSpriteDepth(ui.checkboxes[checkbox].container, GetSpriteDepth(ui.panels[a].background) - 2)
				SetSpriteSize(ui.checkboxes[checkbox].background, 15, 15)
				//SetSpriteColor(ui.checkboxes[checkbox].background, 90, 90, 90, 255)
				SetSpriteColor(ui.checkboxes[checkbox].background, 211, 157, 5, 255)
				SetSpriteDepth(ui.checkboxes[checkbox].background, GetSpriteDepth(ui.checkboxes[checkbox].container) - 2)
				SetSpritePosition(ui.checkboxes[checkbox].background, GetSpriteX(ui.checkboxes[checkbox].container), GetSpriteY(ui.checkboxes[checkbox].container))
				SetSpriteSize(ui.checkboxes[checkbox].foreground, 15, 15)
				SetSpriteDepth(ui.checkboxes[checkbox].foreground, GetSpriteDepth(ui.checkboxes[checkbox].container) - 2)
				SetSpritePosition(ui.checkboxes[checkbox].foreground, GetSpriteX(ui.checkboxes[checkbox].background), GetSpriteY(ui.checkboxes[checkbox].background))
				SetTextString(ui.checkboxes[checkbox].label, "Rotate along wave")
				SetTextSize(ui.checkboxes[checkbox].label, defaultTextSize#)
				SetTextDepth(ui.checkboxes[checkbox].label, GetSpriteDepth(ui.checkboxes[checkbox].container) - 2)
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
			SetTextSize(ui.panels[a].titleLabel, defaultTextSize# * 2.5)
			SetTextAlignment(ui.panels[a].titleLabel, 1)
			SetTextPosition(ui.panels[a].titleLabel, GetSpriteXByOffset(ui.panels[a].background), GetSpriteYByOffset(ui.panels[a].background) - (GetTextTotalHeight(ui.panels[a].titleLabel) / 2))
			FixTextToScreen(ui.panels[a].titleLabel, 1)
			for b = 0 to ui.panels[a].buttons.length
				buttonHeight# = defaultButtonHeight#
				buttonWidth# = defaultButtonWidth#
				if (ui.panels[a].buttons[b].name$ = "About")
					buttonX# = GetWindowWidth() - (buttonWidth# / 2) - 10
				else
					buttonX# = GetSpriteX(ui.panels[a].background) + (buttonWidth# * b) + (buttonWidth# / 2) + 10
				endif
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
	
	SetTextString(zoomLabel, str(GetViewZoom() * 100, 0) + "%")
	for i = 0 to ui.panels[playgroundPanelIndex].buttons.length
		if (ui.panels[playgroundPanelIndex].buttons[i].name$ = "zoom_in")
			if (GetViewZoom() < maxZoom#)
				SetSpriteColor(ui.panels[playgroundPanelIndex].buttons[i].icon, 170, 170, 170, 255)
			else
				SetSpriteColor(ui.panels[playgroundPanelIndex].buttons[i].icon, 85, 85, 85, 255)
			endif
		endif
		if (ui.panels[playgroundPanelIndex].buttons[i].name$ = "zoom_out")
			if (GetViewZoom() > minZoom#)
				SetSpriteColor(ui.panels[playgroundPanelIndex].buttons[i].icon, 170, 170, 170, 255)
			else
				SetSpriteColor(ui.panels[playgroundPanelIndex].buttons[i].icon, 85, 85, 85, 255)
			endif
		endif
	next
endfunction