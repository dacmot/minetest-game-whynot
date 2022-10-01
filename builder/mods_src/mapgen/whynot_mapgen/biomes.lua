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
-- This file contains modifications to the biomes for the whynot map/world generation
--

local function copy_biome(def, variant_suffix)
    local old_name = def.name
    local def = table.copy(def or minetest.registered_biomes[old_name])
    def.name = old_name.."_"..variant_suffix

    for name, decor in pairs(minetest.registered_decorations) do
        for _, biome in pairs(decor.biomes) do
            if (biome == old_name) then
                table.insert(decor.biomes, def.name)
                break
            end
        end
    end

    return def
end


dofile(minetest.get_modpath("whynot_utils").."/init.lua")


local mountaintops_altitude = tonumber(whynot.get_setting("whynot_mapgen.mountaintops_altitude")) or -9999
local hills_to_mountain_vertical_blend = tonumber(whynot.get_setting("whynot_mapgen.hills_to_mountain_vertical_blend")) or 10
local top_layer_thickness = tonumber(whynot.get_setting("whynot_mapgen.top_layer_thickness")) or 1
local filler_layer_thickness = tonumber(whynot.get_setting("whynot_mapgen.filler_layer_thickness")) or 3
local ocean_floor_thickness = tonumber(whynot.get_setting("whynot_mapgen.ocean_floor_thickness")) or 2
local riverbed_thickness = tonumber(whynot.get_setting("whynot_mapgen.riverbed_thickness")) or 2
local lower_atmosphere_biome_ymax = tonumber(whynot.get_setting("whynot_mapgen.lower_atmosphere_biome_ymax")) or 1000
local floatlands_biomes_ymax = tonumber(whynot.get_setting("whynot_mapgen.floatlands_biomes_ymax")) or 5000

minetest.log("info", "Modifying biomes for the why not game...")
for name, def in pairs(minetest.registered_biomes) do

    minetest.unregister_biome(name)

    -- Last layer before mountain tops
    if (def.y_max >= lower_atmosphere_biome_ymax) then

        if (name ~= "tundra_highland") then

            -- Ensure it has some vertical blend so it doesn't look like a bowl haircut
            def.vertical_blend = hills_to_mountain_vertical_blend
            def.y_max = mountaintops_altitude - 1

            -- Change the depth of materials before hitting the rock layer
            if (def.depth_top) then
                def.depth_top = math.max(def.depth_top, top_layer_thickness / 2)
            end
            if (def.depth_filler) then
                def.depth_filler = math.max(def.depth_filler, filler_layer_thickness / 2)
            end
            if (def.depth_riverbed) then
                def.depth_riverbed = math.max(def.depth_riverbed, riverbed_thickness / 2)
            end

        else
            -- Create mountain tops by re-purposing tundra_highland
            def.y_max = lower_atmosphere_biome_ymax - 1
            def.y_min = mountaintops_altitude
        end

    -- Ocean, surface and hills
    elseif (def.y_max < lower_atmosphere_biome_ymax) then

        -- Change the depth of materials before hitting the rock layer
        if (def.depth_top) then
            def.depth_top = top_layer_thickness
        end
        if (def.depth_filler) then
            def.depth_filler = filler_layer_thickness
        end
        if (def.depth_water_top or string.find(name, "ocean")) then
            def.depth_water_top = ocean_floor_thickness
        end
        if (def.depth_riverbed) then
            def.depth_riverbed = riverbed_thickness
        end

        -- Because of the highlands, tundra has an extra intermediate layer.
        -- Make sure its vertical settings match.
        if (name == "tundra") then
            def.vertical_blend = hills_to_mountain_vertical_blend
            def.y_max = mountaintops_altitude - 1
        end

    end

    -- Vary dungeons materials based on biome, or improve existing dungeon materials
    minetest.log("verbose", "whynot dungeons")
    if (def.node_dungeon == "default:desert_stone" or name == "desert_under") then
        minetest.log("verbose", "whynot dungeon: "..name)
        def.node_dungeon = "default:desert_stonebrick"
        def.node_dungeon_alt = "default:desert_cobble"
        def.node_dungeon_stair = "stairs:stair_desert_cobble"
    elseif (def.node_dungeon == "default:sandstonebrick") then
        minetest.log("verbose", "whynot dungeon: "..name)
        def.node_dungeon = "default:sandstonebrick"
        def.node_dungeon_alt = "mtg_plus:sandstone_cobble"
        def.node_dungeon_stair = "stairs:stair_sandstone_cobble"
    elseif (string.find(name, "rainforest")) then
        minetest.log("verbose", "whynot dungeon: "..name)
        def.node_dungeon = "mtg_plus:jungle_cobble"
        def.node_dungeon_alt = "default:mossycobble"
        def.node_dungeon_stair = "stairs:stair_jungle_cobble"
    elseif (string.find(name, "tundra") or string.find(name, "icesheet")) then
        minetest.log("verbose", "whynot dungeon: "..name)
        def.node_dungeon = "mtg_plus:hard_snow_brick"
        def.node_dungeon_alt = "mtg_plus:ice_snow_brick"
        def.node_dungeon_stair = "stairs:stair_snowblock"
    end

    minetest.register_biome(def)


    -- Keep only the "interesting" biomes in floatlands
    if (string.find("coniferous_forest deciduous_forest savanna rainforest taiga desert grassland", name)) then
        local floatlands_biome = copy_biome(def, "floatlands")
        floatlands_biome.y_max = floatlands_biomes_ymax - 1
        floatlands_biome.y_min = lower_atmosphere_biome_ymax

        minetest.register_biome(floatlands_biome)
    end

end
