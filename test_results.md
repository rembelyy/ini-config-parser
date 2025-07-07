## Files

**main.lua:**
```lua
local ini = require("ini")
local config = ini.parse("settings.ini")

print("Var1:", config.hello.var1)
print("Var2:", config.hello.var2)
print("Example", config.hellos.example)
```

**ini.lua:**
```lua
--[[
    INI config parser.
    - Support-Discord: rembelyy
    - Project-Github: https://github.com/rembelyy/ini-config-parser
    - License: https://github.com/rembelyy/ini-config-parser/blob/main/LICENSE
    - Test results: https://github.com/rembelyy/ini-config-parser/blob/main/test_results.md
    - Tests: Passed
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
```

**settings.ini:**
```ini
[hello]
var1 = value
var2 = value2

[hellos]
example = abc123
```

## Results:
Var1:   value
Port:   value2
Token:  abc123

## Result
It's all fine in 0.0.1.
