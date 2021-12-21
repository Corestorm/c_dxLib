addEventHandler("onClientRender",root, function()
dxDrawRoundedRectangle(screenW * 0.3236, screenH * 0.1419, screenW * 0.3360, screenH * 0.7135,tocolor(0,0,0,150),7,false)
dxDrawButton(myThirdButton)
dxDrawButton(myFourth)
dxDrawEditBox(myEdit)
dxDrawEditBox(mySecEdit)
	if avatar then
	dxDrawImage ( screenW * 0.3236, screenH * 0.15, 50, 50, avatar )
	else
	local avatar = 'img/user.png'
		dxDrawImage ( screenW * 0.3236, screenH * 0.15, 50, 50, avatar )

	end
	
end)
showCursor(true)