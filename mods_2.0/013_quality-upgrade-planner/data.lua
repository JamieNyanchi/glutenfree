local item_sounds = require("__base__.prototypes.item_sounds")

local selection_tool = {
  type = "selection-tool",
  name = "quality-upgrade-planner",
  icons = {
    {icon = "__quality-upgrade-planner__/graphics/icons/quality-upgrade-planner.png"},
    {icon = "__base__/graphics/icons/quality-normal.png", scale = 0.2, shift = {-9.5, 9.5}},
  },
  flags = {"only-in-cursor", "not-stackable" , "spawnable"},
  subgroup = "tool",
  order = "c[automated-construction]-d[quality-upgrade-planner]",
  inventory_move_sound = item_sounds.planner_inventory_move,
  pick_sound = item_sounds.planner_inventory_pickup,
  drop_sound = item_sounds.planner_inventory_move,
  stack_size = 1,
  draw_label_for_cursor_render = true,
  skip_fog_of_war = true,
  select =
  {
    border_color = {71, 255, 73},
    mode = {"upgrade"},
    cursor_box_type = "not-allowed",
    started_sound = { filename = "__core__/sound/upgrade-select-start.ogg" },
    ended_sound = { filename = "__core__/sound/upgrade-select-end.ogg" }
  },
  alt_select =
  {
    border_color = {0, 0, 0, 0},
    mode = {"nothing"},
    cursor_box_type = "not-allowed",
  },
  reverse_select =
  {
    border_color = {0, 0, 0, 0},
    mode = {"nothing"},
    cursor_box_type = "not-allowed",
  },
  reverse_alt_select =
  {
    border_color = {0, 0, 0, 0},
    mode = {"nothing"},
    cursor_box_type = "not-allowed",
  },
  super_forced_select =
  {
    border_color = {0, 0, 0, 0},
    mode = {"nothing"},
    cursor_box_type = "not-allowed",
  },
  auto_recycle = false,
  hidden = true,
}

local shortcut = {
  type = "shortcut",
  name = "give-quality-upgrade-planner",
  order = "b[blueprints]-k[quality-upgrade-planner]",
  action = "lua",
  localised_name = {"shortcut.make-quality-upgrade-planner"},
--associated_control_input = "give-quality-upgrade-planner",
  technology_to_unlock = "construction-robotics",
  item_to_spawn = "quality-upgrade-planner",
  style = "green",
  icon = "__quality-upgrade-planner__/graphics/icons/shortcut-toolbar/mip/new-quality-upgrade-planner-x56.png",
  icon_size = 56,
  small_icon = "__quality-upgrade-planner__/graphics/icons/shortcut-toolbar/mip/new-quality-upgrade-planner-x24.png",
  small_icon_size = 24,
}

if mods["quality"] then
  shortcut.technology_to_unlock = "quality-module"
end

data:extend{selection_tool, shortcut}

local mod_prefix = "quality-upgrade-planner--"

data:extend({
  {
    type = "custom-input", key_sequence = "",
    name = mod_prefix .. "cycle-quality-up",
    linked_game_control = "cycle-quality-up",
  },
  {
    type = "custom-input", key_sequence = "",
    name = mod_prefix .. "cycle-quality-down",
    linked_game_control = "cycle-quality-down",
  }
})
