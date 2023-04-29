local function update_gunfire_sound(sound_path, sound_volume)
    for _, gun in pairs(game.forces.player.recipes) do
        if gun.attack_parameters and gun.attack_parameters.sound then
            gun.attack_parameters.sound.filename = sound_path
            gun.attack_parameters.sound.volume = sound_volume
        end
    end
end

script.on_event(defines.events.on_runtime_mod_setting_changed, function(event)
    if event.setting == "custom_gunfire_sound_path" or event.setting == "gunfire_sound_volume" then
        local new_sound_path = settings.global["custom_gunfire_sound_path"].value
        local sound_volume = settings.global["gunfire_sound_volume"].value
        update_gunfire_sound(new_sound_path, sound_volume)
    end
end)
