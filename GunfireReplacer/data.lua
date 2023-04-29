local function replace_gunfire_sound(sound_path, sound_volume)
    local new_sound = {
      type = "sound",
      name = "replacement_gunfire",
      variations = {
        { filename = sound_path, volume = sound_volume }
      }
    }
    data:extend({new_sound})
  end
  
  local default_sound_path = "__GunfireReplacer__/sound/quack.ogg"
  local default_sound_volume = 0.5
  replace_gunfire_sound(default_sound_path, default_sound_volume)
  
  script.on_event(defines.events.on_runtime_mod_setting_changed, function(event)
    local player = game.get_player(event.player_index)
    if event.setting == "custom_gunfire_sound_path" then
      local new_sound_path = settings.get_player_settings(player)["custom_gunfire_sound_path"].value
      local sound_volume = settings.get_player_settings(player)["gunfire_sound_volume"].value
      if new_sound_path ~= default_sound_path then
        replace_gunfire_sound(new_sound_path, sound_volume)
      end
    elseif event.setting == "gunfire_sound_volume" then
      local sound_path = settings.get_player_settings(player)["custom_gunfire_sound_path"].value
      local new_sound_volume = settings.get_player_settings(player)["gunfire_sound_volume"].value
      replace_gunfire_sound(sound_path, new_sound_volume)
    end
  end)
  
  script.on_init(function()
    for _, player in pairs(game.players) do
      local custom_sound_path = settings.get_player_settings(player)["custom_gunfire_sound_path"].value
      local sound_volume = settings.get_player_settings(player)["gunfire_sound_volume"].value
      if custom_sound_path ~= default_sound_path then
        replace_gunfire_sound(custom_sound_path, sound_volume)
      end
    end
  end)
  
  script.on_event(defines.events.on_player_joined_game, function(event)
    local player = game.get_player(event.player_index)
    local custom_sound_path = settings.get_player_settings(player)["custom_gunfire_sound_path"].value
    local sound_volume = settings.get_player_settings(player)["gunfire_sound_volume"].value
    if custom_sound_path ~= default_sound_path then
      replace_gunfire_sound(custom_sound_path, sound_volume)
    end
  end)
  
  for _, gun in pairs(data.raw.gun) do
    if gun.attack_parameters and gun.attack_parameters.sound then
      gun.attack_parameters.sound = { type = "sound", name = "replacement_gunfire" }
    end
  end
  