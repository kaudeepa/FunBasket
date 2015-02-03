-- 
-- adapted from Ghosts Vs Monsters sample project 
-- (see http://blog.anscamobile.com/2010/12/ghosts-vs-monsters-open-source-game-in-corona-sdk/)
-- 

module(..., package.seeall)

-- Main function - MUST return a display.newGroup()
function new()
	local localGroup = display.newGroup()
	
	local theTimer
	local loadingImage
	
	local showLoadingScreen = function()
	-- DK Need to change it to TechtudeSpalsh.png
		loadingImage = display.newImageRect( "Default.png", 480, 320 )
		loadingImage.x = 240; loadingImage.y = 160
		localGroup:insert(loadingImage)
		
		local goToLevel = function()
		--	director:changeScene( "menu" )
		director:changeScene( "screen1" )
		end
		
		theTimer = timer.performWithDelay( 2000, goToLevel, 1 )
	end
	
	showLoadingScreen()
	
	unloadMe = function()
	end
	
	-- MUST return a display.newGroup()
	return localGroup
end
