# RedM Extended
![RedM Extended](https://cdn.discordapp.com/attachments/686807996420063232/901407156245512192/unknown2343.png)

RedM_Extended is a roleplay framework for RedM, original code is from es_extended based on FiveM. The to-go framework for creating an economy based roleplay server on RedM!

## Links & Read more
- [RedM Native Reference](https://vespura.com/doc/natives/)
- [RDX Menu Default](https://github.com/Redm-Extended-PT/rdx_menu_default)
- [RDX Menu Dialog](https://github.com/Redm-Extended-PT/rdx_menu_dialog)
- [Async RedM](https://github.com/TigoDevelopment/redm-async/tree/master)
- [MySQL (Async) RedM](https://github.com/TigoDevelopment/redm-mysql-async)
- [RDX Framework Discord](https://discord.gg/VkhUUGHpNs)

## Features
- Weight based inventory system
- Weapons support
- Supports different money accounts (defaulted with cash, bank and black money)
- Job system with grades
- Easy to use API for developers to easily integrate RDX to their projects
- Register your own commands easily, with argument validation, chat suggestion and using FXServer ACL

## Config Radar
```
    0 = Off,
    1 = Regular (Regular Radar),
    2 = Expanded (Big Radar),
    3 = Simple (Compass like), 
```

## Config First Person
```
    Config.Fps = false
```

## Config Color Map
```
COLORS:
BLIP_STYLE_ADVERSARY =  CYAN
BLIP_STYLE_AREA_BOUNDS_OVERLAY = black with shadow
IP_STYLE_AMBIENT_CANO =  white
BLIP_STYLE_AREA = yellow 
BLIP_STYLE_AREA_BOUNDS = black
BLIP_STYLE_COMPANION = gray
BLIP_STYLE_COP_PERSISTENT = red with shadow ?
BLIP_STYLE_DEBUG_BLUE = blue
BLIP_STYLE_DEBUG_GREEN = green
BLIP_STYLE_DEBUG_PINK = pink
BLIP_STYLE_DEBUG_RED = red
BLIP_STYLE_DEBUG_YELLOW = yellow 
BLIP_STYLE_FM_EVENT = purple
```
```	
Other MapZones:
    DISTRICT_GRIZZLIES = { -- upperleft corner going out of bounds lol
		hash = 0x9125D14C,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
	
    LOCKOUT_EASTSIDE = { -- idk
		hash = 0xFAF570C5,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    REGION_BAY_LAGRAS = { -- lagras small area
		hash = 0x9652B96E,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    REGION_BAY_SAINT_DENIS = { -- saint denis city area
		hash = 0x2A6CBBA2,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    REGION_BGV_STRAWBERRY = { -- STRAWBERRY city area
		hash = 0x4663EEB9,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    REGION_BLU_SISIKA = { -- prison city area
		hash = 0x2D1A7AF2,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    REGION_GRT_BLACKWATER = { -- blackwater city area
		hash = 0x5647E155,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    REGION_GUA_MANICATO = { -- idk maybe guarma
		hash = 0x6E10D212,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    REGION_HRT_CORNWALLKEROSENE = { -- heartland oilfields area
		hash = 0x7B23B4C7,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    REGION_HRT_EMERALDRANCH = { -- emeraldranch area
		hash = 0x6E7BDAC4,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    REGION_HRT_VALENTINE = { -- VALENTINE area
		hash = 0x0079B7EE,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    REGION_ROA_ANNESBURG = { -- ANNESBURG area
		hash = 0x0A8B2CBE,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    REGION_ROA_BUTCHERCREEK = { -- BUTCHERCREEK area
		hash = 0xA053D058,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    REGION_ROA_VANHORNPOST = { -- VANHORNPOST area
		hash = 0x507B5360,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    REGION_SCM_BRAITHWAITEMANOR = { -- BRAITHWAITEMANOR area
		hash = 0xFC531E7A,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    REGION_SCM_CALIGAHALL = { -- CALIGAHALL area
		hash = 0xD218D90D,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    REGION_SCM_RHODES = { -- RHODES area
		hash = 0xD3F2B8A7,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    REGION_TAL_MANZANITAPOST = { -- idk
		hash = 0xDC87C0C8,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    STATE_AMBARINO = { -- whole ambarino state area
		hash = 0x3B8DD21A,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    STATE_DEFAULT = { -- just a blip in the valentine, maybe color fucking up
		hash = 0xAF5E7C06,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    STATE_GUARMA = { -- guarma state
		hash = 0x9307FD41,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    STATE_NEW_AUSTIN = { -- whole new austin state area 
		hash = 0x41759831,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    STATE_NEW_HANOVER = { -- whole new hanover area 
		hash = 0x41332496,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
    STATE_WEST_ELIZABETH = { -- whole west elisa area 
		hash = 0xD69B5B49,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
	    STATE_LEMOYNE = { -- whole leymoyne state area 
		hash = 0x945395DF,
		color = "BLIP_STYLE_AREA_BOUNDS",
    },
```

## Add system admins on the server.cfg
- add_principal group.admin group.user
- add_ace group.admin command allow # allow all commands
- add_ace group.admin command.quit deny # but don't allow quit
- add_principal identifier.steam:**************** group.admin # ADM

## Screenshots
![RedM-Extended](https://cdn.discordapp.com/attachments/686807996420063232/901408246991032390/unknown.png)

## Credits
[esx-ORG](https://github.com/esx-framework)
[ThymonA](https://github.com/ThymonA)
