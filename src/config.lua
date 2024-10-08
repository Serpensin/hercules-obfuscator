-- config.lua

local config = {}

config.settings = {
    output_suffix = "_obfuscated.lua",
    final_print = false,
    compressor = {
        enabled = true,
    },
    control_flow = {
        enabled = true,
        max_fake_blocks = 6,
    },
    caesar_cipher = {
        enabled = true,
    },
    variable_renaming = {
        enabled = false,
        min_name_length = 8,
        max_name_length = 16,
    },
    garbage_code = {
        enabled = true,
        garbage_blocks = 4,
    },
    opaque_predicates = {
        enabled = true,
    },
    function_inlining = {
        enabled = false, -- off because bugged
    },
    dynamic_code = {
        enabled = false, -- off because bugged
    },
    bytecode_encoding = {
        enabled = true,
    }
}

function config.get(key)
    local keys = {}
    for k in key:gmatch("[^.]+") do table.insert(keys, k) end

    local value = config
    for _, k in ipairs(keys) do
        value = value[k]
        if value == nil then
            return nil
        end
    end
    return value
end

return config
