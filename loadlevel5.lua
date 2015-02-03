
module(..., package.seeall)

-- Main function - MUST return a display.newGroup()
function new()
	local localGroup = display.newGroup()
	print("Came to load")
	local theTimer
	local showLoadingScreen = function()	
		local goToLevel = function()
			director:changeScene( "screen8" )
		end
	
		theTimer = timer.performWithDelay( 300, goToLevel, 1 )
	end
	
	showLoadingScreen()
	
	unloadMe = function()
		if theTimer then timer.cancel( theTimer ); end
	end
	return localGroup
end
