module(..., package.seeall)

function new()
local ui = require ( "ui" )
local localGroup = display.newGroup()

local background2
local level1Btn=nil
local level2Btn=nil
local mainmenuBtn=nil
local level3Btn=nil


local buttonHandler = function( event )
if (event.id == "mainmenuBtn" and event.phase =="press") then 
 director:changeScene("screen1", "fade", 30.0,60.0,90.0)
end
if (event.id == "level1Btn" and event.phase =="press") then 
 director:changeScene("screen4", "fade", 30.0,60.0,90.0)
end
if (event.id == "level2Btn" and event.phase =="press") then 
 director:changeScene("screen5", "fade", 30.0,60.0,90.0)
end 
if (event.id == "level3Btn" and event.phase =="press") then 
 director:changeScene("screen6", "fade", 30.0,60.0,90.0)
end
if (event.id == "level4Btn" and event.phase =="press") then 
 director:changeScene("screen7", "fade", 30.0,60.0,90.0)
end 
if (event.id == "level5Btn" and event.phase =="press") then 
 director:changeScene("screen8", "fade", 30.0,60.0,90.0)
end	
end

background2 = display.newImage("bkg_clouds.png", true)

background2.x = display.contentWidth / 2
background2.y = display.contentHeight / 2
localGroup:insert( background2)

level1Btn = ui.newButton{

	defaultSrc = "buttonYellow.png",
	defaultX = 160,
	defaultY = 32,		
	overSrc = "buttonYellowOver.png",
	overX = 160,
	overY = 32,		
	onEvent = buttonHandler,
	id = "level1Btn",
	text = "Level 1",
	font = "Trebuchet-BoldItalic",
	textColor = { 51, 51, 51, 255 },
	emboss = true
}


level1Btn.x = 160
level1Btn.y = 40
level1Btn.isActive = true
localGroup:insert(level1Btn)

level2Btn = ui.newButton{

	defaultSrc = "buttonYellow.png",
	defaultX = 160,
	defaultY = 32,		
	overSrc = "buttonYellowOver.png",
	overX = 160,
	overY = 32,		
	onEvent = buttonHandler,
	id = "level2Btn",
	text = "Level 2",
	font = "Trebuchet-BoldItalic",
	textColor = { 51, 51, 51, 255 },
	emboss = true
}


level2Btn.x = 160
level2Btn.y = 80
level2Btn.isActive = true
localGroup:insert(level2Btn)



level3Btn = ui.newButton{

	defaultSrc = "buttonYellow.png",
	defaultX = 160,
	defaultY = 32,		
	overSrc = "buttonYellowOver.png",
	overX = 160,
	overY = 32,		
	onEvent = buttonHandler,
	id = "level3Btn",
	text = "Level 3",
	font = "Trebuchet-BoldItalic",
	textColor = { 51, 51, 51, 255 },
	emboss = true
}


level3Btn.x = 160
level3Btn.y = 120
level3Btn.isActive = true
localGroup:insert(level3Btn)

level4Btn = ui.newButton{

	defaultSrc = "buttonYellow.png",
	defaultX = 160,
	defaultY = 32,		
	overSrc = "buttonYellowOver.png",
	overX = 160,
	overY = 32,		
	onEvent = buttonHandler,
	id = "level4Btn",
	text = "Level 4",
	font = "Trebuchet-BoldItalic",
	textColor = { 51, 51, 51, 255 },
	emboss = true
}


level4Btn.x = 160
level4Btn.y = 160
level4Btn.isActive = true
localGroup:insert(level4Btn)

level5Btn = ui.newButton{

	defaultSrc = "buttonYellow.png",
	defaultX = 160,
	defaultY = 32,		
	overSrc = "buttonYellowOver.png",
	overX = 160,
	overY = 32,		
	onEvent = buttonHandler,
	id = "level5Btn",
	text = "Level 5",
	font = "Trebuchet-BoldItalic",
	textColor = { 51, 51, 51, 255 },
	emboss = true
}


level5Btn.x = 160
level5Btn.y = 200
level5Btn.isActive = true
localGroup:insert(level5Btn)

mainmenuBtn = ui.newButton{

	defaultSrc = "buttonBlueSmall.png",
	defaultX = 160,
	defaultY = 32,		
	overSrc = "buttonBlueSmallOver.png",
	overX = 160,
	overY = 32,		
	onEvent = buttonHandler,
	id = "mainmenuBtn",
	text = "Main Menu",
	font = "Trebuchet-BoldItalic",
	textColor = { 51, 51, 51, 255 },
	emboss = true
}


mainmenuBtn.x = 160
mainmenuBtn.y = 240
mainmenuBtn.isActive = true
localGroup:insert(mainmenuBtn)

unloadMe = function()
end

return localGroup
end


