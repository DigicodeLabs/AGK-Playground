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






