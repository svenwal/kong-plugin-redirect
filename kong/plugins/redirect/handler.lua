-- If you're not sure your plugin is executing, uncomment the line below and restart Kong
-- then it will throw an error which indicates the plugin is being loaded at least.

--assert(ngx.get_phase() == "timer", "The world is coming to an end!")

---------------------------------------------------------------------------------------------
-- In the code below, just remove the opening brackets; `[[` to enable a specific handler
--
-- The handlers are based on the OpenResty handlers, see the OpenResty docs for details
-- on when exactly they are invoked and what limitations each handler has.
---------------------------------------------------------------------------------------------



local plugin = {
    PRIORITY = 1000, -- set the plugin priority, which determines plugin execution order
    VERSION = "0.1",
  }
  
  function plugin:access(plugin_conf)
    local location = plugin_conf.location_url
    if plugin_conf.forward_query_parameters then 
--  TODO make the below check to avoid adding empty ? to all urls
--      if not kong.request.get_raw_query() == nil then
        location = location .. "?" .. kong.request.get_raw_query()
--      end 
    end
    local headers = {
      Location = location
    }
    kong.response.exit(plugin_conf.status_code, '', headers)
  end
  
  
  return plugin
