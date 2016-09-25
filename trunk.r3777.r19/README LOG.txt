LOG Sources - The Forgotten Server 0.4.3777
[ GENERAL INFO
	-- Revision 1
	* Optimize magicwall system - like cipbia 8.60
	* Lite fix in configmanager.cpp + added new configs "mysqlReconnectionAttempts" - "tradelimit" - "skipItemsVersionCheck"
	* Perfect autostack items + Fixed NPC System (ElfBot)
	* Fixed DeadCorpse Monster "Wallking in"
	* Added support compilation with boost 1.4+ "windows"
	* Fixed function client "ctrl + j"
	* Update Code::Blocks project now possible compilation under <-
	* Added support compilation with WarSystem

	-- Revision 2
	* Added Feature - Mailbox Block (more difficult clone items with parcel system)
	* Fixed Guild Management
	// Added feature "sendChannelEvent" (autoOpen Channel Invitation to player)

	-- Revision 3
	* Optimize code in tile.h (bad codes)
	* Fixed bug (http://youtu.be/x-R1Fm4vp1o)

	-- Revision 4
	* NewConfig "allowedMaxSizedPackets"
	* LiteFix on MailboxSystem
	* Optimize mutedSystem
	* Fixed /ghost stacking debug
	* Fixed showCount hotkey
	* Fixed (STAIRHOP_DELAY) on healing and attack

	-- Revision 5
	* Fixed kickAccountManagerTime on create account
	* Patched binary-tilebased house storage to tfs04-0.4.3777
	// House data storage system. Binary and binary-tilebased performs much faster map saving than relational (up to 60x faster).
	// MAKE BACKUP "DATABASE" POSSIBLE DELETE HOUSE ITEMS

	-- Revision 6
	* Update compiler flags to x64 + optimize (Windows)
	* Removed function (sendChannelEvent) no more crash in guildSystem
	* Added new condition (CONDITION_HOUSESAY) prevent lag and crash on house commands
	* Fixed muted system now work 100 properly
	* Fixed lite typo on mailBox system
	* Fixes on map.cpp on update tiles players

	-- Revision 7
	* Fixed closeShopWindow (only for users dataPacks RL ... Possible fix to NPCTradeShop System)
	* Now walkthroughAllPlayers on tileProtectionZone
	// Note: UP - Warning to thiefPlayers in glowing switch tile -- check data/movements/tiles.lua (ID change depend the your items.otb)
	* Added new function ( doPlayerSetWalkthrough(cid, uid, walkthrough) )
	* Added new flag :: PLAYERFLAG_CANPASSTHROUGHALLCREATURES
	* Added saveStepIn SpecialTiles (movements - similar to /saveme command) - doPlayerSave(cid, true)
	* Deleted OutfitMaxNumber - Nice for server with 987987+ outfits
	* Fixed maximumDoorLevel on data/movements/tiles.lua
	* Changed maxNumberItemsID on items.h (#define ITEMS 11500 - Tibia 8.50) to (#define ITEMS 12660 -  Tibia 8.60)
	* Added penaltyWeaponSystem like CipBia
	* Rewrite WarSystem (more complete and cool)
	// added with "checkWarsEvent"
	* ... other Fixed /ghost stacking debug

	-- Revision 8
	* Fix weapon disappears - the element ends
	* Added WarSystem for SQLite Servers
	* Optimize AutoStackSystem
	* Fix showDurationItems (hour,min,sec)
	* Fixes and complete SQLTables (SQLite and MySQL)
	* Fixes typos en databaseManager
	* Deleted TheForgottenServer-debug.dev
	* Deleted -D__WAR_SYSTEM__ flag no require the system is default
	* DatabaBase Version 28
	// Order to scripts and files

	-- Revision 9
	* Fixed StaminaConfig Bug (http://forum.lordaeron.eu/threads/stamina.495/)
	* Fixed FieldBugs - (http://forum.lordaeron.eu/threads/field-bug.491/)
	* Fixed bug "canWalkthrough" (implemented in rev 7) - (http://youtu.be/tHdDvpIEKtE)
	* Fixed attribute walkStack "glowing switch and other items walStack"
	* Added optional items.otb and items.xml in correct format (data/items/correct_format_items)
	* Added fieldAbsorb "fieldabsorbpercentenergy - fieldabsorbpercentfire - fieldabsorbpercentpoison" function in items (firewalker boots - fieldAbsorbPercentFire)
		// <attribute key="fieldAbsorbPercentFire" value="90" />
		// Change the valor is optional
	* Added new parameter compilation __GROUND_CACHE__
		// Not recommended for not advanced users - ground cache which can lower memory consumption by 20-50%
		// test

	-- Revision 10
	* Fixed accountManager logins "only5" evite crash server with accountManager System
	* Fixed allPosible crashBugs with:: Revision 8-9
	* Added newForm from compilation with Linux (more clean)
	* Removed parameter __GROUND_CACHE__ (no require)
	* Tuned to Code

	-- Revision 11
	* Fixed npcError with function "doPlayerRemoveItem - getItemTypeCount - container"
	* Fixed other error with function "canWalkthrough"
	* Tuned to code

	-- Revision 12
	* Fixed mysql.sql (no possible import on rev 11)
	* Fixed weapon disappears - the element ends (Fixes from rev 8 UPS)
	* Added config maxDepotItems for player premium and free -- check config.lua
	* Tuned to absorbField function
	* Tuned AutoStackSystem

	-- Revision 12.1
	* Fixed spamming console error

	-- Revision 13
	* Added effectTeleport on Monster::createMonster (SUMMON CREATURE)
	* Added feature (http://tibia.wikia.com/wiki/Blank_Rune)
	* Added feature unified Spells (http://tibia.wikia.com/wiki/Updates/8.6)
	* Added newConfigurable (healPlayersOnLevelAdvance)
	* Fixed AutoStackSystem
	* Fixed condition invisible with stealth ring
	* Fixed lightingObjets
	* Fixed updateWarEvents
	* Fixed bug (http://youtu.be/c1bpXJqvzNA)
	* Replaced "PlayerCustomFlag_CanWalkthrough" for "PlayerFlag_CanPassThroughAllCreatures"
	* Server now read "aid" on Actions/MoveEvents/Weapons
	* Server now read "add" "new" on /attr command

	-- Revision 14
	* Added missing function for reconnection MySQL //db.connected()
	* Added new configurable "from protocols 8.7x" - "tibiaClassicSlots"
	* Fixed linkers on x64/MySQL for linux users
	* Fixed monstersXML "loadLoot"
	* Fixed "changeSpeed" "internalCreatureChangeOutfit" "checkDecay" "checkLight" "loadExperienceStages" "playerAutoWalk" "checkCreatureEvents"
	* Fixed displayCriticalHit
	* Rewrite GlobalSave (fix error http://otland.net/f249/forgotten-server-0-4-rev-3777-fixed-bugs-8-6-a-140504/index38.html#post1459137)

	-- Revision 15
	* Added new configurable - "useCapSystem" - "generateAccountSalt" - "noDisableBlockRespawn" - "noShareExpSummonMonster"
	* Added new configurable "monstersGoBackToSpawn" - "bindOnlyGlobalAddress"
	* Cleanup to code
	* Fixed AccountManager Login on ownerAccount
	* Fixed banSystem on detection for send rare packets
	* Fixed bug on "luaDoPlayerSetStamina"
	* Fixed monsters tick Intervals "now is like to cip"
	* Items now support "pickupable"
	* Server now support "wherever" on movements
	* Tuned code on "removeCreature" - "playerMoveThing"
	* Rewrite TheForgottenServer.dev project
	* Removed CryptoPP
	* Removed vahash key Encryption
	* Remove the old RSA system

	-- Revision 16
	* Fixed stamina
	* Fixed pushDelay monsters/players
	* Fixed monster errorLoad
	* Fixed weapons decay
	* Fixed compiler error on Linux/Makefile.am

	-- Revision 17
	System:
		* Added new configs:
			useMultiClient - enableRookSystem - "savePlayerData - houseProtection - houseSkipInitialRent" - 
			enableProtectionQuestForGM
		* Added rookSystem
		* Added oldQuest System
		* Added missing funtions on items:
			blocksolid - blockprojectile - blockpathfind - lightlevel - lightcolor
		* Added new functions:
			getCreatureStorageList(cid) - getStorageList() - doPlayerOpenChannel(cid, channelId) - doSaveHouse(houseId) - 
			doPlayerChangeName(guid, oldName, newName)
		* Fixed errors on Mail System
		* Fixed errors on Mysql Reconnection Attempts
		* Fixed errors on Muted System
		* Fixed errors on Remove Creature
		* Fixed errors on Push Monsters and Players
		* Fixed errors on Chat message is too long (is Cancel)
		* Fixed errors on Items "text - date - writer"
		* Fixed errors en Reflect functions
		* Fixed errors on Skill errors (Evite 9999999 skills error)
		* Fixed errors on Soul System
		* Fixed errors on Stamina System
		* Fixed errors on use Amulet of Loss
		* Fixed errors on House Data Storage
		* Tuned to code
		* Removed limit Outfit
		* Rewrite SaveSystem
		* Rewrite StorageSystem

	Data:
		Actions (Check menus on actions.xml)
			* Added missings special Foods and fixed effects on foods
			* Added new actions <!-- New Actions --> on actions.xml:
				other/destroy.lua - tools/squeeze.lua - tools/rust remover.lua - tools/ceremonial ankh.lua - 
				quests/quests.lua
			* Added new ids on Construction Kits
			* Added new ids on Instruments Musicals
			* Changed menu Dolls for Reaction and added new ids for dools and other objets sounds for example Santa Doll
			* Tuned menu Teleport (stairs, ladders)
			* Tuned menu Bread Creating
			* Tuned menu Windows
			* Tuned menu Watch
			* Tuned menu Other
			* Extended ids on Food System and tuned menu Food

		Creaturescripts:
			* Extended logins on account manager X ip (5 to 20)

		Globalevents:
			* Added missing querys from WarSystem on init.lua
			* Fixed time on clean (on 2 hours) on clean.lua

		Libs:
			* 000-constant.lua
				- Added CONDITION_PARAM_FIELD = 46 :: PLAYERCUSTOMFLAG_CANWALKTHROUGH = 25
				- Added Missing and new IDs on menu: -- Skill IDS :: -- WarSystem IDS :: -- Condition IDS :: -- Reduce IDS :: -- UnderWater IDS
					: SKILL_FIST = SKILL_FIRST :: SKILL_LAST = SKILL_FISHING :: SKILL__LAST = SKILL__LEVEL

				- Changed names on menu: -- Const prop
					: CONST_PROP_MOVEABLE = 6 :: CONST_PROP_BLOCKINGANDNOTMOVEABLE = 7 for
					CONST_PROP_MOVABLE = 6 :: CONST_PROP_BLOCKINGANDNOTMOVABLE = 7

				- Changed names on menu: -- GUILD Members
					: GUILDLEVEL_MEMBER = 1 :: GUILDLEVEL_VICE = 2 :: GUILDLEVEL_LEADER = 3 for
					GUILD_MEMBER = 1  :: GUILD_VICE = 2 :: GUILD_LEADER = 3

				- Changed names on menu: -- Database Types
					: DATABASE_ENGINE_NONE = 0 :: DATABASE_ENGINE_MYSQL = 1 :: DATABASE_ENGINE_SQLITE = 2 :: DATABASE_ENGINE_POSTGRESQL = 3 :: DATABASE_ENGINE_ODBC = 4 for
					DATABASE_NONE = 0 :: DATABASE_MYSQL = 1 :: DATABASE_SQLITE = 2 :: DATABASE_POSTGRESQL = 3 :: DATABASE_ODBC = 4

				- Changed names on menu: -- Weapons IDS
					: WEAPON_SHIELD = 4 :: WEAPON_DIST = 5 :: WEAPON_WAND = 6 :: WEAPON_AMMO = 7 :: WEAPON_FIST = 8 for
					WEAPON_DIST = 4 :: WEAPON_SHIELD = 5 :: WEAPON_FIST = 6 :: WEAPON_WAND = 7 :: WEAPON_AMMO = 8

				- Changed name:
					: STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE = 255 :: RETURNVALUE_NOTMOVEABLE = 10 :: RETURNVALUE_YOUNEEDTOSPLITYOURSPEARS = 59 :: RETURNVALUE_TILEISFULL = 64 for
					STACKPOS_TOP_MOVABLE_ITEM_OR_CREATURE = 255 :: RETURNVALUE_NOTMOVABLE = 10 :: RETURNVALUE_TILEISFULL = 59 :: RETURNVALUE_YOUNEEDTOSPLITYOURSPEARS = 54

			* 012-table.lua - is tuned require remplace
			* 032-position.lua - is tuned require remplace
			* 034-exhaustion.lua - is tuned require remplace
			* 050-function.lua
				- Changes on: (Importan = QQ)
					QQ - function doNumberFormat(i)
					QQ - function playerExists(name) :: Fixed for function playerExists(name, multiworld)
					QQ - function doMutePlayer(cid, time)
					QQ - function doSummonCreature(name, pos, displayError)
					QQ - function getOnlinePlayers() :: Fixed error on multiworld
					QQ - function isPlayerGhost(cid) :: Fixed errors on Ghost stack
					QQ - function doPlayerAddLevel(cid, amount, round) :: Fixed errors (Evite 9999999 skills error)
					QQ - function doPlayerAddMagLevel(cid, amount) :: Fixed errors (Evite 9999999 skills error)
					QQ - function doPlayerAddSkill(cid, skill, amount, round) :: Fixed errors (Evite 9999999 skills error)
					QQ - function doBroadcastMessage(text, class)
					QQ - function doPlayerBroadcastMessage(cid, text, class, checkFlag, ghost)
					QQ - Added missing function: function doItemSetActionId(uid, aid)
					QQ - Added missing function: function isContainer(uid)
					QQ - Added new function: function isUnderWater(cid)
			* 100-compat.lua
				- Changes on: (Importan = QQ)
					QQ - -- Menu Colors "use all"
					QQ - -- PVP Types "use all"
					QQ - Added missing conditions and menus: CONDITION_PHYSICAL = CONDITION_BLEEDING :: -- Compatibile OLD IDS
					- Changed name:
						: PlayerFlag_CanPassThroughAllCreature = 48
						PlayerFlag_CanPassThroughAllCreatures = 48

		Movements:
			* Tuned scripts on drown condition for underWater
				- drown.lua :+: added - hotd.lua "check <!-- Helmet of the Deep -->"
			* Fixed errors on:
				- walkback.lua :: Evite errors on ChestQuest or Doors

		Talkactions:
			* Added missings commands for warSystem :: /war & /balance
			* Fixes on command :: /commands :: /gethouse :: /mkick :: /newtype :: /online :: /promote :: /town

		XML:
			* Changes on vocations.xml "added new function droploot :: Fixed errors on use Amulet of Loss"

	-- Revision 18
	* Fixed all possibles errors
	* Added features:
		http://otland.net/f35/push-distance-closer-158507/
		http://otland.net/f35/level-vocation-instead-world-name-character-login-158447/

	-- Revision 19
	* Fixed errors commands / npc / code prevent spammings
	* Fix error on (onAttacking) - "auto 1 attacktarget"
	* GUI Support
]

Path Files - The Forgotten Server 0.4.3777
[ WARNING HERE ...USE THE NEXT FILES (HAVE IMPORTANT CHANGES)
	config.lua.dist - config.lua
	theforgottenserver.s3db - sqlite.s3db
	schemas/mysql.sql
	data/creaturescripts/scripts/login.lua
	data/items/items.xml - changed FireWalker Boots
	data/lib/000-constant.lua -- Evite debugs
	data/lib/100-compat.lua -- Evite debugs
	data/npc/lib/npcsystem/modules.lua
	data/npc/lib/npcsystem/npchandler.lua
	data/spells/spells.xml -- Optional Clean
	data/XML/channels.xml -- Evite debugs

	After revision 17:
	* Check "CHANGED FILES ON REVISION" from rev16 to 17
]

Path Added Files - The Forgotten Server 0.4.3777
[ OPTIONAL FILES
	data/items/correct_format_items/items.xml
	data/items/correct_format_items/items.otb
	data/spells/spells.xml (shorted)
]

[ CHANGED FILES ON REVISION
	-- Revision 18 to 19
	M
		TheForgottenServer.exe
		config.lua
		data/XML/groups.xml
		data/creaturescripts/scripts/login.lua
		data/npc/lib/npc.lua
		data/npc/lib/npcsystem/modules.lua
		data/spells/scripts/support/conjure food.lua
		data/talkactions/lib/talkactions.lua
		data/talkactions/scripts/balance.lua
		data/talkactions/scripts/commands.lua
		data/talkactions/scripts/deathlist.lua
		data/talkactions/scripts/frags.lua
		data/talkactions/scripts/money.lua
		data/talkactions/scripts/online.lua
		data/talkactions/scripts/pvp.lua
		data/talkactions/scripts/serverinfo.lua
		data/talkactions/scripts/uptime.lua
		data/talkactions/scripts/war.lua
		data/talkactions/talkactions.xml
		sources/creature.cpp
		sources/game.cpp
		sources/house.cpp
		sources/iologindata.cpp
		sources/iomapserialize.cpp
		sources/mailbox.cpp
		sources/protocolgame.cpp

	-- Revision 17 to 18
	M
		config.lua
		data/talkactions/talkactions.xml
		data/movements/movements.xml
		sources/actions.cpp
		sources/cb/TheForgottenServer.cbp
		sources/cb/TheForgottenServer_private.rc
		sources/chat.cpp
		sources/chat.h
		sources/combat.cpp
		sources/compile.sh
		sources/configmanager.cpp
		sources/configmanager.h
		sources/const.h
		sources/databasemanager.cpp
		sources/databasemysqlpp.cpp
		sources/databasemysqlpp.h
		sources/databasepgsql.cpp
		sources/databasepgsql.h
		sources/definitions.h
		sources/exception.cpp
		sources/game.cpp
		sources/game.h
		sources/gameservers.h
		sources/gui.cpp
		sources/gui.h
		sources/gui_resources.rc
		sources/inputbox.cpp
		sources/inputbox.h
		sources/iologindata.cpp
		sources/iomapserialize.cpp
		sources/luascript.cpp
		sources/luascript.h
		sources/otpch.cpp
		sources/otpch.h
		sources/otserv.cpp
		sources/player.cpp
		sources/player.h
		sources/playerbox.cpp
		sources/playerbox.h
		sources/protocolgame.cpp
		sources/protocolgame.h
		sources/protocollogin.cpp
		sources/protocolold.cpp
		sources/resources.h
		sources/scriptmanager.cpp
		sources/status.cpp
		sources/talkaction.cpp
		sources/talkaction.h
		sources/textlogger.cpp
		sources/textlogger.h
		sources/theforgottenserver.s3db
		TheForgottenServer.exe

	-- Revision 16 to 17
	A
		data/actions/scripts/foods/coconut_shrimp_bake.lua
		data/actions/scripts/foods/demonic_candy_ball.lua
		data/actions/scripts/foods/food.lua
		data/actions/scripts/foods/pot_of_blackjack.lua
		data/actions/scripts/other/destroy.lua
		data/actions/scripts/other/reaction.lua
		data/actions/scripts/quests/quests.lua
		data/actions/scripts/tools/blessed_wooden_stake.lua
		data/actions/scripts/tools/ceremonial ankh.lua
		data/actions/scripts/tools/juice_squeezer.lua
		data/actions/scripts/tools/obsidian_knife.lua
		data/actions/scripts/tools/rust remover.lua
		data/actions/scripts/tools/squeeze.lua
		data/movements/scripts/hotd.lua
		data/talkactions/scripts/balance.lua
	M
		config.lua
		data/actions/actions.xml
		data/actions/lib/actions.lua
		data/actions/scripts/foods/sweet_mangonaise_elixir.lua
		data/actions/scripts/foods/veggie_casserole.lua
		data/actions/scripts/liquids/antidote_potion.lua
		data/actions/scripts/liquids/berserk_potion.lua
		data/actions/scripts/liquids/bullseye_potion.lua
		data/actions/scripts/liquids/containers.lua
		data/actions/scripts/liquids/mastermind_potion.lua
		data/actions/scripts/liquids/potions.lua
		data/actions/scripts/other/constructionkits.lua
		data/actions/scripts/other/decayto.lua
		data/actions/scripts/other/enchanting.lua
		data/actions/scripts/other/music.lua
		data/actions/scripts/other/pumpkinhead.lua
		data/actions/scripts/quests/system.lua
		data/actions/scripts/tools/fishing.lua
		data/actions/scripts/tools/machete.lua
		data/actions/scripts/tools/pick.lua
		data/actions/scripts/tools/rope.lua
		data/actions/scripts/tools/scythe.lua
		data/actions/scripts/tools/shovel.lua
		data/creaturescripts/scripts/login.lua
		data/globalevents/scripts/clean.lua
		data/globalevents/scripts/init.lua
		data/lib/000-constant.lua
		data/lib/012-table.lua
		data/lib/032-position.lua
		data/lib/034-exhaustion.lua
		data/lib/050-function.lua
		data/lib/100-compat.lua
		data/movements/movements.xml
		data/movements/scripts/drown.lua
		data/movements/scripts/walkback.lua
		data/talkactions/scripts/commands.lua
		data/talkactions/scripts/gethouse.lua
		data/talkactions/scripts/masskick.lua
		data/talkactions/scripts/newtype.lua
		data/talkactions/scripts/online.lua
		data/talkactions/scripts/promote.lua
		data/talkactions/scripts/teleporttown.lua
		data/talkactions/scripts/war.lua
		data/talkactions/talkactions.xml
		data/XML/vocations.xml
		sources/account.h
		sources/baseevents.cpp
		sources/baseevents.h
		sources/chat.h
		sources/combat.cpp
		sources/combat.h
		sources/configmanager.cpp
		sources/configmanager.h
		sources/configure.ac
		sources/const.h
		sources/creature.cpp
		sources/creature.h
		sources/database.h
		sources/databasemanager.cpp
		sources/databasemysql.cpp
		sources/databasemysql.h
		sources/databasesqlite.cpp
		sources/definitions.h
		sources/fileloader.h
		sources/game.cpp
		sources/game.h
		sources/group.cpp
		sources/house.cpp
		sources/house.h
		sources/housetile.cpp
		sources/housetile.h
		sources/ioban.cpp
		sources/iologindata.cpp
		sources/iologindata.h
		sources/iomap.cpp
		sources/item.h
		sources/items.cpp
		sources/items.h
		sources/luascript.cpp
		sources/luascript.h
		sources/mailbox.cpp
		sources/mailbox.h
		sources/monster.cpp
		sources/monsters.cpp
		sources/networkmessage.h
		sources/npc.cpp
		sources/npc.h
		sources/otserv.cpp
		sources/outfit.cpp
		sources/outfit.h
		sources/outputmessage.h
		sources/party.cpp
		sources/player.cpp
		sources/player.h
		sources/protocol.cpp
		sources/protocolgame.cpp
		sources/protocolgame.h
		sources/protocollogin.cpp
		sources/quests.cpp
		sources/quests.h
		sources/raids.cpp
		sources/scriptmanager.cpp
		sources/spawn.h
		sources/spells.cpp
		sources/spells.h
		sources/status.cpp
		sources/talkaction.cpp
		sources/talkaction.h
		sources/thing.h
		sources/tile.cpp
		sources/tile.h
		sources/tools.cpp
		sources/town.h
		sources/vocation.cpp
		sources/vocation.h
		sources/waitlist.cpp
		sources/weapons.cpp
		sources/weapons.h
		TheForgottenServer.exe

	-- Revision 15 to Revision 16
	M
		config.lua
		data/talkactions/talkactions.xml
		schemas/mysql.sql
		schemas/sqlite.s3db
		sources/cb/TheForgottenServer.cbp
		sources/chat.cpp
		sources/chat.h
		sources/configmanager.cpp
		sources/configmanager.h
		sources/databasemanager.cpp
		sources/definitions.h
		sources/game.cpp
		sources/game.h
		sources/ioban.cpp
		sources/iologindata.cpp
		sources/iomap.cpp
		sources/itemattributes.cpp
		sources/itemattributes.h
		sources/luascript.cpp
		sources/luascript.h
		sources/Makefile.am
		sources/monster.cpp
		sources/monsters.cpp
		sources/player.cpp
		sources/player.h
		sources/protocolgame.cpp
		sources/protocolgame.h
		sources/protocollogin.cpp
		sources/talkaction.cpp
		sources/talkaction.h
		sources/weapons.cpp
		sources/weapons.h
		TheForgottenServer.exe

	-- Revision 14 to Revision 15
	M
		config.lua
		data/lib/000-constant.lua
		data/npc/lib/npcsystem/modules.lua
		data/npc/lib/npcsystem/npchandler.lua
		sources/cb/TheForgottenServer.cbp
		sources/dev-cpp/TheForgottenServer.dev
		sources/admin.cpp
		sources/admin.h
		sources/config.lua
		sources/config.lua.dist
		sources/configmanager.cpp
		sources/configmanager.h
		sources/configure.ac
		sources/const.h
		sources/creature.cpp
		sources/databasemanager.cpp
		sources/databasepgsql.cpp
		sources/definitions.h
		sources/enums.h
		sources/game.cpp
		sources/game.h
		sources/ioban.cpp
		sources/iologindata.cpp
		sources/iomap.cpp
		sources/items.cpp
		sources/luascript.cpp
		sources/luascript.h
		sources/monster.cpp
		sources/monsters.cpp
		sources/movement.cpp
		sources/otserv.cpp
		sources/player.cpp
		sources/player.h
		sources/protocol.cpp
		sources/protocol.h
		sources/protocollogin.cpp
		sources/protocolold.cpp
		sources/server.cpp
		sources/server.h
		sources/spawn.cpp
		sources/spells.cpp
		sources/tools.cpp
		sources/tools.h
		TheForgottenServer.exe
	R
		sources/rsa.cpp
		sources/rsa.h

	-- Revision 13 to Revision 14
	M
		config.lua
		data/lib/000-constant.lua
		sources/admin.cpp
		sources/admin.h
		sources/chat.cpp
		sources/config.lua.dist
		sources/configmanager.cpp
		sources/configmanager.h
		sources/configure.ac
		sources/const.h
		sources/container.cpp
		sources/container.h
		sources/creature.cpp
		sources/creature.h
		sources/cylinder.h
		sources/definitions.h
		sources/depot.cpp
		sources/depot.h
		sources/dispatcher.cpp
		sources/enums.h
		sources/game.cpp
		sources/game.h
		sources/globalevent.cpp
		sources/group.cpp
		sources/iomap.cpp
		sources/iomapserialize.cpp
		sources/item.cpp
		sources/item.h
		sources/itemloader.h
		sources/items.cpp
		sources/items.h
		sources/luascript.cpp
		sources/luascript.h
		sources/mailbox.h
		sources/manager.cpp
		sources/monster.cpp
		sources/monsters.cpp
		sources/npc.cpp
		sources/otserv.cpp
		sources/party.cpp
		sources/party.h
		sources/player.cpp
		sources/player.h
		sources/scheduler.cpp
		sources/spells.cpp
		sources/status.cpp
		sources/talkaction.cpp
		sources/teleport.cpp
		sources/teleport.h
		sources/thing.h
		sources/tile.cpp
		sources/tile.h
		sources/trashholder.cpp
		sources/trashholder.h
		TheForgottenServer.exe

	-- Revision 12.1 to Revision 13
	M
		config.lua
		data/lib/000-constant.lua
		data/lib/100-compat.lua
		data/spells/spells.xml
		sources/actions.cpp
		sources/combat.cpp
		sources/condition.cpp
		sources/condition.h
		sources/config.lua.dist
		sources/configmanager.cpp
		sources/configmanager.h
		sources/connection.cpp
		sources/const.h
		sources/container.cpp
		sources/container.h
		sources/creature.cpp
		sources/creature.h
		sources/cylinder.h
		sources/game.cpp
		sources/game.h
		sources/ioguild.cpp
		sources/item.cpp
		sources/item.h
		sources/items.cpp
		sources/luascript.cpp
		sources/luascript.h
		sources/manager.cpp
		sources/monster.cpp
		sources/monster.h
		sources/monsters.cpp
		sources/monsters.h
		sources/movement.cpp
		sources/otpch.h
		sources/otsystem.h
		sources/player.cpp
		sources/player.h
		sources/protocolgame.cpp
		sources/protocolgame.h
		sources/talkaction.cpp
		sources/tile.cpp
		sources/tile.h
		sources/weapons.cpp
		TheForgottenServer.exe
]