whynot = minetest.global_exists("whynot") and whynot or {}

-- Add logs when accessing settings. Very useful for debugging.
function whynot.get_setting(name, default)
    local value = minetest.settings:get(name)
    if (not value) then
        minetest.log("info", "Setting '"..name.."' could not be found")
        value = default
    end
    value = value or ""
    minetest.log("verbose", "Setting '"..name.."' = "..value)
    return value
end