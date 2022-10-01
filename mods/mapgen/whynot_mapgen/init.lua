--------------------------------------------------------------------------------
--
-- Minetest -- Why Not? Game -- Map generation customisation
-- Copyright (C) 2022  Olivier Dragon
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- -- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.
--
--------------------------------------------------------------------------------

-- Mapgen minetest function should only execute once anyway
-- However this code is slow-ish, so we'll try to only run it when a new world is created
-- Takes 15ms on a fast computer (AMD Ryzen 5900X), but could take much longer on old computers, laptops, phones with android, etc.
local modmeta = minetest.get_mod_storage()
local server_load_count = modmeta:get_int("whynot_mapgen.completed")

if (server_load_count <= 0) then
    local modpath = minetest.get_modpath(minetest.get_current_modname())

    dofile(modpath.."/biomes.lua")
    --
    -- Ores and decorations must be modified after biomes. From lua_api.txt
    --     * Warning: Clearing and re-registering biomes alters the biome to biome ID
    --       correspondences, so any decorations or ores using the 'biomes' field must
    --       afterwards be cleared and re-registered.
    --
    dofile(modpath.."/ores.lua")
    dofile(modpath.."/decorations.lua")
end

server_load_count = server_load_count + 1
modmeta:set_int("whynot_mapgen.completed", server_load_count)
minetest.log("verbose", "Why not game server started "..server_load_count.." times.")


