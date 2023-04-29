local function replace_gunfire_sound(sound_path)
    local new_sound = {
      type = "sound",
      name = "GunfireReplacer_new",
      variations = {
        { filename = sound_path, volume = 0.5 }
      }
    }
    data:extend({new_sound})
  end
  
  local default_sound_path = "__NoGunfireSounds__/sound/quack.ogg"
  replace_gunfire_sound(default_sound_path)
  
  script.on_event(defines.events.on_runtime_mod_setting_changed, function(event)
    if event.setting == "custom_gunfire_sound_path" then
      local new_sound_path = settings.get_player_settings(event.player_index)["custom_gunfire_sound_path"].value
      if new_sound_path ~= default_sound_path then
        replace_gunfire_sound(new_sound_path)
      end
    end
  end)
  
  script.on_init(function()
    for _, player in pairs(game.players) do
      local custom_sound_path = settings.get_player_settings(player.index)["custom_gunfire_sound_path"].value
      if custom_sound_path ~= default_sound_path then
        replace_gunfire_sound(custom_sound_path)
      end
    end
  end)
  
  script.on_event(defines.events.on_player_joined_game, function(event)
    local custom_sound_path = settings.get_player_settings(event.player_index)["custom_gunfire_sound_path"].value
    if custom_sound_path ~= default_sound_path then
      replace_gunfire_sound(custom_sound_path)
    end
  end)
  
  for _, gun in pairs(data.raw.gun) do
    if gun.attack_parameters and gun.attack_parameters.sound then
      gun.attack_parameters.sound = { type = "sound", name = "GunfireReplacer_new" }
    end
  end
  