
 
  function dxCreateWindow( x, y, w, h, wdwTitle, bgColor, enabled, postgui )
	if x and y and w and h then
	local dxWindowElement = createElement("dxLibWindow")
		if isElement(dxWindowElement) then
			dxWinData = {}
			dxWinData.x = x
			dxWinData.y = y
			dxWinData.w = w
			dxWinData.h = h
			dxWinData.wdwTitle = wdwTitle or " dxLib Window "
			dxWinData.bgColor = bgColor or { 255,153, 0 }
			if enabled ~= nil and tostring(enabled) == "false" then
			dxWinData.enabled = false
			else
			dxWinData.enabled = true
			end
				setElementData(dxWindowElement, "dxData", dxWinData, false)
			return dxButtonElement
		end
	end
 end
 
 function dxDrawWindow( dxWindowElement, x, y, w, h, wdwTitle, bgColor, enabled, postgui)
	if dxWindowElement then
		d = getElementData(dxWindowElement, "dxData")
	end
	if d and type(d) == "table" then
		d.x = x or d.x
		d.y = y or d.y
		d.w = w or d.w
		d.h = h or d.h
		d.wdwTitle = wdwTitle or d.wdwTitle
		d.bgColor = bgColor or d.bgColor
		

		
		local x = d.x
		local y = d.y
		local w = d.w
		local h = d.h
		local wdwTitle = d.wdwTitle
		local bgColorR, bgColorG, bgColorB = unpack(d.bgColor)
		local frontiers = 3
		local dxFontHeight = dxGetFontHeight(1, dxFont) * 1.5
			if tostring(enabled) == "false" then
				d.enabled = false
			else
				d.enabled = true
			end

			if d.enabled then
			dxDrawRoundedUpRectangle(x,y,w,h, tocolor(bgColorR, bgColorG, bgColorB, 225),6,postgui)
			dxDrawRoundedRectangle(x+frontiers, y+ dxFontHeight + frontiers, w - (frontiers*2), h - dxFontHeight -(frontiers*2), tocolor(230,230,230,255), 3, postgui)
			--dxDrawRectangle(x,y,w,h, tocolor(bgColorR, bgColorG, bgColorB, 250), postgui)
			--dxDrawRectangle(x+frontiers, y+ dxFontHeight + frontiers, w - (frontiers*2), h - dxFontHeight -(frontiers*2), tocolor(230,230,230,255))
			dxDrawText(string.upper(wdwTitle),x+(frontiers * 2),y+((dxFontHeight/1.5)/3),w+x, h+y, tocolor(255,255,255,255), 1 ,dxWindowFont, "center", "top", false, false, postgui )
			else
			
			end

	end
 end