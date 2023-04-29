data:extend({
    {
        type = "string-setting",
        name = "custom_gunfire_sound_path",
        setting_type = "runtime-global",
        default_value = "__GunfireReplacer__/sound/quack.ogg",
        allow_blank = false,
        order = "a"
    },
    {
        type = "double-setting",
        name = "gunfire_sound_volume",
        setting_type = "runtime-global",
        default_value = 0.5,
        minimum_value = 0,
        maximum_value = 1,
        order = "b"
    }
})
