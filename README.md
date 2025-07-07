# ini-config-parser

An INI Config Parser made with Lua.

---

## Features

- Parses INI files into Lua tables
- Supports sections and key-value pairs
- Converts values to number or boolean if possible
- Can serialize Lua tables back to INI format
- Load from and save to files

---

## Usage

```lua
local ini = require("ini-config-parser")

local configStr = [[
; Sample config
[general]
username = user123
active = true
score = 42

[paths]
home = /home/user
]]

local config = ini.parse(configStr)

print(config.general.username)  -- Output: user123
print(config.general.active)    -- Output: true
print(config.general.score)     -- Output: 42

config.general.score = 100

local outStr = ini.stringify(config)
print(outStr)
````

---

## Installation

Just copy the `ini.lua` file into your project and require it.

---

## Support

Discord: rembelyy
GitHub: [https://github.com/rembelyy/ini-config-parser](https://github.com/rembelyy/ini-config-parser) - [Pull Request](https://github.com/rembelyy/ini-config-parser/pulls)
