if not minetest.get_modpath("player_api") then
	minetest.log(
		"action",
		"[homedecor_wardrobe]: minetest game not detected, disabling as this mod is minetest game only at this time"
	)
	return
end

local S = minetest.get_translator("homedecor_wardrobe")
local modpath = minetest.get_modpath("homedecor_wardrobe")

local wd_cbox = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 1.5, 0.5}}

-- cache set_textures function (fallback to old version)
-- default.player_set_textures is deprecated and will be removed in future
local set_player_textures =
	minetest.get_modpath("player_api") and player_api.set_textures
	or default.player_set_textures

local armor_mod_path = minetest.get_modpath("3d_armor")

local skinslist = {"male1", "male2", "male3", "male4", "male5"}
local default_skin = "character.png"
local skinsdb_mod_path = minetest.get_modpath("skinsdb")

if skinsdb_mod_path then

	for _, shrt in ipairs(skinslist) do

		for _, prefix in ipairs({"", "fe"}) do

			local skin_name = prefix..shrt
			local skin_obj = skins.new("homedecor_clothes_"..skin_name..".png")

			skin_obj:set_preview("homedecor_clothes_"..skin_name.."_preview.png")
			skin_obj:set_texture("homedecor_clothes_"..skin_name..".png")
			if skin_obj.set_hand_from_texture then
				skin_obj:set_hand_from_texture()
			end
			skin_obj:set_meta("name", S("Wardrobe").." "..skin_name)
			skin_obj:set_meta("author", 'Calinou and Jordach')
			skin_obj:set_meta("license", 'CC-by-SA-4.0')

			local file = io.open(modpath ..
				"/textures/homedecor_clothes_" .. skin_name .. ".png", "r")

			skin_obj:set_meta("format", skins.get_skin_format(file))

			file:close()

			skin_obj:set_meta("in_inventory_list", false)
		end
	end
end


local function set_player_skin(player, skin, save)

	if skinsdb_mod_path then

		skins.set_player_skin(player, skin or skins.default)

	elseif armor_mod_path then -- if 3D_armor's installed, let it set the skin

		armor.textures[player:get_player_name()].skin = skin or default_skin
		armor:update_player_visuals(player)
	else
		set_player_textures(player, { skin or default_skin})
	end

	if save and not skinsdb_mod_path then

		if skin == default_skin then
			player:get_meta():set_string("homedecor:player_skin", "")
		else
			player:get_meta():set_string("homedecor:player_skin", skin)
		end
	end
end

local def = {

	description = S("Wardrobe"),
	drawtype = "mesh",
	mesh = "homedecor_bedroom_wardrobe.obj",
	tiles = {
		{name = "homedecor_generic_wood_plain.png", color = 0xffa76820},
		"homedecor_wardrobe_drawers.png",
		"homedecor_wardrobe_doors.png"
	},
	inventory_image = "homedecor_wardrobe_inv.png",

	paramtype = "light",
	paramtype2 = "facedir",

	groups = {snappy = 3, axey=5},
	is_ground_content = false,
	_mcl_hardness=1.6,
	selection_box = wd_cbox,
	collision_box = wd_cbox,
	sounds = default.node_sound_wood_defaults(),

	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple or nil,

	on_place = function(itemstack, placer, pointed_thing)

		return homedecor.stack_vertically(itemstack, placer, pointed_thing,
				itemstack:get_name(), "placeholder")
	end,

	can_dig = function(pos,player)

		local meta = minetest.get_meta(pos)

		return meta:get_inventory():is_empty("main")
	end,

	on_construct = function(pos)

		local meta = minetest.get_meta(pos)

		meta:set_string("infotext", S("Wardrobe"))

		meta:get_inventory():set_size("main", 10)

		-- textures made by the Minetest community (mostly Calinou and Jordach)
		local clothes_strings = ""

		for i = 1, 5 do

			clothes_strings = clothes_strings ..
				"image_button_exit[" .. (i-1) ..
				".5,0;1.1,2;homedecor_clothes_" .. skinslist[i] ..
				"_preview.png;" .. skinslist[i] .. ";]" ..
				"image_button_exit[" .. (i-1) ..
				".5,2;1.1,2;homedecor_clothes_fe" .. skinslist[i] ..
				"_preview.png;fe" .. skinslist[i] .. ";]"
		end

		meta:set_string("formspec",  "size[5.5,8.5]" ..
			default.gui_bg .. default.gui_bg_img .. default.gui_slots ..
			"vertlabel[0,0.5;" .. minetest.formspec_escape(S("Clothes")) .. "]" ..
			"button_exit[0,3.29;0.6,0.6;default;x]" ..
			clothes_strings ..
			"vertlabel[0,5.2;" .. minetest.formspec_escape(S("Storage")) .. "]" ..
			"list[current_name;main;0.5,4.5;5,2;]" ..
			"list[current_player;main;0.5,6.8;5,2;]" ..
			"listring[]"
		)
	end,

	on_receive_fields = function(pos, formname, fields, sender)

		if fields.default then

			set_player_skin(sender, nil, "player")

			return
		end

		for i = 1, 5 do

			if fields[skinslist[i]] then

				set_player_skin(sender,
					"homedecor_clothes_" .. skinslist[i] .. ".png", "player")
				break

			elseif fields["fe" .. skinslist[i]] then

				set_player_skin(sender,
					"homedecor_clothes_fe" .. skinslist[i] .. ".png", "player")
				break
			end
		end
	end
}

-- register the actual minetest node
minetest.register_node(":homedecor:wardrobe", def)

minetest.register_alias("homedecor:wardrobe_bottom", "homedecor:wardrobe")
minetest.register_alias("homedecor:wardrobe_top", "air")

if not skinsdb_mod_path then -- If not managed by skinsdb

	minetest.register_on_joinplayer(function(player)

		local skin = player:get_meta():get("homedecor:player_skin")

		if skin and skin ~= "" then

			-- setting player skin on connect has no effect, so delay skin change
			minetest.after(1, function(player1, skin1)
				set_player_skin(player1, skin1)
			end, player, skin)
		end
	end)
end

minetest.register_craft( {
	output = "homedecor:wardrobe",
	recipe = {
		{ "homedecor:drawer_small", "homedecor:kitchen_cabinet_colorable" },
		{ "homedecor:drawer_small", "group:wood" },
		{ "homedecor:drawer_small", "group:wood" }
	},
})
