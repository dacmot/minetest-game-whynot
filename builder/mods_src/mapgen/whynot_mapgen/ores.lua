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

--
-- This file contains modifications to the ores for the whynot map/world generation
--

dofile(minetest.get_modpath("whynot_utils").."/init.lua")

local function change_ore_def(ore, def)
    if (def.ore == "default:stone_with_"..ore) then
        if (0 > def.y_min and def.y_min > -31000) then
            local prev_ymax = def.y_max
            def.clust_scarcity = tonumber(whynot.get_setting("whynot_mapgen."..ore.."_ground_layer1_scarcity", def.clust_scarcity))
            def.y_max = tonumber(whynot.get_setting("whynot_mapgen."..ore.."_ground_layer1_ymax", def.y_max))
            def.y_min = tonumber(whynot.get_setting("whynot_mapgen."..ore.."_ground_layer1_ymin", def.y_min))
        end
        if (def.y_min <= -31000) then
            local prev_ymax = def.y_max
            def.clust_scarcity = tonumber(whynot.get_setting("whynot_mapgen."..ore.."_ground_layer2_scarcity", def.clust_scarcity))
            def.y_max = tonumber(whynot.get_setting("whynot_mapgen."..ore.."_ground_layer2_ymax", def.y_max))
            def.y_min = tonumber(whynot.get_setting("whynot_mapgen."..ore.."_ground_layer2_ymin", def.y_min))
        end
    end
end


local rores = table.copy(minetest.registered_ores)
minetest.clear_registered_ores()

for _, def in pairs(rores) do
    if (def and def.ore) then

        change_ore_def("tin", def)
        change_ore_def("copper", def)
        change_ore_def("iron", def)
        change_ore_def("mese", def)
        change_ore_def("diamond", def)

        minetest.register_ore(def)

    end
end

