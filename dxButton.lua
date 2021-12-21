
 
 
 function dxCreateButton(x,y,w,h,text,btncolor,txtcolor, btnType, enabled, postgui)
    if x and y and w and h then
    local dxButtonElement = createElement("dxLibButton")
        if isElement(dxButtonElement) then
            dxbuttonData = {}
            dxbuttonData.x = x
             dxbuttonData.y = y
            dxbuttonData.w = w
            dxbuttonData.h = h
            dxbuttonData.text = text or "Button"
            dxbuttonData.btncolor = btncolor or {255,0,20}
            dxbuttonData.txtcolor = txtcolor or {255,255,255}
            dxbuttonData.hover = false
			dxbuttonData.btnType = btnType or "normal"
			dxbuttonData.target = dxCreateRenderTarget(w,h,true)
        if enabled ~= nil and tostring(enabled) == "false" then
            dxbuttonData.enabled = false
        else
            dxbuttonData.enabled = true

        end
            setElementData(dxButtonElement, "dxData", dxbuttonData, false)
            return dxButtonElement
        end
    end
 end
 
 function dxDrawButton(dxButtonElement, x,y,w,h,text,btncolor,txtcolor, btnType,  enabled, postgui)
    if dxButtonElement then
        d = getElementData(dxButtonElement, "dxData")
    if d and type(d) == "table" then
        d.x = x or d.x
        d.y = y or d.y
        d.w = w or d.w
        d.h = h or d.h
        d.text = text or d.text
        d.btncolor = btncolor or d.btncolor
        d.txtcolor = txtcolor or d.txtcolor
        d.btnType = btnType or d.btnType
		d.clicked = false
        local x = d.x
        local y = d.y
        local w = d.w
        local h = d.h
        local text = d.text
        local btnR, btnG, btnB = unpack(d.btncolor)
        local textR,textG,textB = unpack(d.txtcolor)
		local btnType = d.btnType
		 dh = d.target
        if tostring(enabled) == "false" then
            d.enabled = false
        else
            d.enabled = true
        end
		
		if btnType == "normal" then 
		btnAlpha = 255
		circleR,circleG,circleB = 0,0,0
		textR,textG,textB = 255,255,255
		else
		btnAlpha = 0
		circleR,circleG,circleB = btnR, btnG, btnB
		textR,textG,textB = btnR, btnG, btnB
		end
		
        if d.enabled and d.target then
		dxDrawRoundedRectangle(x,y,w,h,tocolor(btnR, btnG, btnB,btnAlpha),15,postgui)
		--dxDrawRectangle(x,y,w,h,tocolor(btnR, btnG, btnB,255), postgui)
        dxDrawText(string.upper(text),x,y,x+w,y+h, tocolor(textR,textG,textB, 255), 1 ,dxFont, "center","center",false,false, postgui)
		

        end
		if d.enabled and isMawseInPosition(x, y, w, h) then
		dxDrawRoundedRectangle(x,y,w,h,tocolor(50, 50, 50,50),10,postgui)
		end
		  if  clicked == true and d.enabled and d.target then
			if progress >= 1 then
			progress = 1
			end
			if clicked == true then
				progress = progress + 0.02
			end
			alpha = interpolateBetween( 250,0,0, 0,0,0, progress, "Linear") 

			dxSetRenderTarget(d.target,true)
		if 	isCursorShowing() then
			theX = cursX*sX - x
			theY = cursY*sY - y
			aW , aH = interpolateBetween( 0,0,0, (x+w)*0.75,(y+h)*0.75,0, progress, "Linear")
			nX , nY = interpolateBetween( theX,30,0, 200,200,0, progress, "Linear")

			dxDrawImage(theX-aW/2,theY-aH/2, aW, aH,"img/circle.png", 0,0, 0,tocolor(circleR,circleG,circleB,alpha))

			dxSetRenderTarget()
			--
		--	clicked = false
		end
						dxDrawImage(x,y,w,h, d.target, 0, 0, 0, tocolor(btnR, btnG, btnB,170))

        end
	--	progress = 0
        setElementData(dxButtonElement, "dxData", d, false)
    end
    end
 end
 
 function dxLibClientClick(button,state)
	if button == "left" and state == "up" then
		for i, dxLibButton in pairs(getElementsByType("dxLibButton")) do
			local	dxData = getElementData(dxLibButton, "dxData")
			if isMawseInPosition ( dxData.x , dxData.y , dxData.w , dxData.h ) then
			if dxData.enabled then
			clicked = true
						cursX , cursY = getCursorPosition()

			triggerEvent("onConolelClick", getRootElement(), dxLibButton)
				progress = 0

				setElementData(dxLibButton, "dxData", dxData, false)

		--	outputChatBox("hehe")
			end
			end
		end
	end
 end

 addEventHandler("onClientClick", root, dxLibClientClick)