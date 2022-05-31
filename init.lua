hs.grid.setGrid('6x6')
hs.grid.ui.textSize = 50
hs.window.animationDuration = 0
hs.grid.HINTS = {
    {"Q", "W", "E", "R", "T", "Y"},
    {"U", "I", "O", "P", "[", "]"},
    {"A", "S", "D", "F", "G", "H"},
    {"J", "K", "L", ";", "'", "Z"},
    {"N", "M", ",", ".", "/", "1"}
}

-- hs.hotkey.bind({"cmd",  "shift"}, "H", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()

--   f.x = max.x
--   f.y = max.y
--   f.w = max.w / 2
--   f.h = max.h
--   win:setFrame(f)
-- end)

-- hs.hotkey.bind({"cmd", "shift"}, "1", function()
--     local win = hs.window.focusedWindow()
--     local rect = hs.geometry(0,0,4,4)
--     hs.grid.set(win, rect)
-- end)

-- hs.hotkey.bind({"cmd", "shift"}, "2", function()
--     local win = hs.window.focusedWindow()
--     local rect = hs.geometry(2,0,4,4)
--     hs.grid.set(win, rect)
-- end)
--
hyper = {"shift", "alt"}
hyper2 = {"ctrl", "alt", "shift"}

hs.hotkey.bind(hyper, "L", function()
    local win = hs.window.focusedWindow()
    local rect = hs.geometry(3,0,3,6)
    hs.grid.set(win, rect)
end)

hs.hotkey.bind(hyper, "H", function()
    local win = hs.window.focusedWindow()
    local rect = hs.geometry(0,0,3,6)
    hs.grid.set(win, rect)
end)

hs.hotkey.bind(hyper2, "H", function() 
    hs.window.focusedWindow():moveOneScreenWest()
end)

hs.hotkey.bind(hyper2, "L", function()
    hs.window.focusedWindow():moveOneScreenEast()
end)

hs.hotkey.bind(hyper, "space", hs.grid.maximizeWindow)

hs.hotkey.bind(hyper, ".", hs.hints.windowHints)
hs.hotkey.bind(hyper, "G", hs.grid.show)

expose = hs.expose.new(nil)
expose_app = hs.expose.new(nil, {onlyActiveApplication = true})

hs.hotkey.bind(hyper, "E", function() expose:toggleShow() end)
hs.hotkey.bind(hyper, "A", function() expose_app:toggleShow() end)

caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    if state then
        caffeine:setTitle("☕️")
    else
        caffeine:setTitle("💤")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

setCaffeineDisplay(hs.caffeinate.toggle('displayIdle'))

hs.loadSpoon('EjectMenu')
spoon.EjectMenu:start()
spoon.EjectMenu:bindHotkeys({ejectAll = {hyper2, 'e'}})

--
-- Requires an API Access Token from Bit.ly
local BITLY_API_ACCESS_TOKEN = "e72c99ea3cd57861e530b5388de556297c49f736"

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "S", function()
	local board = hs.pasteboard.getContents()

	if board:match("^https?://") then
		local response = hs.http.asyncGet(
			"https://api-ssl.bitly.com/v3/shorten" ..
			"?access_token=" .. BITLY_API_ACCESS_TOKEN ..
			"&longUrl=" .. hs.http.encodeForQuery(board),
			{},
			function(status, response, headers)
				if status == 200 then
					local msg = hs.json.decode(response)

					hs.pasteboard.setContents(msg.data.url)
					hs.notify.new({title="Bitly URL Shorten: Success", informativeText=msg.data.url}):send()
				else
					hs.notify.new({title="Bitly URL Shorten: Failure", informativeText=response}):send()
				end
			end
		)
	else
		hs.notify.new({title="Bitly URL Shorten: Failure", informativeText="Expected: URL"}):send()
	end
end)
