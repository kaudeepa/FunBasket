-------Deepak's Code ------------

module(..., package.seeall)

function new()
local localGroup = display.newGroup()

local ui = require( "ui" )
local physics = require( "physics" )

-- For Debugging
--physics.setGravity(0, 9.8)
--physics.setDrawMode("hybrid")



local scoreText
local score = 0

local boingSound = audio.loadSound("boing_wav.wav")
local knockSound = audio.loadSound("knock_wav.wav")
local squishSound = audio.loadSound("squish_wav.wav")
local youWinSound = audio.loadSound("youwin.wav")
local youLoseSound = audio.loadSound("youlose.wav")
local tapSound = audio.loadSound("tapsound.wav")

-- Physics and Multitouch Engine Started
physics.start()
system.activate("multitouch")
display.setStatusBar(display.HiddenStatusBar)



local sky = display.newImage( "background1.png" )
sky.x = 240; sky.y = 160
localGroup:insert(sky)

local ground = display.newImage( "ground1.png" )
ground.x = 240; ground.y = 300
localGroup:insert(ground)

-- Left and right walls.
local leftWall  = display.newRect(0, 0, 1, display.contentHeight)
local rightWall = display.newRect(display.contentWidth, 0, 1, display.contentHeight)

-- one magic hat
local basket = display.newImage( "Hat.png" )
basket.x = 160; basket.y = 265 ; basket.myName ="Hat"
squareShape = { -40,-25, 40,-25, 40,25, -40,25 }
basket.isPlatform = true -- custom flag

-- add all to physics engine to make these real physical objects.
physics.addBody(leftWall, "static", {bounce = 0.1})
physics.addBody(rightWall, "static", {bounce = 0.1})
physics.addBody( basket, "kinematic", { friction=0.1, shape=squareShape} )

localGroup:insert(leftWall)
localGroup:insert(rightWall)
localGroup:insert(basket)

-- SCORE DISPLAY

scoreText = display.newText( "0", 470, 22, "Helvetica-Bold", 52 )
scoreText:setTextColor( 255, 255, 255, 255 )	--> white
scoreText.text = score
scoreText.xScale = 0.5; scoreText.yScale = 0.5	--> for clear retina display text
scoreText.x = (480 - (scoreText.contentWidth * 0.5)) - 15
scoreText.y = 20
localGroup:insert( scoreText )

local setScore = function( scoreNum )
	local newScore = scoreNum
	scoreText.text = newScore
end



local function newCrate()	
	rand = math.random( 100 )

	if (rand < 20) then
		j = display.newImage("ball.png");
		j.x = 60 + math.random( 360 )
		j.y = -100
		physics.addBody( j, { density=0.9, friction=0.3, bounce=0.3, radius=27} )
		j.myName = "ball"
		
	elseif (rand < 30) then
		j = display.newImage("ball_black.png");
		j.x = 60 + math.random( 360 )
		j.y = -100
		physics.addBody( j, { density=1.4, friction=0.3, bounce=0.2, radius=18} )
		j.myName = "ballblack"
		
	elseif (rand < 40) then
		j = display.newImage("ball_blue.png");
		j.x = 60 + math.random( 360 )
		j.y = -100
		physics.addBody( j, { density=1.4, friction=0.3, bounce=0.2, radius=18} )
		j.myName = "ballblue"
		
	elseif (rand < 50) then
		j = display.newImage("ball_green.png");
		j.x = 60 + math.random( 360 )
		j.y = -100
		physics.addBody( j, { density=1.4, friction=0.3, bounce=0.2, radius=18} )
		j.myName = "ballgreen"
		
		
	elseif (rand < 60) then
		j = display.newImage("ball_pink.png");
		j.x = 60 + math.random( 360 )
		j.y = -100
		physics.addBody( j, { density=1.4, friction=0.3, bounce=0.2, radius=18} )
		j.myName = "ballpink"
		
	elseif (rand < 70) then
		j = display.newImage("ball_purple.png");
		j.x = 60 + math.random( 360 )
		j.y = -100
		physics.addBody( j, { density=1.4, friction=0.3, bounce=0.2, radius=18} )
		j.myName = "ballpurple"

		
	elseif (rand < 90) then
		j = display.newImage("ball_white.png");
		j.x = 60 + math.random( 360 )
		j.y = -100
		physics.addBody( j, { density=1.4, friction=0.3, bounce=0.2, radius=18} )
		j.myName = "ballwhite"
			
	else
		j = display.newImage("ball_yellow.png");
		j.x = 60 + math.random( 360 )
		j.y = -100
		physics.addBody( j, { density=0.3, friction=0.2, bounce=0.5, radius=18} )
		j.myName = "ballyellow"
		
	end	
localGroup:insert(j)
end

-- Function for dragging Physics objects

local function startDrag( event )
        local t = event.target

        local phase = event.phase
        if "began" == phase then
                -- Make target the top-most object
                local parent = t.parent
                parent:insert( t )
                display.getCurrentStage():setFocus( t, event.id )
 
                -- Spurious events can be sent to the target, e.g. the user presses 
                -- elsewhere on the screen and then moves the finger over the target.
                -- To prevent this, we add this flag. Only when it's true will "move"
                -- events be sent to the target.
                t.isFocus = true
 
                -- Store initial position
                t.x0 = event.x - t.x
                t.y0 = event.y - t.y
        elseif t.isFocus then
                if "moved" == phase then
                        -- Make object move (we subtract t.x0,t.y0 so that moves are
                        -- relative to initial grab point, rather than object "snapping").
                        t.x = event.x - t.x0
                        t.y = event.y - t.y0
                elseif "ended" == phase or "cancelled" == phase then
                        display.getCurrentStage():setFocus( t, nil )
                        t.isFocus = false
                end
        end
 
        -- Important to return true. This tells the system that the event
        -- should not be propagated to listeners of any objects underneath.
        return true
end


local function onCollision( event )
if ( event.phase == "ended" ) then
				
				if (event.object1.myName =="Hat" and event.object2.myName =="ballpink") then
					score = score + 50
					event.object2:removeSelf()
					media.playEventSound( "boing_caf.caf" )
		end	
				if (event.object1.myName =="Hat" and event.object2.myName =="ballpurple") then
					score = score + 75
					event.object2:removeSelf()
					media.playEventSound( "boing_caf.caf" )
		end	
				if (event.object1.myName =="Hat" and event.object2.myName =="ballblue") then
					score = score + 100
					event.object2:removeSelf()
					media.playEventSound( "boing_caf.caf" )
		end                
				if (event.object1.myName =="Hat" and event.object2.myName =="ballgreen") then
					score = score + 25
					event.object2:removeSelf()
					media.playEventSound( "boing_caf.caf" )
		end

				if (event.object1.myName =="Hat" and event.object2.myName =="ballyellow") then
					score = score + 20	
					event.object2:removeSelf()
					media.playEventSound( "boing_caf.caf" )
		end	
				if (event.object1.myName =="Hat" and event.object2.myName =="ballwhite") then
					score = score + 50
					event.object2:removeSelf()
					media.playEventSound( "boing_caf.caf" )
		end
				if (event.object1.myName =="Hat" and event.object2.myName =="ball") then
					score = score - 50
					event.object2:removeSelf()
					media.playEventSound( "squish_caf.caf" )
		end
				if (event.object1.myName =="Hat" and event.object2.myName =="ballblack") then
					score = score - 25
					event.object2:removeSelf()
					media.playEventSound( "squish_caf.caf" )
		end	
        end
		setScore(score)
end

local callGameOver = function( iscore )

local iscore =iscore
local isWin ="no"

physics.pause()
if iscore > 800 then
isWin ="yes"
audio.play( youWinSound )

else
isWin ="no"
audio.play( youLoseSound )
end
	
	-- SHADE
	local shadeRect = display.newRect( 0, 0, 480, 320 )
	shadeRect:setFillColor( 0, 0, 0, 255 )
	shadeRect.alpha = 0
	
	-- GAME OVER WINDOW
	local gameOverDisplay
	
	if isWin == "yes" then
		gameOverDisplay = display.newImageRect( "youwin.png", 390, 154 )		
	else
		gameOverDisplay = display.newImageRect( "youlose.png", 390, 154 )
	end
	
	gameOverDisplay.x = 240; gameOverDisplay.y = 165
	gameOverDisplay.alpha = 0
	
	-- MENU BUTTON
	local onMenuTouch = function( event )

		if event.phase == "press" then
			audio.play( tapSound )
			director:changeScene( "screen2" )
		end
	end
	
	local menuBtn = ui.newButton{
		defaultSrc = "menubtn.png",
		defaultX = 60,
		defaultY = 60,
		overSrc = "menubtn-over.png",
		overX = 60,
		overY = 60,
		onEvent = onMenuTouch,
		id = "MenuButton",
		text = "",
		font = "Helvetica",
		textColor = { 255, 255, 255, 255 },
		size = 16,
		emboss = false
	}
	
	if isWin == "yes" then
		menuBtn.x = 227
	else
		menuBtn.x = 266
	end
	
	menuBtn.y = 186
	menuBtn.alpha = 0
	
	-- RESTART BUTTON
	local onRestartTouch = function( event )
	
		if event.phase == "press" then
			audio.play( tapSound )
			director:changeScene("loadlevel3")
		end
	end
	
	local restartBtn = ui.newButton{
		defaultSrc = "restartbtn.png",
		defaultX = 60,
		defaultY = 60,
		overSrc = "restartbtn-over.png",
		overX = 60,
		overY = 60,
		onEvent = onRestartTouch,
		id = "RestartButton",
		text = "",
		font = "Helvetica",
		textColor = { 255, 255, 255, 255 },
		size = 16,
		emboss = false
	}
	
	restartBtn.x = menuBtn.x + 72; restartBtn.y = 186
	restartBtn.alpha = 0
	

	
	-- NEXT BUTTON
	local onNextTouch = function( event )
		if event.phase == "press" then
			audio.play( tapSound )
			director:changeScene("loadlevel4")
		end
	end
	
	local nextBtn = ui.newButton{
		defaultSrc = "nextlevelbtn.png",
		defaultX = 60,
		defaultY = 60,
		overSrc = "nextlevelbtn-over.png",
		overX = 60,
		overY = 60,
		onEvent = onNextTouch,
		id = "NextButton",
		text = "",
		font = "Helvetica",
		textColor = { 255, 255, 255, 255 },
		size = 16,
		emboss = false
	}
	
	nextBtn.x = restartBtn.x + 72; nextBtn.y = 186
	nextBtn.alpha = 0
	if isWin ~= "yes" then nextBtn.isVisible = false; end

	-- INSERT ALL ITEMS INTO GROUP
	localGroup:insert( shadeRect )
	localGroup:insert( gameOverDisplay )
	localGroup:insert( menuBtn )
	localGroup:insert( restartBtn )
	if isWin == "yes" then localGroup:insert( nextBtn ); end
	
	-- FADE IN ALL GAME OVER ELEMENTS
	transition.to( shadeRect, { time=200, alpha=0.65 } )
	transition.to( gameOverDisplay, { time=500, alpha=1 } )
	transition.to( menuBtn, { time=500, alpha=1 } )
	transition.to( restartBtn, { time=500, alpha=1 } )
	if isWin == "yes" then transition.to( nextBtn, { time=500, alpha=1 } ); end

	end

	-- Move this one to the bottom.
	
local dropCrates = timer.performWithDelay( 400, newCrate, 40 )
local popup = timer.performWithDelay( 20000, function() callGameOver( score ); end, 1 )


	basket:addEventListener( "touch", startDrag )
	Runtime:addEventListener( "collision", onCollision )

unloadMe = function()
	physics.stop()
	basket:removeEventListener( "touch", startDrag )
	Runtime:removeEventListener( "collision", onCollision )
end

return localGroup
end






 



