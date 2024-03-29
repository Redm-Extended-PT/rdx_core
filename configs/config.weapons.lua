Config.AmmoTypes = {
	UNUSABLE = { label = _U('ammo_unusable'), hash = 0 },
	MOONSHINEJUG = {},
	LASSO = { hash = 0xEAD00129 },
	FISHINGROD = {},
	
	-- PISTOLS
	PISTOL = { hash = 0x743D4F54 },
	PISTOL_EXPRESS = {},
	PISTOL_EXPRESS_EXPLOSIVE = {},
	PISTOL_HIGH_VELOCITY = {},
	PISTOL_SPLIT_POINT = {},
	
	-- REPEATER
	REPEATER = { hash = 0xB0B80B9A },
	REPEATER_EXPRESS = {},
	REPEATER_EXPRESS_EXPLOSIVE = {},
	REPEATER_HIGH_VELOCITY = {},
	
	-- REVOLVER
	REVOLVER = {hash = 0x64356159 },
	REVOLVER_EXPRESS = {},
	REVOLVER_EXPRESS_EXPLOSIVE = {},
	REVOLVER_HIGH_VELOCITY = {},
	REVOLVER_SPLIT_POINT = {},
	
	-- RIFLE
	RIFLE = {},
	RIFLE_EXPRESS = {},
	RIFLE_EXPRESS_EXPLOSIVE = {},
	RIFLE_HIGH_VELOCITY = {},
	RIFLE_SPLIT_POINT = {},
	RIFLE_VARMINT = { hash = 0x7DF4D025 },

	-- SHOTGUN
	SHOTGUN = { hash = 0x90083D3B},
	SHOTGUN_BUCKSHOT_INCENDIARY = {},
	SHOTGUN_EXPRESS_EXPLOSIVE = {},
	SHOTGUN_SLUG = {},

	-- SNIPER
	SNIPER_RIFLE = { hash = 0xD05319F },

	-- BOW
	ARROW = { hash = 0x38E6F55F },
	ARROW_DYNAMITE = {},
	ARROW_FIRE = {},
	ARROW_IMPROVED = {},
	ARROW_POISON = {},
	ARROW_SMALL_GAME = {},
	ARROW_CONFUSION = {},
	ARROW_DISORIENT = {},
	ARROW_DRAIN = {},
	ARROW_TRAIL = {},
	ARROW_WOUND = {},

	--THROWABLES
	DYNAMITE = { hash = 0x1C9D6E9D },
	DYNAMITE_VOLATILE = {},
	MOLOTOV = { hash = 0x5633F9D5 },
	MOLOTOV_VOLATILE = {},
	THROWING_KNIVES = { hash = 0x9E4AD291 },
	THROWING_KNIVES_IMPROVED = {},
	THROWING_KNIVES_POISON = {},
	THROWING_KNIVES_JAVIER = { hash = 0xF51D1AC7},
	THROWING_KNIVES_CONFUSE = {},
	THROWING_KNIVES_DISORIENT = {},
	THROWING_KNIVES_DRAIN = {},
	THROWING_KNIVES_TRAIL = {},
	THROWING_KNIVES_WOUND = {},
	HATCHET = { hash = 0x194631D6 },
	HATCHET_CLEAVER = { hash = 0xB925EC32 },
	HATCHET_DOUBLE_BIT = { hash = 0x63A5047F },
	HATCHET_DOUBLE_BIT_RUSTED = { hash = 0xCABE0C0F },
	HATCHET_HEWING = { hash = 0x8507C1F7 },
	HATCHET_ANCIENT = { hash = 0xA9708E57 },
	HATCHET_HUNTER = { hash = 0x1AA32EB0 },
	HATCHET_HUNTER_RUSTED = { hash = 0xBEDC8EB6 },
	HATCHET_VIKING = { hash = 0xE501537B },
	TOMAHAWK = { hash = 0x49A985D7 },
	TOMAHAWK_HOMING = {},
	TOMAHAWK_IMPROVED = {},
	TOMAHAWK_ANCIENT = {hash = 0xF25D45BC }
}

for name, _ in pairs(Config.AmmoTypes) do
	local ammoTypeName = ('ammo_%s'):format(string.lower(name))

	if (Config.AmmoTypes[name] == nil) then Config.AmmoTypes[name] = {} end
	if (Config.AmmoTypes[name].label == nil) then Config.AmmoTypes[name].label = _U(ammoTypeName) end
	if (Config.AmmoTypes[name].hash == nil) then Config.AmmoTypes[name].hash = GetHashKey(string.upper(ammoTypeName)) end
end

Config.WeaponGroups = {
	REVOLVER = { label = _U('group_revolver'), hash = 0xBE5B8969 },
	PISTOL = { label = _U('group_pistol'), hash = 0x18D5FA97 },
	MELEE = { label = _U('group_melee'), hash = 0xD49321D4 },
	MELEE_THROWABLE = { label = _U('group_melee_throwable'), hash = 0x5C4C5883 },
	SHOTGUN = { label = _U('group_shotgun'), hash = 0x33431399 },
	SNIPER = { label = _U('group_sniper_rifle'), hash = 0xB7BBD827 },
	KIT = { label = _U('group_kit'), hash = 0xC715F939 },
	RIFLE = { label = _U('group_rifle'), hash = 0x39D5C192 },
	BOW = { label = _U('group_bow'), hash = 0xB5FD67CD },
	LASSO = { label = _U('group_lasso'), hash = 0x126210C3 },
	REPEATER = { label = _U('group_repeater'), hash = 0xDC8FB3E9 },
	FISHINGROD = { label = _U('group_fishing_rod'), hash = 0x60B51DA4 },
	NONE = { label = _U('group_none'), hash = 0 },
	JERRY = { label = _U('group_jerry'), hash = 0x5F1BE07C }
}

Config.Weapons = {
	{
		name = 'WEAPON_UNARMED',
		key = 's_interact_jug_pickup',
		hash = GetHashKey('WEAPON_UNARMED'),
		ammo = Config.AmmoTypes.UNUSABLE,
		group = Config.WeaponGroups.NONE,
		label = _U('weapon_unarmed'),
		components = {}
	},
	{
		name = 'WEAPON_MOONSHINEJUG',
		key = 's_interact_jug_pickup',
		hash = GetHashKey('WEAPON_MOONSHINEJUG'),
		ammo = Config.AmmoTypes.MOONSHINEJUG,
		group = Config.WeaponGroups.JERRY,
		label = _U('weapon_moonshinejug'),
		components = {}
	},
	{
		name = 'WEAPON_FISHINGROD',
		key = 'w_melee_fishingpole02',
		hash = GetHashKey('WEAPON_FISHINGROD'),
		ammo = Config.AmmoTypes.FISHINGROD,
		group = Config.WeaponGroups.FISHINGROD,
		label = _U('weapon_fishingrod'),
		components = {}
	},
	{
		name = 'WEAPON_THROWN_THROWING_KNIVES',
		key = 'w_melee_knife05',
		hash = GetHashKey('WEAPON_THROWN_THROWING_KNIVES'),
		ammo = Config.AmmoTypes.THROWING_KNIVES,
		group = Config.WeaponGroups.MELEE_THROWABLE,
		label = _U('weapon_thrown_throwing_knives'),
		components = {}
	},
	{
		name = 'WEAPON_THROWN_TOMAHAWK',
		key = 'w_melee_tomahawk01',
		hash = GetHashKey('WEAPON_THROWN_TOMAHAWK'),
		ammo = Config.AmmoTypes.TOMAHAWK,
		group = Config.WeaponGroups.MELEE_THROWABLE,
		label = _U('weapon_thrown_tomahawk'),
		components = {}
	},
	{
		name = 'WEAPON_THROWN_TOMAHAWK_ANCIENT',
		key = 'w_melee_tomahawk02',
		hash = GetHashKey('WEAPON_THROWN_TOMAHAWK_ANCIENT'),
		ammo = Config.AmmoTypes.TOMAHAWK_ANCIENT,
		group = Config.WeaponGroups.MELEE_THROWABLE,
		label = _U('weapon_thrown_tomahawk_ancient'),
		components = {}
	},
	{
		name = 'WEAPON_PISTOL_M1899',
		key = 'w_pistol_m189901',
		hash = GetHashKey('WEAPON_PISTOL_M1899'),
		ammo = Config.AmmoTypes.PISTOL,
		group = Config.WeaponGroups.PISTOL,
		label = _U('weapon_pistol_m1899'),
		components = {

				"COMPONENT_PISTOL_M1899_BARREL_SHORT",
				"COMPONENT_PISTOL_M1899_BARREL_LONG",
				"COMPONENT_PISTOL_M1899_CLIP",
				"COMPONENT_PISTOL_M1899_GRIP",
				"COMPONENT_PISTOL_M1899_GRIP_IRONWOOD",
				"COMPONENT_PISTOL_M1899_GRIP_PEARL",
				"COMPONENT_PISTOL_M1899_GRIP_EBONY",
				"COMPONENT_PISTOL_M1899_SIGHT_NARROW",
				"COMPONENT_PISTOL_M1899_SIGHT_WIDE",
		}
	},
	{
		name = 'WEAPON_PISTOL_MAUSER',
		key = 'w_pistol_mauser01',
		hash = GetHashKey('WEAPON_PISTOL_MAUSER'),
		ammo = Config.AmmoTypes.PISTOL,
		group = Config.WeaponGroups.PISTOL,
		label = _U('weapon_pistol_mauser'),
		components = {

				"COMPONENT_PISTOL_MAUSER_BARREL_SHORT",
				"COMPONENT_PISTOL_MAUSER_BARREL_LONG",
				"COMPONENT_PISTOL_MAUSER_BARREL_AZTEC",
				"COMPONENT_PISTOL_MAUSER_GRIP",
				"COMPONENT_PISTOL_MAUSER_GRIP_PEARL",
				"COMPONENT_PISTOL_MAUSER_GRIP_EBONY",
				"COMPONENT_PISTOL_MAUSER_GRIP_IRONWOOD",
				"COMPONENT_PISTOL_MAUSER_GRIP_BURLED",
				"COMPONENT_PISTOL_MAUSER_GRIP_AZTEC",
				"COMPONENT_PISTOL_MAUSER_SIGHT_NARROW",
				"COMPONENT_PISTOL_MAUSER_SIGHT_WIDE",
				"COMPONENT_PISTOL_MAUSER_CLIP",
				"COMPONENT_PISTOL_MAUSER_CLIP_EMPTY",
				"COMPONENT_SHORTARM_ROLE_ENGRAVING_MAUSER_AZTEC",
		}
	},
	{
		name = 'WEAPON_PISTOL_MAUSER_DRUNK',
		key = 'w_pistol_mauser01',
		hash = GetHashKey('WEAPON_PISTOL_MAUSER_DRUNK'),
		ammo = Config.AmmoTypes.PISTOL,
		group = Config.WeaponGroups.PISTOL,
		label = _U('weapon_pistol_mauser_drunk'),
		components = {}
	},
	{
		name = 'WEAPON_PISTOL_SEMIAUTO',
		key = 'w_pistol_semiauto01',
		hash = GetHashKey('WEAPON_PISTOL_SEMIAUTO'),
		ammo = Config.AmmoTypes.PISTOL,
		group = Config.WeaponGroups.PISTOL,
		label = _U('weapon_pistol_semiauto'),
		components = {

			"COMPONENT_PISTOL_SEMIAUTO_BARREL_SHORT",
			"COMPONENT_PISTOL_SEMIAUTO_BARREL_LONG",
			"COMPONENT_PISTOL_SEMIAUTO_GRIP",
			"COMPONENT_PISTOL_SEMIAUTO_GRIP_PEARL",
			"COMPONENT_PISTOL_SEMIAUTO_GRIP_IRONWOOD",
			"COMPONENT_PISTOL_SEMIAUTO_GRIP_EBONY",
			"COMPONENT_PISTOL_SEMIAUTO_GRIP_BURLED",
			"COMPONENT_PISTOL_SEMIAUTO_SIGHT_NARROW",
			"COMPONENT_PISTOL_SEMIAUTO_SIGHT_WIDE",
		}
	},
	{
		name = 'WEAPON_PISTOL_VOLCANIC',
		key = 'w_pistol_volcanic01',
		hash = GetHashKey('WEAPON_PISTOL_VOLCANIC'),
		ammo = Config.AmmoTypes.PISTOL,
		group = Config.WeaponGroups.PISTOL,
		label = _U('weapon_pistol_volcanic'),
		components = {
			"COMPONENT_PISTOL_VOLCANIC_BARREL_SHORT",
			"COMPONENT_PISTOL_VOLCANIC_BARREL_LONG",
			"COMPONENT_PISTOL_VOLCANIC_BARREL_COLLECTOR",
			"COMPONENT_PISTOL_VOLCANIC_GRIP",
			"COMPONENT_PISTOL_VOLCANIC_GRIP_PEARL",
			"COMPONENT_PISTOL_VOLCANIC_GRIP_EBONY",
			"COMPONENT_PISTOL_VOLCANIC_GRIP_IRONWOOD",
			"COMPONENT_PISTOL_VOLCANIC_GRIP_COLLECTOR",
			"COMPONENT_PISTOL_VOLCANIC_GRIP_BURLED",
			"COMPONENT_PISTOL_VOLCANIC_SIGHT_NARROW",
			"COMPONENT_PISTOL_VOLCANIC_SIGHT_WIDE",
			"COMPONENT_PISTOL_VOLCANIC_SIGHT_COLLECTOR",
			"COMPONENT_SHORTARM_FRAME_ENGRAVING_VOLCANIC_COLLECTOR",
		}
	},
	{
		name = 'WEAPON_REPEATER_CARBINE',
		key = 'w_repeater_carbine01',
		hash = GetHashKey('WEAPON_REPEATER_CARBINE'),
		ammo = Config.AmmoTypes.REPEATER,
		group = Config.WeaponGroups.REPEATER,
		label = _U('weapon_repeater_carbine'),
		components = {
			"COMPONENT_REPEATER_CARBINE_GRIP",
			"COMPONENT_REPEATER_CARBINE_GRIP_IRONWOOD",
			"COMPONENT_REPEATER_CARBINE_GRIP_ENGRAVED",
			"COMPONENT_REPEATER_CARBINE_GRIP_BURLED",
			"COMPONENT_REPEATER_CARBINE_SIGHT_NARROW",
			"COMPONENT_REPEATER_CARBINE_SIGHT_WIDE",
			"COMPONENT_REPEATER_CARBINE_CLIP",
			"COMPONENT_REPEATER_CARBINE_TUBE",
			"COMPONENT_REPEATER_CARBINE_WRAP1",
			"COMPONENT_REPEATER_CARBINE_WRAP2",
			"COMPONENT_REPEATER_CARBINE_WRAP3",
			"COMPONENT_REPEATER_CARBINE_WRAP4",
			"COMPONENT_REPEATER_CARBINE_WRAP5",
			"COMPONENT_REPEATER_CARBINE_WRAP6", 
		}
	},
	{
		name = 'WEAPON_REPEATER_EVANS',
		key = 'w_repeater_evans01',
		hash = GetHashKey('WEAPON_REPEATER_EVANS'),
		ammo = Config.AmmoTypes.REPEATER,
		group = Config.WeaponGroups.REPEATER,
		label = _U('weapon_repeater_evans'),
		components = {
			"COMPONENT_REPEATER_EVANS_GRIP",
			"COMPONENT_REPEATER_EVANS_GRIP_IRONWOOD",
			"COMPONENT_REPEATER_EVANS_GRIP_ENGRAVED",
			"COMPONENT_REPEATER_EVANS_GRIP_BURLED",
			"COMPONENT_REPEATER_EVANS_GRIP_WINTER",		 
			"COMPONENT_REPEATER_EVANS_SIGHT_NARROW",
			"COMPONENT_REPEATER_EVANS_SIGHT_WIDE",		
			"COMPONENT_REPEATER_EVANS_WRAP",
			"COMPONENT_REPEATER_EVANS_WRAP2",
			"COMPONENT_REPEATER_EVANS_WRAP3",
			"COMPONENT_REPEATER_EVANS_WRAP4",
			"COMPONENT_REPEATER_EVANS_WRAP5",
			"COMPONENT_REPEATER_EVANS_WRAP6",
			"COMPONENT_REPEATER_EVANS_WRAP_WINTER",		  
			"COMPONENT_LONGARM_ROLE_ENGRAVING_EVANS_WINTER",
		}
	},
	{
		name = 'WEAPON_REPEATER_HENRY',
		key = 'w_repeater_henry01',
		hash = GetHashKey('WEAPON_REPEATER_HENRY'),
		ammo = Config.AmmoTypes.REPEATER,
		group = Config.WeaponGroups.REPEATER,
		label = _U('weapon_repeater_henry'),
		components = {
			"COMPONENT_REPEATER_HENRY_GRIP",
			"COMPONENT_REPEATER_HENRY_GRIP_IRONWOOD",
			"COMPONENT_REPEATER_HENRY_GRIP_ENGRAVED",
			"COMPONENT_REPEATER_HENRY_GRIP_BURLED",
			"COMPONENT_REPEATER_HENRY_SIGHT_NARROW",
			"COMPONENT_REPEATER_HENRY_SIGHT_WIDE",
			"COMPONENT_REPEATER_HENRY_WRAP1",
			"COMPONENT_REPEATER_HENRY_WRAP2",
			"COMPONENT_REPEATER_HENRY_WRAP3",
			"COMPONENT_REPEATER_HENRY_WRAP4",
			"COMPONENT_REPEATER_HENRY_WRAP5",
			"COMPONENT_REPEATER_HENRY_WRAP6",
		}
	},
	{
		name = 'WEAPON_RIFLE_VARMINT',
		key = 'w_repeater_pumpaction01',
		hash = GetHashKey('WEAPON_RIFLE_VARMINT'),
		ammo = Config.AmmoTypes.RIFLE_VARMINT,
		group = Config.WeaponGroups.RIFLE,
		label = _U('weapon_rifle_varmint'),
		components = {
			"COMPONENT_RIFLE_VARMINT_GRIP",
			"COMPONENT_RIFLE_VARMINT_GRIP_ENGRAVED",
			"COMPONENT_RIFLE_VARMINT_GRIP_IRONWOOD",
			"COMPONENT_RIFLE_VARMINT_GRIP_NATURALIST",
			"COMPONENT_RIFLE_VARMINT_GRIP_BURLED",
			"COMPONENT_REPEATER_PUMPACTION_SIGHT_NARROW",
			"COMPONENT_REPEATER_PUMPACTION_SIGHT_WIDE",
			"COMPONENT_RIFLE_VARMINT_SIGHT_NATURALIST",
			"COMPONENT_RIFLE_VARMINT_CLIP",
			"COMPONENT_RIFLE_VARMINT_CLIP_ENGRAVED",
			"COMPONENT_RIFLE_VARMINT_CLIP_IRONWOOD",
			"COMPONENT_RIFLE_VARMINT_CLIP_NATURALIST",
			"COMPONENT_RIFLE_VARMINT_CLIP_BURLED",
			"COMPONENT_RIFLE_VARMINT_WRAP1",
			"COMPONENT_RIFLE_VARMINT_WRAP2",
			"COMPONENT_RIFLE_VARMINT_WRAP3",
			"COMPONENT_RIFLE_VARMINT_WRAP4",
			"COMPONENT_RIFLE_VARMINT_WRAP5",
			"COMPONENT_RIFLE_VARMINT_WRAP6",
			"COMPONENT_LONGARM_ROLE_ENGRAVING_VARMINT_NATURALIST",
		}
	},
	{
		name = 'WEAPON_REPEATER_WINCHESTER',
		key = 'w_repeater_winchester01',
		hash = GetHashKey('WEAPON_REPEATER_WINCHESTER'),
		ammo = Config.AmmoTypes.REPEATER,
		group = Config.WeaponGroups.REPEATER,
		label = _U('weapon_repeater_winchester'),
		components = {			
			"COMPONENT_REPEATER_WINCHESTER_GRIP",
			"COMPONENT_REPEATER_WINCHESTER_GRIP_IRONWOOD",
			"COMPONENT_REPEATER_WINCHESTER_GRIP_ENGRAVED",
			"COMPONENT_REPEATER_WINCHESTER_GRIP_COLLECTOR",
			"COMPONENT_REPEATER_WINCHESTER_GRIP_BURLED",			 
			"COMPONENT_REPEATER_WINCHESTER_SIGHT_NARROW",
			"COMPONENT_REPEATER_WINCHESTER_SIGHT_WIDE",			
			"COMPONENT_REPEATER_WINCHESTER_WRAP1",
			"COMPONENT_REPEATER_WINCHESTER_WRAP2",
			"COMPONENT_REPEATER_WINCHESTER_WRAP3",
			"COMPONENT_REPEATER_WINCHESTER_WRAP4",
			"COMPONENT_REPEATER_WINCHESTER_WRAP5",
			"COMPONENT_REPEATER_WINCHESTER_WRAP6",
			"COMPONENT_REPEATER_WINCHESTER_WRAP_COLLECTOR",			 
			"COMPONENT_LONGARM_FRAME_ENGRAVING_WINCHESTER_COLLECTOR",
		}
	},
	{
		name = 'WEAPON_REVOLVER_CATTLEMAN',
		key = 'w_revolver_cattleman01',
		hash = GetHashKey('WEAPON_REVOLVER_CATTLEMAN'),
		ammo = Config.AmmoTypes.REVOLVER,
		group = Config.WeaponGroups.REVOLVER,
		label = _U('weapon_revolver_cattleman'),
		components = {

		   "COMPONENT_REVOLVER_CATTLEMAN_BARREL_SHORT",
		   "COMPONENT_REVOLVER_CATTLEMAN_BARREL_LONG",
		   "COMPONENT_REVOLVER_CATTLEMAN_BARREL_LEGENDARY",		  
		   "COMPONENT_REVOLVER_CATTLEMAN_GRIP",
		   "COMPONENT_REVOLVER_CATTLEMAN_GRIP_PEARL",
		   "COMPONENT_REVOLVER_CATTLEMAN_GRIP_EBONY",
		   "COMPONENT_REVOLVER_CATTLEMAN_GRIP_IRONWOOD",
		   "COMPONENT_REVOLVER_CATTLEMAN_GRIP_GOOD_HONOR",
		   "COMPONENT_REVOLVER_CATTLEMAN_GRIP_BURLED",
		   "COMPONENT_REVOLVER_CATTLEMAN_GRIP_LEGENDARY",		  
		   "COMPONENT_REVOLVER_CATTLEMAN_SIGHT_NARROW",
		   "COMPONENT_REVOLVER_CATTLEMAN_SIGHT_WIDE",
		   "COMPONENT_SHORTARM_ROLE_ENGRAVING_CATTLEMAN_LEGENDARY",
		}
	},
	{
		name = 'WEAPON_REVOLVER_CATTLEMAN_JOHN',
		key = 'w_revolver_cattleman01',
		hash = GetHashKey('WEAPON_REVOLVER_CATTLEMAN_JOHN'),
		ammo = Config.AmmoTypes.REVOLVER,
		group = Config.WeaponGroups.REVOLVER,
		label = _U('weapon_revolver_cattleman_john'),
		components = {}
	},
	{
		name = 'WEAPON_REVOLVER_CATTLEMAN_MEXICAN',
		key = 'w_revolver_cattleman02',
		hash = GetHashKey('WEAPON_REVOLVER_CATTLEMAN_MEXICAN'),
		ammo = Config.AmmoTypes.REVOLVER,
		group = Config.WeaponGroups.REVOLVER,
		label = _U('weapon_revolver_cattleman_mexican'),
		components = {}
	},
	{
		name = 'WEAPON_REVOLVER_CATTLEMAN_PIG',
		key = 'w_revolver_cattleman03',
		hash = GetHashKey('WEAPON_REVOLVER_CATTLEMAN_PIG'),
		ammo = Config.AmmoTypes.REVOLVER,
		group = Config.WeaponGroups.REVOLVER,
		label = _U('weapon_revolver_cattleman_pig'),
		components = {}
	},
	{
		name = 'WEAPON_REVOLVER_DOUBLEACTION',
		key = 'w_revolver_doubleaction01',
		hash = GetHashKey('WEAPON_REVOLVER_DOUBLEACTION'),
		ammo = Config.AmmoTypes.REVOLVER,
		group = Config.WeaponGroups.REVOLVER,
		label = _U('weapon_revolver_doubleaction'),
		components = {

			"COMPONENT_REVOLVER_DOUBLEACTION_BARREL_SHORT",
			"COMPONENT_REVOLVER_DOUBLEACTION_BARREL_LONG",
			"COMPONENT_REVOLVER_DOUBLEACTION_GRIP",
			"COMPONENT_REVOLVER_DOUBLEACTION_GRIP_EBONY",
			"COMPONENT_REVOLVER_DOUBLEACTION_GRIP_IRONWOOD",
			"COMPONENT_REVOLVER_DOUBLEACTION_GRIP_PEARL",
			"COMPONENT_REVOLVER_DOUBLEACTION_GRIP_BAD_HONOR",
			"COMPONENT_REVOLVER_DOUBLEACTION_GRIP_BURLED",
			"COMPONENT_REVOLVER_DOUBLEACTION_SIGHT_WIDE",
			"COMPONENT_REVOLVER_DOUBLEACTION_SIGHT_NARROW",
		}
	},
	{
		name = 'WEAPON_REVOLVER_DOUBLEACTION_EXOTIC',
		key = 'w_revolver_doubleaction02',
		hash = GetHashKey('WEAPON_REVOLVER_DOUBLEACTION_EXOTIC'),
		ammo = Config.AmmoTypes.REVOLVER,
		group = Config.WeaponGroups.REVOLVER,
		label = _U('weapon_revolver_doubleaction_exotic'),
		components = {
			"COMPONENT_REVOLVER_DOUBLEACTION_GRIP_EXOTIC",
		}
	},
	{
		name = 'WEAPON_REVOLVER_DOUBLEACTION_GAMBLER',
		key = 'w_revolver_doubleaction04',
		hash = GetHashKey('WEAPON_REVOLVER_DOUBLEACTION_GAMBLER'),
		ammo = Config.AmmoTypes.REVOLVER,
		group = Config.WeaponGroups.REVOLVER,
		label = _U('weapon_revolver_doubleaction_gambler'),
		components = {}
	},
	{
		name = 'WEAPON_REVOLVER_DOUBLEACTION_MICAH',
		key = 'w_revolver_doubleaction06',
		hash = GetHashKey('WEAPON_REVOLVER_DOUBLEACTION_MICAH'),
		ammo = Config.AmmoTypes.REVOLVER,
		group = Config.WeaponGroups.REVOLVER,
		label = _U('weapon_revolver_doubleaction_micah'),
		components = {}
	},
	--[[{
	    name = 'WEAPON_REVOLVER_NAVY',
		--key = 'w_revolver_navy01', -- not sure guessing
		hash = GetHashKey('WEAPON_REVOLVER_NAVY'),
		ammo = Config.AmmoTypes.REVOLVER,
		group = Config.WeaponGroups.REVOLVER,
		label = _U('weapon_revolver_navy'),
		components = {

	       "COMPONENT_REVOLVER_NAVY_BARREL_SHORT",
	       "COMPONENT_REVOLVER_NAVY_BARREL_LONG",
	       "COMPONENT_REVOLVER_NAVY_BARREL_CROSSOVER",
		   "COMPONENT_REVOLVER_NAVY_GRIP",
	       "COMPONENT_REVOLVER_NAVY_GRIP_IRONWOOD",
	       "COMPONENT_REVOLVER_NAVY_GRIP_PEARL",
	       "COMPONENT_REVOLVER_NAVY_GRIP_EBONY",
	       "COMPONENT_REVOLVER_NAVY_GRIP_CROSSOVER",
	       "COMPONENT_REVOLVER_NAVY_SIGHT_NARROW",
	       "COMPONENT_REVOLVER_NAVY_SIGHT_WIDE",
	       "COMPONENT_REVOLVER_NAVY_SIGHT_CROSSOVER",
		}
	},]]
	{
		name = 'WEAPON_REVOLVER_LEMAT',
		key = 'w_revolver_lemat01',
		hash = GetHashKey('WEAPON_REVOLVER_LEMAT'),
		ammo = Config.AmmoTypes.REVOLVER,
		group = Config.WeaponGroups.REVOLVER,
		label = _U('weapon_revolver_lemat'),
		components = {

				"COMPONENT_REVOLVER_LEMAT_BARREL_SHORT",
				"COMPONENT_REVOLVER_LEMAT_BARREL_LONG",
				"COMPONENT_REVOLVER_LEMAT_GRIP",
				"COMPONENT_REVOLVER_LEMAT_GRIP_PEARL",
				"COMPONENT_REVOLVER_LEMAT_GRIP_EBONY",
				"COMPONENT_REVOLVER_LEMAT_GRIP_IRONWOOD",
				"COMPONENT_REVOLVER_LEMAT_SIGHT_NARROW",
				"COMPONENT_REVOLVER_LEMAT_SIGHT_WIDE",
		}
	},
	{
		name = 'WEAPON_REVOLVER_SCHOFIELD',
		key = 'w_revolver_schofield01',
		hash = GetHashKey('WEAPON_REVOLVER_SCHOFIELD'),
		ammo = Config.AmmoTypes.REVOLVER,
		group = Config.WeaponGroups.REVOLVER,
		label = _U('weapon_revolver_schofield'),
		components = {

				"COMPONENT_REVOLVER_SCHOFIELD_BARREL_SHORT",
				"COMPONENT_REVOLVER_SCHOFIELD_BARREL_LONG",
				"COMPONENT_REVOLVER_SCHOFIELD_BARREL_BOUNTY",
				"COMPONENT_REVOLVER_SCHOFIELD_GRIP",
				"COMPONENT_REVOLVER_SCHOFIELD_GRIP_PEARL",
				"COMPONENT_REVOLVER_SCHOFIELD_GRIP_IRONWOOD",
				"COMPONENT_REVOLVER_SCHOFIELD_GRIP_EBONY",
				"COMPONENT_REVOLVER_SCHOFIELD_GRIP_BOUNTY",
				"COMPONENT_REVOLVER_SCHOFIELD_GRIP_BURLED",
				"COMPONENT_REVOLVER_SCHOFIELD_SIGHT_NARROW",
				"COMPONENT_REVOLVER_SCHOFIELD_SIGHT_WIDE",
				"COMPONENT_REVOLVER_SCHOFIELD_SIGHT_BOUNTY",
				"COMPONENT_SHORTARM_FRAME_ENGRAVING_SCHOFIELD_BOUNTY",
		}
	},
	{
		name = 'WEAPON_REVOLVER_SCHOFIELD_GOLDEN',
		key = 'w_revolver_schofield03',
		hash = GetHashKey('WEAPON_REVOLVER_SCHOFIELD_GOLDEN'),
		ammo = Config.AmmoTypes.REVOLVER,
		group = Config.WeaponGroups.REVOLVER,
		label = _U('weapon_revolver_schofield_golden'),
		components = {}
	},
	{
		name = 'WEAPON_REVOLVER_SCHOFIELD_CALLOWAY',
		key = 'w_revolver_schofield04',
		hash = GetHashKey('WEAPON_REVOLVER_SCHOFIELD_CALLOWAY'),
		ammo = Config.AmmoTypes.REVOLVER,
		group = Config.WeaponGroups.REVOLVER,
		label = _U('weapon_revolver_schofield_calloway'),
		components = {}
	},
	{
		name = 'WEAPON_RIFLE_BOLTACTION',
		key = 'w_rifle_boltaction01',
		hash = GetHashKey('WEAPON_RIFLE_BOLTACTION'),
		ammo = Config.AmmoTypes.RIFLE,
		group = Config.WeaponGroups.RIFLE,
		label = _U('weapon_rifle_boltaction'),
		components = {
			"COMPONENT_RIFLE_BOLTACTION_GRIP",
			"COMPONENT_RIFLE_BOLTACTION_GRIP_IRONWOOD",
			"COMPONENT_RIFLE_BOLTACTION_GRIP_ENGRAVED",
			"COMPONENT_RIFLE_BOLTACTION_GRIP_BOUNTY",
			"COMPONENT_RIFLE_BOLTACTION_GRIP_BURLED",
			"COMPONENT_RIFLE_BOLTACTION_SIGHT_WIDE",
			"COMPONENT_RIFLE_BOLTACTION_SIGHT_NARROW",
			"COMPONENT_RIFLE_BOLTACTION_WRAP",
			"COMPONENT_RIFLE_BOLTACTION_WRAP2",
			"COMPONENT_RIFLE_BOLTACTION_WRAP3",
			"COMPONENT_RIFLE_BOLTACTION_WRAP4",
			"COMPONENT_RIFLE_BOLTACTION_WRAP5",
			"COMPONENT_RIFLE_BOLTACTION_WRAP6",
			"COMPONENT_LONGARM_FRAME_ENGRAVING_BOLTACTION_BOUNTY",
		}
	},
	{
		name = 'WEAPON_SNIPERRIFLE_CARCANO',
		key = 'w_rifle_carcano01',
		hash = GetHashKey('WEAPON_SNIPERRIFLE_CARCANO'),
		ammo = Config.AmmoTypes.RIFLE,
		group = Config.WeaponGroups.SNIPER,
		label = _U('weapon_sniperrifle_carcano'),
		components = {}
	},
	{
		name = 'WEAPON_SNIPERRIFLE_ROLLINGBLOCK',
		key = 'w_rifle_rollingblock01',
		hash = GetHashKey('WEAPON_SNIPERRIFLE_ROLLINGBLOCK'),
		ammo = Config.AmmoTypes.RIFLE,
		group = Config.WeaponGroups.SNIPER,
		label = _U('weapon_sniperrifle_rollingblock'),
		components = {}
	},
	{
		name = 'WEAPON_SNIPERRIFLE_ROLLINGBLOCK_EXOTIC',
		key = 'w_rifle_rollingblock01',
		hash = GetHashKey('WEAPON_SNIPERRIFLE_ROLLINGBLOCK_EXOTIC'),
		ammo = Config.AmmoTypes.RIFLE,
		group = Config.WeaponGroups.SNIPER,
		label = _U('weapon_sniperrifle_rollingblock_exotic'),
		components = {}
	},
	{
		name = 'WEAPON_RIFLE_SPRINGFIELD',
		key = 'w_rifle_springfield01',
		hash = GetHashKey('WEAPON_RIFLE_SPRINGFIELD'),
		ammo = Config.AmmoTypes.RIFLE,
		group = Config.WeaponGroups.RIFLE,
		label = _U('weapon_rifle_springfield'),
		components = {

				"COMPONENT_RIFLE_SPRINGFIELD_GRIP",
				"COMPONENT_RIFLE_SPRINGFIELD_GRIP_IRONWOOD",
				"COMPONENT_RIFLE_SPRINGFIELD_GRIP_ENGRAVED",
				"COMPONENT_RIFLE_SPRINGFIELD_GRIP_BURLED",

				"COMPONENT_RIFLE_SPRINGFIELD_SIGHT_NARROW",
				"COMPONENT_RIFLE_SPRINGFIELD_SIGHT_WIDE",

				"COMPONENT_RIFLE_SPRINGFIELD_WRAP1",
				"COMPONENT_RIFLE_SPRINGFIELD_WRAP2",
				"COMPONENT_RIFLE_SPRINGFIELD_WRAP3",
				"COMPONENT_RIFLE_SPRINGFIELD_WRAP4",
				"COMPONENT_RIFLE_SPRINGFIELD_WRAP5",
				"COMPONENT_RIFLE_SPRINGFIELD_WRAP6",
		}
	},
	{
		name = 'WEAPON_SHOTGUN_DOUBLEBARREL',
		key = 'w_shotgun_doublebarrel01',
		hash = GetHashKey('WEAPON_SHOTGUN_DOUBLEBARREL'),
		ammo = Config.AmmoTypes.SHOTGUN,
		group = Config.WeaponGroups.SHOTGUN,
		label = _U('weapon_shotgun_doublebarrel'),
		components = {}
	},
	{
		name = 'WEAPON_SHOTGUN_DOUBLEBARREL_EXOTIC',
		key = 'w_shotgun_doublebarrel01',
		hash = GetHashKey('WEAPON_SHOTGUN_DOUBLEBARREL_EXOTIC'),
		ammo = Config.AmmoTypes.SHOTGUN,
		group = Config.WeaponGroups.SHOTGUN,
		label = _U('weapon_shotgun_doublebarrel_exotic'),
		components = {}
	},
	{
		name = 'WEAPON_SHOTGUN_PUMP',
		key = 'w_shotgun_pumpaction01',
		hash = GetHashKey('WEAPON_SHOTGUN_PUMP'),
		ammo = Config.AmmoTypes.SHOTGUN,
		group = Config.WeaponGroups.SHOTGUN,
		label = _U('weapon_shotgun_pump'),
		components = {}
	},
	{
		name = 'WEAPON_SHOTGUN_REPEATING',
		key = 'w_shotgun_repeating01',
		hash = GetHashKey('WEAPON_SHOTGUN_REPEATING'),
		ammo = Config.AmmoTypes.SHOTGUN,
		group = Config.WeaponGroups.SHOTGUN,
		label = _U('weapon_shotgun_repeating'),
		components = {}
	},
	{
		name = 'WEAPON_SHOTGUN_SAWEDOFF',
		key = 'w_shotgun_sawed01',
		hash = GetHashKey('WEAPON_SHOTGUN_SAWEDOFF'),
		ammo = Config.AmmoTypes.SHOTGUN,
		group = Config.WeaponGroups.SHOTGUN,
		label = _U('weapon_shotgun_sawedoff'),
		components = {}
	},
	{
		name = 'WEAPON_SHOTGUN_SEMIAUTO',
		key = 'w_shotgun_semiauto01',
		hash = GetHashKey('WEAPON_SHOTGUN_SEMIAUTO'),
		ammo = Config.AmmoTypes.SHOTGUN,
		group = Config.WeaponGroups.SHOTGUN,
		label = _U('weapon_shotgun_semiauto'),
		components = {}
	},
	{
		name = 'WEAPON_BOW',
		key = 'w_sp_bowarrow',
		hash = GetHashKey('WEAPON_BOW'),
		ammo =
		{
			Config.AmmoTypes.ARROW,
			Config.AmmoTypes.ARROW_FIRE,
			Config.AmmoTypes.ARROW_DYNAMITE,
			Config.AmmoTypes.ARROW_SMALL_GAME,
			Config.AmmoTypes.ARROW_IMPROVED,
			Config.AmmoTypes.ARROW_POISON
		},
		group = Config.WeaponGroups.BOW,
		label = _U('weapon_bow'),
		components = {}
	},
	{
		name = 'WEAPON_BOW_IMPROVED',
		key = 'w_sp_bowarrow_improved', -- not sure
		hash = GetHashKey('WEAPON_BOW_IMPROVED'),
		ammo =
		{
			Config.AmmoTypes.ARROW,
			Config.AmmoTypes.ARROW_FIRE,
			Config.AmmoTypes.ARROW_DYNAMITE,
			Config.AmmoTypes.ARROW_SMALL_GAME,
			Config.AmmoTypes.ARROW_IMPROVED,
			Config.AmmoTypes.ARROW_POISON
		},
		group = Config.WeaponGroups.BOW,
		label = _U('weapon_bow'),
		components = {

				"COMPONENT_BOW_IMPROVED_GRIP",
				"COMPONENT_BOW_IMPROVED_GRIP_ALLIGATOR",
				"COMPONENT_BOW_IMPROVED_GRIP_HORNED",
				"COMPONENT_BOW_IMPROVED_GRIP_JAGUAR",
				"COMPONENT_BOW_IMPROVED_GRIP_WOODEN_INLAY",

				"COMPONENT_BOW_FRAME_TINT_A_1",
				"COMPONENT_BOW_FRAME_TINT_A_2",
				"COMPONENT_BOW_FRAME_TINT_A_3",
				"COMPONENT_BOW_FRAME_TINT_A_4",
				"COMPONENT_BOW_FRAME_TINT_A_5",
				"COMPONENT_BOW_FRAME_TINT_A_6",
				"COMPONENT_BOW_FRAME_TINT_A_7",
				"COMPONENT_BOW_FRAME_TINT_A_8",

				"COMPONENT_BOW_GRIPSTOCK_TINT_A_1",
				"COMPONENT_BOW_GRIPSTOCK_TINT_A_2",
				"COMPONENT_BOW_GRIPSTOCK_TINT_A_3",
				"COMPONENT_BOW_GRIPSTOCK_TINT_A_4",
				"COMPONENT_BOW_GRIPSTOCK_TINT_A_5",
				"COMPONENT_BOW_GRIPSTOCK_TINT_A_6",
				"COMPONENT_BOW_GRIPSTOCK_TINT_A_7",
				"COMPONENT_BOW_GRIPSTOCK_TINT_A_8",

				"COMPONENT_BOW_TRIGGER_TINT_A_1",
				"COMPONENT_BOW_TRIGGER_TINT_A_2",
				"COMPONENT_BOW_TRIGGER_TINT_A_3",
				"COMPONENT_BOW_TRIGGER_TINT_A_4",
				"COMPONENT_BOW_TRIGGER_TINT_A_5",
				"COMPONENT_BOW_TRIGGER_TINT_A_6",
				"COMPONENT_BOW_TRIGGER_TINT_A_7",
				"COMPONENT_BOW_TRIGGER_TINT_A_8",

				"COMPONENT_BOW_ROLE_ENGRAVING_IMPROVED_ALLIGATOR",
				"COMPONENT_BOW_ROLE_ENGRAVING_IMPROVED_HORNED",
				"COMPONENT_BOW_ROLE_ENGRAVING_IMPROVED_JAGUAR",
				"COMPONENT_BOW_ROLE_ENGRAVING_IMPROVED_WOODEN_INLAY",
		}
	},
	{
		name = 'WEAPON_THROWN_DYNAMITE',
		key = 'w_throw_dynamite01',
		hash = GetHashKey('WEAPON_THROWN_DYNAMITE'),
		ammo = Config.AmmoTypes.DYNAMITE,
		group = Config.WeaponGroups.MELEE_THROWABLE,
		label = _U('weapon_thrown_dynamite'),
		components = {}
	},
	{
		name = 'WEAPON_THROWN_MOLOTOV',
		key = 'w_throw_molotov01',
		hash = GetHashKey('WEAPON_THROWN_MOLOTOV'),
		ammo = Config.AmmoTypes.MOLOTOV,
		group = Config.WeaponGroups.MELEE_THROWABLE,
		label = _U('weapon_thrown_molotov'),
		components = {}
	},
	{
		name = 'WEAPON_LASSO',
		key = 'w_melee_lasso01',
		hash = GetHashKey('WEAPON_LASSO'),
		ammo = Config.AmmoTypes.LASSO,
		group = Config.WeaponGroups.LASSO,
		label = _U('weapon_lasso'),
		components = {}
	},
	{
		name = 'WEAPON_MELEE_LANTERN_ELECTRIC',
		key = 's_interact_lantern03x_pickup',
		hash = GetHashKey('WEAPON_MELEE_LANTERN_ELECTRIC'),
		ammo = Config.AmmoTypes.UNUSABLE,
		group = Config.WeaponGroups.MELEE,
		label = _U('weapon_melee_lantern_electric'),
		components = {}
	},
	{
		name = 'WEAPON_MELEE_TORCH',
		key = 's_interact_torch',
		hash = GetHashKey(''),
		ammo = Config.AmmoTypes.UNUSABLE,
		group = Config.WeaponGroups.MELEE,
		label = _U('weapon_melee_torch'),
		components = {}
	},
	{
		name = 'WEAPON_MELEE_BROKEN_SWORD',
		key = 'w_melee_brokenSword01',
		hash = GetHashKey('WEAPON_MELEE_BROKEN_SWORD'),
		ammo = Config.AmmoTypes.UNUSABLE,
		group = Config.WeaponGroups.MELEE,
		label = _U('weapon_melee_broken_sword'),
		components = {}
	},
	{
		name = 'WEAPON_MELEE_HATCHET',
		key = 'w_melee_hatchet01',
		hash = GetHashKey('WEAPON_MELEE_HATCHET'),
		ammo = Config.AmmoTypes.HATCHET,
		group = Config.WeaponGroups.MELEE_THROWABLE,
		label = _U('weapon_melee_hatchet'),
		components = {}
	},
	{
		name = 'WEAPON_MELEE_CLEAVER',
		key = 'w_melee_hatchet02',
		hash = GetHashKey('WEAPON_MELEE_CLEAVER'),
		ammo = Config.AmmoTypes.HATCHET_CLEAVER,
		group = Config.WeaponGroups.MELEE_THROWABLE,
		label = _U('weapon_melee_cleaver'),
		components = {}
	},
	{
		name = 'WEAPON_MELEE_ANCIENT_HATCHET',
		key = 'w_melee_hatchet03',
		hash = GetHashKey('WEAPON_MELEE_ANCIENT_HATCHET'),
		ammo = Config.AmmoTypes.HATCHET_ANCIENT,
		group = Config.WeaponGroups.MELEE_THROWABLE,
		label = _U('weapon_melee_ancient_hatchet'),
		components = {}
	},
	{
		name = 'WEAPON_MELEE_HATCHET_VIKING',
		key = 'w_melee_hatchet04',
		hash = GetHashKey('WEAPON_MELEE_HATCHET_VIKING'),
		ammo = Config.AmmoTypes.HATCHET_VIKING,
		group = Config.WeaponGroups.MELEE_THROWABLE,
		label = _U('weapon_melee_hatchet_viking'),
		components = {}
	},
	{
		name = 'WEAPON_MELEE_HATCHET_HEWING',
		key = 'w_melee_hatchet05',
		hash = GetHashKey('WEAPON_MELEE_HATCHET_HEWING'),
		ammo = Config.AmmoTypes.HATCHET_HEWING,
		group = Config.WeaponGroups.MELEE_THROWABLE,
		label = _U('weapon_melee_hatchet_hewing'),
		components = {}
	},
	{
		name = 'WEAPON_MELEE_HATCHET_DOUBLE_BIT',
		key = 'w_melee_hatchet06',
		hash = GetHashKey('WEAPON_MELEE_HATCHET_DOUBLE_BIT'),
		ammo = Config.AmmoTypes.HATCHET_DOUBLE_BIT,
		group = Config.WeaponGroups.MELEE_THROWABLE,
		label = _U('weapon_melee_hatchet_double_bit'),
		components = {}
	},
	{
		name = 'WEAPON_MELEE_HATCHET_DOUBLE_BIT_RUSTED',
		key = 'w_melee_hatchet06',
		hash = GetHashKey('WEAPON_MELEE_HATCHET_DOUBLE_BIT_RUSTED'),
		ammo = Config.AmmoTypes.HATCHET_DOUBLE_BIT_RUSTED,
		group = Config.WeaponGroups.MELEE_THROWABLE,
		label = _U('weapon_melee_hatchet_double_bit_rusted'),
		components = {}
	},
	{
		name = 'WEAPON_MELEE_HATCHET_HUNTER',
		key = 'w_melee_hatchet07',
		hash = GetHashKey('WEAPON_MELEE_HATCHET_HUNTER'),
		ammo = Config.AmmoTypes.HATCHET_HUNTER,
		group = Config.WeaponGroups.MELEE_THROWABLE,
		label = _U('weapon_melee_hatchet_hunter'),
		components = {}
	},
	{
		name = 'WEAPON_MELEE_HATCHET_HUNTER_RUSTED',
		key = 'w_melee_hatchet07',
		hash = GetHashKey('WEAPON_MELEE_HATCHET_HUNTER_RUSTED'),
		ammo = Config.AmmoTypes.HATCHET_HUNTER_RUSTED,
		group = Config.WeaponGroups.MELEE_THROWABLE,
		label = _U('weapon_melee_hatchet_hunter_rusted'),
		components = {}
	},
	{
		name = 'WEAPON_MELEE_KNIFE_JOHN',
		key = 'w_melee_knife01',
		hash = GetHashKey('WEAPON_MELEE_KNIFE_JOHN'),
		group = Config.WeaponGroups.MELEE,
		label = _U('weapon_melee_knife_john'),
		components = {}
	},
	{
		name = 'WEAPON_MELEE_KNIFE',
		key = 'w_melee_knife02',
		hash = GetHashKey('WEAPON_MELEE_KNIFE'),
		group = Config.WeaponGroups.MELEE,
		label = _U('weapon_melee_knife'),
		components = {}
	},
	{
		name = 'WEAPON_MELEE_KNIFE_JAWBONE',
		key = 'w_melee_knife03',
		hash = GetHashKey('WEAPON_MELEE_KNIFE_JAWBONE'),
		group = Config.WeaponGroups.MELEE,
		label = _U('weapon_melee_knife_jawbone'),
		components = {}
	},

	{
		name = 'WEAPON_MELEE_KNIFE_MINER',
		key = 'w_melee_knife14',
		hash = GetHashKey('WEAPON_MELEE_KNIFE_MINER'),
		group = Config.WeaponGroups.MELEE,
		label = _U('weapon_melee_knife_miner'),
		components = {}
	},
	{
		name = 'WEAPON_MELEE_KNIFE_CIVIL_WAR',
		key = 'w_melee_knife16',
		hash = GetHashKey('WEAPON_MELEE_KNIFE_CIVIL_WAR'),
		group = Config.WeaponGroups.MELEE,
		label = _U('weapon_melee_knife_civil_war'),
		components = {}
	},
	{
		name = 'WEAPON_MELEE_KNIFE_BEAR',
		key = 'w_melee_knife17',
		hash = GetHashKey('WEAPON_MELEE_KNIFE_BEAR'),
		group = Config.WeaponGroups.MELEE,
		label = _U('weapon_melee_knife_bear'),
		components = {}
	},
	{
		name = 'WEAPON_MELEE_KNIFE_VAMPIRE',
		key = 'w_melee_knife18',
		hash = GetHashKey('WEAPON_MELEE_KNIFE_VAMPIRE'),
		group = Config.WeaponGroups.MELEE,
		label = _U('weapon_melee_knife_vampire'),
		components = {}
	},
	{
		name = 'WEAPON_MELEE_MACHETE',
		key = 'w_melee_machete01',
		hash = GetHashKey('WEAPON_MELEE_MACHETE'),
		group = Config.WeaponGroups.MELEE,
		label = _U('weapon_melee_knife_machete'),
		components = {}
	}
}

