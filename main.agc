
// Project: AGK Playground 
// Created: 22-08-23

SetClearColor(30, 30, 30)
SetErrorMode(2)
SetOrientationAllowed(1, 1, 1, 1)
SetScissor(0, 0, 0, 0)
SetSyncRate(60, 0)
SetViewZoomMode(1)
SetWindowAllowResize(1)
SetWindowSize(1024, 768, 0)
SetWindowTitle("AGK Playground")
UseNewDefaultFonts(1)

// PLAN:
// 3 days on tweens
// 3 days on adding code preview
// 2 days on UI and about screen
// 3 days tidying up and refactoring code
// 2 days preparing itch.io page
// 13 out of 16 days total

// THANKS:
// BlinkOk & Leyvin for Sin/Cos help
//
// CREDITS:
// Artwork from KennyAssets (kenny.nl)

#insert "types.agc"
#insert "globals.agc"
#insert "icons.agc"
#insert "ui.agc"

if (val(GetLocalVariableValue("windowWidth")) >= minWindowWidth and val(GetLocalVariableValue("windowHeight")) >= minWindowHeight)
	SetWindowSize(val(GetLocalVariableValue("windowWidth")), val(GetLocalVariableValue("windowHeight")), 0)
endif

planet = CreateSprite(LoadImage("planet.png"))
SetSpriteSize(planet, 150, 150)
SetSpritePosition(planet, -99999, -99999)
SetSpriteDepth(planet, 100)
moon = CreateSprite(LoadImage("moon.png"))
SetSpriteSize(moon, 50, 50)
SetSpritePosition(moon, -99999, -99999)
SetSpriteDepth(moon, 99)
spaceship = CreateSprite(LoadImage("spaceship.png"))
SetSpriteSize(spaceship, 50, 50)
SetSpritePosition(spaceship, -99999, -99999)
SetSpriteDepth(spaceship, 100)
particles = CreateParticles(-99999, -99999)
recreateParticles = 1

particlesKeyFrames.insert(blankParticlesKeyFrame)
keyFrame = particlesKeyFrames.length
particlesKeyFrames[keyFrame].group$ = "Color"
particlesKeyFrames[keyFrame].redValue# = 254
particlesKeyFrames[keyFrame].greenValue# = 251
particlesKeyFrames[keyFrame].blueValue# = 164
particlesKeyFrames[keyFrame].alphaValue# = 255
particlesKeyFrames[keyFrame].timeValue# = 0.0
particlesKeyFrames.insert(blankParticlesKeyFrame)
keyFrame = particlesKeyFrames.length
particlesKeyFrames[keyFrame].group$ = "Color"
particlesKeyFrames[keyFrame].redValue# = 255
particlesKeyFrames[keyFrame].greenValue# = 241
particlesKeyFrames[keyFrame].blueValue# = 0
particlesKeyFrames[keyFrame].alphaValue# = 255
particlesKeyFrames[keyFrame].timeValue# = 1.0
particlesKeyFrames.insert(blankParticlesKeyFrame)
keyFrame = particlesKeyFrames.length
particlesKeyFrames[keyFrame].group$ = "Color"
particlesKeyFrames[keyFrame].redValue# = 249
particlesKeyFrames[keyFrame].greenValue# = 175
particlesKeyFrames[keyFrame].blueValue# = 0
particlesKeyFrames[keyFrame].alphaValue# = 255
particlesKeyFrames[keyFrame].timeValue# = 1.5
particlesKeyFrames.insert(blankParticlesKeyFrame)
keyFrame = particlesKeyFrames.length
particlesKeyFrames[keyFrame].group$ = "Color"
particlesKeyFrames[keyFrame].redValue# = 254
particlesKeyFrames[keyFrame].greenValue# = 55
particlesKeyFrames[keyFrame].blueValue# = 2
particlesKeyFrames[keyFrame].alphaValue# = 255
particlesKeyFrames[keyFrame].timeValue# = 2.5
particlesKeyFrames.insert(blankParticlesKeyFrame)
keyFrame = particlesKeyFrames.length
particlesKeyFrames[keyFrame].group$ = "Color"
particlesKeyFrames[keyFrame].redValue# = 75
particlesKeyFrames[keyFrame].greenValue# = 33
particlesKeyFrames[keyFrame].blueValue# = 19
particlesKeyFrames[keyFrame].alphaValue# = 255
particlesKeyFrames[keyFrame].timeValue# = 4.0
particlesKeyFrames.insert(blankParticlesKeyFrame)
keyFrame = particlesKeyFrames.length
particlesKeyFrames[keyFrame].group$ = "Color"
particlesKeyFrames[keyFrame].redValue# = 75
particlesKeyFrames[keyFrame].greenValue# = 33
particlesKeyFrames[keyFrame].blueValue# = 19
particlesKeyFrames[keyFrame].alphaValue# = 0
particlesKeyFrames[keyFrame].timeValue# = 5.0

remstart
type typeColorPicker
	output as integer
	sliders as typeSlider[10]
endtype

colorPicker as typeColorPicker

for i = 0 to 9
	colorPicker.sliders[i].container = CreateSprite(0)
	SetSpritePosition(colorPicker.sliders[i].container, -99999, -99999)
	colorPicker.sliders[i].inactiveTrack = CreateSprite(0)
	SetSpritePosition(colorPicker.sliders[i].inactiveTrack, -99999, -99999)
	colorPicker.sliders[i].activeTrack = CreateSprite(0)
	SetSpritePosition(colorPicker.sliders[i].activeTrack, -99999, -99999)
	colorPicker.sliders[i].handle = CreateSprite(0)
	SetSpritePosition(colorPicker.sliders[i].handle, -99999, -99999)
	colorPicker.sliders[i].minHandle = CreateSprite(0)
	SetSpritePosition(colorPicker.sliders[i].minHandle, -99999, -99999)
	colorPicker.sliders[i].maxHandle = CreateSprite(0)
	SetSpritePosition(colorPicker.sliders[i].maxHandle, -99999, -99999)
	colorPicker.sliders[i].label = CreateText("Slider")
	SetTextPosition(colorPicker.sliders[i].label, -99999, -99999)
	colorPicker.sliders[i].toLabel = CreateText("to")
	SetTextPosition(colorPicker.sliders[i].toLabel, -99999, -99999)
	colorPicker.sliders[i].editbox = CreateEditBox()
	SetEditBoxPosition(colorPicker.sliders[i].editbox, -99999, -99999)
	colorPicker.sliders[i].maxEditbox = CreateEditBox()
	SetEditBoxPosition(colorPicker.sliders[i].maxEditbox, -99999, -99999)
	colorPicker.sliders[i].minEditbox = CreateEditBox()
	SetEditBoxPosition(colorPicker.sliders[i].minEditbox, -99999, -99999)
next

colorAlphaBar as integer[2]
//colorbarPointer as integer[2]
colorBox as integer[2]
colorBoxPointer as integer[2]
//colorBox[0] = CreateSprite(LoadImage("hsla-h.png"))
colorPicker.output = CreateSprite(0)
SetSpriteSize(colorPicker.output, 200, 200)
SetSpritePosition(colorPicker.output, 250, 250)

slider = 0
				colorPicker.sliders[slider].name$ = "Red"
				colorPicker.sliders[slider].min# = 0
				colorPicker.sliders[slider].minValue# = 0
				colorPicker.sliders[slider].max# = 255
				colorPicker.sliders[slider].maxValue# = 0
				colorPicker.sliders[slider].value# = 255
				colorPicker.sliders[slider].activeTrackFromCentre = 0
				colorPicker.sliders[slider].rangeSlider = 0
				SetSpritePosition(colorPicker.sliders[slider].container, GetSpriteX(colorPicker.output), GetSpriteY(colorPicker.output) + GetSpriteHeight(colorPicker.output) + 10)
				SetSpriteSize(colorPicker.sliders[slider].container, 200, 35)
				SetSpriteColor(colorPicker.sliders[slider].container, 255, 255, 0, 0)
				SetSpriteDepth(colorPicker.sliders[slider].container, GetSpriteDepth(ui.panels[a].background) - 1)
				SetTextString(colorPicker.sliders[slider].label, "Red")
				SetTextSize(colorPicker.sliders[slider].label, defaultTextSize#)
				SetTextDepth(colorPicker.sliders[slider].label, GetSpriteDepth(ui.panels[a].background) - 1)
				SetTextPosition(colorPicker.sliders[slider].label, GetSpriteX(colorPicker.sliders[slider].container), GetSpriteY(colorPicker.sliders[slider].container))
				if (colorPicker.sliders[slider].rangeSlider = 0)
					SetEditBoxText(colorPicker.sliders[slider].editbox, str(colorPicker.sliders[slider].value#, 0))
					SetEditBoxPosition(colorPicker.sliders[slider].editbox, GetSpriteX(colorPicker.sliders[slider].container) + GetSpriteWidth(colorPicker.sliders[slider].container) - 50, GetSpriteY(colorPicker.sliders[slider].container))
					SetEditBoxSize(colorPicker.sliders[slider].editbox, 45, GetEditBoxHeight(colorPicker.sliders[slider].editbox))
					SetEditBoxBorderSize(colorPicker.sliders[slider].editbox, 0)
					SetEditBoxInputType(colorPicker.sliders[slider].editbox, 1)
					SetEditBoxBackgroundColor(colorPicker.sliders[slider].editbox, 51, 51, 51, 255)
					SetEditBoxTextColor(colorPicker.sliders[slider].editbox, 255, 255, 255)
					SetEditBoxDepth(colorPicker.sliders[slider].editbox, GetSpriteDepth(ui.panels[a].background) - 1)
				endif
				if (colorPicker.sliders[slider].rangeSlider = 1)
					SetEditBoxText(colorPicker.sliders[slider].minEditbox, str(colorPicker.sliders[slider].minValue#, 0))
					SetEditBoxPosition(colorPicker.sliders[slider].minEditbox, GetSpriteX(colorPicker.sliders[slider].container) + GetSpriteWidth(colorPicker.sliders[slider].container) - 115, GetSpriteY(colorPicker.sliders[slider].container))
					SetEditBoxSize(colorPicker.sliders[slider].minEditbox, 45, GetEditBoxHeight(colorPicker.sliders[slider].minEditbox))
					SetEditBoxBorderSize(colorPicker.sliders[slider].minEditbox, 0)
					SetEditBoxInputType(colorPicker.sliders[slider].minEditbox, 1)
					SetEditBoxBackgroundColor(colorPicker.sliders[slider].minEditbox, 51, 51, 51, 255)
					SetEditBoxTextColor(colorPicker.sliders[slider].minEditbox, 255, 255, 255)
					SetEditBoxDepth(colorPicker.sliders[slider].minEditbox, GetSpriteDepth(ui.panels[a].background) - 1)
					SetTextString(colorPicker.sliders[slider].toLabel, "to")
					SetTextAlignment(colorPicker.sliders[slider].toLabel, 1)
					SetTextSize(colorPicker.sliders[slider].toLabel, defaultTextSize#)
					SetTextDepth(colorPicker.sliders[slider].toLabel, GetSpriteDepth(ui.panels[a].background) - 1)
					SetTextPosition(colorPicker.sliders[slider].toLabel, GetSpriteX(colorPicker.sliders[slider].container) + GetSpriteWidth(colorPicker.sliders[slider].container) - 60, GetSpriteY(colorPicker.sliders[slider].container))	
					SetEditBoxText(colorPicker.sliders[slider].maxEditbox, str(colorPicker.sliders[slider].maxValue#, 0))
					SetEditBoxPosition(colorPicker.sliders[slider].maxEditbox, GetSpriteX(colorPicker.sliders[slider].container) + GetSpriteWidth(colorPicker.sliders[slider].container) - 50, GetSpriteY(colorPicker.sliders[slider].container))
					SetEditBoxSize(colorPicker.sliders[slider].maxEditbox, 45, GetEditBoxHeight(colorPicker.sliders[slider].maxEditbox))
					SetEditBoxBorderSize(colorPicker.sliders[slider].maxEditbox, 0)
					SetEditBoxInputType(colorPicker.sliders[slider].maxEditbox, 1)
					SetEditBoxBackgroundColor(colorPicker.sliders[slider].maxEditbox, 51, 51, 51, 255)
					SetEditBoxTextColor(colorPicker.sliders[slider].maxEditbox, 255, 255, 255)
					SetEditBoxDepth(colorPicker.sliders[slider].maxEditbox, GetSpriteDepth(ui.panels[a].background) - 1)
				endif
				SetSpritePosition(colorPicker.sliders[slider].inactiveTrack, GetSpriteX(colorPicker.sliders[slider].container) + 7.5, GetSpriteY(colorPicker.sliders[slider].container) + 27)
				SetSpriteSize(colorPicker.sliders[slider].inactiveTrack, GetSpriteWidth(colorPicker.sliders[slider].container) - 15, 4)
				SetSpriteColor(colorPicker.sliders[slider].inactiveTrack, 61, 57, 60, 255)
				SetSpriteDepth(colorPicker.sliders[slider].inactiveTrack, GetSpriteDepth(ui.panels[a].background) - 1)
				if (colorPicker.sliders[slider].rangeSlider = 0)
					SetSpriteSize(colorPicker.sliders[slider].handle, 15, 15)
					percentage# = ((colorPicker.sliders[slider].value# - colorPicker.sliders[slider].min#) / (colorPicker.sliders[slider].max# - colorPicker.sliders[slider].min#)) * 100.0
					handleX# = ((GetSpriteWidth(colorPicker.sliders[slider].inactiveTrack) - GetSpriteWidth(colorPicker.sliders[slider].handle)) / 100.0) * percentage#
					SetSpritePositionByOffset(colorPicker.sliders[slider].handle, GetSpriteX(colorPicker.sliders[slider].inactiveTrack) + (GetSpriteWidth(colorPicker.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(colorPicker.sliders[slider].inactiveTrack))
					SetSpriteColor(colorPicker.sliders[slider].handle, 147, 145, 147, 255)
					SetSpriteDepth(colorPicker.sliders[slider].handle, GetSpriteDepth(ui.panels[a].background) - 3)
				endif
				if (colorPicker.sliders[slider].rangeSlider = 1)
					SetSpriteSize(colorPicker.sliders[slider].minHandle, 15, 15)
					percentage# = ((colorPicker.sliders[slider].minValue# - colorPicker.sliders[slider].min#) / (colorPicker.sliders[slider].max# - colorPicker.sliders[slider].min#)) * 100.0
					handleX# = ((GetSpriteWidth(colorPicker.sliders[slider].inactiveTrack) - GetSpriteWidth(colorPicker.sliders[slider].minHandle)) / 100.0) * percentage#
					SetSpritePositionByOffset(colorPicker.sliders[slider].minHandle, GetSpriteX(colorPicker.sliders[slider].inactiveTrack) + (GetSpriteWidth(colorPicker.sliders[slider].minHandle) / 2) + handleX#, GetSpriteYByOffset(colorPicker.sliders[slider].inactiveTrack))
					SetSpriteColor(colorPicker.sliders[slider].minHandle, 147, 145, 147, 255)
					SetSpriteDepth(colorPicker.sliders[slider].minHandle, GetSpriteDepth(ui.panels[a].background) - 3)
					SetSpriteSize(colorPicker.sliders[slider].maxHandle, 15, 15)
					percentage# = ((colorPicker.sliders[slider].maxValue# - colorPicker.sliders[slider].min#) / (colorPicker.sliders[slider].max# - colorPicker.sliders[slider].min#)) * 100.0
					handleX# = ((GetSpriteWidth(colorPicker.sliders[slider].inactiveTrack) - GetSpriteWidth(colorPicker.sliders[slider].maxHandle)) / 100.0) * percentage#
					SetSpritePositionByOffset(colorPicker.sliders[slider].maxHandle, GetSpriteX(colorPicker.sliders[slider].inactiveTrack) + (GetSpriteWidth(colorPicker.sliders[slider].maxHandle) / 2) + handleX#, GetSpriteYByOffset(colorPicker.sliders[slider].inactiveTrack))
					SetSpriteColor(colorPicker.sliders[slider].maxHandle, 147, 145, 147, 255)
					SetSpriteDepth(colorPicker.sliders[slider].maxHandle, GetSpriteDepth(ui.panels[a].background) - 3)
				endif
				if (colorPicker.sliders[slider].rangeSlider = 0)
					if (colorPicker.sliders[slider].activeTrackFromCentre = 0)
						SetSpriteSize(colorPicker.sliders[slider].activeTrack, GetSpriteXByOffset(colorPicker.sliders[slider].handle) - GetSpriteX(colorPicker.sliders[slider].inactiveTrack), 4)
						SetSpritePosition(colorPicker.sliders[slider].activeTrack, GetSpriteX(colorPicker.sliders[slider].container) + 7.5, GetSpriteY(colorPicker.sliders[slider].container) + 27)
					else
						SetSpriteSize(colorPicker.sliders[slider].activeTrack, abs(GetSpriteXByOffset(colorPicker.sliders[slider].handle) - GetSpriteXByOffset(colorPicker.sliders[slider].inactiveTrack)), 4)
						if (colorPicker.sliders[slider].value# < 0)
							SetSpritePosition(colorPicker.sliders[slider].activeTrack, GetSpriteXByOffset(colorPicker.sliders[slider].inactiveTrack) - GetSpriteWidth(colorPicker.sliders[slider].activeTrack), GetSpriteY(colorPicker.sliders[slider].container) + 27)
						else
							SetSpritePosition(colorPicker.sliders[slider].activeTrack, GetSpriteXByOffset(colorPicker.sliders[slider].inactiveTrack), GetSpriteY(colorPicker.sliders[slider].container) + 27)
						endif	
					endif
				endif
				if (colorPicker.sliders[slider].rangeSlider = 1)
					SetSpriteSize(colorPicker.sliders[slider].activeTrack, abs(GetSpriteXByOffset(colorPicker.sliders[slider].maxHandle) - GetSpriteXByOffset(colorPicker.sliders[slider].minHandle)), 4)
					SetSpritePosition(colorPicker.sliders[slider].activeTrack, GetSpriteXByOffset(colorPicker.sliders[slider].minHandle), GetSpriteY(colorPicker.sliders[slider].container) + 27)
				endif
				SetSpriteColor(colorPicker.sliders[slider].activeTrack, 98, 96, 98, 255)
				SetSpriteDepth(colorPicker.sliders[slider].activeTrack, GetSpriteDepth(ui.panels[a].background) - 2)
remend

remstart
colorBoxPointer[0] = CreateSprite(0)
SetSpriteSize(colorBoxPointer[0], 14, 14)
SetSpritePositionByOffset(colorBoxPointer[0], 506, 250)
SetSpriteColor(colorBoxPointer[0], 255, 255, 255, 255)
SetSpriteScissor(colorBoxPointer[0], GetSpriteX(colorBox[0]), GetSpriteY(colorBox[0]), GetSpriteX(colorBox[0]) + GetSpriteWidth(colorBox[0]), GetSpriteY(colorBox[0]) + GetSpriteHeight(colorBox[0])) 
colorBoxPointer[1] = CreateSprite(0)
SetSpriteSize(colorBoxPointer[1], 12, 12)
SetSpritePositionByOffset(colorBoxPointer[1], 506, 250)
SetSpriteColor(colorBoxPointer[1], 0, 0, 0, 255)
SetSpriteScissor(colorBoxPointer[1], GetSpriteX(colorBox[0]), GetSpriteY(colorBox[0]), GetSpriteX(colorBox[0]) + GetSpriteWidth(colorBox[0]), GetSpriteY(colorBox[0]) + GetSpriteHeight(colorBox[0])) 
colorBoxPointer[2] = CreateSprite(0)
SetSpriteSize(colorBoxPointer[2], 10, 10)
SetSpriteColor(colorBoxPointer[2], 255, 255, 255, 255)
SetSpritePositionByOffset(colorBoxPointer[2], GetSpriteXByOffset(colorBoxPointer[0]), GetSpriteYByOffset(colorBoxPointer[0]))
SetSpriteScissor(colorBoxPointer[2], GetSpriteX(colorBox[0]), GetSpriteY(colorBox[0]), GetSpriteX(colorBox[0]) + GetSpriteWidth(colorBox[0]), GetSpriteY(colorBox[0]) + GetSpriteHeight(colorBox[0])) 
remend

remstart
colorBox[1] = CreateSprite(0)
SetSpriteSize(colorBox[1], 256, 256)
SetSpritePosition(colorBox[1], 250, 250)
SetSpriteColorAlpha(colorBox[1], 0)
remend

remstart
colorAlphaBar[0] = CreateSprite(LoadImage("color-alpha-bar-grid.png"))
SetSpriteSize(colorAlphaBar[0], 256, 30)
SetSpritePosition(colorAlphaBar[0], 250, 516)
colorAlphaBar[1] = CreateSprite(LoadImage("color-alpha-bar.png"))
SetSpriteSize(colorAlphaBar[1], 256, 30)
SetSpritePosition(colorAlphaBar[1], 250, 516)
remend
remstart
colorbarPointer[0] = CreateSprite(LoadImage("color-bar-pointer-border.png"))
SetSpriteSize(colorbarPointer[0], 20, 20)
SetSpriteColor(colorbarPointer[0], 255, 255, 255, 255)
SetSpritePosition(colorbarPointer[0], GetSpriteX(colorbar) - (GetSpriteWidth(colorbarPointer[0]) / 2) + 1, GetSpriteYByOffset(colorbar))
colorbarPointer[1] = CreateSprite(LoadImage("color-bar-pointer-box.png"))
SetSpriteSize(colorbarPointer[1], 20, 20)
SetSpriteColor(colorbarPointer[1], 255, 0, 0, 255)
SetSpritePosition(colorbarPointer[1], GetSpriteX(colorbar) - (GetSpriteWidth(colorbarPointer[0]) / 2) + 1, GetSpriteYByOffset(colorbar))
remend

SetViewZoomMode(1)


		
do
	//print(ScreenFPS())
	
	if (selectedCategory = CATEGORY_2D_PARTICLES)
		contentHeight# = 0
		contentY# = GetSpriteY(ui.panels[propertiesPanelIndex].invisibleDragZone) + 10 + 40
		for slider = 0 to 8
			if (GetSpriteExists(ui.panels[propertiesPanelIndex].invisibleDragZone) and GetSpriteExists(ui.sliders[slider].container))
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[propertiesPanelIndex].invisibleDragZone) + 20, contentY#)
				SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
				if (ui.sliders[slider].rangeSlider = 0)
					SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				endif
				if (ui.sliders[slider].rangeSlider = 1)
					SetEditBoxPosition(ui.sliders[slider].minEditbox, GetSpriteX(ui.sliders[slider].container) + 260 - 115, GetSpriteY(ui.sliders[slider].container))
					SetTextPosition(ui.sliders[slider].toLabel, GetSpriteX(ui.sliders[slider].container) + 260 - 60, GetSpriteY(ui.sliders[slider].container))	
					SetEditBoxPosition(ui.sliders[slider].maxEditbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
				endif
				SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
				if (ui.sliders[slider].rangeSlider = 0)
					percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
					handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
					SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				endif
				if (ui.sliders[slider].rangeSlider = 1)
					percentage# = ((ui.sliders[slider].minValue# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
					handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].minHandle)) / 100.0) * percentage#
					SetSpritePositionByOffset(ui.sliders[slider].minHandle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].minHandle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
					percentage# = ((ui.sliders[slider].maxValue# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
					handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].maxHandle)) / 100.0) * percentage#
					SetSpritePositionByOffset(ui.sliders[slider].maxHandle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].maxHandle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
				endif
				
				if (ui.sliders[slider].rangeSlider = 0)
					if (ui.sliders[slider].activeTrackFromCentre = 0)
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
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].minHandle), GetSpriteY(ui.sliders[slider].container) + 27)
				endif
			endif
			contentY# = contentY# + GetSpriteHeight(ui.sliders[slider].container) + 10
			contentHeight# = contentHeight# + GetSpriteHeight(ui.sliders[slider].container) + 10
		next
		contentY# = contentY# + 4
		contentHeight# = contentHeight# + 4
		for checkbox = 0 to 0
			if (GetSpriteExists(ui.panels[propertiesPanelIndex].invisibleDragZone) and GetSpriteExists(ui.checkboxes[checkbox].container))
				SetSpritePosition(ui.checkboxes[checkbox].container, GetSpriteX(ui.panels[propertiesPanelIndex].invisibleDragZone) + 20, contentY#)
				SetSpritePosition(ui.checkboxes[checkbox].background, GetSpriteX(ui.checkboxes[checkbox].container), GetSpriteY(ui.checkboxes[checkbox].container))
				if (ui.checkboxes[checkbox].value = 1)
					SetSpritePosition(ui.checkboxes[checkbox].foreground, GetSpriteX(ui.checkboxes[checkbox].background), GetSpriteY(ui.checkboxes[checkbox].background))
				else
					SetSpritePosition(ui.checkboxes[checkbox].foreground, -99999, -99999)
				endif	
				SetTextPosition(ui.checkboxes[checkbox].label, GetSpriteX(ui.checkboxes[checkbox].background) + GetSpriteWidth(ui.checkboxes[checkbox].background) + 8, GetSpriteYByOffset(ui.checkboxes[checkbox].background) - (GetTextTotalHeight(ui.checkboxes[checkbox].label) / 2))
				contentY# = contentY# + GetSpriteHeight(ui.sliders[slider].container) + 10
				contentHeight# = contentHeight# + GetSpriteHeight(ui.sliders[slider].container) + 10
			endif
		next
		contentY# = contentY# + 2
		contentHeight# = contentHeight# + 2
			
		if (ui.panels[propertiesPanelIndex].subHeaders.length >= 0)
			if (GetSpriteExists(ui.panels[propertiesPanelIndex].invisibleDragZone) and GetSpriteExists(ui.panels[propertiesPanelIndex].subHeaders[0].container))
				SetSpritePosition(ui.panels[propertiesPanelIndex].subHeaders[0].container, GetSpriteX(ui.panels[propertiesPanelIndex].invisibleDragZone), contentY#)
				SetTextPosition(ui.panels[propertiesPanelIndex].subHeaders[0].label, GetSpriteX(ui.panels[propertiesPanelIndex].background) + 20, GetSpriteYByOffset(ui.panels[propertiesPanelIndex].subHeaders[0].container) - (GetTextTotalHeight(ui.panels[propertiesPanelIndex].subHeaders[0].label) / 2))
				contentY# = contentY# + GetSpriteHeight(ui.panels[propertiesPanelIndex].subHeaders[0].container)
				contentHeight# = contentHeight# + GetSpriteHeight(ui.panels[propertiesPanelIndex].subHeaders[0].container) + 10
			endif
		endif
		contentHeight# = contentHeight# + 2
		contentY# = contentY# + 2
		
		for keyFrame = 0 to particlesKeyFrames.length
			if (GetSpriteExists(ui.panels[propertiesPanelIndex].invisibleDragZone) and GetSpriteExists(particlesKeyFrames[keyFrame].container))
				if (particlesKeyFrames[keyFrame].group$ = "Color")
					SetSpritePosition(particlesKeyFrames[keyFrame].container, GetSpriteX(ui.panels[propertiesPanelIndex].invisibleDragZone) + 20, contentY#)
					SetTextPosition(particlesKeyFrames[keyFrame].timeLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 0), GetSpriteY(particlesKeyFrames[keyFrame].container))
					SetEditBoxPosition(particlesKeyFrames[keyFrame].timeEditbox, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 0), GetSpriteY(particlesKeyFrames[keyFrame].container) + GetSpriteHeight(particlesKeyFrames[keyFrame].container) - GetEditBoxHeight(particlesKeyFrames[keyFrame].timeEditbox))
					SetTextPosition(particlesKeyFrames[keyFrame].redLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 1), GetSpriteY(particlesKeyFrames[keyFrame].container))
					SetEditBoxPosition(particlesKeyFrames[keyFrame].redEditbox, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 1), GetSpriteY(particlesKeyFrames[keyFrame].container) + GetSpriteHeight(particlesKeyFrames[keyFrame].container) - GetEditBoxHeight(particlesKeyFrames[keyFrame].redEditbox))
					SetTextPosition(particlesKeyFrames[keyFrame].greenLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 2), GetSpriteY(particlesKeyFrames[keyFrame].container))
					SetEditBoxPosition(particlesKeyFrames[keyFrame].greenEditbox, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 2), GetSpriteY(particlesKeyFrames[keyFrame].container) + GetSpriteHeight(particlesKeyFrames[keyFrame].container) - GetEditBoxHeight(particlesKeyFrames[keyFrame].greenEditbox))
					SetTextPosition(particlesKeyFrames[keyFrame].blueLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 3), GetSpriteY(particlesKeyFrames[keyFrame].container))
					SetEditBoxPosition(particlesKeyFrames[keyFrame].blueEditbox, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 3), GetSpriteY(particlesKeyFrames[keyFrame].container) + GetSpriteHeight(particlesKeyFrames[keyFrame].container) - GetEditBoxHeight(particlesKeyFrames[keyFrame].blueEditbox))
					SetTextPosition(particlesKeyFrames[keyFrame].alphaLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 4), GetSpriteY(particlesKeyFrames[keyFrame].container))
					SetEditBoxPosition(particlesKeyFrames[keyFrame].alphaEditbox, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 4), GetSpriteY(particlesKeyFrames[keyFrame].container) + GetSpriteHeight(particlesKeyFrames[keyFrame].container) - GetEditBoxHeight(particlesKeyFrames[keyFrame].alphaEditbox))
					SetSpritePosition(particlesKeyFrames[keyFrame].deleteIcon, GetSpriteX(particlesKeyFrames[keyFrame].container) + GetSpriteWidth(particlesKeyFrames[keyFrame].container) - GetSpriteWidth(particlesKeyFrames[keyFrame].deleteIcon), GetEditBoxY(particlesKeyFrames[keyFrame].alphaEditbox) + (GetEditBoxHeight(particlesKeyFrames[keyFrame].alphaEditbox) / 2) - (GetSpriteHeight(particlesKeyFrames[keyFrame].deleteIcon) / 2))
					contentY# = contentY# + GetSpriteHeight(particlesKeyFrames[keyFrame].container) + 12
					contentHeight# = contentHeight# + GetSpriteHeight(particlesKeyFrames[keyFrame].container) + 12
				endif
				if (particlesKeyFrames[keyFrame].group$ = "Scale")
					SetSpritePosition(particlesKeyFrames[keyFrame].container, GetSpriteX(ui.panels[propertiesPanelIndex].invisibleDragZone) + 20, contentY#)
					SetTextPosition(particlesKeyFrames[keyFrame].timeLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 0), GetSpriteY(particlesKeyFrames[keyFrame].container))
					SetEditBoxPosition(particlesKeyFrames[keyFrame].timeEditbox, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 0), GetSpriteY(particlesKeyFrames[keyFrame].container) + GetSpriteHeight(particlesKeyFrames[keyFrame].container) - GetEditBoxHeight(particlesKeyFrames[keyFrame].timeEditbox))
					SetTextPosition(particlesKeyFrames[keyFrame].scaleLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 1), GetSpriteY(particlesKeyFrames[keyFrame].container))
					SetEditBoxPosition(particlesKeyFrames[keyFrame].scaleEditbox, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 1), GetSpriteY(particlesKeyFrames[keyFrame].container) + GetSpriteHeight(particlesKeyFrames[keyFrame].container) - GetEditBoxHeight(particlesKeyFrames[keyFrame].scaleEditbox))
					SetSpritePosition(particlesKeyFrames[keyFrame].deleteIcon, GetSpriteX(particlesKeyFrames[keyFrame].container) + GetSpriteWidth(particlesKeyFrames[keyFrame].container) - GetSpriteWidth(particlesKeyFrames[keyFrame].deleteIcon), GetEditBoxY(particlesKeyFrames[keyFrame].scaleEditbox) + (GetEditBoxHeight(particlesKeyFrames[keyFrame].scaleEditbox) / 2) - (GetSpriteHeight(particlesKeyFrames[keyFrame].deleteIcon) / 2))
					contentY# = contentY# + GetSpriteHeight(particlesKeyFrames[keyFrame].container) + 12
					contentHeight# = contentHeight# + GetSpriteHeight(particlesKeyFrames[keyFrame].container) + 12
				endif
			endif
		next
		for b = 0 to ui.panels[propertiesPanelIndex].buttons.length
			if (GetSpriteExists(ui.panels[propertiesPanelIndex].buttons[b].background))
				buttonHeight# = 20
				buttonWidth# = 120
				buttonX# = GetSpriteX(ui.panels[propertiesPanelIndex].invisibleDragZone) + 20 + (buttonWidth# * b) + (b * 15)
				buttonY# = contentY# + 5
				SetSpritePosition(ui.panels[propertiesPanelIndex].buttons[b].background, buttonX#, buttonY#)
				SetTextPosition(ui.panels[propertiesPanelIndex].buttons[b].label, GetSpriteXByOffset(ui.panels[propertiesPanelIndex].buttons[b].background), GetSpriteYByOffset(ui.panels[propertiesPanelIndex].buttons[b].background) - (GetTextTotalHeight(ui.panels[propertiesPanelIndex].buttons[b].label) / 2))
			endif
		next
		contentY# = contentY# + GetSpriteHeight(ui.panels[propertiesPanelIndex].buttons[0].background)
		contentHeight# = contentHeight# + GetSpriteHeight(ui.panels[propertiesPanelIndex].buttons[0].background)
		ui.panels[propertiesPanelIndex].contentHeight# = contentHeight# + 200
	endif

	// INPUT ACTIONS
	if (GetPointerPressed() = 1)
		spritePressed = GetSpriteHit(ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
		if (spritePressed > 0)
			spriteX# = GetSpriteX(spritePressed)
			spriteY# = GetSpriteY(spritePressed)
			startX# = GetPointerX()
			startY# = GetPointerY()
			viewX# = GetViewOffsetX()
			viewY# = GetViewOffsetY()
			dragSpriteStartX# = startX# - spriteX#
			dragSpriteStartY# = startY# - spriteY#
			dragViewStartX# = startX# - viewX#
			dragViewStartY# = startY# - viewY#
		endif
	else
		if (GetPointerState() = 1)
			spriteHeld = GetSpriteHit(ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			if (spritePressed > 0 and spritePressed = spriteHeld)
				dX# = startX# - GetPointerX()
				dY# = startY# - GetPointerY()
				spriteDX# = spriteX# - dX#
				spriteDY# = spriteY# - dY#
				viewDX# = viewX# + dX#
				viewDY# = viewY# + dY#
			endif
			if (spritePressed = ui.panels[propertiesPanelIndex].invisibleDragZone)
				if (spriteDY# > GetSpriteY(ui.panels[propertiesPanelIndex].titleBackground)) then spriteDY# = GetSpriteY(ui.panels[propertiesPanelIndex].titleBackground)
				if (spriteDY# < -(GetSpriteHeight(spritePressed) - GetWindowHeight())) then spriteDY# = -(GetSpriteHeight(spritePressed) - GetWindowHeight())
				SetSpriteY(spritePressed, spriteDY#)
				attachedTo = ui.panels[propertiesPanelIndex].invisibleDragZone
				contentSize# = ui.panels[propertiesPanelIndex].contentHeight#
				panelID = ui.panels[propertiesPanelIndex].background
				trackSize# = GetWindowHeight() - topPanelHeight#
				UpdatePanelVerticalScrollBar(ui.panels[propertiesPanelIndex].verticalScrollBar, panelID, attachedTo, trackSize#, contentSize#)
			endif
			if (spritePressed = ui.panels[propertiesPanelIndex].verticalScrollBar)
				dX# = GetPointerX() - dragSpriteStartX#
				dY# = GetPointerY() - dragSpriteStartY#
					
				SetSpriteY(spritePressed, dY#)
				if (GetSpriteY(spritePressed) < GetSpriteY(ui.panels[propertiesPanelIndex].titleBackground)) then SetSpriteY(spritePressed, GetSpriteY(ui.panels[propertiesPanelIndex].titleBackground))
				if (GetSpriteY(spritePressed) + GetSpriteHeight(spritePressed) > GetWindowHeight()) then SetSpriteY(spritePressed, GetWindowHeight() - GetSpriteHeight(spritePressed))
				
				attachedTo = ui.panels[propertiesPanelIndex].invisibleDragZone
				contentSize# = ui.panels[propertiesPanelIndex].contentHeight#
				panelID = ui.panels[propertiesPanelIndex].background
				trackSize# = GetWindowHeight() - topPanelHeight#
				DraggingPanelVerticalScrollBar(ui.panels[propertiesPanelIndex].verticalScrollBar, panelID, attachedTo, trackSize#, contentSize#)
				SetSpriteColor(ui.panels[propertiesPanelIndex].verticalScrollBar, 81, 81, 81, 255)
			else
				SetSpriteColor(ui.panels[propertiesPanelIndex].verticalScrollBar, 61, 61, 61, 255)
			endif
			for i = 0 to 9
				if (ui.sliders[i].rangeSlider = 0)
					if (spritePressed = ui.sliders[i].handle)
						dX# = GetPointerX() - dragSpriteStartX#
						dY# = GetPointerY() - dragSpriteStartY#
						if (dX# < GetSpriteX(ui.sliders[i].inactiveTrack) ) then dX# = GetSpriteX(ui.sliders[i].inactiveTrack) //+ (GetSpriteWidth(ui.sliders[i].handle) / 2)
						if (dX# > GetSpriteX(ui.sliders[i].inactiveTrack) + GetSpriteWidth(ui.sliders[i].inactiveTrack)) then dX# = GetSpriteX(ui.sliders[i].inactiveTrack) + GetSpriteWidth(ui.sliders[i].inactiveTrack)
						SetSpritePositionByOffset(ui.sliders[i].handle, dX#, GetSpriteYByOffset(ui.sliders[i].handle))
						if (ui.sliders[i].activeTrackFromCentre = 0)
							SetSpriteSize(ui.sliders[i].activeTrack, GetSpriteXByOffset(ui.sliders[i].handle) - GetSpriteX(ui.sliders[i].inactiveTrack), GetSpriteHeight(ui.sliders[i].inactiveTrack))
						else
							SetSpriteSize(ui.sliders[i].activeTrack, abs(GetSpriteXByOffset(ui.sliders[i].handle) - GetSpriteXByOffset(ui.sliders[i].inactiveTrack)), GetSpriteHeight(ui.sliders[i].inactiveTrack))
							if (ui.sliders[i].value# < 0)
								SetSpritePosition(ui.sliders[i].activeTrack, GetSpriteXByOffset(ui.sliders[i].inactiveTrack) - GetSpriteWidth(ui.sliders[i].activeTrack), GetSpriteY(ui.sliders[i].container) + 27)
							else
								SetSpritePosition(ui.sliders[i].activeTrack, GetSpriteXByOffset(ui.sliders[i].inactiveTrack), GetSpriteY(ui.sliders[i].container) + 27)
							endif	
						endif
						percentage# = (100.0 / (GetSpriteWidth(ui.sliders[i].inactiveTrack) )) * (GetSpriteXByOffset(ui.sliders[i].handle) - GetSpriteX(ui.sliders[i].inactiveTrack))
						ui.sliders[i].value# = (((abs(ui.sliders[i].min#) + ui.sliders[i].max#) / 100.0) * percentage#) - abs(ui.sliders[i].min#) // - GetSpriteWidth(ui.sliders[i].handle)
						SetEditBoxText(ui.sliders[i].editbox, str(ui.sliders[i].value#, 0))
					endif
				endif
				if (ui.sliders[i].rangeSlider = 1)
					if (spritePressed = ui.sliders[i].minHandle)
						dX# = GetPointerX() - dragSpriteStartX#
						dY# = GetPointerY() - dragSpriteStartY#
						if (dX# < GetSpriteX(ui.sliders[i].inactiveTrack) ) then dX# = GetSpriteX(ui.sliders[i].inactiveTrack) //+ (GetSpriteWidth(ui.sliders[i].handle) / 2)
						if (dX# > GetSpriteX(ui.sliders[i].inactiveTrack) + GetSpriteWidth(ui.sliders[i].inactiveTrack)) then dX# = GetSpriteX(ui.sliders[i].inactiveTrack) + GetSpriteWidth(ui.sliders[i].inactiveTrack)
						if (dX# > GetSpriteXByOffset(ui.sliders[i].maxHandle)) then dX# = GetSpriteXByOffset(ui.sliders[i].maxHandle)
						SetSpritePositionByOffset(ui.sliders[i].minHandle, dX#, GetSpriteYByOffset(ui.sliders[i].minHandle))
						percentage# = (100.0 / (GetSpriteWidth(ui.sliders[i].inactiveTrack) )) * (GetSpriteXByOffset(ui.sliders[i].minHandle) - GetSpriteX(ui.sliders[i].inactiveTrack))
						ui.sliders[i].minValue# = (((abs(ui.sliders[i].min#) + ui.sliders[i].max#) / 100.0) * percentage#) - abs(ui.sliders[i].min#) // - GetSpriteWidth(ui.sliders[i].handle)
						SetEditBoxText(ui.sliders[i].minEditbox, str(ui.sliders[i].minValue#, 0))
					endif
					if (spritePressed = ui.sliders[i].maxHandle)
						dX# = GetPointerX() - dragSpriteStartX#
						dY# = GetPointerY() - dragSpriteStartY#
						if (dX# < GetSpriteX(ui.sliders[i].inactiveTrack) ) then dX# = GetSpriteX(ui.sliders[i].inactiveTrack) //+ (GetSpriteWidth(ui.sliders[i].handle) / 2)
						if (dX# > GetSpriteX(ui.sliders[i].inactiveTrack) + GetSpriteWidth(ui.sliders[i].inactiveTrack)) then dX# = GetSpriteX(ui.sliders[i].inactiveTrack) + GetSpriteWidth(ui.sliders[i].inactiveTrack)
						if (dX# < GetSpriteXByOffset(ui.sliders[i].minHandle)) then dX# = GetSpriteXByOffset(ui.sliders[i].minHandle)
						SetSpritePositionByOffset(ui.sliders[i].maxHandle, dX#, GetSpriteYByOffset(ui.sliders[i].maxHandle))
						percentage# = (100.0 / (GetSpriteWidth(ui.sliders[i].inactiveTrack) )) * (GetSpriteXByOffset(ui.sliders[i].maxHandle) - GetSpriteX(ui.sliders[i].inactiveTrack))
						ui.sliders[i].maxValue# = (((abs(ui.sliders[i].min#) + ui.sliders[i].max#) / 100.0) * percentage#) - abs(ui.sliders[i].min#) // - GetSpriteWidth(ui.sliders[i].handle)
						SetEditBoxText(ui.sliders[i].maxEditbox, str(ui.sliders[i].maxValue#, 0))
					endif
					SetSpriteSize(ui.sliders[i].activeTrack, abs(GetSpriteXByOffset(ui.sliders[i].maxHandle) - GetSpriteXByOffset(ui.sliders[i].minHandle)), 4)
					SetSpritePosition(ui.sliders[i].activeTrack, GetSpriteXByOffset(ui.sliders[i].minHandle), GetSpriteY(ui.sliders[i].container) + 27)	
				endif
			next
			remstart
			if (spritePressed = colorBox[1])
				dX# = GetPointerX()
				dY# = GetPointerY()
				if (dX# < GetSpriteX(colorBox[0])) then dX# = GetSpriteX(colorBox[0])
				if (dX# > GetSpriteX(colorBox[0]) + GetSpriteWidth(colorBox[0])) then dX# = GetSpriteX(colorBox[0]) + GetSpriteWidth(colorBox[0])
				if (dY# < GetSpriteY(colorBox[0])) then dY# = GetSpriteY(colorBox[0])
				if (dY# > GetSpriteY(colorBox[0]) + GetSpriteHeight(colorBox[0])) then dY# = GetSpriteY(colorBox[0]) + GetSpriteHeight(colorBox[0])
			
				SetSpritePositionByOffset(colorBoxPointer[0], -99999, -99999)
				SetSpritePositionByOffset(colorBoxPointer[1], -99999, -99999)
				SetSpritePositionByOffset(colorBoxPointer[2], -99999, -99999)
            		Render()
            		image = GetImage(dX#, dY#, 1, 1)
            		ClearScreen()
            		memblock = CreateMemblockFromImage(image)
            		color[1] = GetMemblockByte(memblock, 12)
            		color[2] = GetMemblockByte(memblock, 13)
            		color[3] = GetMemblockByte(memblock, 14)
            		color[4] = GetMemblockByte(memblock, 15)
        
            		//SetSpritePositionByOffset(colorBoxPointer[0], dX#, dY#)
				//SetSpritePositionByOffset(colorBoxPointer[1], dX#, dY#)
				//SetSpritePositionByOffset(colorBoxPointer[2], dX#, dY#)
            		//SetSpriteColor(colorBoxPointer[2], r#, g#, b#, 255)
				//SetSpriteColor(colorAlphaBar[1], r#, g#, b#, 255)
			endif
			remend
			remstart
			if (spritePressed = colorboxPointer[0] or spritePressed = colorboxPointer[1] or spritePressed = colorboxPointer[2])
				dX# = GetPointerX() - dragSpriteStartX#
				dY# = GetPointerY() - dragSpriteStartY#
				if (dX# < GetSpriteX(colorbox)) then dX# = GetSpriteX(colorbox)
				if (dX# > GetSpriteX(colorbox) + GetSpriteWidth(colorbox)) then dX# = GetSpriteX(colorbox) + GetSpriteWidth(colorbox)
				if (dY# < GetSpriteY(colorbox)) then dY# = GetSpriteY(colorbox)
				if (dY# > GetSpriteY(colorbox) + GetSpriteHeight(colorbox)) then dY# = GetSpriteY(colorbox) + GetSpriteHeight(colorbox)
				SetSpritePositionByOffset(colorboxPointer[0], dX# + (GetSpriteWidth(colorboxPointer[0]) / 2), dY# + (GetSpriteHeight(colorboxPointer[0]) / 2))
				SetSpritePositionByOffset(colorboxPointer[1], dX# + (GetSpriteWidth(colorboxPointer[0]) / 2), dY# + (GetSpriteHeight(colorboxPointer[0]) / 2))
				SetSpritePositionByOffset(colorboxPointer[2], dX# + (GetSpriteWidth(colorboxPointer[0]) / 2), dY# + (GetSpriteHeight(colorboxPointer[0]) / 2))
				
				Render()
            		img = GetImage(GetSpriteXByOffset(colorboxPointer[0]), GetSpriteY(colorboxPointer[0]), 1, 1)
            		ClearScreen() 
            		mb = CreateMemblockFromImage(img)
 				
            		color[1] = GetMemblockByte(mb,12)
            		color[2] = GetMemblockByte(mb,13)
            		color[3] = GetMemblockByte(mb,14)
            		color[4] = GetMemblockByte(mb,15)
            		
            		SetSpriteColor(colorboxPointer[2], color[1], color[2], color[3], color[4])
            endif
            remend
			
			remstart
			if (spritePressed = colorbar)
				dX# = GetPointerX()
				if (dX# < GetSpriteX(colorbar) + 1) then dX# = GetSpriteX(colorbar) + 1
				if (dX# > GetSpriteX(colorbar) + GetSpriteWidth(colorbar) - 1) then dX# = GetSpriteX(colorbar) + GetSpriteWidth(colorbar) - 1
				//SetSpritePositionByOffset(colorbarPointer[0], dX#, GetSpriteYByOffset(colorbar) + (GetSpriteHeight(colorbarPointer[0]) / 2))
				//SetSpritePositionByOffset(colorbarPointer[1], dX#, GetSpriteYByOffset(colorbar) + (GetSpriteHeight(colorbarPointer[1]) / 2))
				
            		Render()
            		img = GetImage(GetSpriteXByOffset(colorbarPointer[0]), GetSpriteY(colorbarPointer[0]) - 5, 1, 1)
            		ClearScreen()
            		mb = CreateMemblockFromImage(img)
 				
 				color as integer[4]
            		color[1] = GetMemblockByte(mb,12)
            		color[2] = GetMemblockByte(mb,13)
            		color[3] = GetMemblockByte(mb,14)
            		color[4] = GetMemblockByte(mb,15)
            		
            		SetSpriteColor(colorbarPointer[1], color[1], color[2], color[3], color[4])
			endif
			if (spritePressed = colorbarPointer[0] or spritePressed = colorbarPointer[1])
				dX# = GetPointerX() - dragSpriteStartX#
				print(dX#)
				if (dX# < GetSpriteX(colorbar) - (GetSpriteWidth(colorbarPointer[0]) / 2)) then dX# = GetSpriteX(colorbar) - (GetSpriteWidth(colorbarPointer[0]) / 2) + 1
				if (dX# > GetSpriteX(colorbar) + GetSpriteWidth(colorbar) - (GetSpriteWidth(colorbarPointer[0]) / 2)) then dX# = GetSpriteX(colorbar) + GetSpriteWidth(colorbar) - (GetSpriteWidth(colorbarPointer[0]) / 2) - 1
				print(dX#)
				SetSpritePosition(colorbarPointer[0], dX#, GetSpriteYByOffset(colorbar))
				SetSpritePosition(colorbarPointer[1], dX#, GetSpriteYByOffset(colorbar))
				
				Render()
            		img = GetImage(GetSpriteXByOffset(colorbarPointer[0]), GetSpriteY(colorbarPointer[0]) - 5, 1, 1)
            		ClearScreen() 
            		mb = CreateMemblockFromImage(img)
 				
            		color[1] = GetMemblockByte(mb,12)
            		color[2] = GetMemblockByte(mb,13)
            		color[3] = GetMemblockByte(mb,14)
            		color[4] = GetMemblockByte(mb,15)
            		
            		SetSpriteColor(colorbarPointer[1], color[1], color[2], color[3], color[4])
            endif
            remend
		endif
		if (GetPointerReleased())
			spriteReleased = GetSpriteHit(ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			if (spriteReleased > 0 and spriteReleased = spritePressed)
				for i = 0 to ui.panels[categoriesPanelIndex].buttons.length
					if (spritePressed = ui.panels[categoriesPanelIndex].buttons[i].icon)
						if (ui.panels[categoriesPanelIndex].buttons[i].name$ = "Cos/Sin Orbit")
							//if (GetParticlesExists(particles)) then DeleteParticles(particles)
							SetParticlesActive(particles, 0)
							SetParticlesVisible(particles, 0)
							selectedCategory = CATEGORY_COS_SIN_ORBIT
							redrawUI = 1
						endif
						if (ui.panels[categoriesPanelIndex].buttons[i].name$ = "2D Particles")
							SetParticlesActive(particles, 1)
							SetParticlesVisible(particles, 1)
							selectedCategory = CATEGORY_2D_PARTICLES
							redrawUI = 1
							recreateParticles = 1
						endif
						if (ui.panels[categoriesPanelIndex].buttons[i].name$ = "Sine Wave")
							//if (GetParticlesExists(particles)) then DeleteParticles(particles)
							SetParticlesActive(particles, 0)
							SetParticlesVisible(particles, 0)
							selectedCategory = CATEGORY_SINE_WAVES
							redrawUI = 1
						endif
					endif
				next
				for i = 0 to ui.panels[playgroundPanelIndex].buttons.length
					if (spritePressed = ui.panels[playgroundPanelIndex].buttons[i].icon)
						if (ui.panels[playgroundPanelIndex].buttons[i].name$ = "zoom_in")
							viewZoom# = GetViewZoom()
							viewZoom# = viewZoom# + 0.1
							if (viewZoom# > maxZoom#) then viewZoom# = maxZoom#
							SetViewZoom(viewZoom#)
							redrawPlayground = 1
						endif
						if (ui.panels[playgroundPanelIndex].buttons[i].name$ = "zoom_out")
							viewZoom# = GetViewZoom()
							viewZoom# = viewZoom# - 0.1
							if (viewZoom# < minZoom#) then viewZoom# = minZoom#
							SetViewZoom(viewZoom#)
							redrawPlayground = 1
						endif
					endif
				next
				for i = 0 to ui.panels[propertiesPanelIndex].buttons.length
					if (spritePressed = ui.panels[propertiesPanelIndex].buttons[i].background)
						if (ui.panels[propertiesPanelIndex].buttons[i].name$ = "AddColorKeyFrame")
							
							particlesKeyFrames.insert(blankParticlesKeyFrame)
							keyFrame = particlesKeyFrames.length
							particlesKeyFrames[keyFrame].group$ = "Color"
							particlesKeyFrames[keyFrame].redValue# = 0
							particlesKeyFrames[keyFrame].greenValue# = 0
							particlesKeyFrames[keyFrame].blueValue# = 0
							particlesKeyFrames[keyFrame].alphaValue# = 255
							particlesKeyFrames[keyFrame].timeValue# = 0.0
							
							a = propertiesPanelIndex
							particlesKeyFrames[keyFrame].alphaMin# = 0
							particlesKeyFrames[keyFrame].alphaMax# = 255
							particlesKeyFrames[keyFrame].blueMin# = 0
							particlesKeyFrames[keyFrame].blueMax# = 255
							particlesKeyFrames[keyFrame].greenMin# = 0
							particlesKeyFrames[keyFrame].greenMax# = 255
							particlesKeyFrames[keyFrame].redMin# = 0
							particlesKeyFrames[keyFrame].redMax# = 255
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
							SetSpriteColor(particlesKeyFrames[keyFrame].container, 255, 255, 0, 0)
							particlesKeyFrames[keyFrame].timeLabel = CreateText("Time")
							SetTextSize(particlesKeyFrames[keyFrame].timeLabel, defaultTextSize#)
							SetTextPosition(particlesKeyFrames[keyFrame].timeLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 0), GetSpriteY(particlesKeyFrames[keyFrame].container))
							SetTextDepth(particlesKeyFrames[keyFrame].timeLabel, GetSpriteDepth(ui.panels[a].background) - 1)
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
							SetEditBoxDepth(particlesKeyFrames[keyFrame].timeEditbox, GetSpriteDepth(ui.panels[a].background) - 1)
							FixEditBoxToScreen(particlesKeyFrames[keyFrame].timeEditbox, 1)
							particlesKeyFrames[keyFrame].redLabel = CreateText("Red")
							SetTextSize(particlesKeyFrames[keyFrame].redLabel, defaultTextSize#)
							SetTextPosition(particlesKeyFrames[keyFrame].redLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 1), GetSpriteY(particlesKeyFrames[keyFrame].container))
							SetTextDepth(particlesKeyFrames[keyFrame].redLabel, GetSpriteDepth(ui.panels[a].background) - 1)
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
							SetEditBoxDepth(particlesKeyFrames[keyFrame].redEditbox, GetSpriteDepth(ui.panels[a].background) - 1)
							FixEditBoxToScreen(particlesKeyFrames[keyFrame].redEditbox, 1)
							particlesKeyFrames[keyFrame].greenLabel = CreateText("Green")
							SetTextSize(particlesKeyFrames[keyFrame].greenLabel, defaultTextSize#)
							SetTextPosition(particlesKeyFrames[keyFrame].greenLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 2), GetSpriteY(particlesKeyFrames[keyFrame].container))
							SetTextDepth(particlesKeyFrames[keyFrame].greenLabel, GetSpriteDepth(ui.panels[a].background) - 1)
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
							SetEditBoxDepth(particlesKeyFrames[keyFrame].greenEditbox, GetSpriteDepth(ui.panels[a].background) - 1)
							FixEditBoxToScreen(particlesKeyFrames[keyFrame].greenEditbox, 1)
							particlesKeyFrames[keyFrame].blueLabel = CreateText("Blue")
							SetTextSize(particlesKeyFrames[keyFrame].blueLabel, defaultTextSize#)
							SetTextPosition(particlesKeyFrames[keyFrame].blueLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 3), GetSpriteY(particlesKeyFrames[keyFrame].container))
							SetTextDepth(particlesKeyFrames[keyFrame].blueLabel, GetSpriteDepth(ui.panels[a].background) - 1)
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
							SetEditBoxDepth(particlesKeyFrames[keyFrame].blueEditbox, GetSpriteDepth(ui.panels[a].background) - 1)
							FixEditBoxToScreen(particlesKeyFrames[keyFrame].blueEditbox, 1)
							particlesKeyFrames[keyFrame].alphaLabel = CreateText("Alpha")
							SetTextSize(particlesKeyFrames[keyFrame].alphaLabel, defaultTextSize#)
							SetTextPosition(particlesKeyFrames[keyFrame].alphaLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 4), GetSpriteY(particlesKeyFrames[keyFrame].container))
							SetTextDepth(particlesKeyFrames[keyFrame].alphaLabel, GetSpriteDepth(ui.panels[a].background) - 1)
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
							SetEditBoxDepth(particlesKeyFrames[keyFrame].alphaEditbox, GetSpriteDepth(ui.panels[a].background) - 1)
							FixEditBoxToScreen(particlesKeyFrames[keyFrame].alphaEditbox, 1)
							particlesKeyFrames[keyFrame].deleteIcon = CreateSprite(GetIconImageID("delete"))
							SetSpriteColor(particlesKeyFrames[keyFrame].deleteIcon, 147, 145, 147, 255)
							SetSpriteSize(particlesKeyFrames[keyFrame].deleteIcon, 20, 20)
							SetSpritePosition(particlesKeyFrames[keyFrame].deleteIcon, GetSpriteX(particlesKeyFrames[keyFrame].container) + GetSpriteWidth(particlesKeyFrames[keyFrame].container) - GetSpriteWidth(particlesKeyFrames[keyFrame].deleteIcon), GetEditBoxY(particlesKeyFrames[keyFrame].alphaEditbox) + (GetEditBoxHeight(particlesKeyFrames[keyFrame].alphaEditbox) / 2) - (GetSpriteHeight(particlesKeyFrames[keyFrame].deleteIcon) / 2))
							FixSpriteToScreen(particlesKeyFrames[keyFrame].deleteIcon, 1)
							
				
						endif
						if (ui.panels[propertiesPanelIndex].buttons[i].name$ = "AddScaleKeyFrame")
						
							particlesKeyFrames.insert(blankParticlesKeyFrame)
							keyFrame = particlesKeyFrames.length
							particlesKeyFrames[keyFrame].group$ = "Scale"
							particlesKeyFrames[keyFrame].scaleValue# = 1.0
							particlesKeyFrames[keyFrame].timeValue# = 0.0
							
							a = propertiesPanelIndex
							particlesKeyFrames[keyFrame].scaleMin# = 0
							particlesKeyFrames[keyFrame].scaleMax# = 999
							particlesKeyFrames[keyFrame].timeMin# = 0
							particlesKeyFrames[keyFrame].timeMax# = 999
							particlesKeyFrames[keyFrame].container = CreateSprite(0)
							SetSpriteSize(particlesKeyFrames[keyFrame].container, 260, 38)
							if (keyFrame = 0)
								SetSpritePosition(particlesKeyFrames[keyFrame].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(ui.panels[a].subHeaders[0].container) + GetSpriteHeight(ui.panels[a].subHeaders[0].container) + 10)
							else
								SetSpritePosition(particlesKeyFrames[keyFrame].container, GetSpriteX(ui.panels[a].background) + 20, GetSpriteY(particlesKeyFrames[keyFrame - 1].container) + GetSpriteHeight(particlesKeyFrames[keyFrame - 1].container) + 12)
							endif
							SetSpriteColor(particlesKeyFrames[keyFrame].container, 255, 255, 0, 0)
							particlesKeyFrames[keyFrame].timeLabel = CreateText("Time")
							SetTextSize(particlesKeyFrames[keyFrame].timeLabel, defaultTextSize#)
							SetTextPosition(particlesKeyFrames[keyFrame].timeLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 0), GetSpriteY(particlesKeyFrames[keyFrame].container))
							SetTextDepth(particlesKeyFrames[keyFrame].timeLabel, GetSpriteDepth(ui.panels[a].background) - 1)
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
							SetEditBoxDepth(particlesKeyFrames[keyFrame].timeEditbox, GetSpriteDepth(ui.panels[a].background) - 1)
							FixEditBoxToScreen(particlesKeyFrames[keyFrame].timeEditbox, 1)
							particlesKeyFrames[keyFrame].scaleLabel = CreateText("Scale")
							SetTextSize(particlesKeyFrames[keyFrame].scaleLabel, defaultTextSize#)
							SetTextPosition(particlesKeyFrames[keyFrame].scaleLabel, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 1), GetSpriteY(particlesKeyFrames[keyFrame].container))
							SetTextDepth(particlesKeyFrames[keyFrame].scaleLabel, GetSpriteDepth(ui.panels[a].background) - 1)
							FixTextToScreen(particlesKeyFrames[keyFrame].scaleLabel, 1)
							particlesKeyFrames[keyFrame].scaleEditbox = CreateEditBox()
							SetEditBoxText(particlesKeyFrames[keyFrame].scaleEditbox, str(particlesKeyFrames[keyFrame].scaleValue#, 0))
							SetEditBoxSize(particlesKeyFrames[keyFrame].scaleEditbox, 41, GetEditBoxHeight(particlesKeyFrames[keyFrame].scaleEditbox))
							SetEditBoxPosition(particlesKeyFrames[keyFrame].scaleEditbox, GetSpriteX(particlesKeyFrames[keyFrame].container) + (48 * 1), GetSpriteY(particlesKeyFrames[keyFrame].container) + GetSpriteHeight(particlesKeyFrames[keyFrame].container) - GetEditBoxHeight(particlesKeyFrames[keyFrame].scaleEditbox))
							SetEditBoxBorderSize(particlesKeyFrames[keyFrame].scaleEditbox, 1)
							SetEditBoxBorderColor(particlesKeyFrames[keyFrame].scaleEditbox, 90, 88, 91, 255)
							SetEditBoxInputType(particlesKeyFrames[keyFrame].scaleEditbox, 1)
							SetEditBoxBackgroundColor(particlesKeyFrames[keyFrame].scaleEditbox, 61, 57, 60, 255)
							SetEditBoxTextColor(particlesKeyFrames[keyFrame].scaleEditbox, 255, 255, 255)
							SetEditBoxDepth(particlesKeyFrames[keyFrame].scaleEditbox, GetSpriteDepth(ui.panels[a].background) - 1)
							FixEditBoxToScreen(particlesKeyFrames[keyFrame].scaleEditbox, 1)
							particlesKeyFrames[keyFrame].deleteIcon = CreateSprite(GetIconImageID("delete"))
							SetSpriteColor(particlesKeyFrames[keyFrame].deleteIcon, 147, 145, 147, 255)
							SetSpriteSize(particlesKeyFrames[keyFrame].deleteIcon, 20, 20)
							SetSpritePosition(particlesKeyFrames[keyFrame].deleteIcon, GetSpriteX(particlesKeyFrames[keyFrame].container) + GetSpriteWidth(particlesKeyFrames[keyFrame].container) - GetSpriteWidth(particlesKeyFrames[keyFrame].deleteIcon), GetEditBoxY(particlesKeyFrames[keyFrame].scaleEditbox) + (GetEditBoxHeight(particlesKeyFrames[keyFrame].scaleEditbox) / 2) - (GetSpriteHeight(particlesKeyFrames[keyFrame].deleteIcon) / 2))
							FixSpriteToScreen(particlesKeyFrames[keyFrame].deleteIcon, 1)
							
				
						endif
					endif
				next
				for i = 0 to 9
					if (spriteReleased = ui.checkboxes[i].background or spriteReleased = ui.checkboxes[i].foreground)
						ui.checkboxes[i].value = 1 - ui.checkboxes[i].value
						if (selectedCategory = CATEGORY_COS_SIN_ORBIT)
							if (i = 0 and ui.checkboxes[0].value = 1)
								ui.checkboxes[1].value = 0
								SetSpriteColor(ui.checkboxes[1].background, 94, 90, 93, 255)
								SetSpritePosition(ui.checkboxes[1].foreground, -99999, -99999)
							endif
							if (i = 1 and ui.checkboxes[1].value = 1)
								ui.checkboxes[0].value = 0
								SetSpriteColor(ui.checkboxes[0].background, 94, 90, 93, 255)
								SetSpritePosition(ui.checkboxes[0].foreground, -99999, -99999)
							endif
						endif
						if (ui.checkboxes[i].value = 0)
							SetSpriteColor(ui.checkboxes[i].background, 94, 90, 93, 255)
							SetSpritePosition(ui.checkboxes[i].foreground, -99999, -99999)
						else
							SetSpriteColor(ui.checkboxes[i].background, 211, 157, 5, 255)
							SetSpritePosition(ui.checkboxes[i].foreground, GetSpriteX(ui.checkboxes[i].background), GetSpriteY(ui.checkboxes[i].background))
							SetSpriteSize(ui.checkboxes[i].foreground, GetSpriteWidth(ui.checkboxes[i].background), GetSpriteHeight(ui.checkboxes[i].background))
							SetSpriteImage(ui.checkboxes[i].foreground, GetIconImageID("check"))
							SetSpriteColor(ui.checkboxes[i].foreground, 255, 255, 255, 255)
						endif
					endif
				next
				for keyFrame = 0 to particlesKeyFrames.length
					if (spriteReleased = particlesKeyFrames[keyFrame].deleteIcon)
						DeleteSprite(particlesKeyFrames[keyFrame].container)
						DeleteText(particlesKeyFrames[keyFrame].timeLabel)
						DeleteEditBox(particlesKeyFrames[keyFrame].timeEditbox)
						DeleteText(particlesKeyFrames[keyFrame].redLabel)
						DeleteEditBox(particlesKeyFrames[keyFrame].redEditbox)
						DeleteText(particlesKeyFrames[keyFrame].greenLabel)
						DeleteEditBox(particlesKeyFrames[keyFrame].greenEditbox)
						DeleteText(particlesKeyFrames[keyFrame].blueLabel)
						DeleteEditBox(particlesKeyFrames[keyFrame].blueEditbox)
						DeleteText(particlesKeyFrames[keyFrame].alphaLabel)
						DeleteEditBox(particlesKeyFrames[keyFrame].alphaEditbox)
						DeleteText(particlesKeyFrames[keyFrame].scaleLabel)
						DeleteEditBox(particlesKeyFrames[keyFrame].scaleEditbox)
						DeleteSprite(particlesKeyFrames[keyFrame].deleteIcon)
						particlesKeyFrames.remove(keyFrame)
						exit
					endif
				next
			endif
			spritePressed = 0
			spriteHeld = 0
			spriteReleased = 0
		endif
	endif
	
	UpdateUIListener()
	
	for i = 0 to particlesKeyFrames.length
		if (particlesKeyFrames[i].group$ = "Color")
			if (GetEditBoxExists(particlesKeyFrames[i].timeEditbox))
				if (GetEditBoxText(particlesKeyFrames[i].alphaEditbox) = "-0") then SetEditBoxText(particlesKeyFrames[i].alphaEditbox, "0")
				if (GetEditBoxText(particlesKeyFrames[i].blueEditbox) = "-0") then SetEditBoxText(particlesKeyFrames[i].blueEditbox, "0")
				if (GetEditBoxText(particlesKeyFrames[i].greenEditbox) = "-0") then SetEditBoxText(particlesKeyFrames[i].greenEditbox, "0")
				if (GetEditBoxText(particlesKeyFrames[i].redEditbox) = "-0") then SetEditBoxText(particlesKeyFrames[i].redEditbox, "0")
				if (GetEditBoxText(particlesKeyFrames[i].timeEditbox) = "-0") then SetEditBoxText(particlesKeyFrames[i].timeEditbox, "0")
				if (GetEditBoxHasFocus(particlesKeyFrames[i].alphaEditbox))
					SetEditBoxBorderSize(particlesKeyFrames[i].alphaEditbox, 2)
					SetEditBoxBorderColor(particlesKeyFrames[i].alphaEditbox, 146, 143, 46, 200)
				else
					SetEditBoxBorderSize(particlesKeyFrames[i].alphaEditbox, 1)
					SetEditBoxBorderColor(particlesKeyFrames[i].alphaEditbox, 90, 88, 91, 200)
				endif
				if (GetEditBoxHasFocus(particlesKeyFrames[i].blueEditbox))
					SetEditBoxBorderSize(particlesKeyFrames[i].blueEditbox, 2)
					SetEditBoxBorderColor(particlesKeyFrames[i].blueEditbox, 146, 143, 46, 200)
				else
					SetEditBoxBorderSize(particlesKeyFrames[i].blueEditbox, 1)
					SetEditBoxBorderColor(particlesKeyFrames[i].blueEditbox, 90, 88, 91, 200)
				endif
				if (GetEditBoxHasFocus(particlesKeyFrames[i].greenEditbox))
					SetEditBoxBorderSize(particlesKeyFrames[i].greenEditbox, 2)
					SetEditBoxBorderColor(particlesKeyFrames[i].greenEditbox, 146, 143, 46, 200)
				else
					SetEditBoxBorderSize(particlesKeyFrames[i].greenEditbox, 1)
					SetEditBoxBorderColor(particlesKeyFrames[i].greenEditbox, 90, 88, 91, 200)
				endif
				if (GetEditBoxHasFocus(particlesKeyFrames[i].redEditbox))
					SetEditBoxBorderSize(particlesKeyFrames[i].redEditbox, 2)
					SetEditBoxBorderColor(particlesKeyFrames[i].redEditbox, 146, 143, 46, 200)
				else
					SetEditBoxBorderSize(particlesKeyFrames[i].redEditbox, 1)
					SetEditBoxBorderColor(particlesKeyFrames[i].redEditbox, 90, 88, 91, 200)
				endif
				if (GetEditBoxHasFocus(particlesKeyFrames[i].timeEditbox))
					SetEditBoxBorderSize(particlesKeyFrames[i].timeEditbox, 2)
					SetEditBoxBorderColor(particlesKeyFrames[i].timeEditbox, 146, 143, 46, 200)
				else
					SetEditBoxBorderSize(particlesKeyFrames[i].timeEditbox, 1)
					SetEditBoxBorderColor(particlesKeyFrames[i].timeEditbox, 90, 88, 91, 200)
				endif
				if (GetEditBoxChanged(particlesKeyFrames[i].alphaEditbox))
					if (valFloat(GetEditBoxText(particlesKeyFrames[i].alphaEditbox)) < particlesKeyFrames[i].alphaMin#)
						SetEditBoxText(particlesKeyFrames[i].alphaEditbox, str(particlesKeyFrames[i].alphaMin#, 0))
					endif
					if (valFloat(GetEditBoxText(particlesKeyFrames[i].alphaEditbox)) > particlesKeyFrames[i].alphaMax#)
						SetEditBoxText(particlesKeyFrames[i].alphaEditbox, str(particlesKeyFrames[i].alphaMax#, 0))
					endif
					particlesKeyFrames[i].alphaValue# = valFloat(GetEditBoxText(particlesKeyFrames[i].alphaEditbox))
				endif
				if (GetEditBoxChanged(particlesKeyFrames[i].blueEditbox))
					if (valFloat(GetEditBoxText(particlesKeyFrames[i].blueEditbox)) < particlesKeyFrames[i].blueMin#)
						SetEditBoxText(particlesKeyFrames[i].blueEditbox, str(particlesKeyFrames[i].blueMin#, 0))
					endif
					if (valFloat(GetEditBoxText(particlesKeyFrames[i].blueEditbox)) > particlesKeyFrames[i].blueMax#)
						SetEditBoxText(particlesKeyFrames[i].blueEditbox, str(particlesKeyFrames[i].blueMax#, 0))
					endif
					particlesKeyFrames[i].blueValue# = valFloat(GetEditBoxText(particlesKeyFrames[i].blueEditbox))
				endif
				if (GetEditBoxChanged(particlesKeyFrames[i].greenEditbox))
					if (valFloat(GetEditBoxText(particlesKeyFrames[i].greenEditbox)) < particlesKeyFrames[i].greenMin#)
						SetEditBoxText(particlesKeyFrames[i].greenEditbox, str(particlesKeyFrames[i].greenMin#, 0))
					endif
					if (valFloat(GetEditBoxText(particlesKeyFrames[i].greenEditbox)) > particlesKeyFrames[i].greenMax#)
						SetEditBoxText(particlesKeyFrames[i].greenEditbox, str(particlesKeyFrames[i].greenMax#, 0))
					endif
					particlesKeyFrames[i].greenValue# = valFloat(GetEditBoxText(particlesKeyFrames[i].greenEditbox))
				endif
				if (GetEditBoxChanged(particlesKeyFrames[i].redEditbox))
					if (valFloat(GetEditBoxText(particlesKeyFrames[i].redEditbox)) < particlesKeyFrames[i].redMin#)
						SetEditBoxText(particlesKeyFrames[i].redEditbox, str(particlesKeyFrames[i].redMin#, 0))
					endif
					if (valFloat(GetEditBoxText(particlesKeyFrames[i].redEditbox)) > particlesKeyFrames[i].redMax#)
						SetEditBoxText(particlesKeyFrames[i].redEditbox, str(particlesKeyFrames[i].redMax#, 0))
					endif
					particlesKeyFrames[i].redValue# = valFloat(GetEditBoxText(particlesKeyFrames[i].redEditbox))
				endif
				if (GetEditBoxChanged(particlesKeyFrames[i].timeEditbox))
					if (valFloat(GetEditBoxText(particlesKeyFrames[i].timeEditbox)) < particlesKeyFrames[i].timeMin#)
						SetEditBoxText(particlesKeyFrames[i].timeEditbox, str(particlesKeyFrames[i].timeMin#))
					endif
					if (valFloat(GetEditBoxText(particlesKeyFrames[i].timeEditbox)) > particlesKeyFrames[i].timeMax#)
						SetEditBoxText(particlesKeyFrames[i].timeEditbox, str(particlesKeyFrames[i].timeMax#))
					endif
					particlesKeyFrames[i].timeValue# = valFloat(GetEditBoxText(particlesKeyFrames[i].timeEditbox))
				endif
			endif
		endif
		if (particlesKeyFrames[i].group$ = "Scale")
			if (GetEditBoxExists(particlesKeyFrames[i].timeEditbox))
				if (GetEditBoxText(particlesKeyFrames[i].scaleEditbox) = "-0") then SetEditBoxText(particlesKeyFrames[i].scaleEditbox, "0")
				if (GetEditBoxText(particlesKeyFrames[i].timeEditbox) = "-0") then SetEditBoxText(particlesKeyFrames[i].timeEditbox, "0")
				if (GetEditBoxHasFocus(particlesKeyFrames[i].scaleEditbox))
					SetEditBoxBorderSize(particlesKeyFrames[i].scaleEditbox, 2)
					SetEditBoxBorderColor(particlesKeyFrames[i].scaleEditbox, 146, 143, 46, 200)
				else
					SetEditBoxBorderSize(particlesKeyFrames[i].scaleEditbox, 1)
					SetEditBoxBorderColor(particlesKeyFrames[i].scaleEditbox, 90, 88, 91, 200)
				endif
				if (GetEditBoxHasFocus(particlesKeyFrames[i].timeEditbox))
					SetEditBoxBorderSize(particlesKeyFrames[i].timeEditbox, 2)
					SetEditBoxBorderColor(particlesKeyFrames[i].timeEditbox, 146, 143, 46, 200)
				else
					SetEditBoxBorderSize(particlesKeyFrames[i].timeEditbox, 1)
					SetEditBoxBorderColor(particlesKeyFrames[i].timeEditbox, 90, 88, 91, 200)
				endif
				if (GetEditBoxChanged(particlesKeyFrames[i].scaleEditbox))
					if (valFloat(GetEditBoxText(particlesKeyFrames[i].scaleEditbox)) < particlesKeyFrames[i].scaleMin#)
						SetEditBoxText(particlesKeyFrames[i].scaleEditbox, str(particlesKeyFrames[i].scaleMin#, 0))
					endif
					if (valFloat(GetEditBoxText(particlesKeyFrames[i].scaleEditbox)) > particlesKeyFrames[i].scaleMax#)
						SetEditBoxText(particlesKeyFrames[i].scaleEditbox, str(particlesKeyFrames[i].scaleMax#, 0))
					endif
					particlesKeyFrames[i].scaleValue# = valFloat(GetEditBoxText(particlesKeyFrames[i].scaleEditbox))
				endif
				if (GetEditBoxChanged(particlesKeyFrames[i].timeEditbox))
					if (valFloat(GetEditBoxText(particlesKeyFrames[i].timeEditbox)) < particlesKeyFrames[i].timeMin#)
						SetEditBoxText(particlesKeyFrames[i].timeEditbox, str(particlesKeyFrames[i].timeMin#, 0))
					endif
					if (valFloat(GetEditBoxText(particlesKeyFrames[i].timeEditbox)) > particlesKeyFrames[i].timeMax#)
						SetEditBoxText(particlesKeyFrames[i].timeEditbox, str(particlesKeyFrames[i].timeMax#, 0))
					endif
					particlesKeyFrames[i].timeValue# = valFloat(GetEditBoxText(particlesKeyFrames[i].timeEditbox))
				endif
			endif
		endif
	next

	for i = 0 to 9		
		if (ui.sliders[i].rangeSlider = 0)
			if (GetEditBoxText(ui.sliders[i].editbox) = "-0") then SetEditBoxText(ui.sliders[i].editbox, "0")
			if (GetEditBoxChanged(ui.sliders[i].editbox))
				if (valFloat(GetEditBoxText(ui.sliders[i].editbox)) < ui.sliders[i].min#)
					SetEditBoxText(ui.sliders[i].editbox, str(ui.sliders[i].min#, 0))
				endif
				if (valFloat(GetEditBoxText(ui.sliders[i].editbox)) > ui.sliders[i].max#)
					SetEditBoxText(ui.sliders[i].editbox, str(ui.sliders[i].max#, 0))
				endif
				ui.sliders[i].value# = valFloat(GetEditBoxText(ui.sliders[i].editbox))
				percentage# = ((ui.sliders[i].value# - ui.sliders[i].min#) / (ui.sliders[i].max# - ui.sliders[i].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[i].inactiveTrack) - GetSpriteWidth(ui.sliders[i].handle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[i].handle, GetSpriteX(ui.sliders[i].inactiveTrack) + (GetSpriteWidth(ui.sliders[i].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[i].inactiveTrack))	
				if (ui.sliders[i].activeTrackFromCentre = 0)
					SetSpriteSize(ui.sliders[i].activeTrack, GetSpriteXByOffset(ui.sliders[i].handle) - GetSpriteX(ui.sliders[i].inactiveTrack), GetSpriteHeight(ui.sliders[i].inactiveTrack))
				else
					SetSpriteSize(ui.sliders[i].activeTrack, abs(GetSpriteXByOffset(ui.sliders[i].handle) - GetSpriteXByOffset(ui.sliders[i].inactiveTrack)), GetSpriteHeight(ui.sliders[i].inactiveTrack))
					if (ui.sliders[i].value# < 0)
						SetSpritePosition(ui.sliders[i].activeTrack, GetSpriteXByOffset(ui.sliders[i].inactiveTrack) - GetSpriteWidth(ui.sliders[i].activeTrack), GetSpriteY(ui.sliders[i].container) + 27)
					else
						SetSpritePosition(ui.sliders[i].activeTrack, GetSpriteXByOffset(ui.sliders[i].inactiveTrack), GetSpriteY(ui.sliders[i].container) + 27)
					endif	
				endif
			endif
			if (GetEditBoxHasFocus(ui.sliders[i].editbox))
				SetEditBoxBorderSize(ui.sliders[i].editbox, 2)
				SetEditBoxBorderColor(ui.sliders[i].editbox, 146, 143, 46, 200)
			else
				//SetEditBoxBorderSize(ui.sliders[i].editbox, 0)
				SetEditBoxBorderSize(ui.sliders[i].editbox, 1)
				SetEditBoxBorderColor(ui.sliders[i].editbox, 90, 88, 91, 200)
			endif
		endif
		if (ui.sliders[i].rangeSlider = 1)
			if (GetEditBoxText(ui.sliders[i].minEditbox) = "-0") then SetEditBoxText(ui.sliders[i].minEditbox, "0")
			if (GetEditBoxText(ui.sliders[i].maxEditbox) = "-0") then SetEditBoxText(ui.sliders[i].maxEditbox, "0")
			if (GetEditBoxChanged(ui.sliders[i].minEditbox))
				if (valFloat(GetEditBoxText(ui.sliders[i].minEditbox)) < ui.sliders[i].min#)
					SetEditBoxText(ui.sliders[i].minEditbox, str(ui.sliders[i].min#, 0))
				endif
				if (valFloat(GetEditBoxText(ui.sliders[i].minEditbox)) > ui.sliders[i].max#)
					SetEditBoxText(ui.sliders[i].minEditbox, str(ui.sliders[i].max#, 0))
				endif
				ui.sliders[i].value# = valFloat(GetEditBoxText(ui.sliders[i].minEditbox))
				percentage# = ((ui.sliders[i].value# - ui.sliders[i].min#) / (ui.sliders[i].max# - ui.sliders[i].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[i].inactiveTrack) - GetSpriteWidth(ui.sliders[i].minHandle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[i].minHandle, GetSpriteX(ui.sliders[i].inactiveTrack) + (GetSpriteWidth(ui.sliders[i].minHandle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[i].inactiveTrack))	
				SetSpriteSize(ui.sliders[i].activeTrack, abs(GetSpriteXByOffset(ui.sliders[i].maxHandle) - GetSpriteXByOffset(ui.sliders[i].minHandle)), 4)
				SetSpritePosition(ui.sliders[i].activeTrack, GetSpriteXByOffset(ui.sliders[i].minHandle), GetSpriteY(ui.sliders[i].container) + 27)	
			endif
			if (GetEditBoxChanged(ui.sliders[i].maxEditbox))
				if (valFloat(GetEditBoxText(ui.sliders[i].maxEditbox)) < ui.sliders[i].min#)
					SetEditBoxText(ui.sliders[i].maxEditbox, str(ui.sliders[i].min#, 0))
				endif
				if (valFloat(GetEditBoxText(ui.sliders[i].maxEditbox)) > ui.sliders[i].max#)
					SetEditBoxText(ui.sliders[i].maxEditbox, str(ui.sliders[i].max#, 0))
				endif
				ui.sliders[i].value# = valFloat(GetEditBoxText(ui.sliders[i].maxEditbox))
				percentage# = ((ui.sliders[i].value# - ui.sliders[i].min#) / (ui.sliders[i].max# - ui.sliders[i].min#)) * 100.0
				handleX# = ((GetSpriteWidth(ui.sliders[i].inactiveTrack) - GetSpriteWidth(ui.sliders[i].maxHandle)) / 100.0) * percentage#
				SetSpritePositionByOffset(ui.sliders[i].maxHandle, GetSpriteX(ui.sliders[i].inactiveTrack) + (GetSpriteWidth(ui.sliders[i].maxHandle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[i].inactiveTrack))	
				SetSpriteSize(ui.sliders[i].activeTrack, abs(GetSpriteXByOffset(ui.sliders[i].maxHandle) - GetSpriteXByOffset(ui.sliders[i].minHandle)), 4)
				SetSpritePosition(ui.sliders[i].activeTrack, GetSpriteXByOffset(ui.sliders[i].minHandle), GetSpriteY(ui.sliders[i].container) + 27)	
			endif
			if (GetEditBoxHasFocus(ui.sliders[i].minEditbox))
				SetEditBoxBorderSize(ui.sliders[i].minEditbox, 2)
				SetEditBoxBorderColor(ui.sliders[i].minEditbox, 146, 143, 46, 200)
			else
				//SetEditBoxBorderSize(ui.sliders[i].minEditbox, 0)
				SetEditBoxBorderSize(ui.sliders[i].minEditbox, 1)
				SetEditBoxBorderColor(ui.sliders[i].minEditbox, 90, 88, 91, 200)
			endif
			if (GetEditBoxHasFocus(ui.sliders[i].maxEditbox))
				SetEditBoxBorderSize(ui.sliders[i].maxEditbox, 2)
				SetEditBoxBorderColor(ui.sliders[i].maxEditbox, 146, 143, 46, 200)
			else
				//SetEditBoxBorderSize(ui.sliders[i].maxEditbox, 0)
				SetEditBoxBorderSize(ui.sliders[i].maxEditbox, 1)
				SetEditBoxBorderColor(ui.sliders[i].maxEditbox, 90, 88, 91, 200)
			endif
		endif
	next
	
	if (selectedCategory = CATEGORY_COS_SIN_ORBIT)
		SetSpritePositionByOffset(planet, categoriesPanelWidth# + ((GetWindowWidth() - categoriesPanelWidth# - propertiesPanelWidth#)  / 2), topPanelHeight# + tabsPanelHeight# + ((GetWindowHeight() - topPanelHeight# - tabsPanelHeight#) / 2))
		SetSpriteAngle(moon, GetSpriteAngle(moon) + val(GetEditBoxText(ui.sliders[2].editbox)))
		angle# = GetSpriteAngle(moon)
		radiusX# = val(GetEditBoxText(ui.sliders[0].editbox))
		radiusY# = val(GetEditBoxText(ui.sliders[1].editbox))
		//if (ui.checkboxes[2].value = 1)
		//	// THIS VERSION WILL MAKE THE MOON FACE THE PLANET AT ALL TIMES
		//	moonX# = GetSpriteXByOffset(planet) + cos(angle#) * radiusX#
		//	moonY# = GetSpriteYByOffset(planet) + sin(angle#) * radiusY#
		//else
		moonX# = GetSpriteXByOffset(planet) - cos(angle#) * radiusX#
		moonY# = GetSpriteYByOffset(planet) - sin(angle#) * radiusY#
		//endif
		SetSpritePositionByOffset(moon, moonX#, moonY#)
	else
		SetSpritePositionByOffset(planet, -99999, -99999)
		SetSpritePositionByOffset(moon, -99999, -99999)
	endif
	if (selectedCategory = CATEGORY_2D_PARTICLES)
		SetParticlesActive(particles, 1)
		SetParticlesVisible(particles, 1)
		SetParticlesAngle(particles, val(GetEditBoxText(ui.sliders[1].editbox)))
		SetParticlesDepth(particles, 100)
		SetParticlesDirection(particles, val(GetEditBoxText(ui.sliders[2].editbox)), val(GetEditBoxText(ui.sliders[3].editbox)))
		//SetParticlesFaceDirection(particles, ui.checkboxes[0].value)
		SetParticlesFrequency(particles, val(GetEditBoxText(ui.sliders[4].editbox)))
		SetParticlesImage(particles, imgParticle)
		SetParticlesLife(particles, val(GetEditBoxText(ui.sliders[5].editbox)))
		SetParticlesPosition(particles, categoriesPanelWidth# + ((GetWindowWidth() - categoriesPanelWidth# - propertiesPanelWidth#)  / 2), topPanelHeight# + tabsPanelHeight# + ((GetWindowHeight() - topPanelHeight# - tabsPanelHeight#) / 2))
		SetParticlesSize(particles, val(GetEditBoxText(ui.sliders[0].editbox)))
		SetParticlesStartZone(particles, val(GetEditBoxText(ui.sliders[7].minEditbox)), val(GetEditBoxText(ui.sliders[8].minEditbox)), val(GetEditBoxText(ui.sliders[7].maxEditbox)), val(GetEditBoxText(ui.sliders[8].maxEditbox)))
		SetParticlesVelocityRange(particles, val(GetEditBoxText(ui.sliders[6].minEditbox)), val(GetEditBoxText(ui.sliders[6].maxEditbox)))
		
		ClearParticlesColors(particles)
		ClearParticlesScales(particles)
		for keyFrame = 0 to particlesKeyFrames.length
			if (particlesKeyFrames[keyFrame].group$ = "Color")
				AddParticlesColorKeyFrame(particles, particlesKeyFrames[keyFrame].timeValue#, particlesKeyFrames[keyFrame].redValue#, particlesKeyFrames[keyFrame].greenValue#, particlesKeyFrames[keyFrame].blueValue#, particlesKeyFrames[keyFrame].alphaValue#)
			endif
		next
		for keyFrame = 0 to particlesKeyFrames.length
			if (particlesKeyFrames[keyFrame].group$ = "Scale")
				AddParticlesScaleKeyFrame(particles, particlesKeyFrames[keyFrame].timeValue#, particlesKeyFrames[keyFrame].scaleValue#)
			endif
		next
		if (ui.checkboxes[0].value = 1)
			DrawLine(GetParticlesX(particles) + val(GetEditBoxText(ui.sliders[7].minEditbox)), GetParticlesY(particles) + val(GetEditBoxText(ui.sliders[8].minEditbox)), GetParticlesX(particles) + val(GetEditBoxText(ui.sliders[7].maxEditbox)), GetParticlesY(particles) + val(GetEditBoxText(ui.sliders[8].minEditbox)), 255, 0, 0)
			DrawLine(GetParticlesX(particles) + val(GetEditBoxText(ui.sliders[7].minEditbox)), GetParticlesY(particles) + val(GetEditBoxText(ui.sliders[8].maxEditbox)), GetParticlesX(particles) + val(GetEditBoxText(ui.sliders[7].maxEditbox)), GetParticlesY(particles) + val(GetEditBoxText(ui.sliders[8].maxEditbox)), 255, 0, 0)
			DrawLine(GetParticlesX(particles) + val(GetEditBoxText(ui.sliders[7].minEditbox)), GetParticlesY(particles) + val(GetEditBoxText(ui.sliders[8].minEditbox)), GetParticlesX(particles) + val(GetEditBoxText(ui.sliders[7].minEditbox)), GetParticlesY(particles) + val(GetEditBoxText(ui.sliders[8].maxEditbox)), 255, 0, 0)
			DrawLine(GetParticlesX(particles) + val(GetEditBoxText(ui.sliders[7].maxEditbox)), GetParticlesY(particles) + val(GetEditBoxText(ui.sliders[8].minEditbox)), GetParticlesX(particles) + val(GetEditBoxText(ui.sliders[7].maxEditbox)), GetParticlesY(particles) + val(GetEditBoxText(ui.sliders[8].maxEditbox)), 255, 0, 0)
		endif
	endif
	if (selectedCategory = CATEGORY_SINE_WAVES)
		angularFrequency# = val(GetEditBoxText(ui.sliders[0].editbox))
		waveAngle# = waveAngle# + angularFrequency#
		amplitude# = val(GetEditBoxText(ui.sliders[1].editbox))
		spacingX# = val(GetEditBoxText(ui.sliders[2].editbox))
		spaceshipX# = spaceshipX# + spacingX#
		if (spaceshipX# < ScreenToWorldX(categoriesPanelWidth# - (GetSpriteWidth(spaceship) / 2))) then spaceshipX# = ScreenToWorldX(GetSpriteX(ui.panels[playgroundPanelIndex].background) + GetSpriteWidth(ui.panels[playgroundPanelIndex].background) + (GetSpriteWidth(spaceship) / 2)) //ScreenToWorldX(categoriesPanelWidth# - (GetSpriteWidth(spaceship) / 2))
		if (spaceshipX# > ScreenToWorldX(GetSpriteX(ui.panels[playgroundPanelIndex].background) + GetSpriteWidth(ui.panels[playgroundPanelIndex].background) + (GetSpriteWidth(spaceship) / 2))) then spaceshipX# = ScreenToWorldX(categoriesPanelWidth# - (GetSpriteWidth(spaceship) / 2))
		spaceshipY# = amplitude# * sin(waveAngle#)
		SetSpritePositionByOffset(spaceship, spaceshipX#, spaceshipY# + topPanelHeight# + tabsPanelHeight# + ((GetWindowHeight() - topPanelHeight# - tabsPanelHeight#) / 2))
		if (ui.checkboxes[0].value = 1)
			nextX# = spaceshipX# + spacingX#
			nextY# = (amplitude# * sin(waveAngle# + angularFrequency#)) + topPanelHeight# + tabsPanelHeight# + ((GetWindowHeight() - topPanelHeight# - tabsPanelHeight#) / 2)
			SetSpriteAngle(spaceship, atan2(nextY# - GetSpriteYByOffset(spaceship), nextX# - GetSpriteXByOffset(spaceship)))
		else
			SetSpriteAngle(spaceship, 0)
		endif
	else
		SetSpritePositionByOffset(spaceship, -99999, -99999)
	endif

	ScrollBarsListener()
	
	redrawPlayground = 0
	redrawUI = 0

	UpdateAllTweens(GetFrameTime())
	Sync()
loop

#include "functions.agc"
