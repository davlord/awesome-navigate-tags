local ascreen = require("awful.screen")
local tag = require("awful.tag")
local gmath = require("gears.math")

local navigate_tags = {}

function navigate_tags.navigator(filter)
    local navigator = {}

    function navigator.viewidx(i, screen)
	screen = screen or ascreen.focused()
	local tags = screen.tags
	local showntags = {}
	for _, t in ipairs(tags) do
	    if not tag.getproperty(t, "hide") and filter(t) then
		table.insert(showntags, t)
	    end
	end
	local sel = screen.selected_tag
	tag.viewnone(screen)
	for k, t in ipairs(showntags) do
	    if t == sel then
		showntags[gmath.cycle(#showntags, k + i)].selected = true
	    end
	end
	screen:emit_signal("tag::history::update")
    end

    function navigator.viewnext(screen)
	navigator.viewidx(1, screen)
    end

    function navigator.viewprev(screen)
	navigator.viewidx(-1, screen)
    end

    return navigator
end


return navigate_tags;
