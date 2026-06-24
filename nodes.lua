-- START RAW MATERIALS

local texture_style = minetest.setting_get("birthstones_texture_style") or "classic"
-- can also be "realistic" if all block textures are implemented

function file_exists(name)
	local f=io.open(name,"r")
	if f~=nil then
		io.close(f)
		return true
	else return false
	end
end

local function get_block_tiles(name)
	local this_texture_style = texture_style
	local path = nil
	if this_texture_style == "realistic" then
		-- if file_exists("birthstones_" .. name .. "_block_top.png") then
			path = { "birthstones_" .. name .. "_block_top.png", "birthstones_" .. name .. "_block_top.png", "birthstones_" .. name .. "_block_east.png", "birthstones_" .. name .. "_block_east.png", "birthstones_" .. name .. "_block_north.png", "birthstones_" .. name .. "_block_north.png" }
		-- else
		-- 	this_texture_style = "classic"
		-- end
	end
	-- intentionally don't use else since fallback to classic may have been performed above:
	if this_texture_style == "classic" then
		path = { "birthstones_" .. name .. "_block.png" }
	end
	return path
end

--like this since i wanted to modify drops to make it unsievable

local gems = {
	{ore = "alexandrite", desc = "Alexandrite"},
	{ore = "amethyst", desc = "Amethyst"},
	{ore = "aquamarine", desc = "Aquamarine"},
	{ore = "diamond", desc = "White Diamond"},
	{ore = "emerald", desc = "Emerald"},
	{ore = "garnet", desc = "Garnet"},
	{ore = "opal", desc = "Opal"},
	{ore = "peridot", desc = "Peridot"},
	{ore = "ruby", desc = "Ruby"},
	{ore = "sapphire", desc = "Sapphire"},
	{ore = "topaz", desc = "Topaz"},
	{ore = "zircon", desc = "Zircon"},
}

for _, gem in ipairs(gems) do
	minetest.register_node("birthstones:stone_with_" .. gem.ore, {
		description = "Stone with " .. gem.desc,
		tiles = {
			"default_stone.png^birthstones_mineral_" .. gem.ore .. ".png"
		},
		is_ground_content = true,
		groups = {cracky = 1},
		sounds = default.node_sound_stone_defaults(),

		drop = {
			max_items = 3,
			items = {
				{
					items = {"birthstones:" .. gem.ore},
				},
				{
					items = {"birthstones:" .. gem.ore},
					rarity = 2,
				},
				{
					items = {"birthstones:" .. gem.ore},
					rarity = 3,
				},
			},
		},
	})
end

-- END RAW MATERIALS


-- START BLOCKS


minetest.register_node( "birthstones:alexandriteblock", {
	description = "Alexandrite Block",
	tiles = get_block_tiles("alexandrite"),
	is_ground_content = true,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:amethystblock", {
	description = "Amethyst Block",
	tiles = get_block_tiles("amethyst"),
	is_ground_content = true,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:aquamarineblock", {
	description = "Aquamarine Block",
	tiles = get_block_tiles("aquamarine"),
	is_ground_content = true,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:diamondblock", {
	description = "White Diamond Block",
	tiles = get_block_tiles("diamond"),
	is_ground_content = true,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:emeraldblock", {
	description = "Emerald Block",
	tiles = get_block_tiles("emerald"),
	is_ground_content = true,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:garnetblock", {
	description = "Garnet Block",
	tiles = get_block_tiles("garnet"),
	is_ground_content = true,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:opalblock", {
	description = "Opal Block",
	tiles = get_block_tiles("opal"),
	is_ground_content = true,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:peridotblock", {
	description = "Peridot Block",
	tiles = get_block_tiles("peridot"),
	is_ground_content = true,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:rubyblock", {
	description = "Ruby Block",
	tiles = get_block_tiles("ruby"),
	is_ground_content = true,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:sapphireblock", {
	description = "Sapphire Block",
	tiles = get_block_tiles("sapphire"),
	is_ground_content = true,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})
-- tiles: +Y, -Y, +X, -X, +Z, -Z. In English: top, bottom, right, left, back, front.  - http://dev.minetest.net/minetest.register_node
minetest.register_node( "birthstones:topazblock", {
	description = "Topaz Block",
	tiles = get_block_tiles("topaz"),
	is_ground_content = true,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:zirconblock", {
	description = "Zircon Block",
	tiles = get_block_tiles("zircon"),
	is_ground_content = true,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})