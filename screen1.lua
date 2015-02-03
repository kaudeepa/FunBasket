module(..., package.seeall)

function new()
local ui = require ( "ui" )
local localGroup = display.newGroup()

local background1
local button1 = nil
local button2 = nil

background1 = display.newImage("carbonfiber.jpg", true)
localGroup:insert(background1)

background1.x = display.contentWidth / 2
background1.y = display.contentHeight / 2


local function buttonHandler ( event )
if (event.id == "button1" and event.phase =="press") then
 director:changeScene("screen2", "fade", 30.0,60.0,90.0)
elseif (event.id == "button2" and event.phase =="press") then
director:changeScene("screen3", "fade", "green")
end 
end

button1 = ui.newButton{
		defaultSrc = "buttonYellow.png",
		defaultX = 160,
		defaultY = 32,		
		overSrc = "buttonYellowOver.png",
		overX = 160,
		overY = 32,		
		onEvent = buttonHandler,
		id = "button1",
		text = "Level select",
		font = "Helvetica",
		textColor = { 255, 255, 255, 255 },
		emboss = true
	}

	button1.x = 160
	button1.y = 80
	button1.isActive = true
	localGroup:insert(button1)


button2 = ui.newButton{
		defaultSrc = "buttonGray.png",
		defaultX = 160,
		defaultY = 32,		
		overSrc = "buttonBlue.png",
		overX = 160,
		overY = 32,		
		onEvent = buttonHandler,
		id = "button2",
		text = "How To Play",
		font = "Helvetica",
		textColor = { 255, 255, 255, 255 },
		emboss = false
	}

	button2.x = 160
	button2.y = 130
	button2.isActive = true
	localGroup:insert(button2)
print("Iamhere screen1")

unloadMe = function()
end

return localGroup
end



