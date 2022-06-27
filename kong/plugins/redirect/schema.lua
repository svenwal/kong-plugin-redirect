local typedefs = require "kong.db.schema.typedefs"

-- Grab pluginname from module name
local plugin_name = ({...})[1]:match("^kong%.plugins%.([^%.]+)")

local schema = {
  name = plugin_name,
  fields = {
    { protocols = typedefs.protocols_http },
    { config = {
        type = "record",
        fields = {
          { location_url = {
              type = "string",
              default = "http://example.com",
              required = true,
              }},
          { forward_query_parameters = {
              type = "boolean",
              default = true,
              required = true,
              }},
          { status_code = {
              type = "integer",
              default = 307,
              required = true,
              gt = 0, }},
        },
        entity_checks = {
        },
      },
    },
  },
}

return schema
