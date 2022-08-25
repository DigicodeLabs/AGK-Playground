// File: icons.agc
// Created: 22-08-22

type typeIcon
	sortKey$ as string
	id as integer
	imageID as integer
	name$ as string
endtype

global icon as typeIcon[]

fileID = OpenToRead("icons/outlined/96px/Material-Icons.txt")
for a = 1 to 4
	img = LoadImage("icons/outlined/96px/Material-Icons-" + AddLeadingZeros(str(a), 2) + ".png")
	for b = 1 to 400
		line$ = ReadLine(fileID)
		subimage = LoadSubImage(img, "icon" + str(b))
		icon.insert(blankIcon)
		id = icon.length
		icon[id].sortKey$ = line$
		icon[id].id = id
		icon[id].imageID = subimage
		icon[id].name$ = line$
	next
next
CloseFile(fileID)
icon.sort()