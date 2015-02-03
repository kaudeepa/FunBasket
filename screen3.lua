module(..., package.seeall)

function new()
local ui = require ( "ui" )
local localGroup = display.newGroup()

local background3
local button31=nil


local buttonHandler = function( event )
if (event.id == "button31" and event.phase =="press") then
director:changeScene("screen1", "fade", 30.0,60.0,90.0)
end 	
end

background3 = display.newImage("bkg_clouds.png", true)
background3.x = display.contentWidth / 2
background3.y = display.contentHeight / 2
localGroup:insert(background3)

button31 = ui.newButton{
		defaultSrc = "buttonBlueSmall.png",
		defaultX = 160,
		defaultY = 32,		
		overSrc = "buttonBlueSmallOver.png",
		overX = 160,
		overY = 32,		
		onEvent = buttonHandler,
		id = "button31",
		text = "Main Menu",
		font = "Helvetica",
		textColor = { 255, 255, 255, 255 },
		emboss = false
	}
	button31.x = 160
	button31.y = 80
	button31.isActive = true
	localGroup:insert(button31)


unloadMe = function()
end

	return localGroup
end


