--[[
    INI config parser.
    - Support-Discord: rembelyy
    - Project-Github: https://github.com/rembelyy/ini-config-parser
--]]

local function parseIni(path)
    local result = {}
    local section = result

    local file, err = io.open(path, "r")
    if not file then
        return nil, err
    end

    for line in file:lines() do
        line = line:match("^%s*(.-)%s*$")
        if line ~= "" and not line:match("^%s*[;#]") then
            local header = line:match("^%[(.-)%]$")
            if header then
                header = header:lower()
                result[header] = result[header] or {}
                section = result[header]
            else
                local key, value = line:match("^(.-)%s*=%s*(.*)$")
                if key and value then
                    key = key:lower()
                    value = value:match('^"(.-)"$') or value:match("^'(.-)'$") or value
                    section[key] = value
                end
            end
        end
    end

    file:close()
    return result
end

return {
    parse = parseIni
}
