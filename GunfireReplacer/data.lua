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
  
  for _, gun in pairs(data.raw.gun) do
    if gun.attack_parameters and gun.attack_parameters.sound then
      gun.attack_parameters.sound = { type = "sound", name = "replacement_gunfire" }
    end
  end
  