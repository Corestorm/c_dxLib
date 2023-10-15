
 scW,scH = guiGetScreenSize ()

 screenW, screenH = guiGetScreenSize()
 sX, sY = guiGetScreenSize()
 Time  = 0
 dxFont = dxCreateFont("files/dx_lib_font_b.ttf", 11)
 dxWindowFont = dxCreateFont("files/dx_lib_font_b.ttf", 11)
sW,sH = (scW/1366), (scH/768)
 progress = 0
 clicked = false
 editProgress = 0
 gbAlpha = 1
------

function __isMouseInPosition ( posX, posY, sizeX, sizeY ) --- Without Reltive 
    if(isCursorShowing()) then
        local cX, cY = getCursorPosition()
        if(cX >= posX and cX <= posX+(sizeX - posX)) and (cY >= posY and cY <= posY+(sizeY - posY)) then
            return true
        else
            return false
        end
    else
        return false	
    end
end
function ___isMouseInPosition ( posX, posY, sizeX, sizeY ) --- With Reltive
    if(isCursorShowing()) then
        local cX, cY = getCursorPosition()
        local screenWidth, screenHeight = guiGetScreenSize()
        local cX, cY = (cX*screenWidth), (cY*screenHeight)
        if(cX >= posX and cX <= posX+(sizeX - posX)) and (cY >= posY and cY <= posY+(sizeY - posY)) then
            return true
        else
            return false
        end
    else
        return false	
    end
end

function __isItemInRange ( Rx, Ry, Rwidth, Rheight, x, y, width, height ) --- With Reltive 
    local sx, sy = guiGetScreenSize ( )
    local Rx, Ry = ( Rx * sx ), ( Ry * sy )
	if ( Rx >= x and Rx <= x + width and Rwidth < width ) and ( Ry >= y and Ry <= y + height and Rheight < height ) then
        return true
    else
        return false
    end
end


function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if 
		type( sEventName ) == 'string' and 
		isElement( pElementAttachedTo ) and 
		type( func ) == 'function' 
	then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs( aAttachedFunctions ) do
				if v == func then
					return true
				end
			end
		end
	end

	return false
end

function isMawseInPosition ( x, y, width, height )
	if ( not isCursorShowing( ) ) then
		return false
	end
    local sx, sy = guiGetScreenSize ( )
    local cx, cy = getCursorPosition ( )
    local cx, cy = ( cx * sx ), ( cy * sy )
    if ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) then
        return true
    else
        return false
    end
end 
 function dxDrawLinedRectangle( x, y, width, height, color, _width, postGUI )
	local _width = _width or 1
	dxDrawLine ( x, y, x+width, y, color, _width, postGUI ) -- Top
	dxDrawLine ( x, y, x, y+height, color, _width, postGUI ) -- Left
	dxDrawLine ( x, y+height, x+width, y+height, color, _width, postGUI ) -- Bottom
	return dxDrawLine ( x+width, y, x+width, y+height, color, _width, postGUI ) -- Right
end



function dxDrawRoundedRectangle(x,y,w,h,color,radius,postGUI)
	local color = color or tocolor(0,255,255,255)
	local postGUI = postGUI or false
	local radius = radius or 10
	dxDrawImageSection(x,y,radius,radius,0,0,10,10,"img/round.png",0,0,0,color,postGUI) -- left up
	dxDrawRectangle(x+radius,y,w-radius-radius,radius,color,postGUI) -- up
	dxDrawImageSection(x+w-radius,y,radius,radius,0,0,10,10,"img/round.png",90,0,0,color,postGUI) -- right up
	dxDrawRectangle(x+w-radius,y+radius,radius,h-radius-radius,color,postGUI) -- right
	dxDrawImageSection(x+w-radius,y+h-radius,radius,radius,0,0,10,10,"img/round.png",180,0,0,color,postGUI) -- right down
	dxDrawRectangle(x,y+radius,radius,h-radius-radius,color,postGUI) -- left
	dxDrawImageSection(x,y+h-radius,radius,radius,0,0,10,10,"img/round.png",-90,0,0,color,postGUI) -- left down
	dxDrawRectangle(x+radius,y+h-radius,w-radius-radius,radius,color,postGUI) -- down
	dxDrawRectangle(x+radius,y+radius,w-radius-radius,h-radius-radius,color,postGUI) -- middle
end

function dxDrawRoundedUpRectangle(x,y,w,h,color,radius,postGUI)
	local color = color or tocolor(0,255,255,255)
	local postGUI = postGUI or false
	local radius = radius or 10
	dxDrawImageSection(x,y,radius,radius,0,0,10,10,"img/round.png",0,0,0,color,postGUI) -- left up
	dxDrawRectangle(x+radius,y,w-radius-radius,radius,color,postGUI) -- up
	dxDrawImageSection(x+w-radius,y,radius,radius,0,0,10,10,"img/round.png",90,0,0,color,postGUI) -- right up
	dxDrawRectangle(x+w-radius,y+radius,radius,h-radius-radius,color,postGUI) -- right
--	dxDrawImageSection(x+w-radius,y+h-radius,radius,radius,0,0,10,10,"img/round.png",180,0,0,color,postGUI) -- right down
	dxDrawRectangle(x,y+radius,radius,h-radius-radius,color,postGUI) -- left
--	dxDrawImageSection(x,y+h-radius,radius,radius,0,0,10,10,"img/round.png",-90,0,0,color,postGUI) -- left down
	dxDrawRectangle(x,y+h-radius,w,radius,color,postGUI) -- down
	dxDrawRectangle(x+radius,y+radius,w-radius-radius,h-radius-radius,color,postGUI) -- middle
end

function dxDrawRoundedDownRectangle(x,y,w,h,color,radius,postGUI)
	local color = color or tocolor(0,255,255,255)
	local postGUI = postGUI or false
	local radius = radius or 10
--	dxDrawImageSection(x,y,radius,radius,0,0,10,10,"img/round.png",0,0,0,color,postGUI) -- left up
	dxDrawRectangle(x,y,w,radius,color,postGUI) -- up
	--dxDrawImageSection(x+w-radius,y,radius,radius,0,0,10,10,"img/round.png",90,0,0,color,postGUI) -- right up
	dxDrawRectangle(x+w-radius,y+radius,radius,h-radius-radius,color,postGUI) -- right
	dxDrawImageSection(x+w-radius,y+h-radius,radius,radius,0,0,10,10,"img/round.png",180,0,0,color,postGUI) -- right down
	dxDrawRectangle(x,y+radius,radius,h-radius-radius,color,postGUI) -- left
	dxDrawImageSection(x,y+h-radius,radius,radius,0,0,10,10,"img/round.png",-90,0,0,color,postGUI) -- left down
	dxDrawRectangle(x,y+h-radius,w,radius,color,postGUI) -- down
	dxDrawRectangle(x+radius,y+radius,w-radius-radius,h-radius-radius,color,postGUI) -- middle
end


----------------------- Example :

 
 
 sX, sY = guiGetScreenSize()
function onDxLibGridlistStart()
	renderTarget = dxCreateRenderTarget(sX,sY,true)
end
addEventHandler("onClientResourceStart",resourceRoot,onDxLibGridlistStart)

 
 
 
 
 function isEventHandlerAdded(sEventName, pElementAttachedTo, func)
 if type(sEventName) == 'string' and
  isElement(pElementAttachedTo) and
  type(func) == 'function'
 then
  local aAttachedFunctions = getEventHandlers(sEventName, pElementAttachedTo)
  if type(aAttachedFunctions) == 'table' and #aAttachedFunctions > 0 then
   for i, v in ipairs(aAttachedFunctions) do
    if v == func then
     return true
    end
   end
  end
 end
 return false
end
 
addEventHandler("onClientResourceStart", root, function()
--myButton =  dxCreateButton(435, 500, 120, 32,"Login",{0,95,171},{255,19,19},"normal", true,true)
--mySecButton =  dxCreateButton(screenW * 0.4488, screenH * 0.7044, screenW * 0.0922, screenH * 0.0378,"Login",{0,95,171},{19,19,19},"normal", true,true)
myThirdButton =  dxCreateButton(screenW * 0.4488, screenH * 0.7044, screenW * 0.0922, screenH * 0.0378,"Stay Guest",{0,95,171},{19,19,19},"normal", true,true)
myFourth =  dxCreateButton(screenW * 0.4268, screenH * 0.8164, screenW * 0.1340, screenH * 0.0156,"visite us @inf-edge.com",{0,95,171},{19,19,19},"invisible", true,true)

myEdit =  dxCreateEditBox(screenW * 0.4231, screenH * 0.3698, screenW * 0.1515, screenH * 0.0469,"UserName", "User", {255,255,255}, {255,255,255}, true, false,true)
mySecEdit =  dxCreateEditBox(screenW * 0.4231, screenH * 0.4909, screenW * 0.1515, screenH * 0.0469,"Password", "Pass", {255,255,255}, {255,255,255}, true, true, true)

myNobGrid = dxCreateGridList(500, 200, 200, 60, {"Arabic", "français", "english", "spania"}, {0,95,150}, true, true)
end) 
addEvent( "onClientGotImage", true )
addEventHandler( "onClientGotImage", resourceRoot,function( pixels )
	if avatar and (avatar ~= 'img/user.png') then
		destroyElement( avatar )
	end
		avatar = dxCreateTexture(pixels)
end)
function dxLibClientButtonClick(Button)
	
	if Button == myThirdButton then
	outputChatBox("editbox says : "..dxGetEditBoxText (myEdit))
	outputChatBox("and the other says : "..dxGetEditBoxText (mySecEdit))

	triggerServerEvent('playerWantToLogin',getLocalPlayer(),tostring(dxGetEditBoxText (myEdit)),tostring(dxGetEditBoxText(mySecEdit)),getLocalPlayer())

	end

 end
addEvent("onConolelClick", true)
addEventHandler("onConolelClick", root ,dxLibClientButtonClick )


	--[[	d]]
