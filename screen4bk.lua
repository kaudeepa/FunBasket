-------Deepak's Code ------------

module(..., package.seeall)

function new()
local localGroup = display.newGroup()

local ui = require( "ui" )
local physics = require( "physics" )
--local gameUI = require("gameUI")
--local dragBody = gameUI.dragBody

-- For Debugging
--physics.setGravity(0, 9.8)
--physics.setDrawMode("hybrid")



local scoreText
local score = 0

local boingSound = audio.loadSound("boing_wav.wav")
local knockSound = audio.loadSound("knock_wav.wav")
local squishSound = audio.loadSound("squish_wav.wav")

-- Physics and Multitouch Engine Started
physics.start()
system.activate("multitouch")
display.setStatusBar(display.HiddenStatusBar)



local sky = display.newImage( "background1.png" )
sky.x = 240; sky.y = 160
localGroup:insert(sky)
--print(localGroup.numChildren)

local ground = display.newImage( "ground1.png" )
ground.x = 240; ground.y = 300
localGroup:insert(ground)
--print(localGroup.numChildren)

-- Left and right walls.
local leftWall  = display.newRect(0, 0, 1, display.contentHeight)
local rightWall = display.newRect(display.contentWidth, 0, 1, display.contentHeight)

-- one magic hat
local basket = display.newImage( "Hat.png" )
basket.x = 160; basket.y = 265 ; basket.myName ="Hat"
squareShape = { -40,-25, 40,-25, 40,25, -40,25 }
physics.addBody( basket, "kinematic", { friction=0.1, shape=squareShape} )
localGroup:insert(basket)

-- add all to physics engine to make these real physical objects.
physics.addBody(leftWall, "static", {bounce = 0.1})
physics.addBody(rightWall, "static", {bounce = 0.1})

localGroup:insert(leftWall)
localGroup:insert(rightWall)

--print(localGroup.numChildren)

-- SCORE DISPLAY

scoreText = display.newText( "0", 470, 22, "Helvetica-Bold", 52 )
scoreText:setTextColor( 255, 255, 255, 255 )	--> white
scoreText.text = score
scoreText.xScale = 0.5; scoreText.yScale = 0.5	--> for clear retina display text
scoreText.x = (480 - (scoreText.contentWidth * 0.5)) - 15
scoreText.y = 20
localGroup:insert( scoreText )
--print(localGroup.numChildren)

local setScore = function( scoreNum )
	local newScore = scoreNum
	scoreText.text = newScore
end



local function newCrate()	
	rand = math.random( 100 )
local j
-- check it later
	if (rand < 10) then
		j = display.newImage("ball_yellow.png");
		j.x = 60 + math.random( 360 )
		j.y = -100
		physics.addBody( j, { density=0.9, friction=0.3, bounce=0.3, radius=18} )
		j.myName = "ballyellow"
			
	elseif (rand < 20) then
		j = display.newImage("ball_blue.png");
		j.x = 60 + math.random( 360 )
		j.y = -100
		physics.addBody( j, { density=1.4, friction=0.3, bounce=0.2, radius=18} )
		j.myName = "ballblue"
		
	elseif (rand < 40) then
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
		
	elseif (rand < 80) then
			j = display.newImage("ball_white.png");
			j.x = 60 + math.random( 360 )
			j.y = -100
			physics.addBody( j, { density=1.4, friction=0.3, bounce=0.2, radius=18} )
			j.myName = "ballwhite"
		
	else
		j = display.newImage("ball_purple.png");
		j.x = 60 + math.random( 360 )
		j.y = -100
		physics.addBody( j, { density=1.4, friction=0.3, bounce=0.2, radius=18} )
		j.myName = "ballpurple"
		

		
	end	
localGroup:insert(j)
--print(localGroup.numChildren)
end

local function startDrag( event )
        local t = event.target
        local phase = event.phase

        if "began" == phase then
                display.getCurrentStage():setFocus( t )
                t.isFocus = true
 
                -- Store initial position
                t.x0 = event.x - t.x
                t.y0 = event.y - t.y
                
                -- Stop current motion, if any
                event.target:setLinearVelocity( 0, 0 )
                event.target.angularVelocity = 0
 
        elseif t.isFocus then
                if "moved" == phase then
                        t.x = event.x - t.x0
                        t.y = event.y - t.y0
 
                elseif "ended" == phase or "cancelled" == phase then
                        display.getCurrentStage():setFocus( nil )
                        t.isFocus = false
                end
        end
 
        -- Stop further propagation of touch event!
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
		
        end
		setScore(score)
	--	print(localGroup.numChildren)
end

local callGameOver = function( iscore )
local iscore =iscore
local isWin ="no"
basket.isFocus =false
physics.pause()

if iscore > 500 then
isWin ="yes"
--audio.play( youWinSound )
else
isWin ="no"
--	audio.play( youLoseSound )
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
		if event.phase == "release" then
		--	audio.play( tapSound )
		--	print("Main screen call")
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
		if event.phase == "release" then
	--	print("i try to restart")
		--	audio.play( tapSound )
			director:changeScene("loadlevel1")
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
		if event.phase == "release" then
		--	audio.play( tapSound )
			director:changeScene("loadlevel2")
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
--	print(localGroup.numChildren)
	
	-- FADE IN ALL GAME OVER ELEMENTS
	transition.to( shadeRect, { time=200, alpha=0.65 } )
	transition.to( gameOverDisplay, { time=500, alpha=1 } )
	transition.to( menuBtn, { time=500, alpha=1 } )
	transition.to( restartBtn, { time=500, alpha=1 } )
	if isWin == "yes" then transition.to( nextBtn, { time=500, alpha=1 } ); end

	end

	-- Move this one to the bottom.
	local dropCrates = timer.performWithDelay( 550, newCrate, 40 )
	local popup = timer.performWithDelay( 25000, function() callGameOver( score ); end, 1 )
--print(localGroup.numChildren)

    basket:addEventListener( "touch", startDrag )
	Runtime:addEventListener( "collision", onCollision )

unloadMe = function()
	physics.stop()
	basket:removeEventListener( "touch", startDrag )
	Runtime:removeEventListener( "collision", onCollision )	
	if dropCrates then timer.cancel( dropCrates ); end
	if popup then timer.cancel( popup ); end

	
end

return localGroup
end






 



