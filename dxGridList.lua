



 function dxCreateGridList(x, y, w, h, listElements, bgColor, enabled, postgui)
  if x and y and w and h then
	local gridElement = createElement("dxGridList")
	if gridElement then
		dxData = {}
		dxData.x = x
		dxData.y = y
		dxData.w = w
		dxData.h = h
		dxData.listElements = listElements or {"test 1", "test 2", "test 3"}
		dxData.bgColor = bgColor or {0,95,171}
		dxData.maxRows = 5

		dxData.rows = {
			items = {},
			active  = false,
			hover = false,
			itemHover = false
		
		}
			if enabled ~= nil and tostring(enabled) == "false" then
				dxData.enabled = false
			else
				dxData.enabled = true
			end
		setElementData(gridElement, "dxData", dxData)
		return gridElement
	end
  end
 end
 
 function dxDrawGridList(gridElement)
	if gridElement then
	d = getElementData(gridElement, "dxData")
	end
 
	if d and type(d) == "table" then

		bgColorR, bgColorG, bgColorB = unpack(d.bgColor) 
		local 	gridItemSize = dxGetFontHeight(1, dxFont)
		local	gridBgHeight = gridItemSize*#d.listElements
	if #d.listElements ~=0 then
		d.rows.hover = false
		if isMawseInPosition(d.x, d.y+gridItemSize, d.w, gridBgHeight ) then
		d.rows.hover = true
		end
			if d.h <=  gridItemSize*#d.listElements then
				d.h = gridItemSize*#d.listElements
			end
		dxDrawRectangle(d.x, d.y+gridItemSize, d.w, d.h, tocolor(bgColorR, bgColorG, bgColorB,255), false)
		d.rows.itemHover = false
		for i , gridItem in ipairs(d.listElements) do
		gridBgHeightA = gridItemSize* i
		
		if i <=  d.maxRows then
		-- scroll is not ez :(
			progress  = 0
			startPos = d.y 
			endPos = d.y+d.h
			scrollBgW = 15
			theStart = 	gridItemSize * 3


		--	dxDrawRectangle(d.x+d.w+2.5, d.y+gridItemSize+2.5, (scrollBgW/1.5), theStart/d.h, tocolor(19,19,19,255) ,true)
		if not d.rows.items[i] then
				d.rows.items[i] = 0
			end
			if d.rows.active and d.rows.active == i then
				d.rows.items[i] = math.max(d.rows.items[i]-15,0)
				dxDrawRectangle(d.x,d.y+(gridBgHeightA), d.w, gridItemSize, tocolor(50,50,50,255))
			elseif isMawseInPosition(d.x,d.y+(gridBgHeightA), d.w, gridItemSize) then
				d.rows.itemHover = i
				d.rows.items[i] = math.min(d.rows.items[i]+20,200)
				dxDrawRectangle(d.x,d.y+(gridBgHeightA), d.w, gridItemSize, tocolor(50,50,50,d.rows.items[i]))
			else
				d.rows.items[i] = math.max(d.rows.items[i]-15, 0) 
				dxDrawRectangle(d.x,d.y+(gridBgHeightA), d.w, gridItemSize, tocolor(50,50,50,d.rows.items[i]))

			end
			dxDrawText(tostring(gridItem), d.x+2, d.y+(gridBgHeightA), d.w, gridBgHeightA, tocolor(255,255,255,255), 1,dxFont, "left", "top", true, false,false,true)
			end
		end
	        setElementData(gridElement, "dxData", d, false)
	end
	end
 end
 
 function ondxLibRowClick(button , state)
	if button == "left" and state == "up" then
		for i , dxLibGrid in pairs(getElementsByType("dxGridList")) do
			local d = getElementData(dxLibGrid, "dxData")
			if d.rows.itemHover and d.rows.hover then
				d.rows.active = d.rows.itemHover
				setElementData(dxLibGrid, "dxData", d, false)
				if d.listElements[d.rows.active] then
				outputChatBox("does it work ?"..tostring(dxGetFontHeight(1, dxFont)))
				end
			end
		end
	end
 end
 addEventHandler("onClientClick", root, ondxLibRowClick)
 