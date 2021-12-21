local progress = 0
 local edit = {}
 function dxCreateEditBox(x, y, w, h, titleText, defaultText, editColor, textColor, enabled, masked, postgui)
	if x and y and w and h then
		dxEditElement = createElement("dxLibEditBox")
	edit[dxEditElement] = {}
		if isElement(dxEditElement) then
			edit[dxEditElement].dxEditData = {}
			edit[dxEditElement].dxEditData.x = x
			edit[dxEditElement].dxEditData.y = y
			edit[dxEditElement].dxEditData.w = w
			edit[dxEditElement].dxEditData.h = h
			edit[dxEditElement].dxEditData.defaultText = defaultText or "dxEditBox"
			edit[dxEditElement].dxEditData.editColor = editColor or {50,50,50}
			edit[dxEditElement].dxEditData.textColor = textColor or {19,19,19}
			edit[dxEditElement].dxEditData.clicked = false
			edit[dxEditElement].dxEditData.state = "up"
			edit[dxEditElement].dxEditData.titleText = titleText or "editBoxTitle"
			edit[dxEditElement].dxEditData.masked = masked or false
			edit[dxEditElement].dxEditData.hover = hover or false

		if enabled ~= nil and tostring(enabled) == "false" then
			edit[dxEditElement].dxEditData.enabled = false
		else
			edit[dxEditElement].dxEditData.enabled = true
		end
			setElementData(dxEditElement, "dxData", edit[dxEditElement].dxEditData, false)
			return dxEditElement
		end
	end
 end
 
 
 
 
 function dxDrawEditBox(dxEditElement, x, y, w, h, titleText, defaultText, editColor, textColor, enabled, postgui)
	if dxEditElement then
	local	d = edit[dxEditElement].dxEditData 
	if d and type(d) == "table" then
		d.x = x or d.x
		d.y = y or d.y
		d.w = w or d.w
		d.h = h or d.h
		d.defaultText = defaultText or d.defaultText
		d.editColor = editColor or d.editColor
		d.textColor = textColor or d.textColor
		d.titleText = titleText or d.titleText
		d.masked = d.masked or false
		local x = d.x
		local y = d.y
		local w = d.w
		local h = d.h
		local defaultText = d.defaultText
		local titleText = d.titleText
		local editColorR, editColorG, editColorB = unpack(d.editColor)
		local textColorR, textColorG, textColorB = unpack(d.textColor)
		local borderX, borderY = 3, 1.5


		if tostring (enabled) == "false" then
			d.enabled = false
		else
			d.enabled = true
		end
		
		if tostring(d.masked) == "true" then
		defaultText = string.rep("●", #defaultText)
		else
		defaultText = defaultText
		end
		
			local Edit = getElementsByType("dxLibEditBox")
			for i = 1, #Edit do 
			local dxData = edit[Edit[i]].dxEditData
			if progress >= 1 then
			progress = 1
			end

			if d.enabled then
			dat = dxGetTextWidth(dxData.defaultText) - dxGetTextWidth(#dxData.defaultText - 1)

				if not dxData.clicked == true then
			 dd =	dxDrawLine(x, y+h, x+w, y+h, tocolor(0,0,0,255), 2, postgui)
			dxDrawText(defaultText,x+borderX, y+borderY+(dxGetFontHeight(1, dxWindowFont)/2), x + w, y + h, tocolor(textColorR, textColorG, textColorB, 255), 1, dxWindowFont, "center", "bottom", true, false, postgui)
			defaultText =""

			end
				if edit[dxEditElement].dxEditData.hover == true then
			--	dxDrawRectangle(x-1.5, y-3, w+3, h+6, tocolor(200,200,200,100))
				end
					if dxData.clicked == true then

			progress = progress + 0.02
			dxData.ny , fontScale=  (dxData.y) - (dxGetFontHeight(1, dxWindowFont)/2), 0.75
			dxData.ny , fontScale = interpolateBetween( dxData.ny , fontScale,0, (dxData.y) - (dxGetFontHeight(1, dxWindowFont)/2), 0.75,0, progress, "Linear") 

				dxDrawLine(x, y+h, x+w, y+h, tocolor(255,255,255,255), 2, postgui)
			dxDrawText(dxData.titleText,dxData.x+borderX, dxData.ny+borderY, dxData.x + dxData.w, dxData.ny + dxData.h, tocolor(textColorR, textColorG, textColorB, alpha), fontScale, dxWindowFont, "center", "center", true, false, postgui)
			dxDrawText(defaultText,x+borderX, y+borderY+(dxGetFontHeight(1, dxWindowFont)/2), x + w, y + h, tocolor(textColorR, textColorG, textColorB, 255), 1, dxWindowFont, "center", "bottom", true, false, postgui)
		dd = dxDrawLine(x, y+h, x+w, y+h, tocolor(0,0,0,255), 2, postgui)
					end
			end
			end


	end
	end
 end
 guiSetInputEnabled(false)
 


	function onClick(button, state)
		if button == "left" and state == "up" then
			local Edit = getElementsByType("dxLibEditBox")
			for i = 1, #Edit do
				local dxData = edit[Edit[i]].dxEditData
				if dxData.enabled == true then
					if isMawseInPosition(dxData.x, dxData.y, dxData.w, dxData.h) then
						dxData.clicked = true
						dxData.hover = true
						guiSetInputEnabled(true)
					else
						dxData.clicked = false
						dxData.hover = false
						guiSetInputEnabled(false)
					end
				end
				setElementData(Edit[i], "dxData", dxData, false)

			end
		end
	end
	addEventHandler("onClientClick", root, onClick)


function playerPressedKey(button, press)
		if (press) then 
		local Edit =  getElementsByType("dxLibEditBox")
		for i = 1,  #Edit do
		local dxData = edit[Edit[i]].dxEditData
		if dxData.clicked == true then
		if button == "backspace" then
			dxData.defaultText = string.sub(dxData.defaultText, 1 ,#dxData.defaultText-1)
			end
		setElementData(Edit[i], "dxData", dxData, false)
		end
		end
    end
end
	addEventHandler("onClientKey", root, playerPressedKey)
	
	
addEventHandler("onClientCharacter", root, function(character)
		 
			local Edit =  getElementsByType("dxLibEditBox")
				for i = 1,  #Edit do
			local dxData = edit[Edit[i]].dxEditData
			if dxData.clicked == true then
				animate = true
			character = checkPressedKey()
				dxData.defaultText = dxData.defaultText..character
				
			

			end
				setElementData(Edit[i], "dxData", dxData, false)

			end
	
end)
	
		
--test

 -- function concatChar(Char)
	-- local Edit =  getElementsByType("dxLibEditBox")
	-- for i = 1,  #Edit do
	-- local dxData = edit[Edit[i]].dxEditData
		-- if dxData.clicked == true then
		-- animate = true
		-- for i , theKey in ipairs(keysTable) do
			-- if Char == theKey then 
				-- dxData.defaultText = dxData.defaultText..theKey
				-- outputChatBox(tostring(Char))
				-- end
			-- end
		-- setElementData(Edit[i], "dxData", dxData, false)
		-- end

	-- end
 -- end
 
 --	addEventHandler("onClientCharacter", root, concatChar)
	
function dxGetEditBoxText (dxEditElement)
	if isElement(dxEditElement) and getElementType(dxEditElement) == "dxLibEditBox" then
	 return edit[dxEditElement].dxEditData.defaultText
	end
end
function dxSetEditBoxText (dxEditElement, text)
	if isElement(dxEditElement) and getElementType(dxEditElement) == "dxLibEditBox" then
		edit[dxEditElement].dxEditData.defaultText = text
	return true
	end
end

 keysTable = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
			"l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z","","A","B","C","D","E","F","G","H","I",
			"J","K", "L", "M", "N","O","P","Q","R","S","T","U","V","W","W","Y","Z"," ", "num_0", "num_1", "num_2", "num_3", "num_4", "num_5",
			"num_6", "num_7", "num_8", "num_9", "num_mul", "num_add", "num_sub", "num_div", "num_dec","space","[", "]", ";", ",", "-", ".", "/", "#", "\\", "=", '`'
} 
shiftTable = {")","!","@","#","$","%","^","&","*","("}

keyState = {}

function checkPressedKey()
	for i,key in ipairs(keysTable) do
		if getKeyState(key) then
			if true then
				if not keyState[i] then
					keyState[i] = getTickCount() + 500
					if key == "num_0" then return "0"
					elseif key == "num_1" then return "1"
					elseif key == "num_2" then return "2"
					elseif key == "num_3" then return "3"
					elseif key == "num_4" then return "4"
					elseif key == "num_5" then return "5"
					elseif key == "num_6" then return "6"
					elseif key == "num_7" then return "7"
					elseif key == "num_8" then return "8"
					elseif key == "num_9" then return "9"
					elseif key == "num_add" then return "+"
					elseif key == "num_sub" then return "-"
					elseif key == "num_div" then return "/"
					elseif key == "num_mul" then return "*"
					elseif key == "num_dec" then return ","
					elseif key == "space" then return " "
					else
						if not (getKeyState("lshift") or getKeyState("rshift")) then
							return key
						else
							if tonumber(key) then
								return shiftTable[tonumber(key)+1]
							elseif key == '`' then return "~"
							elseif key == '-' then return "_"
							elseif key == "=" then return "+"
							elseif key == "[" then return "{"
							elseif key == "]" then return "}"
							elseif key == "\\" then return "|"
							elseif key == "'" then return "\""
							elseif key == ";" then return ":"
							elseif key == "/" then return "?"
							elseif key == "." then return ">"
							elseif key == "," then return "<"
							else
								return string.upper(key)
							end
						end
					end
				elseif keyState[i] and keyState[i] < getTickCount() then
					keyState[i] = getTickCount()+200
					if key == "num_0" then return "0"
					elseif key == "num_1" then return "1"
					elseif key == "num_2" then return "2"
					elseif key == "num_3" then return "3"
					elseif key == "num_4" then return "4"
					elseif key == "num_5" then return "5"
					elseif key == "num_6" then return "6"
					elseif key == "num_7" then return "7"
					elseif key == "num_8" then return "8"
					elseif key == "num_9" then return "9"
					elseif key == "num_add" then return "+"
					elseif key == "num_sub" then return "-"
					elseif key == "num_div" then return "/"
					elseif key == "num_mul" then return "*"
					elseif key == "num_dec" then return ","
					elseif key == "space" then return " "
					else
						if not (getKeyState("lshift") or getKeyState("rshift")) then
							return key
						else
							if tonumber(key) then
								return shiftTable[tonumber(key)+1]
							elseif key == '`' then return "~"
							elseif key == '-' then return "_"
							elseif key == "=" then return "+"
							elseif key == "[" then return "{"
							elseif key == "]" then return "}"
							elseif key == "\\" then return "|"
							elseif key == "'" then return "\""
							elseif key == ";" then return ":"
							elseif key == "/" then return "?"
							elseif key == "." then return ">"
							elseif key == "," then return "<"
							else
								return string.upper(key)
							end
						end
					end
				end
			else
				return ""
			end
		else
			keyState[i] = false
		end
	end
	return ""
end

