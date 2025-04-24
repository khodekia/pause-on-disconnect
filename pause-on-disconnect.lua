local default_sink = nil

function handleDeviceEvent(object, event)
  local props = object.properties
  local node_type = props["node.nick"]
  local active_port = props["device.active.port"]

  if default_sink and event == "change" and node_type == "Audio/Sink" then
    if active_port and string.match(active_port, "headphones") then
      -- Headphones connected: do nothing
    else
      -- Headphones disconnected: pause playback
      local client = session:get_client("org.freedesktop.portal.Desktop")
      local cmd = "playerctl pause"
      os.execute(cmd)
    end
  end
end

-- Monitor default audio sink changes
session:connect("object-added", function(_, object)
  if object.type == "Audio/Sink" then
    default_sink = object
    object:connect("event", handleDeviceEvent)
  end
end)
