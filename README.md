# ini-config-parser
An INI config parser written in pure Lua.

---

## Features

- Parses `.ini` files from disk
- Supports section headers: `[section]`
- Supports key-value pairs: `key = value`
- Ignores empty lines and comments (`;` or `#`)
- Quoted and unquoted values are handled
- All keys and section names are converted to lowercase
- Returns a structured Lua table
- No external dependencies

---

## Example

```ini
[general]
username = "rembelyy"
active = true

[paths]
home = /home/user
````

---

## Usage

```lua
local ini = require("ini")
local config = ini.parse("config.ini")

print(config.general.username)      --> rembelyy
print(config.paths.home)            --> /home/user
```

---

## File

File: `ini.lua`

Exports:

```lua
{
  parse = function(path) --> table or (nil, err)
}
```

---

## Tests

* All tests passed
* See: [test_results.md](https://github.com/rembelyy/ini-config-parser/blob/main/test_results.md)

---

## License

Apache-2.0 License
[View license](https://github.com/rembelyy/ini-config-parser/blob/main/LICENSE)

---

## Support

Discord: rembelyy
GitHub: [github.com/rembelyy/ini-config-parser](https://github.com/rembelyy/ini-config-parser)
