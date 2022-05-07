--- EventManager for erectus mods.
-- You can bind to the events here and react to them.
-- @author SirLich

-- Event manager
local eventManager = {
	events = {}
}

--- Calls the event with the given name and passes the given arguments.
function eventManager:call(event, ...)
	mj:log("Calling event " .. event)

	if self.events[event] then
		for i, f in pairs(self.events[event]) do
			mj:log("Calling event " .. event .. " with " .. #{...})
			f(...)
		end
	end
end

--- Binds a function to the event with the given name.
function eventManager:bind(event, callback)
	-- Ensure the event is in the table
	if not self.events[event] then
		self.events[event] = {}
	end

	-- Add binding into the event table
	table.insert(self.events[event], callback)
	mj:log("Bound event " .. event .. " to callback " .. tostring(callback))
end


return eventManager
