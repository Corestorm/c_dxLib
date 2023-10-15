
  function dxLibDrawRoundedRectangle(x, y ,w , h, length, color, postgui)
	length = length or 4.1
	dxDrawImageSection(x,y,w/2,h,  256, 0, 65 ,  129, "img/circles.png",0,0,0,color,postgui)
	dxDrawImageSection(x+w/1.39,y,w/2,h,  256, 0, 65 ,  128, "img/circles.png",180,50,0,color,postgui)
	dxDrawImageSection(x,y,w/2,h,  256, 0, 65 ,  129, "img/circles_border.png",0,0,0,tocolor(0,0,0,150),true)
	dxDrawImageSection(x+w/1.39,y-1,w/2,h,  256, 0, 65 ,  129, "img/circles_border.png",180,50,0,tocolor(0,0,0,150),true)

	dxDrawRectangle(x+w/2,y+(length/2.75),w,(length/(length/2.75))*1.25, tocolor(0,0,0,150), true)--dx rec line up
	dxDrawRectangle(x+w/2,y+h-((length/2.75)*5),w,(length/(length/2.75))*1.25, tocolor(0,0,0,150), true)--dx rec line down

	 dxDrawRectangle(x+w/2,y+(length/(length/2.75))*1.25, w,h-(((length/(length/2.75))*1.25)*2), color, false)
  
  end
  
