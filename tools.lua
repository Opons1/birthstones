-- START OF FUNCTIONS
-- (START OF INIT IS FURTHER DOWN)

local function create_tools_for_material(material, display_name, uses_vs_env, time1, time2, time3, maxlev)
	minetest.register_tool("birthstones:pick_" .. string.lower(material), {
		description = display_name .. " Pickaxe",
		inventory_image = "birthstones_tool_" .. string.lower(material) .. "pick.png",
		tool_capabilities = {
			max_drop_level=0,
			groupcaps={
				cracky={times={[1]=time1, [2]=time2, [3]=time3}, uses=uses_vs_env, maxlevel=maxlev}
			}
		},
	})
	minetest.register_craft({
		output = "birthstones:pick_" .. string.lower(material),
		recipe = {
			{'birthstones:' .. string.lower(material), 'birthstones:' .. string.lower(material), 'birthstones:' .. string.lower(material)},
			{'', 'default:stick', ''},
			{'', 'default:stick', ''}
		}
	})
	minetest.register_tool("birthstones:axe_" .. string.lower(material), {
		description = display_name .. " Axe",
		inventory_image = "birthstones_tool_" .. string.lower(material) .. "axe.png",
		tool_capabilities = {
			max_drop_level=1,
			groupcaps={
				choppy={times={[1]=time1/2.0, [2]=time2/2.0, [3]=time3/2.0}, uses=uses_vs_env, maxlevel=maxlev},
				fleshy={times={[2]=time2, [3]=time3}, uses=uses_vs_env/3*4, maxlevel=maxlev}
			}
		},
	})
	minetest.register_craft({
		output = "birthstones:axe_" .. string.lower(material),
		recipe = {
			{'birthstones:' .. string.lower(material), 'birthstones:' .. string.lower(material)},
			{'birthstones:' .. string.lower(material), 'default:stick'},
			{'', 'default:stick'}
		}
	})
	minetest.register_tool("birthstones:shovel_" .. string.lower(material), {
		description = display_name .. " Shovel",
		inventory_image = "birthstones_tool_" .. string.lower(material) .. "shovel.png",
		wield_image = "birthstones_tool_" .. string.lower(material) .. "shovel.png^[transformR90",
		tool_capabilities = {
			full_punch_interval = 1.0,
			max_drop_level=1,
			groupcaps={
				crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=uses_vs_env, maxlevel=3},
			},
			damage_groups = {fleshy=4},
		},
		sound = {breaks = "default_tool_breaks"},
	})
	minetest.register_craft({
		output = "birthstones:shovel_" .. string.lower(material),
		recipe = {
			{'', 'birthstones:' .. string.lower(material)},
			{'', 'default:stick'},
			{'', 'default:stick'}
		}
	})
	minetest.register_tool("birthstones:sword_" .. string.lower(material), {
		description = display_name .. " Sword",
		inventory_image = "birthstones_tool_" .. string.lower(material) .. "sword.png",
		tool_capabilities = {
			full_punch_interval = 0.7,
			max_drop_level=1,
			groupcaps={
				snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=uses_vs_env/3*4, maxlevel=3},
			},
			damage_groups = {fleshy=8},
		},
		sound = {breaks = "default_tool_breaks"},
	})
	minetest.register_craft({
		output = "birthstones:sword_" .. string.lower(material),
		recipe = {
			{'', 'birthstones:' .. string.lower(material)},
			{'', 'birthstones:' .. string.lower(material)},
			{'', 'default:stick'}
		}
	})
	if minetest.get_modpath("farming") then
		farming.register_hoe("birthstones:hoe_" .. material, { -- formerly ":farming:hoe_" .. material
			description = display_name .. " Hoe",
			inventory_image = "birthstones_tool_" .. material .. "hoe.png",
			max_uses = uses_vs_env*3,
			material = "birthstones:" .. material
		})
	end
	if minetest.get_modpath("toolranks") then
		toolranks.add_tool("birthstones:pick_" .. string.lower(material))
		toolranks.add_tool("birthstones:axe_" .. string.lower(material))
		toolranks.add_tool("birthstones:shovel_" .. string.lower(material))
		toolranks.add_tool("birthstones:sword_" .. string.lower(material))
	end
end

-- END OF FUNCTIONS

-- START OF INIT

-- default:diamond:
-- 		sword uses=40
-- 		pick uses=30
-- default:stone:
-- 		sword uses=20
-- 		pick uses=20
--                 material, display_name, uses_vs_env, time1, time2, time3, maxlev
--uses_vs_env: normal use (bonus is added for fleshy target)
create_tools_for_material("alexandrite", "Alexandrite", 17, 3.2, 1.40, 0.90, 1)
create_tools_for_material("amethyst", "Amethyst", 17, 3.2, 1.40, 0.90, 1)
create_tools_for_material("aquamarine", "Aquamarine", 15, 3.2, 1.40, 0.90, 1)
create_tools_for_material("diamond", "White Diamond", 30, 4.5, 1.8, 1.3, 3)
create_tools_for_material("emerald", "Emerald", 27, 4.2, 1.6, 1.2, 2)
create_tools_for_material("garnet", "Garnet", 22, 4.0, 1.5, 1.0, 1)
create_tools_for_material("opal", "Opal", 19, 3.5, 1.6, 1.5, 2)
create_tools_for_material("peridot", "Peridot", 24, 4.0, 1.5, 1.0, 1)
create_tools_for_material("ruby", "Ruby", 27, 4.2, 1.6, 1.2, 2)
create_tools_for_material("sapphire", "Sapphire", 27, 4.2, 1.6, 1.2, 1)
create_tools_for_material("topaz", "Topaz", 25, 4.1, 1.6, 1.05, 1)
create_tools_for_material("zircon", "Zircon", 30, 4.1, 1.6, 1.05, 1)
