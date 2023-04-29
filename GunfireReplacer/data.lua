local default_sound_path = "__GunfireReplacer__/sound/quack.ogg"
local default_sound_volume = 0.5

local new_sound = {
    type = "sound",
    name = "replacement_gunfire",
    filename = default_sound_path,
    volume = default_sound_volume
}

data:extend({new_sound})

for _, gun in pairs(data.raw.gun) do
    if gun.attack_parameters and gun.attack_parameters.sound then
        gun.attack_parameters.sound.filename = default_sound_path
        gun.attack_parameters.sound.volume = default_sound_volume
    end
end
