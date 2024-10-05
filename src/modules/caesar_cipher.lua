local CaesarCipher = {}

-- Function to apply Caesar cipher with a given offset, supporting unprintable characters
local function caesar_cipher(data, offset)
    local result = {}
    for i = 1, #data do
        local byte = data:byte(i)
        -- Shift within the extended ASCII range (0-255)
        local new_byte = ((byte + offset) % 256)
        table.insert(result, string.char(new_byte))
    end
    return table.concat(result)
end

function CaesarCipher.process(code)
    -- Random offset between 0 and 255 for more variability
    local offset = math.random(0, 255)

    -- Encrypt the entire code with the wider range, including unprintable characters
    local encrypted_code = caesar_cipher(code, offset)

    -- Create the final code with decryption
    local final_code = string.format([[
        local function decrypt_code(code, offset)
            local result = {}
            for i = 1, #code do
                local byte = code:byte(i)
                -- Reverse the shifting within the extended ASCII range (0-255)
                local new_byte = ((byte - offset) %% 256)
                table.insert(result, string.char(new_byte))
            end
            return table.concat(result)
        end

        -- Decrypt and execute the encrypted code
        load(decrypt_code(%q, %d))()
    ]], encrypted_code, offset)

    return final_code
end

return CaesarCipher
