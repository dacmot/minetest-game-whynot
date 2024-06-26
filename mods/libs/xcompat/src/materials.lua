local materials = {
    sand = "default:sand",
    sandstone = "default:sandstone",
    gravel = "default:gravel",
    copper_ingot = "default:copper_ingot",
    steel_ingot = "default:steel_ingot",
    gold_ingot = "default:gold_ingot",
    tin_ingot = "default:tin_ingot",
    copper_block = "default:copperblock",
    steel_block = "default:steelblock",
    gold_block = "default:goldblock",
    tin_block = "default:tinblock",
    axe_steel = "default:axe_steel",
    axe_diamond = "default:axe_diamond",
    axe_bronze = "default:axe_bronze",
    axe_stone = "default:axe_stone",
    axe_wood = "default:axe_wood",
    pick_steel = "default:pick_steel",
    mese = "default:mese",
    mese_crystal = "default:mese_crystal",
    mese_crystal_fragment = "default:mese_crystal_fragment",
    torch = "default:torch",
    diamond = "default:diamond",
    clay_lump = "default:clay_lump",
    water_bucket = "bucket:bucket_water",
    empty_bucket = "bucket:bucket_empty",
    dye_dark_grey = "dye:dark_grey",
    dye_black = "dye:black",
    dye_white = "dye:white",
    dye_green = "dye:green",
    dye_red = "dye:red",
    dye_yellow = "dye:yellow",
    dye_brown = "dye:brown",
    dye_blue = "dye:blue",
    dye_violet = "dye:violet",
    dye_grey = "dye:grey",
    dye_dark_green = "dye:dark_green",
    dye_orange = "dye:orange",
    dye_pink = "dye:pink",
    silicon = "mesecons_materials:silicon",
    string = "farming:string",
    paper = "default:paper",
    book = "default:book",
    iron_lump = "default:iron_lump",
    wool_grey = "wool:grey",
    wool_green = "wool:green",
    wool_dark_green = "wool:dark_green",
    wool_brown = "wool:brown",
    wool_black = "wool:black",
    wool_white = "wool:white",
    slab_stone = "stairs:slab_stone",
    slab_wood = "stairs:slab_wood",
    glass = "default:glass",
    glass_block = "default:glass",
    glass_bottle = "vessels:glass_bottle",
    coal_lump = "default:coal_lump",
    stone = "default:stone",
    desert_stone = "default:desert_stone",
    desert_sand = "default:desert_sand",
    chest = "default:chest",
    cobble = "default:cobble",
    brick = "default:brick",
    obsidian_glass = "default:obsidian_glass",
    water_source = "default:water_source",
    water_flowing = "default:water_flowing",
    dirt = "default:dirt",
    dirt_with_grass = "default:dirt_with_grass",
    apple_leaves = "default:leaves",
    jungle_leaves = "default:jungleleaves",
}

if minetest.get_modpath("moreores") then
    materials.silver_ingot = "moreores:silver_ingot"
end

if minetest.get_modpath("technic") then
	materials.lead_ingot = "technic:lead_ingot"
	materials.carbon_steel_ingot = "technic:carbon_steel_ingot"
	materials.stainless_steel_ingot = "technic:stainless_steel_ingot"
end

if minetest.get_modpath("aloz") then
	materials.aluminum_ingot = "aloz:aluminum_ingot"
end

if minetest.get_modpath("techage") then
	materials.aluminum_ingot = "techage:aluminum"
end

if minetest.get_modpath("mcl_core") then
    materials = {
        sand = "mcl_core:sand",
        sandstone = "mcl_core:sandstone",
        gravel = "mcl_core:gravel",
        copper_ingot = "mcl_copper:copper_ingot",
        steel_ingot = "mcl_core:iron_ingot",
        gold_ingot = "mcl_core:gold_ingot",
        tin_ingot = "mcl_core:iron_ingot",
        copper_block = "mcl_copper:copper_block",
        steel_block = "mcl_core:iron_block",
        gold_block = "mcl_core:gold_block",
        tin_block = "mcl_core:iron_block",
        axe_steel = "mcl_core:axe_steel",
        axe_diamond = "mcl_core:axe_diamond",
        axe_bronze = "mcl_core:axe_bronze",
        axe_stone = "mcl_core:axe_stone",
        axe_wood = "mcl_core:axe_wood",
        pick_steel = "mcl_core:pick_steel",
        mese = "mesecons_torch:redstoneblock",
        mese_crystal = "mesecons:redstone",
        mese_crystal_fragment = "mcl_core:iron_ingot",
        torch = "mcl_torches:torch",
        diamond = "mcl_core:diamond",
        clay_lump = "default:clay_lump",
        water_bucket = "mcl_buckets:bucket:bucket_water",
        empty_bucket = "mcl_buckets:bucket_empty",
        dye_dark_grey = "mcl_dyes:dark_grey",
        dye_black = "mcl_dyes:black",
        dye_white = "mcl_dyes:white",
        dye_green = "mcl_dyes:green",
        dye_red = "mcl_dyes:red",
        dye_yellow = "mcl_dyes:yellow",
        dye_brown = "mcl_dyes:brown",
        dye_blue = "mcl_dyes:blue",
        dye_violet = "mcl_dyes:violet",
        dye_grey = "mcl_dyes:grey",
        dye_dark_green = "mcl_dyes:dark_green",
        dye_orange = "mcl_dyes:orange",
        dye_pink = "mcl_dyes:pink",
        silicon = "mcl_core:iron_ingot",
        string = "mcl_mobitems:string",
        paper = "mcl_core:paper",
        book = "mcl_core:book",
        iron_lump = "mcl_core:stone_with_iron",
        wool_grey = "mcl_wool:grey",
        wool_green = "mcl_wool:green",
        wool_dark_green = "mcl_wool:dark_green",
        wool_brown = "mcl_wool:brown",
        wool_black = "mcl_wool:black",
        wool_white = "mcl_wool:white",
        slab_stone = "mcl_stairs:slab_stone",
        slab_wood = "mcl_stairs:slab_wood",
        glass = "mcl_core:glass",
        glass_block = "mcl_core:glass",
        glass_bottle = "mcl_core:glass_bottle",
        coal_lump = "mcl_core:coal",
        stone = "mcl_core:stone",
        desert_stone = "mcl_core:redsandstone",
        desert_sand = "mcl_core:sand",
        chest = "mcl_chests:chest",
        cobble = "mcl_core:cobble",
        brick = "mcl_core:brick",
        water_source = "mcl_core:water_source",
        water_flowing = "mcl_core:water_flowing",
        dirt = "mcl_core:dirt",
        dirt_with_grass = "mcl_core:dirt_with_grass",
        apple_leaves = "mcl_trees:leaves_oak",
        jungle_leaves = "mcl_trees:leaves_jungle",
    }
elseif minetest.get_modpath("fl_ores") and minetest.get_modpath("fl_stone") then
    materials = {
        sand = "fl_stone:sand",
        sandstone = "fl_stone:sandstone",
        gravel = "fl_topsoil:gravel",
        copper_ingot = "fl_ores:copper_ingot",
        steel_ingot = "fl_ores:iron_ingot",
        gold_ingot = "fl_ores:gold_ingot",
        tin_ingot = "fl_ores:tin_ingot",
        copper_block = "fl_ores:copper_block",
        steel_block = "fl_ores:iron_block",
        gold_block = "fl_ores:gold_block",
        tin_block = "fl_ores:tin_block",
        axe_steel = "fl_tools:steel_axe",
        axe_diamond = "fl_tools:diamond_axe",
        axe_bronze = "fl_tools:bronze_axe",
        axe_stone = "fl_tools:stone_axe",
        axe_wood = "fl_tools:wood_axe",
        pick_steel = "fl_tools:steel_pick",
        mese = "fl_ores:iron_ingot",
        mese_crystal = "fl_ores:iron_ingot",
        mese_crystal_fragment = "fl_ores:iron_ingot",
        torch = "fl_light_sources:torch",
        diamond = "fl_ores:diamond",
        clay_lump = "fl_bricks:clay_lump",
        water_bucket = "fl_bucket:bucket_water",
        empty_bucket = "fl_bucket:bucket",
        dye_dark_grey = "fl_dyes:dark_grey_dye",
        dye_black = "fl_dyes:black_dye",
        dye_white = "fl_dyes:white_dye",
        dye_green = "fl_dyes:green_dye",
        dye_red = "fl_dyes:red_dye",
        dye_yellow = "fl_dyes:yellow_dye",
        dye_brown = "fl_dyes:brown_dye",
        dye_blue = "fl_dyes:blue_dye",
        dye_violet = "fl_dyes:violet_dye",
        dye_grey = "fl_dyes:grey_dye",
        dye_dark_green = "fl_dyes:dark_green_dye",
        dye_orange = "fl_dyes:orange_dye",
        dye_pink = "fl_dyes:pink_dye",
        silver_ingot = "fl_ores:iron_ingot",
        silicon = "mesecons_materials:silicon",
        string = "fl_plantlife:oxeye_daisy",
        paper = "basic_materials:plastic_sheet",
        iron_lump = "fl_ores:iron_ore",
        wool_grey = "",
        wool_green = "",
        wool_dark_green = "",
        wool_brown = "",
        wool_black = "",
        wool_white = "",
        slab_stone = "fl_stone:stone_slab",
        slab_wood = "fl_trees:apple_plank_slab",
        glass = "fl_glass:framed_glass",
        glass_block = "fl_glass:framed_glass",
        glass_bottle = "fl_bottles:bottle",
        coal_lump = "fl_ores:coal_ore",
        stone = "fl_stone:stone",
        desert_stone = "fl_stone:desert_stone",
        desert_sand = "fl_stone:desert_sand",
        chest = "fl_storage:wood_chest",
        cobble = "fl_stone:stone_rubble",
        brick = "",
        water_source = "fl_liquids:water_source",
        water_flowing = "fl_liquids:water_flowing",
        dirt = "fl_stone:dirt",
        dirt_with_grass = "fl_topsoil:dirt_with_grass",
        apple_leaves = "fl_trees:apple_leaves",
        jungle_leaves = "fl_trees:jungletree_leaves",
    }
elseif minetest.get_modpath("hades_core") then
    materials = {
        sand = "hades_core:fertile_sand",
        sandstone = "hades_core:sandstone",
        gravel = "hades_core:gravel",
        copper_ingot = "hades_core:copper_ingot",
        steel_ingot = "hades_core:steel_ingot",
        gold_ingot = "hades_core:gold_ingot",
        tin_ingot = "hades_core:tin_ingot",
        silver_ingot = "--unknown--",
        copper_block = "hades_core:copperblock",
        steel_block = "hades_core:steelblock",
        gold_block = "hades_core:goldblock",
        tin_block = "hades_core:tinblock",
        axe_steel = "hades_core:axe_steel",
        axe_diamond = "hades_core:axe_diamond",
        axe_bronze = "hades_core:axe_bronze",
        axe_stone = "hades_core:axe_stone",
        axe_wood = "hades_core:axe_wood",
        pick_steel = "hades_core:pick_steel",
        mese = "hades_core:mese",
        mese_crystal = "hades_core:mese_crystal",
        mese_crystal_fragment = "hades_core:mese_crystal_fragment",
        torch = "hades_torches:torch",
        diamond = "hades_core:diamond",
        clay_lump = "hades_core:clay_lump",
        clay_brick = "hades_core:clay_brick",

        --[[
            Since hades doesnt have buckets or water for the user,
            using dirt from near water to pull the water out
        ]]
        water_bucket = "hades_core:dirt",
        empty_bucket = "hades_core:fertile_sand",
        dye_dark_grey = "dye:dark_grey",
        dye_black = "dye:black",
        dye_white = "dye:white",
        dye_green = "dye:green",
        dye_red = "dye:red",
        dye_yellow = "dye:yellow",
        dye_brown = "dye:brown",
        dye_blue = "dye:blue",
        dye_violet = "dye:violet",
        dye_grey = "dye:grey",
        dye_dark_green = "dye:dark_green",
        dye_orange = "dye:orange",
        dye_pink = "dye:pink",
        silicon = "hades_materials:silicon",
        string = "hades_farming:string",
        paper = "hades_core:paper",
        book = "hades_core:book",
        iron_lump = "hades_core:iron_lump",
        wool_grey = "wool:grey",
        wool_green = "wool:green",
        wool_dark_green = "wool:dark_green",
        wool_brown = "wool:brown",
        wool_black = "wool:black",
        wool_white = "wool:white",
        slab_stone = "stairs:slab_stone",
        slab_wood = "stairs:slab_wood",
        glass = "hades_core:glass",
        glass_block = "hades_core:glass",
        glass_bottle = "vessels:glass_bottle",
        obsidian_glass = "hades_core:obsidian_glass",
        coal_lump = "hades_core:coal_lump",
        stone = "hades_core:stone",
        desert_stone = "hades_core:stone_baked",
        desert_sand = "hades_core:volcanic_sand",
        chest = "hades_chests:chest";
        cobble = "hades_core:cobble",
        brick = "hades_core:brick",
        water_source = "hades_core:water_source",
        water_flowing = "hades_core:water_flowing",
        dirt = "hades_core:dirt",
        dirt_with_grass = "hades_core:dirt_with_grass",
        apple_leaves = "hades_trees:leaves",
        jungle_leaves = "hades_trees:jungle_leaves",
    }

    if minetest.get_modpath("hades_bucket") then
        materials["water_bucket"] = "hades_bucket:bucket_water"
        materials["empty_bucket"] = "hades_bucket:bucket_empty"
    end
    if minetest.get_modpath("hades_extraores") then
        materials["silver_ingot"] = "hades_extraores:silver_ingot"
        materials["aluminum_ingot"] = "hades_extraores:aluminum_ingot"
    end
    if minetest.get_modpath("hades_default") then
        materials.desert_sand = "hades_default:desert_sand"
    end
    if minetest.get_modpath("hades_technic") then
		materials.lead_ingot = "hades_technic:lead_ingot"
		materials.carbon_steel_ingot = "hades_technic:carbon_steel_ingot"
		materials.stainless_steel_ingot = "hades_technic:stainless_steel_ingot"
	end
end

return materials