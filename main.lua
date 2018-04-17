-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- created on kangmin
-- created by April 17
-----------------------------------------------------------------------------------------

local theBall = display.newImage( "./assets/sprites/soccerball.png", 400, 157)
theBall.x = display.contentCenterX
theBall.y = display.contentCenterY
theBall.id = "ball object"

function theBall:touch( event )
    if ( event.phase == "began" ) then
    	print( "Touch event began on: " .. self.id)

        -- set touch focus
        display.getCurrentStage():setFocus( self )
        self.isFocus = true

    elseif ( self.isFocus ) then
    	if ( event.phase == "moved") then
    		print( "Moved phase of touch event detected.")

        elseif ( event.phase == "ended" or event.phase == "cancelled") then

        -- Reset touch focus
        display.getCurrentStage():setFocus( nil )
        self.isFocus = nil
        print( "Touch event ended on:" .. self.id)
        
        end

    end

    return true
end

theBall:addEventListener( "touch", theBall)