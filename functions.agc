function AddLeadingZeros(string$ as string, noOfZeros as integer)
	local i as integer
	
	for i = 1 to noOfZeros
		if (len(string$) < noOfZeros)
			string$ = "0" + string$
		endif
	next
endfunction string$



function AddOrdinalSuffix(i)
	local j as integer
	local k as integer
	local l$ as string
	
	j = mod(i, 10)
	k = mod(i, 100)
	if (j = 1 and k <> 11)
		l$ = str(i) + "st"
	elseif (j = 2 and k <> 12)
		l$ = str(i) + "nd"
	elseif (j = 3 and k <> 13)
		l$ = str(i) + "rd"
	else
		l$ = str(i) + "th"
	endif
endfunction l$



function AddThousandsSeperator(number as integer, seperator$ as string)
	local counter as integer
	local formattedNumber$ as string
	local i as integer
	local numberLength as integer
	
	numberLength = len(str(number))
	
	if (numberLength < 4)
		formattedNumber$ = str(number)
	else
		counter = 0
		for i = numberLength to 1 step -1
			inc counter
			formattedNumber$ = Mid(str(number), i, 1) + formattedNumber$
			if (mod(counter, 3) = 0 and i <> 1) then formattedNumber$ = seperator$ + formattedNumber$
		next
	endif
endfunction formattedNumber$



function CreateOrUpdateCodeLine(index as integer, text$ as string)
	local commands as string[]
	
	if (GetTextExists(codeLines[index]) = 0)
		codeLines[index] = CreateText(text$)
	else
		SetTextString(codeLines[index], text$)
	endif
	
	commands = ["do", "loop"] 
	for command = 0 to commands.length
		if (GetTextString(codeLines[index]) = commands[command])
			SetTextColor(codeLines[index], 61, 157, 220, 255)
		endif
	next
	commands = ["AddParticlesColorKeyFrame(", "AddParticlesScaleKeyFrame(", "atan2(", "ClearParticlesColors(", "ClearParticlesScales(", "cos(", "CreateParticles(", "CreateSprite(", "GetSpriteAngle(", "GetSpriteXByOffset(", "GetSpriteYByOffset(", "LoadImage(", "SetParticlesAngle(", "SetParticlesDirection(", "SetParticlesFrequency(", "SetParticlesImage(", "SetParticlesLife(", "SetParticlesPosition(", "SetParticlesSize(", "SetParticlesStartZone(", "SetParticlesVelocityRange(", "SetSpritePositionByOffset(", "SetSpriteAngle(", "SetSpriteSize(", "sin(", "Sync(", "val("] 
	for command = 0 to commands.length
		offset = 0
		for count = 1 to FindStringCount(GetTextString(codeLines[index]), commands[command])
			position = FindString(GetTextString(codeLines[index]), commands[command], 1, offset) - 1
			if (position <> -1)
				for char = position to position + len(commands[command]) - 2
					SetTextCharColor(codeLines[index], char, 0, 203, 177, 255)
				next
			endif
			offset = position + len(commands[command])
		next
	next
	lastChar$ = ""
	for char = 1 to len(GetTextString(codeLines[index]))
		if (char > 1)
			lastChar$ = Mid(GetTextString(codeLines[index]), char - 1, 1)
		else
			lastChar$ = ""
		endif
		currentChar$ = Mid(GetTextString(codeLines[index]), char, 1)
		if (char < len(GetTextString(codeLines[index])))
			nextChar$ = Mid(GetTextString(codeLines[index]), char + 1, 1)
		else
			nextChar$ = ""
		endif
		if (FindString("-.0123456789", currentChar$) > 0 and FindString(" (-.0123456789", lastChar$) > 0)
			SetTextCharColor(codeLines[index], char - 1, 0, 255, 0, 255)
		endif
	next
	position = FindString(GetTextString(codeLines[index]), "//", 1, offset) - 1
	if (position <> -1)
		for char = position to len(GetTextString(codeLines[index]))
			SetTextCharColor(codeLines[index], char, 40, 170, 57, 255)
		next
	endif
endfunction



function DeleteCodeLines()
	for i = 0 to codeLines.length
		if (GetTextExists(codeLines[i])) then DeleteText(codeLines[i])
	next
	codeLines.length = -1
endfunction



function GetIconImageID(iconName$ as string)
	
endfunction icon[icon.find(iconName$)].imageID



function GetLocalVariableValue(variable$ as string)
	local i as integer
	local variableValue$ as string
	
	for i = 0 to localVariables.length
		if (localVariables[i].variable = "") then localVariables.remove(i)
		if (lower(localVariables[i].variable) = lower(variable$))
			variableValue$ = localVariables[i].value
		endif
	next
endfunction variableValue$



function Hue2RGB(p# as float, q# as float, t# as float)
	value# as float
	
	if (t# < 0.0) then t# = t# + 1.0
	if (t# > 1.0) then t# = t# - 1.0
	if (t# < 1.0 / 6.0) then value# = p# + (q# - p#) * 6.0 * t#
	if (t# < 1.0 / 2.0) then value# = q#
	if (t# < 2.0 / 3.0) then value# = p# + (q# - p#) * (2.0 / 3.0 - t#) * 6.0
endfunction value# * 255



function InRange(variable# as float, min# as float, max# as float)
	local inRange as integer : inRange = 0
	
	if (variable# >= min# and variable# <= max#) then inRange = 1
endfunction inRange



function Lerp(min# as float, max# as float, f# as float)
	local result# as float
	
	result# = min# + f# * (max# - min#)
endfunction result#



function MaxFloat(a# as float, b# as float)
	local maxValue# as float
	
	if (a# > b#)
		maxValue# = a#
	else
		maxValue# = b#
	endif
endfunction maxValue#



function MaxInt(a as integer, b as integer)
	local maxValue as integer
	
	if (a > b)
		maxValue = a
	else
		maxValue = b
	endif
endfunction maxValue



function MinFloat(a# as float, b# as float)
	local minValue# as float
	
	if (a# < b#)
		minValue# = a#
	else
		minValue# = b#
	endif
endfunction minValue#



function MinInt(a as integer, b as integer)
	local minValue as integer
	
	if (a < b)
		minValue = a
	else
		minValue = b
	endif
endfunction minValue



function ResetProperties()
	if (selectedCategory = CATEGORY_COS_SIN_ORBIT)
		ui.imageLoaders[0].value = imgPlanet
		ui.imageLoaders[1].value = imgMoon
		ui.sliders[0].value# = 150		// Orbited Sprite Height
		ui.sliders[1].value# = 50		// Orbiting Sprite Height
		ui.sliders[2].value# = 100		// Radius X
		ui.sliders[3].value# = 100		// Radius Y
		ui.sliders[4].value# = 2		// Angle Step Size
	endif
	if (selectedCategory = CATEGORY_2D_PARTICLES)
		ui.imageLoaders[0].value = imgParticle
		ui.sliders[0].value# = 50		// Particle Size
		ui.sliders[1].value# = 20		// Angle Range
		ui.sliders[2].value# = 0		// Direction X
		ui.sliders[3].value# = -15		// Direction Y
		ui.sliders[4].value# = 100		// Frequency
		ui.sliders[5].value# = 6		// Particle Life
		ui.sliders[6].minValue# = 2	// Velocity Range
		ui.sliders[6].maxValue# = 4	// Velocity Range
		ui.sliders[7].minValue# = -30	// Start Zone X
		ui.sliders[7].maxValue# = 30	// Start Zone X
		ui.sliders[8].minValue# = -20	// Start Zone Y
		ui.sliders[8].maxValue# = 20	// Start Zone Y
		ui.checkboxes[0].value = 0	// Debug: Show Starting Zone
	endif
	if (selectedCategory = CATEGORY_SINE_WAVES)
		ui.imageLoaders[0].value = imgSpaceship
		ui.sliders[0].value# = 50		// Sprite Height
		ui.sliders[1].value# = 1		// Angular Frequency
		ui.sliders[2].value# = 100		// Amplitude
		ui.sliders[3].value# = 1		// Spacing X
		ui.checkboxes[0].value = 1	// Rotate along wave
	endif
endfunction



function SaveLocalVariable(variable$ as string, value$ as string)
	local i as integer
	local indexFound as integer
	
	indexFound = -1
	for i = 0 to localVariables.length
		if (lower(localVariables[i].variable) = lower(variable$))
			indexFound = i
			localVariables[i].value = value$
		endif
	next
	if (indexFound = -1)
		localVariables.insert(blankVariable)
		localVariables[localVariables.length].variable = variable$
		localVariables[localVariables.length].value = value$
	endif
	localVariables.sort()
	localVariables.save("localVariables.json")
endfunction



function SetSpriteColorFromHex(spriteID as integer, color$ as string)
	local rgba as integer[4] : rgba[1] = 255 : rgba[2] = 255 : rgba[3] = 255 : rgba[4] = 255
	
	color$ = ReplaceString(color$, "#", "", -1)
	if (len(color$) = 3)
		rgba[1] = val(mid(color$, 1, 1) + mid(color$, 1, 1), 16)
		rgba[2] = val(mid(color$, 2, 1) + mid(color$, 2, 1), 16)
		rgba[3] = val(mid(color$, 3, 1) + mid(color$, 3, 1), 16)
	elseif (len(color$) = 6)
		rgba[1] = val(mid(color$, 1, 2), 16)
		rgba[2] = val(mid(color$, 3, 2), 16)
		rgba[3] = val(mid(color$, 5, 2), 16)
	endif
	SetSpriteColor(spriteID, rgba[1], rgba[2], rgba[3], rgba[4])
endfunction



function SetTextColorFromHex(textID as integer, color$ as string)
	local rgba as integer[4] : rgba[1] = 255 : rgba[2] = 255 : rgba[3] = 255 : rgba[4] = 255
	
	color$ = ReplaceString(color$, "#", "", -1)
	if (len(color$) = 3)
		rgba[1] = val(mid(color$, 1, 1) + mid(color$, 1, 1), 16)
		rgba[2] = val(mid(color$, 2, 1) + mid(color$, 2, 1), 16)
		rgba[3] = val(mid(color$, 3, 1) + mid(color$, 3, 1), 16)
	elseif (len(color$) = 6)
		rgba[1] = val(mid(color$, 1, 2), 16)
		rgba[2] = val(mid(color$, 3, 2), 16)
		rgba[3] = val(mid(color$, 5, 2), 16)
	endif
	SetTextColor(textID, rgba[1], rgba[2], rgba[3], rgba[4])
endfunction






