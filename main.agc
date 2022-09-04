
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
// 3 days creating app icon and cover image for itch.io
// 1 day preparing itch.io page
// 4 out of 11 days total

// THANKS:
// BlinkOk & Leyvin for Sin/Cos help
//
// CREDITS:
// Artwork from KennyAssets (kenny.nl)

#insert "types.agc"
#insert "globals.agc"
#insert "icons.agc"
#insert "ui.agc"

ResetProperties()

if (val(GetLocalVariableValue("windowWidth")) >= minWindowWidth and val(GetLocalVariableValue("windowHeight")) >= minWindowHeight)
	SetWindowSize(val(GetLocalVariableValue("windowWidth")), val(GetLocalVariableValue("windowHeight")), 0)
endif

//leftEdgeOfScreen = CreateSprite(0)
//SetSpriteSize(leftEdgeOfScreen, 100, 100)
//SetSpritePositionByOffset(leftEdgeOfScreen, 0, GetWindowHeight() / 2)

planet = CreateSprite(imgPlanet)
SetSpriteSize(planet, 150, 150)
SetSpritePosition(planet, -99999, -99999)
SetSpriteDepth(planet, 100)
moon = CreateSprite(imgMoon)
SetSpriteSize(moon, 50, 50)
SetSpritePosition(moon, -99999, -99999)
SetSpriteDepth(moon, 99)
spaceship = CreateSprite(imgSpaceship)
SetSpriteSize(spaceship, 50, 50)
SetSpritePosition(spaceship, -99999, -99999)
SetSpriteDepth(spaceship, 100)
coin = CreateSprite(LoadImage("coin.png"))
SetSpriteSize(coin, 75, 75)
SetSpritePosition(coin, -99999, -99999)
SetSpriteDepth(coin, 100)
particles = CreateParticles(-99999, -99999)
recreateParticles = 1

particlesStartZone = CreateSprite(LoadImage("particle-start-zone-border.png"))
SetSpriteColor(particlesStartZone, 255, 0, 0, 255)
SetSpriteSize(particlesStartZone, 100, 100)
SetSpritePosition(particlesStartZone, -99999, -99999)
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
particlesKeyFrames[keyFrame].group$ = "Scale"
particlesKeyFrames[keyFrame].scaleValue# = 1.2
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
particlesKeyFrames[keyFrame].group$ = "Scale"
particlesKeyFrames[keyFrame].scaleValue# = 0.6
particlesKeyFrames[keyFrame].timeValue# = 2.0
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

fps = CreateText("60.00")
SetTextSize(fps, defaultTextSize# * 2)
SetTextColor(fps, 255, 255, 0, 200)
FixTextToScreen(fps, 1)

do
	if (tabSelected = 0)
		SetTextString(fps, "FPS: " + str(ScreenFPS(), 2))
		SetTextPosition(fps, GetSpriteX(ui.panels[playgroundPanelIndex].background) + 10, GetSpriteY(ui.panels[playgroundPanelIndex].background) + 10)
	else
		SetTextPosition(fps, -99999, -99999)
	endif
	
	if (GetRawKeyPressed(32))
		ShowAboutWindow()
	endif
	
	if (selectedCategory = CATEGORY_2D_PARTICLES)
		contentHeight# = 0
		contentY# = GetSpriteY(ui.panels[propertiesPanelIndex].invisibleDragZone) + 10 + 40
		
		SetSpritePosition(ui.imageLoaders[0].container, GetSpriteX(ui.panels[propertiesPanelIndex].background) + 20, contentY#)
		SetTextPosition(ui.imageLoaders[0].label, GetSpriteX(ui.imageLoaders[0].container), GetSpriteY(ui.imageLoaders[0].container))
		SetSpritePosition(ui.imageLoaders[0].imageBorder, GetSpriteX(ui.imageLoaders[0].container), GetSpriteY(ui.imageLoaders[0].container) + 20)
		SetSpritePositionByOffset(ui.imageLoaders[0].imageBackground, GetSpriteXByOffset(ui.imageLoaders[0].imageBorder), GetSpriteYByOffset(ui.imageLoaders[0].imageBorder))
		SetSpritePositionByOffset(ui.imageLoaders[0].image, GetSpriteXByOffset(ui.imageLoaders[0].imageBorder), GetSpriteYByOffset(ui.imageLoaders[0].imageBorder))
		SetSpritePosition(ui.imageLoaders[0].importButton.background, GetSpriteX(ui.imageLoaders[0].imageBorder) + GetSpriteWidth(ui.imageLoaders[0].imageBorder) + 10, GetSpriteY(ui.imageLoaders[0].imageBorder) + 15)
		SetTextPosition(ui.imageLoaders[0].importButton.label, GetSpriteXByOffset(ui.imageLoaders[0].importButton.background), GetSpriteYByOffset(ui.imageLoaders[0].importButton.background) - (GetTextTotalHeight(ui.imageLoaders[0].importButton.label) / 2))
		SetSpritePosition(ui.imageLoaders[0].removeButton.background, GetSpriteX(ui.imageLoaders[0].imageBorder) + GetSpriteWidth(ui.imageLoaders[0].imageBorder) + 10, GetSpriteY(ui.imageLoaders[0].imageBorder) + 45)
		SetTextPosition(ui.imageLoaders[0].removeButton.label, GetSpriteXByOffset(ui.imageLoaders[0].removeButton.background), GetSpriteYByOffset(ui.imageLoaders[0].removeButton.background) - (GetTextTotalHeight(ui.imageLoaders[0].removeButton.label) / 2))
		contentY# = contentY# + GetSpriteHeight(ui.imageLoaders[0].container) + 10
				
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
				contentY# = contentY# + GetSpriteHeight(ui.checkboxes[checkbox].container) + 10
				contentHeight# = contentHeight# + GetSpriteHeight(ui.checkboxes[checkbox].container) + 10
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
		ui.panels[propertiesPanelIndex].contentHeight# = contentHeight#
		if (contentHeight# > GetSpriteHeight(ui.panels[propertiesPanelIndex].background)) then ui.panels[propertiesPanelIndex].contentHeight# = ui.panels[propertiesPanelIndex].contentHeight# + 200
	endif
	if (selectedCategory = CATEGORY_COS_SIN_ORBIT)
		contentHeight# = 0
		contentY# = GetSpriteY(ui.panels[propertiesPanelIndex].invisibleDragZone) + 10 + 40
		
		imageLoader = 0
		SetSpritePosition(ui.imageLoaders[imageLoader].container, GetSpriteX(ui.panels[propertiesPanelIndex].invisibleDragZone) + 20, GetSpriteY(ui.panels[propertiesPanelIndex].invisibleDragZone) + 10 + 40)
		SetTextPosition(ui.imageLoaders[imageLoader].label, GetSpriteX(ui.imageLoaders[imageLoader].container), GetSpriteY(ui.imageLoaders[imageLoader].container))
		SetSpritePosition(ui.imageLoaders[imageLoader].imageBorder, GetSpriteX(ui.imageLoaders[imageLoader].container), GetSpriteY(ui.imageLoaders[imageLoader].container) + 20)
		SetSpritePositionByOffset(ui.imageLoaders[imageLoader].imageBackground, GetSpriteXByOffset(ui.imageLoaders[imageLoader].imageBorder), GetSpriteYByOffset(ui.imageLoaders[imageLoader].imageBorder))
		SetSpritePositionByOffset(ui.imageLoaders[imageLoader].image, GetSpriteXByOffset(ui.imageLoaders[imageLoader].imageBorder), GetSpriteYByOffset(ui.imageLoaders[imageLoader].imageBorder))
		SetSpritePosition(ui.imageLoaders[imageLoader].importButton.background, GetSpriteX(ui.imageLoaders[imageLoader].imageBorder) + GetSpriteWidth(ui.imageLoaders[imageLoader].imageBorder) + 10, GetSpriteY(ui.imageLoaders[imageLoader].imageBorder) + 15)
		SetTextPosition(ui.imageLoaders[imageLoader].importButton.label, GetSpriteXByOffset(ui.imageLoaders[imageLoader].importButton.background), GetSpriteYByOffset(ui.imageLoaders[imageLoader].importButton.background) - (GetTextTotalHeight(ui.imageLoaders[imageLoader].importButton.label) / 2))
		SetSpritePosition(ui.imageLoaders[imageLoader].removeButton.background, GetSpriteX(ui.imageLoaders[imageLoader].imageBorder) + GetSpriteWidth(ui.imageLoaders[imageLoader].imageBorder) + 10, GetSpriteY(ui.imageLoaders[imageLoader].imageBorder) + 45)
		SetTextPosition(ui.imageLoaders[imageLoader].removeButton.label, GetSpriteXByOffset(ui.imageLoaders[imageLoader].removeButton.background), GetSpriteYByOffset(ui.imageLoaders[imageLoader].removeButton.background) - (GetTextTotalHeight(ui.imageLoaders[imageLoader].removeButton.label) / 2))
		contentY# = contentY# + GetSpriteHeight(ui.imageLoaders[imageLoader].container) + 10
		contentHeight# = contentHeight# + GetSpriteHeight(ui.imageLoaders[imageLoader].container) + 10
		
		slider = 0
		SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[propertiesPanelIndex].invisibleDragZone) + 20, GetSpriteY(ui.imageLoaders[0].container) + GetSpriteHeight(ui.imageLoaders[0].container) + 10)
		SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
		SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
		SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
		percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
		handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
		SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
		if (ui.sliders[slider].activeTrackFromCentre = 0)
			SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
		else
			if (ui.sliders[slider].value# < 0)
				SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
			else
				SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
			endif	
		endif
		contentY# = contentY# + GetSpriteHeight(ui.sliders[slider].container) + 10
		contentHeight# = contentHeight# + GetSpriteHeight(ui.sliders[slider].container) + 10
		
		imageLoader = 1
		SetSpritePosition(ui.imageLoaders[imageLoader].container, GetSpriteX(ui.panels[propertiesPanelIndex].invisibleDragZone) + 20, GetSpriteY(ui.sliders[0].container) + GetSpriteHeight(ui.sliders[0].container) + 10)
		SetTextPosition(ui.imageLoaders[imageLoader].label, GetSpriteX(ui.imageLoaders[imageLoader].container), GetSpriteY(ui.imageLoaders[imageLoader].container))
		SetSpritePosition(ui.imageLoaders[imageLoader].imageBorder, GetSpriteX(ui.imageLoaders[imageLoader].container), GetSpriteY(ui.imageLoaders[imageLoader].container) + 20)
		SetSpritePositionByOffset(ui.imageLoaders[imageLoader].imageBackground, GetSpriteXByOffset(ui.imageLoaders[imageLoader].imageBorder), GetSpriteYByOffset(ui.imageLoaders[imageLoader].imageBorder))
		SetSpritePositionByOffset(ui.imageLoaders[imageLoader].image, GetSpriteXByOffset(ui.imageLoaders[imageLoader].imageBorder), GetSpriteYByOffset(ui.imageLoaders[imageLoader].imageBorder))
		SetSpritePosition(ui.imageLoaders[imageLoader].importButton.background, GetSpriteX(ui.imageLoaders[imageLoader].imageBorder) + GetSpriteWidth(ui.imageLoaders[imageLoader].imageBorder) + 10, GetSpriteY(ui.imageLoaders[imageLoader].imageBorder) + 15)
		SetTextPosition(ui.imageLoaders[imageLoader].importButton.label, GetSpriteXByOffset(ui.imageLoaders[imageLoader].importButton.background), GetSpriteYByOffset(ui.imageLoaders[imageLoader].importButton.background) - (GetTextTotalHeight(ui.imageLoaders[imageLoader].importButton.label) / 2))
		SetSpritePosition(ui.imageLoaders[imageLoader].removeButton.background, GetSpriteX(ui.imageLoaders[imageLoader].imageBorder) + GetSpriteWidth(ui.imageLoaders[imageLoader].imageBorder) + 10, GetSpriteY(ui.imageLoaders[imageLoader].imageBorder) + 45)
		SetTextPosition(ui.imageLoaders[imageLoader].removeButton.label, GetSpriteXByOffset(ui.imageLoaders[imageLoader].removeButton.background), GetSpriteYByOffset(ui.imageLoaders[imageLoader].removeButton.background) - (GetTextTotalHeight(ui.imageLoaders[imageLoader].removeButton.label) / 2))
		contentY# = contentY# + GetSpriteHeight(ui.imageLoaders[imageLoader].container) + 10
		contentHeight# = contentHeight# + GetSpriteHeight(ui.imageLoaders[imageLoader].container) + 10
		
		for slider = 1 to 4
			if (slider = 1)
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[propertiesPanelIndex].invisibleDragZone) + 20, GetSpriteY(ui.imageLoaders[1].container) + GetSpriteHeight(ui.imageLoaders[1].container) + 10)
			else
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[propertiesPanelIndex].invisibleDragZone) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
			endif
			SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
			SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
			SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
			percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
			handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
			SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
			if (ui.sliders[slider].activeTrackFromCentre = 0)
				SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
			else
				if (ui.sliders[slider].value# < 0)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
				else
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
				endif	
			endif
			contentY# = contentY# + GetSpriteHeight(ui.sliders[slider].container) + 10
			contentHeight# = contentHeight# + GetSpriteHeight(ui.sliders[slider].container) + 10
		next
		ui.panels[propertiesPanelIndex].contentHeight# = contentHeight#
		if (contentHeight# > GetSpriteHeight(ui.panels[propertiesPanelIndex].background)) then ui.panels[propertiesPanelIndex].contentHeight# = ui.panels[propertiesPanelIndex].contentHeight# + 200
	endif
	if (selectedCategory = CATEGORY_SINE_WAVES)
		contentHeight# = 0
		contentY# = GetSpriteY(ui.panels[propertiesPanelIndex].invisibleDragZone) + 10 + 40
		
		imageLoader = 0
		SetSpritePosition(ui.imageLoaders[imageLoader].container, GetSpriteX(ui.panels[propertiesPanelIndex].invisibleDragZone) + 20, GetSpriteY(ui.panels[propertiesPanelIndex].invisibleDragZone) + 10 + 40)
		SetTextPosition(ui.imageLoaders[imageLoader].label, GetSpriteX(ui.imageLoaders[imageLoader].container), GetSpriteY(ui.imageLoaders[imageLoader].container))
		SetSpritePosition(ui.imageLoaders[imageLoader].imageBorder, GetSpriteX(ui.imageLoaders[imageLoader].container), GetSpriteY(ui.imageLoaders[imageLoader].container) + 20)
		SetSpritePositionByOffset(ui.imageLoaders[imageLoader].imageBackground, GetSpriteXByOffset(ui.imageLoaders[imageLoader].imageBorder), GetSpriteYByOffset(ui.imageLoaders[imageLoader].imageBorder))
		SetSpritePositionByOffset(ui.imageLoaders[imageLoader].image, GetSpriteXByOffset(ui.imageLoaders[imageLoader].imageBorder), GetSpriteYByOffset(ui.imageLoaders[imageLoader].imageBorder))
		SetSpritePosition(ui.imageLoaders[imageLoader].importButton.background, GetSpriteX(ui.imageLoaders[imageLoader].imageBorder) + GetSpriteWidth(ui.imageLoaders[imageLoader].imageBorder) + 10, GetSpriteY(ui.imageLoaders[imageLoader].imageBorder) + 15)
		SetTextPosition(ui.imageLoaders[imageLoader].importButton.label, GetSpriteXByOffset(ui.imageLoaders[imageLoader].importButton.background), GetSpriteYByOffset(ui.imageLoaders[imageLoader].importButton.background) - (GetTextTotalHeight(ui.imageLoaders[imageLoader].importButton.label) / 2))
		SetSpritePosition(ui.imageLoaders[imageLoader].removeButton.background, GetSpriteX(ui.imageLoaders[imageLoader].imageBorder) + GetSpriteWidth(ui.imageLoaders[imageLoader].imageBorder) + 10, GetSpriteY(ui.imageLoaders[imageLoader].imageBorder) + 45)
		SetTextPosition(ui.imageLoaders[imageLoader].removeButton.label, GetSpriteXByOffset(ui.imageLoaders[imageLoader].removeButton.background), GetSpriteYByOffset(ui.imageLoaders[imageLoader].removeButton.background) - (GetTextTotalHeight(ui.imageLoaders[imageLoader].removeButton.label) / 2))
		contentY# = contentY# + GetSpriteHeight(ui.imageLoaders[imageLoader].container) + 10
		contentHeight# = contentHeight# + GetSpriteHeight(ui.imageLoaders[imageLoader].container) + 10
		
		for slider = 0 to 3
			if (slider = 0)
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[propertiesPanelIndex].invisibleDragZone) + 20, GetSpriteY(ui.imageLoaders[0].container) + GetSpriteHeight(ui.imageLoaders[0].container) + 10)
			else
				SetSpritePosition(ui.sliders[slider].container, GetSpriteX(ui.panels[propertiesPanelIndex].invisibleDragZone) + 20, GetSpriteY(ui.sliders[slider - 1].container) + GetSpriteHeight(ui.sliders[slider - 1].container) + 10)
			endif
			SetTextPosition(ui.sliders[slider].label, GetSpriteX(ui.sliders[slider].container), GetSpriteY(ui.sliders[slider].container))
			SetEditBoxPosition(ui.sliders[slider].editbox, GetSpriteX(ui.sliders[slider].container) + 260 - 50, GetSpriteY(ui.sliders[slider].container))
			SetSpritePosition(ui.sliders[slider].inactiveTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
			percentage# = ((ui.sliders[slider].value# - ui.sliders[slider].min#) / (ui.sliders[slider].max# - ui.sliders[slider].min#)) * 100.0
			handleX# = ((GetSpriteWidth(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].handle)) / 100.0) * percentage#
			SetSpritePositionByOffset(ui.sliders[slider].handle, GetSpriteX(ui.sliders[slider].inactiveTrack) + (GetSpriteWidth(ui.sliders[slider].handle) / 2) + handleX#, GetSpriteYByOffset(ui.sliders[slider].inactiveTrack))
			if (ui.sliders[slider].activeTrackFromCentre = 0)
				SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteX(ui.sliders[slider].container) + 7.5, GetSpriteY(ui.sliders[slider].container) + 27)
			else
				if (ui.sliders[slider].value# < 0)
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack) - GetSpriteWidth(ui.sliders[slider].activeTrack), GetSpriteY(ui.sliders[slider].container) + 27)
				else
					SetSpritePosition(ui.sliders[slider].activeTrack, GetSpriteXByOffset(ui.sliders[slider].inactiveTrack), GetSpriteY(ui.sliders[slider].container) + 27)
				endif	
			endif
			contentY# = contentY# + GetSpriteHeight(ui.sliders[slider].container) + 10
			contentHeight# = contentHeight# + GetSpriteHeight(ui.sliders[slider].container) + 10
		next
				
		checkbox = 0
		SetSpritePosition(ui.checkboxes[checkbox].container, GetSpriteX(ui.panels[propertiesPanelIndex].invisibleDragZone) + 20, GetSpriteY(ui.sliders[3].container) + GetSpriteHeight(ui.sliders[3].container) + 14)
		SetSpritePosition(ui.checkboxes[checkbox].background, GetSpriteX(ui.checkboxes[checkbox].container), GetSpriteY(ui.checkboxes[checkbox].container))
		SetSpritePosition(ui.checkboxes[checkbox].foreground, GetSpriteX(ui.checkboxes[checkbox].background), GetSpriteY(ui.checkboxes[checkbox].background))
		SetTextPosition(ui.checkboxes[checkbox].label, GetSpriteX(ui.checkboxes[checkbox].background) + GetSpriteWidth(ui.checkboxes[checkbox].background) + 8, GetSpriteYByOffset(ui.checkboxes[checkbox].background) - (GetTextTotalHeight(ui.checkboxes[checkbox].label) / 2))
		contentY# = contentY# + GetSpriteHeight(ui.checkboxes[checkbox].container) + 10
		contentHeight# = contentHeight# + GetSpriteHeight(ui.checkboxes[checkbox].container) + 10
		ui.panels[propertiesPanelIndex].contentHeight# = contentHeight#
		if (contentHeight# > GetSpriteHeight(ui.panels[propertiesPanelIndex].background)) then ui.panels[propertiesPanelIndex].contentHeight# = ui.panels[propertiesPanelIndex].contentHeight# + 200
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
			if (spritePressed = ui.panels[codePanelIndex].invisibleDragZone)
				if (spriteDX# > categoriesPanelWidth#) then spriteDX# = categoriesPanelWidth#
				if (spriteDX# < -(GetSpriteWidth(spritePressed) - GetWindowWidth() + categoriesPanelWidth# + propertiesPanelWidth#)) then spriteDX# = -(GetSpriteWidth(spritePressed) - GetWindowWidth() + categoriesPanelWidth# + propertiesPanelWidth#)
				if (spriteDY# > topPanelHeight# + tabsPanelHeight#) then spriteDY# = topPanelHeight# + tabsPanelHeight#
				if (spriteDY# < -(GetSpriteHeight(spritePressed) - GetWindowHeight())) then spriteDY# = -(GetSpriteHeight(spritePressed) - GetWindowHeight())
				if (ui.panels[codePanelIndex].contentWidth# > GetSpriteWidth(ui.panels[codePanelIndex].background))
					SetSpriteX(spritePressed, spriteDX#)
				endif
				if (ui.panels[codePanelIndex].contentHeight# > GetSpriteHeight(ui.panels[codePanelIndex].background))
					SetSpriteY(spritePressed, spriteDY#)
				endif
				//SetSpriteY(spritePressed, spriteDY#)
				attachedTo = ui.panels[codePanelIndex].invisibleDragZone
				contentSize# = ui.panels[codePanelIndex].contentHeight#
				panelID = ui.panels[codePanelIndex].background
				trackSize# = GetWindowHeight() - topPanelHeight# - tabsPanelHeight#
				UpdatePanelVerticalScrollBar(ui.panels[codePanelIndex].verticalScrollBar, panelID, attachedTo, trackSize#, contentSize#)
				attachedTo = ui.panels[codePanelIndex].invisibleDragZone
				contentSize# = ui.panels[codePanelIndex].contentWidth#
				panelID = ui.panels[codePanelIndex].background
				trackSize# = GetWindowWidth() - categoriesPanelWidth# - propertiesPanelWidth#
				UpdatePanelHorizontalScrollBar(ui.panels[codePanelIndex].horizontalScrollBar, panelID, attachedTo, trackSize#, contentSize#)
			endif
			if (spritePressed = ui.panels[codePanelIndex].horizontalScrollBar)
				dX# = GetPointerX() - dragSpriteStartX#
				dY# = GetPointerY() - dragSpriteStartY#
					
				SetSpriteX(spritePressed, dX#)
				if (GetSpriteX(spritePressed) < categoriesPanelWidth#) then SetSpriteX(spritePressed, categoriesPanelWidth#)
				if (GetSpriteX(spritePressed) + GetSpriteWidth(spritePressed) > GetWindowWidth() - propertiesPanelWidth#) then SetSpriteX(spritePressed, GetWindowWidth() - propertiesPanelWidth# - GetSpriteWidth(spritePressed))
				
				attachedTo = ui.panels[codePanelIndex].invisibleDragZone
				contentSize# = ui.panels[codePanelIndex].contentWidth#
				panelID = ui.panels[codePanelIndex].background
				trackSize# = GetWindowWidth() - categoriesPanelWidth# - propertiesPanelWidth#
				DraggingPanelHorizontalScrollBar(ui.panels[codePanelIndex].horizontalScrollBar, panelID, attachedTo, trackSize#, contentSize#)
				SetSpriteColor(ui.panels[codePanelIndex].horizontalScrollBar, 81, 81, 81, 255)
			else
				SetSpriteColor(ui.panels[codePanelIndex].horizontalScrollBar, 61, 61, 61, 255)
			endif
			if (spritePressed = ui.panels[codePanelIndex].verticalScrollBar)
				dX# = GetPointerX() - dragSpriteStartX#
				dY# = GetPointerY() - dragSpriteStartY#
					
				SetSpriteY(spritePressed, dY#)
				if (GetSpriteY(spritePressed) < topPanelHeight# + tabsPanelHeight#) then SetSpriteY(spritePressed, topPanelHeight# + tabsPanelHeight#)
				if (GetSpriteY(spritePressed) + GetSpriteHeight(spritePressed) > GetWindowHeight()) then SetSpriteY(spritePressed, GetWindowHeight() - GetSpriteHeight(spritePressed))
				
				attachedTo = ui.panels[codePanelIndex].invisibleDragZone
				contentSize# = ui.panels[codePanelIndex].contentHeight#
				panelID = ui.panels[codePanelIndex].background
				trackSize# = GetWindowHeight() - topPanelHeight# - tabsPanelHeight#
				DraggingPanelVerticalScrollBar(ui.panels[codePanelIndex].verticalScrollBar, panelID, attachedTo, trackSize#, contentSize#)
				SetSpriteColor(ui.panels[codePanelIndex].verticalScrollBar, 81, 81, 81, 255)
			else
				SetSpriteColor(ui.panels[codePanelIndex].verticalScrollBar, 61, 61, 61, 255)
			endif
			if (spritePressed = ui.panels[propertiesPanelIndex].invisibleDragZone)
				if (spriteDY# > GetSpriteY(ui.panels[propertiesPanelIndex].titleBackground)) then spriteDY# = GetSpriteY(ui.panels[propertiesPanelIndex].titleBackground)
				if (spriteDY# < -(GetSpriteHeight(spritePressed) - GetWindowHeight())) then spriteDY# = -(GetSpriteHeight(spritePressed) - GetWindowHeight())
				if (ui.panels[propertiesPanelIndex].contentHeight# > GetSpriteHeight(ui.panels[propertiesPanelIndex].background))
					SetSpriteY(spritePressed, spriteDY#)
				endif
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
			
		endif
		if (GetPointerReleased())
			spriteReleased = GetSpriteHit(ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			if (spriteReleased > 0 and spriteReleased = spritePressed)
				if (spriteReleased = ui.aboutWindow.scrim or spriteReleased = ui.aboutWindow.closeButton.icon)
					HideAboutWindow()
				endif
				if (spritePressed = ui.aboutWindow.kenneyLink)
					spritePressed = 0
					spriteReleased = 0
					OpenBrowser("https://kenney.nl")
				endif
				if (spritePressed = ui.aboutWindow.socialButtons[0].icon and ui.aboutWindow.socialButtons[0].name$ = "itchio")
					spritePressed = 0
					spriteReleased = 0
					OpenBrowser("https://digicodelabs.itch.io/agk-playground")
				endif
				if (spritePressed = ui.aboutWindow.socialButtons[1].icon and ui.aboutWindow.socialButtons[1].name$ = "github")
					spritePressed = 0
					spriteReleased = 0
					OpenBrowser("https://github.com/DigicodeLabs/AGK-Playground-Public")
				endif
				for i = 0 to 9
					if (spritePressed = ui.imageLoaders[i].importButton.background)
						ShowChooseImageScreen()
						while (IsChoosingImage() = 1)
      						Sync()
     					endwhile
						image = GetChosenImage()
						SetSpriteImage(ui.imageLoaders[i].image, image)
						ui.imageLoaders[i].value = image
						SetSpriteSize(ui.imageLoaders[i].image, 70 / (GetImageHeight(ui.imageLoaders[i].value) / GetImageWidth(ui.imageLoaders[i].value)), 70)
					endif
					if (spritePressed = ui.imageLoaders[i].removeButton.background)
						SetSpriteSize(ui.imageLoaders[i].image, 50, 50)
						SetSpriteImage(ui.imageLoaders[i].image, imgBlank)
						ui.imageLoaders[i].value = imgBlank
					endif
				next
				for i = 0 to ui.panels[categoriesPanelIndex].buttons.length
					if (spritePressed = ui.panels[categoriesPanelIndex].buttons[i].icon)
						if (ui.panels[categoriesPanelIndex].buttons[i].name$ = "Cos/Sin Orbit")
							lastSelectedCategory = selectedCategory
							//if (GetParticlesExists(particles)) then DeleteParticles(particles)
							SetParticlesActive(particles, 0)
							SetParticlesVisible(particles, 0)
							selectedCategory = CATEGORY_COS_SIN_ORBIT
							if (lastSelectedCategory <> selectedCategory)
								ResetProperties()
								redrawUI = 1
							endif
						endif
						if (ui.panels[categoriesPanelIndex].buttons[i].name$ = "2D Particles")
							lastSelectedCategory = selectedCategory
							SetParticlesActive(particles, 1)
							SetParticlesVisible(particles, 1)
							selectedCategory = CATEGORY_2D_PARTICLES
							if (lastSelectedCategory <> selectedCategory)
								ResetProperties()
								redrawUI = 1
								recreateParticles = 1
							endif
						endif
						if (ui.panels[categoriesPanelIndex].buttons[i].name$ = "2D Tweens")
							lastSelectedCategory = selectedCategory
							SetParticlesActive(particles, 0)
							SetParticlesVisible(particles, 0)
							selectedCategory = CATEGORY_2D_TWEENS
							if (lastSelectedCategory <> selectedCategory)
								ResetProperties()
								redrawUI = 1
							endif
						endif
						if (ui.panels[categoriesPanelIndex].buttons[i].name$ = "Sine Wave")
							lastSelectedCategory = selectedCategory
							//if (GetParticlesExists(particles)) then DeleteParticles(particles)
							SetParticlesActive(particles, 0)
							SetParticlesVisible(particles, 0)
							selectedCategory = CATEGORY_SINE_WAVES
							if (lastSelectedCategory <> selectedCategory) 
								ResetProperties()
								redrawUI = 1
							endif
						endif
					endif
				next
				for i = 0 to ui.panels[codePanelIndex].buttons.length
					if (spritePressed = ui.panels[codePanelIndex].buttons[i].icon)
						if (ui.panels[codePanelIndex].buttons[i].name$ = "Unfold")
							condensedCode = 1 - condensedCode
						endif
						if (ui.panels[codePanelIndex].buttons[i].name$ = "Copy")
							code$ = ""
							for codeLine = 0 to codeLines.length
								if (GetTextExists(codeLines[codeLine]))
									code$ = code$ + ReplaceString(GetTextString(codeLines[codeLine]), "    ", chr(9), -1) + chr(10)
								endif
							next
							SetClipboardText(code$)
							DeleteText(copiedToClipboard)
							DeleteSprite(copiedToClipboardBackground)
							DeleteTween(copiedToClipboardBackgroundTween)
							DeleteTween(copiedToClipboardTween)
							copiedToClipboardBackground = CreateSprite(0)
							copiedToClipboard = CreateText("Copied to Clipboard")
							SetSpriteColor(copiedToClipboardBackground, 0, 0, 0, 200)
							SetTextSize(copiedToClipboard, defaultTextSize# * 3)
							SetSpriteSize(copiedToClipboardBackground, GetTextTotalWidth(copiedToClipboard) + 50, GetTextTotalHeight(copiedToClipboard) + 20)
							SetSpritePositionByOffset(copiedToClipboardBackground, GetSpriteXByOffset(ui.panels[codePanelIndex].background), GetSpriteYByOffset(ui.panels[codePanelIndex].background))
							SetTextAlignment(copiedToClipboard, 1)
							SetTextPosition(copiedToClipboard, GetSpriteXByOffset(copiedToClipboardBackground), GetSpriteYByOffset(copiedToClipboardBackground) - (GetTextTotalHeight(copiedToClipboard) / 2))
							copiedToClipboardBackgroundTween = CreateTweenSprite(1)
							copiedToClipboardTween = CreateTweenText(1)
							SetTweenSpriteAlpha(copiedToClipboardBackgroundTween, 200, 0, TweenLinear())
							SetTweenTextAlpha(copiedToClipboardTween, 255, 0, TweenLinear())
							PlayTweenSprite(copiedToClipboardBackgroundTween, copiedToClipboardBackground, 1)
							PlayTweenText(copiedToClipboardTween, copiedToClipboard, 1)
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
							//SetViewOffset(GetViewOffsetX(), GetViewOffsetY())
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
				for i = 0 to ui.panels[tabsPanelIndex].buttons.length
					if (spritePressed = ui.panels[tabsPanelIndex].buttons[i].background)
						if (ui.panels[tabsPanelIndex].buttons[i].name$ = "PLAYGROUND")
							DeleteCodeLines()
							redrawPlayground = 1
							tabSelected = 0
							
							panelX# = categoriesPanelWidth#
							panelY# = topPanelHeight# + tabsPanelHeight#
							SetSpritePosition(ui.panels[playgroundPanelIndex].background, panelX#, panelY#)
							SetSpritePosition(ui.panels[codePanelIndex].background, -99999, -99999)
							SetSpritePosition(ui.panels[codePanelIndex].invisibleDragZone, -99999, -99999)
						endif
						if (ui.panels[tabsPanelIndex].buttons[i].name$ = "CODE")
							DeleteCodeLines()
							redrawCode = 1
							tabSelected = 1
							
							panelX# = categoriesPanelWidth#
							panelY# = topPanelHeight# + tabsPanelHeight#
							SetSpritePosition(ui.panels[codePanelIndex].background, panelX#, panelY#)
							SetSpritePosition(ui.panels[codePanelIndex].invisibleDragZone, GetSpriteX(ui.panels[codePanelIndex].background), GetSpriteY(ui.panels[codePanelIndex].background))
							SetSpritePosition(ui.panels[playgroundPanelIndex].background, -99999, -99999)
						endif
					endif
				next
				for i = 0 to ui.panels[topPanelIndex].buttons.length
					if (spritePressed = ui.panels[topPanelIndex].buttons[i].icon)
						if (ui.panels[topPanelIndex].buttons[i].name$ = "About")
							ShowAboutWindow()
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
			if (GetEditBoxExists(particlesKeyFrames[i].scaleEditbox) and GetEditBoxExists(particlesKeyFrames[i].timeEditbox))
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
	
	for b = 0 to ui.panels[tabsPanelIndex].buttons.length
		if (tabSelected = b)
			SetSpriteColor(ui.panels[tabsPanelIndex].buttons[b].background, 30, 30, 30, 255)
		else
			SetSpriteColor(ui.panels[tabsPanelIndex].buttons[b].background, 15, 15, 15, 255)
		endif
	next

	for b = 0 to ui.panels[codePanelIndex].buttons.length
		buttonHeight# = defaultButtonHeight#
		buttonWidth# = defaultButtonWidth#
		buttonX# = GetSpriteX(ui.panels[codePanelIndex].background) + GetSpriteWidth(ui.panels[codePanelIndex].background) - 80
		buttonY# = GetWindowHeight() - (buttonHeight# / 2) - (55 * (ui.panels[codePanelIndex].buttons.length + 1)) + (b * 55)
		if (tabSelected = 1)
			if (b = 0)
				if (condensedCode = 0)
					SetSpriteImage(ui.panels[codePanelIndex].buttons[b].icon, GetIconImageID("unfold_less"))
				else
					SetSpriteImage(ui.panels[codePanelIndex].buttons[b].icon, GetIconImageID("unfold_more"))
				endif
			endif
			SetSpritePositionByOffset(ui.panels[codePanelIndex].buttons[b].icon, buttonX#, buttonY#)
		else
			SetSpritePositionByOffset(ui.panels[codePanelIndex].buttons[b].icon, -99999, -99999)
		endif
	next
	for b = 0 to ui.panels[playgroundPanelIndex].buttons.length
		buttonHeight# = defaultButtonHeight#
		buttonWidth# = defaultButtonWidth#
		buttonX# = GetSpriteX(ui.panels[playgroundPanelIndex].background) + GetSpriteWidth(ui.panels[playgroundPanelIndex].background) - 80
		buttonY# = GetWindowHeight() - (buttonHeight# / 2) - (55 * (ui.panels[playgroundPanelIndex].buttons.length + 1)) + (b * 55)
		if (tabSelected = 0)
			SetSpritePositionByOffset(ui.panels[playgroundPanelIndex].buttons[b].icon, buttonX#, buttonY#)
			SetTextPosition(zoomLabel, GetSpriteXByOffset(ui.panels[playgroundPanelIndex].buttons[0].icon), (((GetSpriteY(ui.panels[playgroundPanelIndex].buttons[1].icon) + GetSpriteHeight(ui.panels[playgroundPanelIndex].buttons[1].icon)) - GetSpriteY(ui.panels[playgroundPanelIndex].buttons[0].icon)) / 2) + GetSpriteY(ui.panels[playgroundPanelIndex].buttons[0].icon) - (GetTextTotalHeight(zoomLabel) / 2))
		else
			SetSpritePositionByOffset(ui.panels[playgroundPanelIndex].buttons[b].icon, -99999, -99999)
			SetTextPosition(zoomLabel, -99999, -99999)
		endif
	next
	
	if (selectedCategory = CATEGORY_COS_SIN_ORBIT)
		if (tabSelected = 0)
			if (ui.imageLoaders[0].value > 0)
				SetSpriteImage(planet, ui.imageLoaders[0].value)
			else
				SetSpriteImage(planet, imgBlank)
			endif
			SetSpriteSize(planet, val(GetEditBoxText(ui.sliders[0].editbox)) / (GetImageHeight(ui.imageLoaders[0].value) / GetImageWidth(ui.imageLoaders[0].value)), val(GetEditBoxText(ui.sliders[0].editbox)))
			if (ui.imageLoaders[1].value > 0)
				SetSpriteImage(moon, ui.imageLoaders[1].value)
			else
				SetSpriteImage(moon, imgBlank)
			endif
			SetSpriteColor(moon, 255, 255, 255, 255)
			SetSpriteSize(moon, val(GetEditBoxText(ui.sliders[1].editbox)) / (GetImageHeight(ui.imageLoaders[1].value) / GetImageWidth(ui.imageLoaders[1].value)), val(GetEditBoxText(ui.sliders[1].editbox)))
			
			SetSpritePositionByOffset(planet, categoriesPanelWidth# + ((GetWindowWidth() - categoriesPanelWidth# - propertiesPanelWidth#)  / 2), topPanelHeight# + tabsPanelHeight# + ((GetWindowHeight() - topPanelHeight# - tabsPanelHeight#) / 2))
			SetSpriteAngle(moon, GetSpriteAngle(moon) + val(GetEditBoxText(ui.sliders[4].editbox)))
			angle# = GetSpriteAngle(moon)
			radiusX# = val(GetEditBoxText(ui.sliders[2].editbox))
			radiusY# = val(GetEditBoxText(ui.sliders[3].editbox))
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
			DeleteCodeLines()
			codeLines.length = 100
			codeLine = -1
			if (condensedCode = 0)
				if (ui.imageLoaders[0].value <> imgBlank)
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "orbitedSprite = CreateSprite(LoadImage(" + chr(34) + Mid(GetImageFilename(ui.imageLoaders[0].value), FindStringReverse(GetImageFilename(ui.imageLoaders[0].value), "/") + 1, len(GetImageFilename(ui.imageLoaders[0].value))) + chr(34) + "))")
				else
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "orbitedSprite = CreateSprite(0)")
				endif
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "SetSpritePositionByOffset(orbitedSprite, 512, 384)")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "SetSpriteSize(orbitedSprite, " + str(val(GetEditBoxText(ui.sliders[0].editbox)) / (GetImageHeight(ui.imageLoaders[0].value) / GetImageWidth(ui.imageLoaders[0].value)), 0) + ", " + GetEditBoxText(ui.sliders[0].editbox) + ")")
				if (ui.imageLoaders[1].value <> imgBlank)
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "orbitingSprite = CreateSprite(LoadImage(" + chr(34) + Mid(GetImageFilename(ui.imageLoaders[1].value), FindStringReverse(GetImageFilename(ui.imageLoaders[1].value), "/") + 1, len(GetImageFilename(ui.imageLoaders[1].value))) + chr(34) + "))")
				else
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "orbitingSprite = CreateSprite(0)")
				endif
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "SetSpriteSize(orbitingSprite, " + str(val(GetEditBoxText(ui.sliders[1].editbox)) / (GetImageHeight(ui.imageLoaders[1].value) / GetImageWidth(ui.imageLoaders[1].value)), 0) + ", " + GetEditBoxText(ui.sliders[1].editbox) + ")")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "do")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "stepSize# = " + GetEditBoxText(ui.sliders[4].editbox))
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "angle# = GetSpriteAngle(orbitingSprite) + stepSize#")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "radiusX# = " + GetEditBoxText(ui.sliders[2].editbox))
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "radiusY# = " + GetEditBoxText(ui.sliders[3].editbox))
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "orbitingSpriteX# = GetSpriteXByOffset(orbitedSprite) - cos(angle#) * radiusX#")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "orbitingSpriteY# = GetSpriteYByOffset(orbitedSprite) - sin(angle#) * radiusY#")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "SetSpritePositionByOffset(orbitingSprite, orbitingSpriteX#, orbitingSpriteY#)")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "SetSpriteAngle(orbitingSprite, angle#)")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "Sync()")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "loop")
			endif
			if (condensedCode = 1)
				if (ui.imageLoaders[0].value <> imgBlank)
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "orbitedSprite = CreateSprite(LoadImage(" + chr(34) + Mid(GetImageFilename(ui.imageLoaders[0].value), FindStringReverse(GetImageFilename(ui.imageLoaders[0].value), "/") + 1, len(GetImageFilename(ui.imageLoaders[0].value))) + chr(34) + "))")
				else
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "orbitedSprite = CreateSprite(0)")
				endif
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "SetSpritePositionByOffset(orbitedSprite, 512, 384)")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "SetSpriteSize(orbitedSprite, " + str(val(GetEditBoxText(ui.sliders[0].editbox)) / (GetImageHeight(ui.imageLoaders[0].value) / GetImageWidth(ui.imageLoaders[0].value)), 0) + ", " + GetEditBoxText(ui.sliders[0].editbox) + ")")
				if (ui.imageLoaders[1].value <> imgBlank)
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "orbitingSprite = CreateSprite(LoadImage(" + chr(34) + Mid(GetImageFilename(ui.imageLoaders[1].value), FindStringReverse(GetImageFilename(ui.imageLoaders[1].value), "/") + 1, len(GetImageFilename(ui.imageLoaders[1].value))) + chr(34) + "))")
				else
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "orbitingSprite = CreateSprite(0)")
				endif
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "SetSpriteSize(orbitingSprite, " + str(val(GetEditBoxText(ui.sliders[1].editbox)) / (GetImageHeight(ui.imageLoaders[1].value) / GetImageWidth(ui.imageLoaders[1].value)), 0) + ", " + GetEditBoxText(ui.sliders[1].editbox) + ")")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "do")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "angle# = GetSpriteAngle(orbitingSprite) + " + GetEditBoxText(ui.sliders[4].editbox))
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "SetSpritePositionByOffset(orbitingSprite, GetSpriteXByOffset(orbitedSprite) - cos(angle#) * " + GetEditBoxText(ui.sliders[2].editbox) + ", GetSpriteYByOffset(orbitedSprite) - sin(angle#) * " + GetEditBoxText(ui.sliders[3].editbox) + ")")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "SetSpriteAngle(orbitingSprite, angle#)")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "Sync()")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "loop")
			endif
			ui.panels[codePanelIndex].contentHeight# = 0
			ui.panels[codePanelIndex].contentWidth# = 0
			for i = 0 to codeLines.length
				if (GetTextExists(codeLines[i]))
					SetTextSize(codeLines[i], defaultTextSize# + 3)
					SetTextDepth(codeLines[i], 98)
					SetTextPosition(codeLines[i], GetSpriteX(ui.panels[codePanelIndex].invisibleDragZone) + 20, GetSpriteY(ui.panels[codePanelIndex].invisibleDragZone) + 20 + (i * defaultTextSize#))
					FixTextToScreen(codeLines[i], 1)
					ui.panels[codePanelIndex].contentHeight# = ui.panels[codePanelIndex].contentHeight# + GetTextTotalHeight(codeLines[i])
					if (GetTextTotalWidth(codeLines[i]) > ui.panels[codePanelIndex].contentWidth#) then ui.panels[codePanelIndex].contentWidth# = GetTextTotalWidth(codeLines[i])
				endif
			next
		endif
	else
		SetSpritePositionByOffset(planet, -99999, -99999)
		SetSpritePositionByOffset(moon, -99999, -99999)
	endif
	if (selectedCategory = CATEGORY_2D_PARTICLES)
		if (tabSelected = 0)
			SetParticlesActive(particles, 1)
			SetParticlesVisible(particles, 1)
			SetParticlesAngle(particles, val(GetEditBoxText(ui.sliders[1].editbox)))
			SetParticlesDepth(particles, 100)
			SetParticlesDirection(particles, val(GetEditBoxText(ui.sliders[2].editbox)), val(GetEditBoxText(ui.sliders[3].editbox)))
			//SetParticlesFaceDirection(particles, ui.checkboxes[0].value)
			SetParticlesFrequency(particles, val(GetEditBoxText(ui.sliders[4].editbox)))
			if (ui.imageLoaders[0].value <> imgBlank)
				SetParticlesImage(particles, ui.imageLoaders[0].value)
			else
				SetParticlesImage(particles, imgBlank)
			endif
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
				//SetSpriteColor(particlesStartZone, 255, 0, 0, 50)
				SetSpriteSize(particlesStartZone, val(GetEditBoxText(ui.sliders[7].maxEditbox)) - val(GetEditBoxText(ui.sliders[7].minEditbox)), val(GetEditBoxText(ui.sliders[8].maxEditbox)) - val(GetEditBoxText(ui.sliders[8].minEditbox)))
				SetSpritePosition(particlesStartZone, GetParticlesX(particles) + val(GetEditBoxText(ui.sliders[7].minEditbox)), GetParticlesY(particles) + val(GetEditBoxText(ui.sliders[8].minEditbox)))
				//DrawLine(GetParticlesX(particles) + val(GetEditBoxText(ui.sliders[7].minEditbox)), GetParticlesY(particles) + val(GetEditBoxText(ui.sliders[8].minEditbox)), GetParticlesX(particles) + val(GetEditBoxText(ui.sliders[7].maxEditbox)), GetParticlesY(particles) + val(GetEditBoxText(ui.sliders[8].minEditbox)), 255, 0, 0)
				//DrawLine(GetParticlesX(particles) + val(GetEditBoxText(ui.sliders[7].minEditbox)), GetParticlesY(particles) + val(GetEditBoxText(ui.sliders[8].maxEditbox)), GetParticlesX(particles) + val(GetEditBoxText(ui.sliders[7].maxEditbox)), GetParticlesY(particles) + val(GetEditBoxText(ui.sliders[8].maxEditbox)), 255, 0, 0)
				//DrawLine(GetParticlesX(particles) + val(GetEditBoxText(ui.sliders[7].minEditbox)), GetParticlesY(particles) + val(GetEditBoxText(ui.sliders[8].minEditbox)), GetParticlesX(particles) + val(GetEditBoxText(ui.sliders[7].minEditbox)), GetParticlesY(particles) + val(GetEditBoxText(ui.sliders[8].maxEditbox)), 255, 0, 0)
				//DrawLine(GetParticlesX(particles) + val(GetEditBoxText(ui.sliders[7].maxEditbox)), GetParticlesY(particles) + val(GetEditBoxText(ui.sliders[8].minEditbox)), GetParticlesX(particles) + val(GetEditBoxText(ui.sliders[7].maxEditbox)), GetParticlesY(particles) + val(GetEditBoxText(ui.sliders[8].maxEditbox)), 255, 0, 0)
			else
				SetSpritePosition(particlesStartZone, -99999, -99999)
			endif
		else
			SetParticlesActive(particles, 0)
			SetParticlesVisible(particles, 0)
			//if (redrawCode = 1)
				DeleteCodeLines()
				codeLines.length = 100
				codeLine = -1
				if (condensedCode = 0)
					if (ui.imageLoaders[0].value <> imgBlank)
						inc codeLine
						CreateOrUpdateCodeLine(codeLine, "particleImage = LoadImage(" + chr(34) + Mid(GetImageFilename(ui.imageLoaders[0].value), FindStringReverse(GetImageFilename(ui.imageLoaders[0].value), "/") + 1, len(GetImageFilename(ui.imageLoaders[0].value))) + chr(34) + ")")
					endif
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "particles = CreateParticles(512, 384)")
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "")
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "do")
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "particlesAngleRange# = " + GetEditBoxText(ui.sliders[1].editbox))
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "particlesDirectionX# = " + GetEditBoxText(ui.sliders[2].editbox))
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "particlesDirectionY# = " + GetEditBoxText(ui.sliders[3].editbox))
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "particlesFrequency# = " + GetEditBoxText(ui.sliders[4].editbox))
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "particlesLife# = " + GetEditBoxText(ui.sliders[5].editbox))
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "particlesSize# = " + GetEditBoxText(ui.sliders[0].editbox))
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "particlesStartZoneX1# = " + GetEditBoxText(ui.sliders[7].minEditbox))
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "particlesStartZoneX2# = " + GetEditBoxText(ui.sliders[7].maxEditbox))
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "particlesStartZoneY1# = " + GetEditBoxText(ui.sliders[8].minEditbox))
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "particlesStartZoneY2# = " + GetEditBoxText(ui.sliders[8].maxEditbox))
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "particlesVelocityRangeMin# = " + GetEditBoxText(ui.sliders[6].minEditbox))
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "particlesVelocityRangeMax# = " + GetEditBoxText(ui.sliders[6].maxEditbox))
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "")
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "SetParticlesAngle(particles, particlesAngleRange#)")
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "SetParticlesDirection(particles, particlesDirectionX#, particlesDirectionY#)")
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "SetParticlesFrequency(particles, particlesFrequency#)")
					if (ui.imageLoaders[0].value <> imgBlank)
						inc codeLine
						CreateOrUpdateCodeLine(codeLine, "    " + "SetParticlesImage(particles, particleImage)")
					endif
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "SetParticlesLife(particles, particlesLife#)")
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "SetParticlesSize(particles, particlesSize#)")
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "SetParticlesStartZone(particles, particlesStartZoneX1#, particlesStartZoneY1#, particlesStartZoneX2#, particlesStartZoneY2#)")
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "SetParticlesVelocityRange(particles, particlesVelocityRangeMin#, particlesVelocityRangeMax#)")
				endif
				if (condensedCode = 1)
					if (ui.imageLoaders[0].value <> imgBlank)
						inc codeLine
						CreateOrUpdateCodeLine(codeLine, "particleImage = LoadImage(" + chr(34) + Mid(GetImageFilename(ui.imageLoaders[0].value), FindStringReverse(GetImageFilename(ui.imageLoaders[0].value), "/") + 1, len(GetImageFilename(ui.imageLoaders[0].value))) + chr(34) + ")")
					endif
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "particles = CreateParticles(512, 384)")
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "")
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "do")
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "SetParticlesAngle(particles, " + GetEditBoxText(ui.sliders[1].editbox) + ")")
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "SetParticlesDirection(particles, " + GetEditBoxText(ui.sliders[2].editbox) + ", " + GetEditBoxText(ui.sliders[3].editbox) + ")")
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "SetParticlesFrequency(particles, " + GetEditBoxText(ui.sliders[4].editbox) + ")")
					if (ui.imageLoaders[0].value <> imgBlank)
						inc codeLine
						CreateOrUpdateCodeLine(codeLine, "    " + "SetParticlesImage(particles, particleImage)")
					endif
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "SetParticlesLife(particles, " + GetEditBoxText(ui.sliders[5].editbox) + ")")
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "SetParticlesSize(particles, " + GetEditBoxText(ui.sliders[0].editbox) + ")")
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "SetParticlesStartZone(particles, " + GetEditBoxText(ui.sliders[7].minEditbox) + ", " + GetEditBoxText(ui.sliders[8].minEditbox) + ", " + GetEditBoxText(ui.sliders[7].maxEditbox) + ", " + GetEditBoxText(ui.sliders[8].maxEditbox) + ")")
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "SetParticlesVelocityRange(particles, " + GetEditBoxText(ui.sliders[6].minEditbox) + ", " + GetEditBoxText(ui.sliders[6].maxEditbox) + ")")
				endif
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "")
				if (particlesKeyFrames.length > -1)
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "ClearParticlesColors(particles)")
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "ClearParticlesScales(particles)")
				endif
				for keyFrame = 0 to particlesKeyFrames.length
					if (particlesKeyFrames[keyFrame].group$ = "Color")
						inc codeLine
						CreateOrUpdateCodeLine(codeLine, "    " + "AddParticlesColorKeyFrame(particles, " + str(particlesKeyFrames[keyFrame].timeValue#, 2) + ", " + str(particlesKeyFrames[keyFrame].redValue#, 0) + ", " + str(particlesKeyFrames[keyFrame].greenValue#, 0) + ", " + str(particlesKeyFrames[keyFrame].blueValue#, 0) + ", " + str(particlesKeyFrames[keyFrame].alphaValue#, 0) + ")")
					endif
				next
				for keyFrame = 0 to particlesKeyFrames.length
					if (particlesKeyFrames[keyFrame].group$ = "Scale")
						inc codeLine
						CreateOrUpdateCodeLine(codeLine, "    " + "AddParticlesScaleKeyFrame(particles, " + str(particlesKeyFrames[keyFrame].timeValue#, 2) + ", " + str(particlesKeyFrames[keyFrame].scaleValue#, 2) + ")")
					endif
				next
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "Sync()")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "loop")
				ui.panels[codePanelIndex].contentHeight# = 0
				ui.panels[codePanelIndex].contentWidth# = 0
				for i = 0 to codeLines.length
					if (GetTextExists(codeLines[i]))
						SetTextSize(codeLines[i], defaultTextSize# + 3)
						SetTextDepth(codeLines[i], 98)
						SetTextPosition(codeLines[i], GetSpriteX(ui.panels[codePanelIndex].invisibleDragZone) + 20, GetSpriteY(ui.panels[codePanelIndex].invisibleDragZone) + 20 + (i * defaultTextSize#))
						FixTextToScreen(codeLines[i], 1)
						ui.panels[codePanelIndex].contentHeight# = ui.panels[codePanelIndex].contentHeight# + GetTextTotalHeight(codeLines[i])
						if (GetTextTotalWidth(codeLines[i]) > ui.panels[codePanelIndex].contentWidth#) then ui.panels[codePanelIndex].contentWidth# = GetTextTotalWidth(codeLines[i])
					endif
				next
				redrawCode = 0
			//endif
		endif
	else
		SetSpritePosition(particlesStartZone, -99999, -99999)
	endif
	if (selectedCategory = CATEGORY_SINE_WAVES)
		if (tabSelected = 0)
			if (ui.imageLoaders[0].value > 0)
				SetSpriteImage(spaceship, ui.imageLoaders[0].value)
			else
				SetSpriteImage(spaceship, imgBlank)
			endif
			SetSpriteSize(spaceship, val(GetEditBoxText(ui.sliders[0].editbox)) / (GetImageHeight(ui.imageLoaders[0].value) / GetImageWidth(ui.imageLoaders[0].value)), val(GetEditBoxText(ui.sliders[0].editbox)))
			angularFrequency# = val(GetEditBoxText(ui.sliders[1].editbox))
			waveAngle# = waveAngle# + angularFrequency#
			amplitude# = val(GetEditBoxText(ui.sliders[2].editbox))
			spacingX# = val(GetEditBoxText(ui.sliders[3].editbox))
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
			DeleteCodeLines()
			codeLines.length = 100
			codeLine = -1
			if (condensedCode = 0)
				if (ui.imageLoaders[0].value <> imgBlank)
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "sprite = CreateSprite(LoadImage(" + chr(34) + Mid(GetImageFilename(ui.imageLoaders[0].value), FindStringReverse(GetImageFilename(ui.imageLoaders[0].value), "/") + 1, len(GetImageFilename(ui.imageLoaders[0].value))) + chr(34) + "))")
				else
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "sprite = CreateSprite(0)")
				endif	
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "SetSpriteSize(sprite, " + str(val(GetEditBoxText(ui.sliders[0].editbox)) / (GetImageHeight(ui.imageLoaders[0].value) / GetImageWidth(ui.imageLoaders[0].value)), 0) + ", " + GetEditBoxText(ui.sliders[0].editbox) + ")")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "do")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "angularFrequency# = " + GetEditBoxText(ui.sliders[1].editbox))
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "waveAngle# = waveAngle# + angularFrequency#")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "amplitude# = " + GetEditBoxText(ui.sliders[2].editbox))
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "spacingX# = " + GetEditBoxText(ui.sliders[3].editbox))
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "spriteX# = spriteX# + spacingX#")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "spriteYOffset# = 384")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "spriteY# = amplitude# * sin(waveAngle#)")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "SetSpritePositionByOffset(sprite, spriteX#, spriteY# + spriteYOffset#)")
				if (ui.checkboxes[0].value = 1)
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "nextX# = spriteX# + spacingX#")
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "nextY# = (amplitude# * sin(waveAngle# + angularFrequency#)) + spriteYOffset#")
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "SetSpriteAngle(sprite, atan2(nextY# - GetSpriteYByOffset(sprite), nextX# - GetSpriteXByOffset(sprite)))")
				endif
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "Sync()")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "loop")
			endif
			if (condensedCode = 1)
				if (ui.imageLoaders[0].value <> imgBlank)
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "sprite = CreateSprite(LoadImage(" + chr(34) + Mid(GetImageFilename(ui.imageLoaders[0].value), FindStringReverse(GetImageFilename(ui.imageLoaders[0].value), "/") + 1, len(GetImageFilename(ui.imageLoaders[0].value))) + chr(34) + "))")
				else
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "sprite = CreateSprite(0)")
				endif	
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "SetSpriteSize(sprite, " + str(val(GetEditBoxText(ui.sliders[0].editbox)) / (GetImageHeight(ui.imageLoaders[0].value) / GetImageWidth(ui.imageLoaders[0].value)), 0) + ", " + GetEditBoxText(ui.sliders[0].editbox) + ")")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "do")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "waveAngle# = waveAngle# + " + GetEditBoxText(ui.sliders[1].editbox))
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "spriteX# = spriteX# + " + GetEditBoxText(ui.sliders[3].editbox))
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "spriteYOffset# = 384")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "SetSpritePositionByOffset(sprite, spriteX#, " + GetEditBoxText(ui.sliders[2].editbox) + " * sin(waveAngle#) + spriteYOffset#)")
				if (ui.checkboxes[0].value = 1)
					inc codeLine
					CreateOrUpdateCodeLine(codeLine, "    " + "SetSpriteAngle(sprite, atan2(((" + GetEditBoxText(ui.sliders[2].editbox) + " * sin(waveAngle# + " + GetEditBoxText(ui.sliders[1].editbox) + ")) + spriteYOffset#) - GetSpriteYByOffset(sprite), (spriteX# + " + GetEditBoxText(ui.sliders[3].editbox) + ") - GetSpriteXByOffset(sprite)))")
				endif
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "    " + "Sync()")
				inc codeLine
				CreateOrUpdateCodeLine(codeLine, "loop")
			endif
			ui.panels[codePanelIndex].contentHeight# = 0
			ui.panels[codePanelIndex].contentWidth# = 0
			for i = 0 to codeLines.length
				if (GetTextExists(codeLines[i]))
					SetTextSize(codeLines[i], defaultTextSize# + 3)
					SetTextDepth(codeLines[i], 98)
					SetTextPosition(codeLines[i], GetSpriteX(ui.panels[codePanelIndex].invisibleDragZone) + 20, GetSpriteY(ui.panels[codePanelIndex].invisibleDragZone) + 20 + (i * defaultTextSize#))
					FixTextToScreen(codeLines[i], 1)
					ui.panels[codePanelIndex].contentHeight# = ui.panels[codePanelIndex].contentHeight# + GetTextTotalHeight(codeLines[i])
					if (GetTextTotalWidth(codeLines[i]) > ui.panels[codePanelIndex].contentWidth#) then ui.panels[codePanelIndex].contentWidth# = GetTextTotalWidth(codeLines[i])
				endif
			next
		endif
	else
		SetSpritePositionByOffset(spaceship, -99999, -99999)
	endif
	if (selectedCategory = CATEGORY_2D_TWEENS)
		if (redrawUI = 1)
			SetSpritePositionByOffset(coin, categoriesPanelWidth# + ((GetWindowWidth() - categoriesPanelWidth# - propertiesPanelWidth#)  / 2), topPanelHeight# + tabsPanelHeight# + ((GetWindowHeight() - topPanelHeight# - tabsPanelHeight#) / 2))
			tweenChain = CreateTweenChain()
			tweens.insert(0)
			tween = tweens.length
			tweens[tween] = CreateTweenSprite(1)
			SetTweenSpriteYByOffset(tweens[tween], GetSpriteYByOffset(coin), GetSpriteYByOffset(coin) - 100, TweenEaseOut1())
			AddTweenChainSprite(tweenChain, tweens[tween], coin, 0)
			SetTweenSpriteSizeX(tweens[tween], GetSpriteWidth(coin), 0, TweenLinear())
			tweens.insert(0)
			tween = tweens.length
			tweens[tween] = CreateTweenSprite(1)
			SetTweenSpriteYByOffset(tweens[tween], GetSpriteYByOffset(coin) - 100, GetSpriteYByOffset(coin), TweenEaseIn1())
			SetTweenSpriteSizeX(tweens[tween], 0, GetSpriteWidth(coin), TweenLinear())
			AddTweenChainSprite(tweenChain, tweens[tween], coin, 0)
		endif
		if (GetTweenChainPlaying(tweenChain) = 0)
			PlayTweenChain(tweenChain)
		endif
	else
		SetSpritePositionByOffset(coin, -99999, -99999)
	endif

	ScrollBarsListener()
	
	redrawPlayground = 0
	redrawUI = 0

	UpdateAllTweens(GetFrameTime())
	Sync()
loop

#include "functions.agc"
