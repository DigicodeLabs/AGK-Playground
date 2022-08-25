
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

// THANKS:
// BlinkOk & Leyvin for Sin/Cos help
//
// CREDITS:
// Artwork from KennyAssets (kenny.nl)
// Artwork from Pixabay (pixabay.com)

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

SetViewZoomMode(1)
do
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
			for i = 0 to 9
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
							SetSpritePosition(ui.sliders[i].activeTrack, GetSpriteXByOffset(ui.sliders[i].inactiveTrack) - GetSpriteWidth(ui.sliders[i].activeTrack), GetSpriteY(ui.sliders[i].container) + 25)
						else
							SetSpritePosition(ui.sliders[i].activeTrack, GetSpriteXByOffset(ui.sliders[i].inactiveTrack), GetSpriteY(ui.sliders[i].container) + 25)
						endif	
					endif
					percentage# = (100.0 / (GetSpriteWidth(ui.sliders[i].inactiveTrack) )) * (GetSpriteXByOffset(ui.sliders[i].handle) - GetSpriteX(ui.sliders[i].inactiveTrack))
					ui.sliders[i].value# = (((abs(ui.sliders[i].min#) + ui.sliders[i].max#) / 100.0) * percentage#) - abs(ui.sliders[i].min#) // - GetSpriteWidth(ui.sliders[i].handle)
					SetEditBoxText(ui.sliders[i].editbox, str(ui.sliders[i].value#, 0))
				endif
			next
			
		endif
		if (GetPointerReleased())
			spriteReleased = GetSpriteHit(ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			if (spriteReleased > 0 and spriteReleased = spritePressed)
				for i = 0 to ui.panels[categoriesPanelIndex].buttons.length
					if (spritePressed = ui.panels[categoriesPanelIndex].buttons[i].icon)
						if (ui.panels[categoriesPanelIndex].buttons[i].name$ = "Cos/Sin Orbit")
							selectedCategory = COS_SIN_ORBIT
							redrawUI = 1
						endif
						if (ui.panels[categoriesPanelIndex].buttons[i].name$ = "Sine Wave")
							selectedCategory = SINE_WAVES
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
				for i = 0 to 9
					if (spriteReleased = ui.checkboxes[i].background or spriteReleased = ui.checkboxes[i].foreground)
						ui.checkboxes[i].value = 1 - ui.checkboxes[i].value
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
			endif
			spritePressed = 0
			spriteHeld = 0
			spriteReleased = 0
		endif
	endif
	
	UpdateUIListener()
	
	for i = 0 to 9
		if (GetEditBoxHasFocus(ui.sliders[i].editbox))
			SetEditBoxBorderSize(ui.sliders[i].editbox, 2)
			SetEditBoxBorderColor(ui.sliders[i].editbox, 146, 143, 46, 200)
		else
			SetEditBoxBorderSize(ui.sliders[i].editbox, 0)
		endif
	next

	if (selectedCategory = COS_SIN_ORBIT)
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
	if (selectedCategory = SINE_WAVES)
		angularFrequency# = val(GetEditBoxText(ui.sliders[0].editbox))
		waveAngle# = waveAngle# + angularFrequency#
		amplitude# = val(GetEditBoxText(ui.sliders[1].editbox))
		spacingX# = val(GetEditBoxText(ui.sliders[2].editbox))
		spaceshipX# = spaceshipX# + spacingX#
		if (spaceshipX# < ScreenToWorldX(categoriesPanelWidth# - (GetSpriteWidth(spaceship) / 2))) then spaceshipX# = ScreenToWorldX(categoriesPanelWidth# - (GetSpriteWidth(spaceship) / 2))
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
