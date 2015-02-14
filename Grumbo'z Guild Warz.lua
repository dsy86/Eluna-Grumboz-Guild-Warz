-- **g****************************************s***
-- ********© Grumbo'z Guild Warz System™ ©********	
-- **** Brought to you by Grumbo of BloodyWoW *l**
-- **r*************** slp13at420 ****p************
-- ***Foereaper***  Ty Eluna guyz  ****Rochet2****
-- *************** Ty Emudevs.com  *********1*****
-- **u******************♠*********3***************
-- *********************♠*************************
-- ********** This is NOT a C++ SCRIPT **a********
-- ***m***********  This is For  *****************
-- ************* TRINITY/ELUNA ONLY *t************
-- *♠*******************4***********************♠*
-- *b* Please Do Not Remove any of the credits ***
-- **** and/or attempt to release as your own **2*
-- ***o******************©*************0**********
-- **************** First Public *****************
-- ********** release date 03-10-2013 ************
-- ***********************************************

print("\n-----------------------------------")
print("Grumbo'z Guild Warz System Loading:\n")
print("For TC2 Cataclysm 4.3.4\n")

local start = os.clock()

if(GetLuaEngine()~="ElunaEngine")then
	print("err: "..GetLuaEngine().." Detected.\n");
	print("!!..LOAD HALTED..?!!");
	print("\nXXX XXX XXX XXX XXX XXX XXX XXX XXX");
	print("-----------------------------------");
	return false;
else
	print("Approved: Eluna Detected.\n");
end

local Guard_Died_Drop = 20558; -- wsg's
local table_version = 2.40; -- 30
local core_version = 6.50; -- 50
local pigpayz_version = 2.50;
local tele_version = 1.50;
local pvp_version = 4.60;
local vendor_version = 1.50;

local Server = "SERVER";
local guild_warz_DB = "guild_warz_434"; -- Must match unique name if running on multiple cores i.e. guild_warz_3.3.5a_1 

GWCOMM = {};
GWARZ = {};
GWHELP = {};
GGW = {};

local function LoadGWtable()

local Ghsql =  WorldDBQuery("SELECT * FROM "..guild_warz_DB..".help;");

	if(Ghsql)then
	
		repeat
			GWHELP[Ghsql:GetUInt32(0)] = {
				entry = Ghsql:GetUInt32(0),
				command = Ghsql:GetString(1),
				description = Ghsql:GetString(2),
				example = Ghsql:GetString(3),
				command_level = Ghsql:GetUInt32(4),
			};
		until not Ghsql:NextRow()
	end

local Gcsql =  WorldDBQuery("SELECT * FROM "..guild_warz_DB..".commands;");

	if(Gcsql)then
		repeat
			GWCOMM[Gcsql:GetString(0)] = {
				guild = Gcsql:GetString(0),
				commands = Gcsql:GetString(1),
				info_loc = Gcsql:GetString(2),
				list_loc = Gcsql:GetString(3),
				tele = Gcsql:GetString(4),
				version = Gcsql:GetString(5),
				loc = Gcsql:GetString(6),
				farm = Gcsql:GetString(7),
				barrack = Gcsql:GetString(8),
				hall = Gcsql:GetString(9),
				pig = Gcsql:GetString(10),
				guard = Gcsql:GetString(11),
				vendor1 = Gcsql:GetString(12),
				vendor2 = Gcsql:GetString(13),
				vendor3 = Gcsql:GetString(14),
				GLD_lvlb = Gcsql:GetUInt32(15),
				GLD_lvls = Gcsql:GetUInt32(16),
				respawn_flag = Gcsql:GetString(17),
				details_loc = Gcsql:GetString(18),
				table = Gcsql:GetString(19),
				GM_admin = Gcsql:GetUInt32(20),
				GM_minimum = Gcsql:GetUInt32(21),
				currency = Gcsql:GetUInt32(22),
				loc_cost = Gcsql:GetUInt32(23),
				farm_cost = Gcsql:GetUInt32(24),
				barrack_cost = Gcsql:GetUInt32(25),
				hall_cost = Gcsql:GetUInt32(26),
				pig_cost = Gcsql:GetUInt32(27),
				guard_cost = Gcsql:GetUInt32(28),
				vendor1_cost = Gcsql:GetUInt32(29),
				vendor2_cost = Gcsql:GetUInt32(30),
				vendor3_cost = Gcsql:GetUInt32(31),
				farm_L = Gcsql:GetUInt32(32),
				barrack_L = Gcsql:GetUInt32(33),
				hall_L = Gcsql:GetUInt32(34),
				pig_L = Gcsql:GetUInt32(35),
				guard_L = Gcsql:GetUInt32(36),
				vendor1_L = Gcsql:GetUInt32(37),
				vendor2_L = Gcsql:GetUInt32(38),
				vendor3_L = Gcsql:GetUInt32(39),
				pig_payz = Gcsql:GetUInt32(40),
				pig_payz_timer = Gcsql:GetUInt32(41),
				gift_count = Gcsql:GetUInt32(42),
				flag_require = Gcsql:GetUInt32(43),
				Server = Gcsql:GetString(44),
				flag_id = Gcsql:GetUInt32(45),
				farm_id = Gcsql:GetUInt32(46),
				barrack_id = Gcsql:GetUInt32(47),
				hall_id = Gcsql:GetUInt32(48),
				pig_id = Gcsql:GetUInt32(49),
				guard_id = Gcsql:GetUInt32(50),
				vendor1_id = Gcsql:GetUInt32(51),
				vendor2_id = Gcsql:GetUInt32(52),
				vendor3_id = Gcsql:GetUInt32(53),
				command_set = Gcsql:GetString(54),
				anarchy = Gcsql:GetUInt32(55),			
				flag_timer = Gcsql:GetUInt32(56),
				spawn_timer = Gcsql:GetUInt32(57),
				guild_id = Gcsql:GetUInt32(58),
				guild_invite = Gcsql:GetUInt32(59),
				color_1 = Gcsql:GetString(60),
				color_2 = Gcsql:GetString(61),
				color_3 = Gcsql:GetString(62),
				color_4 = Gcsql:GetString(63),
				color_5 = Gcsql:GetString(64),
				color_6 = Gcsql:GetString(65),
				color_7 = Gcsql:GetString(66),
				color_8 = Gcsql:GetString(67),
				color_9 = Gcsql:GetString(68),
				color_10 = Gcsql:GetString(69),
				color_11 = Gcsql:GetString(70),
				color_12 = Gcsql:GetString(71),
				color_13 = Gcsql:GetString(72),
				color_14 = Gcsql:GetString(73),
				color_15 = Gcsql:GetString(74),
			};
		until not Gcsql:NextRow()
	end

	local Gwsql =  WorldDBQuery("SELECT * FROM "..guild_warz_DB..".zones;");

	if(Gwsql)then
		repeat
			GWARZ[Gwsql:GetUInt32(0)] = {
				entry = Gwsql:GetUInt32(0),
				map_id = Gwsql:GetUInt32(1),
				area_id = Gwsql:GetUInt32(2),
				zone_id = Gwsql:GetUInt32(3),
				guild_name = Gwsql:GetString(4),
				team = Gwsql:GetUInt32(5),
				x = Gwsql:GetFloat(6),
				y = Gwsql:GetFloat(7),
				z = Gwsql:GetFloat(8),
				farm_count = Gwsql:GetUInt32(9),
				barrack_count = Gwsql:GetUInt32(10),
				hall_count = Gwsql:GetUInt32(11),
				pig_count = Gwsql:GetUInt32(12),
				guard_count = Gwsql:GetUInt32(13),
				vendor1_count = Gwsql:GetUInt32(14),
				vendor2_count = Gwsql:GetUInt32(15),
				vendor3_count = Gwsql:GetUInt32(16),
				flag_id = Gwsql:GetUInt32(17),
				spawn_time = Gwsql:GetUInt32(18),
				guild_id = Gwsql:GetUInt32(19),
			};
		until not Gwsql:NextRow();
	end
end

LoadGWtable()

print("Guild Warz tables version: "..table_version);

local Currencyname = GetItemLink(GWCOMM[Server].currency);

-- ******************************************************
-- ************** CORE : custom functions ***************
-- ******************************************************

local function GetLocationId(player)
	for i = 1, #GWARZ do
		if(GWARZ[i].map_id == player:GetMapId() and GWARZ[i].area_id == player:GetAreaId() and GWARZ[i].zone_id == player:GetZoneId()) then
			return i;
		end
	end
end

local function PreparedStatements(key, ...)
	local Query = {
		[1] = "UPDATE "..guild_warz_DB..".zones SET `%s` = '%s' WHERE `entry` = '%s';",
		[2] = "DELETE FROM %s WHERE `guid` = '%s';",
		[3] = "UPDATE "..guild_warz_DB..".commands SET `%s` = '%s' WHERE `guild` = '%s';"
	}
	
	if(key == 1) then
		local subtable, value, loc = ...
		local qs = string.format(Query[key], ...)
		WorldDBQuery(qs)
		GWARZ[loc][subtable] = value;
	end
	
	if(key == 2) then
		local qs = string.format(Query[key], ...)
		WorldDBQuery(qs)
		LoadGWtable()
	end
	
	if(key == 3) then
		local qs = string.format(Query[key], ...)
		WorldDBQuery(qs)
		LoadGWtable()
	end
end

function CreateLocation(map, area, zone)
	local CLentry = (#GWARZ+1)
	WorldDBQuery("INSERT INTO "..guild_warz_DB..".zones SET `entry` = '"..CLentry.."';");
	LoadGWtable()
	print("Location: "..CLentry.." : created.")	
	
	-- Push values to Table Update after creation
	PreparedStatements(1, "map_id", map, CLentry)
	PreparedStatements(1, "area_id", area, CLentry)
	PreparedStatements(1, "zone_id", zone, CLentry)
	PreparedStatements(1, "guild_name", Server, CLentry)
	PreparedStatements(1, "team", 2, CLentry)
	PreparedStatements(1, "x", 0, CLentry)
	PreparedStatements(1, "y", 0, CLentry)
	PreparedStatements(1, "z", 0, CLentry)
	PreparedStatements(1, "farm_count", 0, CLentry)
	PreparedStatements(1, "pig_count", 0, CLentry)
	PreparedStatements(1, "guard_count", 0, CLentry)
	PreparedStatements(1, "flag_id", 0, CLentry)
	return CLentry;
end

function CreateGcommands(guild, name)
	local gid = guild:GetId()
	local CLentry = (#GWCOMM+1) -- should create varchar entry of guild name
	WorldDBQuery("INSERT INTO "..guild_warz_DB..".commands SET `guild` = '"..name.."';");
	PreparedStatements(3, "guild_id", gid, name)
	print("commands for: "..name.." : created.")	
	LoadGWtable()
	return guild;
end

local GW_version =  ((table_version+core_version+pigpayz_version+tele_version+pvp_version+vendor_version)/4)

function Newguildgift(eventId, guild, leader, name) -- idea provided by creativextent . wrote by BlackWolf
	CreateGcommands(guild, name)
	leader:AddItem(GWCOMM[Server].currency, GWCOMM[Server].gift_count)
	SendWorldMessage(GWCOMM[Server].color_13.."The Guild "..name.." lead by "..leader:GetName().." has entered exsistance..!! NOW Prepair to hold your lands!!|r")
end

RegisterGuildEvent(5, Newguildgift)

function PlrFaction(eventId, player)

local xFaction = player:GetFaction()

GGW[player:GetAccountId()] = {
		faction = xFaction,
		team = player:GetTeam(),
};

	if(player:GetGuildName())then
		
		local Guildname = player:GetGuildName();
	
			if(GWCOMM[Guildname]==nil)then
				Gcommands = CreateGcommands(player:GetGuild(), Guildname)
			end
	
		player:SendBroadcastMessage(GWCOMM[Server].color_12.."Use '/guild "..GWCOMM[Guildname].commands.." for a list of GGW commands.")	
	end
end
								
RegisterPlayerEvent(3, PlrFaction)

-- ****************************************************
-- ******************* CORE ENGINE ********************
-- ****************************************************

function GWcommands(event, player, msg, type, language)
local k = 0
local ChatCache = {}

	for word in string.gmatch(msg, "[%w_]+") do
	        k = k+1
	        ChatCache[k] = word
	end

math.randomseed(tonumber(os.time()*os.time()))

local guild_id = player:GetGuildId()
local LocId = GetLocationId(player)
	
	if(LocId == nil)then
		LocId = CreateLocation(player:GetMapId(), player:GetAreaId(), player:GetZoneId())
	end
	
local Guildname = ""..player:GetGuildName()..""

	if(GWCOMM[Guildname]==nil)then
		Gcommands = CreateGcommands(player:GetGuild(), player:GetGuildName())
	end
	
	if(GWCOMM[Guildname]==nil)then
		Gcommands = CreateGcommands(player:GetGuildName())
	end
			
	local Zoneprice=(GWCOMM[Server].loc_cost)+(GWCOMM[Server].farm_cost*GWARZ[LocId].farm_count)+(GWCOMM[Server].barrack_cost*GWARZ[LocId].barrack_count)+(GWCOMM[Server].hall_cost*GWARZ[LocId].hall_count)+(GWCOMM[Server].pig_cost*GWARZ[LocId].pig_count)+(GWCOMM[Server].vendor1_cost*GWARZ[LocId].vendor1_count);
	local yentry = 0
	local ypigcnt = 0
	local yvalue = 0
	
-- ****************************************************
-- ************** CORE : Guild Commands ***************
-- ****************************************************

	if(player:IsInGuild()==true)then
		
		if(ChatCache[1]==GWCOMM[player:GetGuildName()].commands)then
			player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."*********************************************");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_8.."*  -Grumbo'z Guild Warz Commands:-  *");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."*********************************************");
			player:SendBroadcastMessage("(Guild: "..Guildname..")");
			player:SendBroadcastMessage("(Name: "..player:GetName()..") (Guild Rank: "..player:GetGuildRank()..") (Game Rank: "..player:GetGMRank()..")");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."************************************************************");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_8.." Guild Member Commands:");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."-------------------------------------------");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_1..""..GWCOMM[Guildname].commands.."|r          "..GWCOMM[Guildname].color_3.."list guild commands.");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_1..""..GWCOMM[Guildname].info_loc.."|r                     "..GWCOMM[Guildname].color_3.."lists area info.");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_1..""..GWCOMM[Guildname].list_loc.."|r                      "..GWCOMM[Guildname].color_3.."lists areas owned");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."|r                             "..GWCOMM[Guildname].color_3.."by your guild.|r");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_1..""..GWCOMM[Guildname].tele.." `location_id`|r   "..GWCOMM[Guildname].color_3.."teleport to area");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."|r                             "..GWCOMM[Guildname].color_3.."by location id.|r");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."|cff00cc00"..GWCOMM[Guildname].version.."|r                    "..GWCOMM[Guildname].color_3.."-displays Core versions.|r");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."************************************************************");

			if(player:GetGuildRank() <= GWCOMM[player:GetGuildName()].GLD_lvlb)then
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."buy "..GWCOMM[Guildname].color_8.."Guild Master level Commands:Rank: "..GWCOMM[Guildname].color_2..GWCOMM[player:GetGuildName()].GLD_lvlb..GWCOMM[Guildname].color_8.." access.");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."-------------------------------------------");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."buy "..GWCOMM[Guildname].loc.."|r         "..GWCOMM[Guildname].color_3.."-purchase area.");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."buy "..GWCOMM[Guildname].farm.."|r       "..GWCOMM[Guildname].color_3.."-purchase a guild farm.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."buy "..GWCOMM[Guildname].barrack.."|r       "..GWCOMM[Guildname].color_3.."-purchase a barracks for guards.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."buy "..GWCOMM[Guildname].hall.."|r       "..GWCOMM[Guildname].color_3.."-purchase a guild hall.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."buy "..GWCOMM[Guildname].pig.."|r           "..GWCOMM[Guildname].color_3.."-purchase a pig.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."buy "..GWCOMM[Guildname].guard.."|r      "..GWCOMM[Guildname].color_3.."-purchase a disposable guard.");

				if(GWCOMM[Server].vendor1_id > 0)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."buy "..GWCOMM[Guildname].vendor1.."|r      "..GWCOMM[Guildname].color_3.."-purchase vendor1.");end
				if(GWCOMM[Server].vendor2_id > 0)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."buy "..GWCOMM[Guildname].vendor2.."|r      "..GWCOMM[Guildname].color_3.."-purchase vendor2.");end
				if(GWCOMM[Server].vendor3_id > 0)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."buy "..GWCOMM[Guildname].vendor3.."|r      "..GWCOMM[Guildname].color_3.."-purchase vendor3.");end

				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."************************************************************");
			end
			
			if(player:GetGuildRank()<=GWCOMM[player:GetGuildName()].GLD_lvls)then
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."sell "..GWCOMM[Guildname].color_8.."Guild Master level Commands:Rank: "..GWCOMM[Guildname].color_2..GWCOMM[player:GetGuildName()].GLD_lvls..GWCOMM[Guildname].color_8.." access.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."-------------------------------------------");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."sell "..GWCOMM[Guildname].loc.."|r         "..GWCOMM[Guildname].color_3.."-sell area for its TOTAL value.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."sell "..GWCOMM[Guildname].farm.."|r       "..GWCOMM[Guildname].color_3.."-sell farm.|r")	;	
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."sell "..GWCOMM[Guildname].barrack.."|r       "..GWCOMM[Guildname].color_3.."-sell barracks.|r");		
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."sell "..GWCOMM[Guildname].hall.."|r       "..GWCOMM[Guildname].color_3.."-sell hall.|r");	
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."sell "..GWCOMM[Guildname].pig.."|r           "..GWCOMM[Guildname].color_3.."-sell a pig to market.|r");		
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."sell "..GWCOMM[Guildname].guard.."|r  "..GWCOMM[Guildname].color_3.."-removes a selected guard.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."|r                        "..GWCOMM[Guildname].color_3.."guards are disposable.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."|r                        "..GWCOMM[Guildname].color_3.."no cash back.|r");
		
				if(GWCOMM[Server].vendor1_id > 0)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."|cff00cc00sell "..GWCOMM[Guildname].vendor1.."|r  "..GWCOMM[Guildname].color_3.."-removes a selected vendor1.|r");end
				if(GWCOMM[Server].vendor2_id > 0)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."|cff00cc00sell "..GWCOMM[Guildname].vendor2.."|r  "..GWCOMM[Guildname].color_3.."-removes a selected vendor2.|r");end
				if(GWCOMM[Server].vendor3_id > 0)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."|cff00cc00sell "..GWCOMM[Guildname].vendor3.."|r  "..GWCOMM[Guildname].color_3.."-removes a selected vendor3.|r");end

				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."************************************************************");
			end
			
			if(player:GetGuildRank()==0)then
				player:SendBroadcastMessage(GWCOMM[Guildname].color_8.."Guild Master settings:");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."-------------------------------------------");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Guild Buy. minimum required guild rank:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[player:GetGuildName()].GLD_lvlb.."");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Guild Sell. minimum required guild rank:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[player:GetGuildName()].GLD_lvls.."");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Guild invite system:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Guildname].guild_invite.."|r          "..GWCOMM[Guildname].color_3.."0 = off 1 = on.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."************************************************************")
			end

			if(player:GetGuildRank()==0)or(player:GetGMRank()==GWCOMM[Server].GM_admin)then
				player:SendBroadcastMessage(GWCOMM[Guildname].color_8.."Guild Master/Game Master/Admin special Commands:")
				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."-------------------------------------------");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1..""..GWCOMM[Server].command_set.."|r      "..GWCOMM[Guildname].color_3.."used to modify commands and settings.|r")
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."help "..GWCOMM[Server].command_set.."|r    "..GWCOMM[Guildname].color_3.."lists commands and settings you may change.|r")
				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."************************************************************")
			end
			
			if(player:GetGuildRank()<=GWCOMM[player:GetGuildName()].GLD_lvlb)or(player:GetGMRank()>=GWCOMM[Server].GM_minimum)then
				player:SendBroadcastMessage(GWCOMM[Guildname].color_8.."Prices in "..Currencyname..""..GWCOMM[Guildname].color_8.."'s:|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."-------------------------------------------");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Zone price:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].loc_cost.."|r "..GWCOMM[Guildname].color_3.."base location price.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Farm price:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].farm_cost.."|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Barracks price:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].barrack_cost.."|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Hall price:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].hall_cost.."|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Pig price:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].pig_cost.."|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Guard price:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].guard_cost.."|r");

				if(GWCOMM[Server].vendor1_id > 0)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."vendor1 price:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].vendor1_cost.."|r");end
				if(GWCOMM[Server].vendor2_id > 0)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."vendor2 price:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].vendor2_cost.."|r");end
				if(GWCOMM[Server].vendor3_id > 0)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."vendor3 price:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].vendor3_cost.."|r");end

				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."************************************************************")
			end

			if(player:GetGuildRank()<=GWCOMM[player:GetGuildName()].GLD_lvlb)or(player:GetGMRank()>=GWCOMM[Server].GM_minimum)then
				player:SendBroadcastMessage(GWCOMM[Guildname].color_8.."Location Limits:");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."-------------------------------------------");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Farm limit:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].farm_L.."|r "..GWCOMM[Guildname].color_3.."per location.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Pig limit:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].pig_L.."|r "..GWCOMM[Guildname].color_3.."per farm. Require a farm.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Barrack limit:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].barrack_L.."|r "..GWCOMM[Guildname].color_3.."per farm. Require a farm.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Guard limit:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].guard_L.."|r "..GWCOMM[Guildname].color_3.."per barrack. Require a barrack|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Hall limit:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].hall_L.."|r "..GWCOMM[Guildname].color_3.."per location. Require a barrack.|r");
				
				if(GWCOMM[Server].vendor1_id > 0)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Vendor1 limit:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].vendor1_L.."|r "..GWCOMM[Guildname].color_3.."per location. Require a hall.|r");end
				if(GWCOMM[Server].vendor2_id > 0)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Vendor2 limit:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].vendor2_L.."|r "..GWCOMM[Guildname].color_3.."per location. Require a hall.|r");end
				if(GWCOMM[Server].vendor3_id > 0)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Vendor3 limit:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].vendor3_L.."|r "..GWCOMM[Guildname].color_3.."per location. Require a hall.|r");end
				
				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."************************************************************");
			end
			
			if(player:GetGMRank()>=GWCOMM[Server].GM_minimum)then
				player:SendBroadcastMessage(GWCOMM[Guildname].color_8.."Game Master Commands:")
				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."-------------------------------------------");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1..""..GWCOMM[Server].details_loc.."|r         "..GWCOMM[Guildname].color_3.."-location info.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."reset "..GWCOMM[Server].loc.."|r           "..GWCOMM[Guildname].color_3.."-Resets location to server.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."reload "..GWCOMM[Server].table.."|r          "..GWCOMM[Guildname].color_3.."-Reloads GW tables.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."reset "..GWCOMM[Server].farm.."|r          "..GWCOMM[Guildname].color_3.."-Resets location farm count to 0.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."reset "..GWCOMM[Server].barrack.."|r          "..GWCOMM[Guildname].color_3.."-Resets location barrack count to 0.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."reset "..GWCOMM[Server].hall.."|r          "..GWCOMM[Guildname].color_3.."-Resets location hall count to 0.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."reset "..GWCOMM[Server].pig.."|r          "..GWCOMM[Guildname].color_3.."-Resets location pig count to 0.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."reset "..GWCOMM[Server].guard.."|r          "..GWCOMM[Guildname].color_3.."-Resets location guard count to 0.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."reset "..GWCOMM[Server].vendor1.."|r          "..GWCOMM[Guildname].color_3.."-Resets location vendor 1 count to 0.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."reset "..GWCOMM[Server].vendor2.."|r          "..GWCOMM[Guildname].color_3.."-Resets location vendor 2 count to 0.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."reset "..GWCOMM[Server].vendor3.."|r          "..GWCOMM[Guildname].color_3.."-Resets location vendor 3 count to 0.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."spawn "..GWCOMM[Server].respawn_flag.."|r         "..GWCOMM[Guildname].color_3.."-Spawns new flag if current|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."|r                         "..GWCOMM[Guildname].color_3.."flag is missing.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."lock "..GWCOMM[Server].loc.."|r         "..GWCOMM[Guildname].color_3.."-locks a location from purchase.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."************************************************************");
			end
				
			if(player:GetGMRank()==GWCOMM[Server].GM_admin)then
				player:SendBroadcastMessage(GWCOMM[Guildname].color_8.."ADMIN settings:")
				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."-------------------------------------------");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."ADMIN Level Access:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].GM_admin.."|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Minimum GM Level Access:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].GM_minimum.."|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Pig Payz:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].pig_payz.."|r "..GWCOMM[Guildname].color_3.."copper.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."New Guild Gift amount:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].gift_count.."|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Flag require:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].flag_require.."|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Anarchy:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].anarchy.."|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."No-Tag-Flag:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].flag_timer.."|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."No-Tag-Flag-Timer:|r "..GWCOMM[Guildname].color_2..""..GWCOMM[Server].spawn_timer.."|r "..GWCOMM[Guildname].color_3.."-in seconds");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."************************************************************")
			end
		return false;
		end
		
		if(ChatCache[1]==GWCOMM[Guildname].info_loc)then
			player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."****************************")
			player:SendBroadcastMessage(GWCOMM[Guildname].color_8.."Location details:")
			player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."---------------------------------");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."|cff00cc00Loc ID:|r "..GWCOMM[Guildname].color_2..""..GWARZ[LocId].entry.."|r");

			if(GWARZ[LocId].team==0)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Owner:|r "..GWCOMM[Guildname].color_4..""..GWARZ[LocId].guild_name.."|r.");end
			if(GWARZ[LocId].team==1)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Owner:|r "..GWCOMM[Guildname].color_5..""..GWARZ[LocId].guild_name.."|r.");end
			if(GWARZ[LocId].team==2)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Owner:|r "..GWCOMM[Guildname].color_6..""..GWARZ[LocId].guild_name.."|r.");end
			if(GWARZ[LocId].team==3)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Owner:|r "..GWCOMM[Guildname].color_7..""..GWARZ[LocId].guild_name.."|r.");end
			
			if(GWARZ[LocId].team==0)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Faction: "..GWCOMM[Guildname].color_4.."Alliance.|r");end
			if(GWARZ[LocId].team==1)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Faction: "..GWCOMM[Guildname].color_5.."Horde.|r");end
			if(GWARZ[LocId].team==2)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Faction: "..GWCOMM[Guildname].color_6.."For Sale.|r");	end
			if(GWARZ[LocId].team==3)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Faction: "..GWCOMM[Guildname].color_7.."LOCKED|r");end

			player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."|cff00cc00Farms:|r "..GWCOMM[Guildname].color_2..""..GWARZ[LocId].farm_count.."|r");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."|cff00cc00Hall:|r "..GWCOMM[Guildname].color_2..""..GWARZ[LocId].hall_count.."|r");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."|cff00cc00pigs:|r "..GWCOMM[Guildname].color_2..""..GWARZ[LocId].pig_count.."|r");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."|cff00cc00Value:|r "..GWCOMM[Guildname].color_2..""..Zoneprice.." "..GWCOMM[Guildname].color_3..""..Currencyname.."'s.|r");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."****************************");
			return false;
		end
		
		if(ChatCache[1]==GWCOMM[Guildname].list_loc)then
			local Glocdb = WorldDBQuery("SELECT `entry` FROM "..guild_warz_DB..".zones WHERE `guild_name` = '"..player:GetGuildName().."';");
			
			if(Glocdb==nil)then
				player:SendBroadcastMessage("Your guild does not own any land");
			end
			
			if(Glocdb~=nil)then
				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."**********************************************************************");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Loc ID:     farm:     barracks:     Hall:     Guards:     Pigs:          Zone value:|r");
				
				repeat
					local Gloc = Glocdb:GetUInt32(0)
					local Xzoneprice=(GWCOMM[Server].loc_cost)+(GWCOMM[Server].farm_cost*GWARZ[Gloc].farm_count)+(GWCOMM[Server].barrack_cost*GWARZ[Gloc].barrack_count)+(GWCOMM[Server].hall_cost*GWARZ[Gloc].hall_count)+(GWCOMM[Server].pig_cost*GWARZ[Gloc].pig_count)+(GWCOMM[Server].vendor1_cost*GWARZ[Gloc].vendor1_count);
					player:SendBroadcastMessage(GWCOMM[Guildname].color_2..""..Gloc.."             "..GWARZ[Gloc].farm_count.."             "..GWARZ[Gloc].barrack_count.."             "..GWARZ[Gloc].hall_count.."             "..GWARZ[Gloc].guard_count.."             "..GWARZ[Gloc].pig_count.."                  "..Xzoneprice.."|r");
					yentry = yentry+1;
					ypigcnt = ypigcnt+GWARZ[Gloc].pig_count;
					yvalue = yvalue+Xzoneprice;
				until Glocdb:NextRow()~=true;
				
				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."**********************************************************************");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."total locations: "..GWCOMM[Guildname].color_2..""..yentry.."|r      "..GWCOMM[Guildname].color_1.."total pigs:|r "..GWCOMM[Guildname].color_2..""..ypigcnt.."|r      "..GWCOMM[Guildname].color_1.."Total value:|r "..GWCOMM[Guildname].color_2..""..yvalue.."|r "..GWCOMM[Guildname].color_1..""..Currencyname.."'s.|r");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."**********************************************************************");
			end
			return false;
		end
		
		if(ChatCache[1]==GWCOMM[Guildname].version)then
			player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."****************************************");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Grumbo'z Guild Warz. VER : "..GW_version.."|r");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Core :: "..core_version..".|r");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."PigPayz :: "..pigpayz_version..".|r");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Teleport :: "..tele_version..".|r");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."PvP :: "..pvp_version..".|r");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Vendor :: "..vendor_version..".|r");
			player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."****************************************");
			return false;
		end
	
		if (ChatCache[1] == GWCOMM[Server].command_set) then
	
			for i = 1, #GWHELP do
	
				if(ChatCache[2]==tostring(GWHELP[i].command))then
	
					if(GWHELP[i].command_level<=4)and(player:GetGuildRank()==0)then
						PreparedStatements(3, ChatCache[2], ChatCache[3], player:GetGuildName())
						player:SendBroadcastMessage("guild cmd "..ChatCache[2].." set to "..ChatCache[3]..".");
					return false;
					end
		
					if(GWHELP[i].command_level<=6)and(GWHELP[i].command_level>=5)and(player:GetGMRank()==GWCOMM[Server].GM_admin)then
						PreparedStatements(3, ChatCache[2], ChatCache[3], Server)
						player:SendBroadcastMessage(GWCOMM[Guildname].color_10.."GM cmd "..ChatCache[2].." set to "..ChatCache[3].."|r.");
					return false;
					end
				end
			end	
		player:SendBroadcastMessage(GWCOMM[Guildname].color_12.."err...");
		return false;
		end
	
		if (ChatCache[1] == "help")then
		
			for i = 1, #GWHELP do
				
				if(ChatCache[2] == GWCOMM[Server].command_set)and(ChatCache[3]==nil)then
					player:SendBroadcastMessage(GWCOMM[Guildname].color_10.."command id      -     description");
						
						for b = 1, #GWHELP do

							if((player:GetGuildRank()==0)and(GWHELP[b].command_level<=4))then
								player:SendBroadcastMessage(GWCOMM[Guildname].color_10..""..GWHELP[b].command.."     -     "..GWCOMM[Guildname].color_11..""..GWHELP[b].description.."|r");
							end
							
							if(player:GetGMRank()==GWCOMM[Server].GM_admin)and(GWHELP[b].command_level>=5)and(GWHELP[b].command_level<=6)then
	                        	player:SendBroadcastMessage(GWCOMM[Guildname].color_10..""..GWHELP[b].command.."     -     "..GWCOMM[Guildname].color_11..""..GWHELP[b].description.."|r");
	                        end
						end
				return false;
				end
				
				if(ChatCache[3] == tostring(GWHELP[i].command))then
				
					if(player:GetGuildRank()==0)and(GWHELP[i].command_level<=4)then
						player:SendBroadcastMessage(GWCOMM[Guildname].color_10..""..GWHELP[i].command.."      -      |cff00cc00"..GWHELP[i].description.."|r");
						player:SendBroadcastMessage(GWCOMM[Guildname].color_10.."Example:|r /g "..GWCOMM[Guildname].color_11..""..GWHELP[i].example.."");
						player:SendBroadcastMessage(GWCOMM[Guildname].color_10.."Current:|r "..GWCOMM[Guildname].color_13..""..GWCOMM[Guildname][GWHELP[i].command].."");
						return false;
					end
					
					if(player:GetGMRank()==GWCOMM[Server].GM_admin)and(GWHELP[i].command_level>=5)and(GWHELP[i].command_level<=6)then
						player:SendBroadcastMessage(GWCOMM[Guildname].color_10..""..GWHELP[i].command.."      -      |cff00cc00"..GWHELP[i].description.."|r");
						player:SendBroadcastMessage(GWCOMM[Guildname].color_10.."Example:|r /g "..GWCOMM[Guildname].color_11..""..GWHELP[i].example.."");
						player:SendBroadcastMessage(GWCOMM[Guildname].color_10.."Current:|r "..GWCOMM[Guildname].color_13..""..GWCOMM[Guildname][GWHELP[i].command].."");
						return false;
					end
				end
			end
		player:SendBroadcastMessage("err...");
		return false;
		end

-- ****************************************************
-- ************ CORE: Guild Master Commands ***********
-- ****************************************************

		if(player:GetGuildRank() <= GWCOMM[Guildname].GLD_lvlb and ChatCache[1] == "buy")then

-- ******************* Buy commands *******************

			if(ChatCache[2] == GWCOMM[Guildname].loc)then
		
				if(GWARZ[LocId].guild_name ~= Server)then
					player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You cannot purchase this area.")
					player:SendBroadcastMessage(GWCOMM[Guildname].color_14..""..GWARZ[LocId].guild_name.." owns this area.");
				else

					if(player:GetItemCount(GWCOMM[Server].currency) < Zoneprice)then
						player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You do not have enough "..Currencyname.."'s.");
					else

						if(GWARZ[LocId].team==3)then
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."THIS AREA IS OFF LIMITS")
						else

							Gflag = PerformIngameSpawn(2, GWCOMM[Server].flag_id+(player:GetTeam()), player:GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, 1):GetGUIDLow()
							PreparedStatements(1, "guild_name", player:GetGuildName(), LocId)
							PreparedStatements(1, "team", player:GetTeam(), LocId)
							PreparedStatements(1, "x", player:GetX(), LocId)
							PreparedStatements(1, "y", player:GetY(), LocId)
							PreparedStatements(1, "z", player:GetZ(), LocId)
							PreparedStatements(1, "flag_id", Gflag, LocId)
							PreparedStatements(1, "fs_time", GetGameTime(), LocId)							
							PreparedStatements(1, "guild_id", guild_id, LocId)
							player:RemoveItem(GWCOMM[Server].currency, Zoneprice)
						
							if(player:GetGender()==0)then
								player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."Congratulations King "..player:GetName()..". you have expanded "..player:GetGuildName().."'s land.|r");
							else
								player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."Congratulations Queen "..player:GetName()..". you have expanded "..player:GetGuildName().."'s land.|r");
							end
						end
					end
				end
			return false;
			end
	
			if(ChatCache[2] == GWCOMM[Guildname].farm)then

				if(GWARZ[LocId].guild_name ~= player:GetGuildName())then
					player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Your Guild does not own this land.");
				else

					if(player:GetItemCount(GWCOMM[Server].currency) < GWCOMM[Server].farm_cost)then
						player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You require more "..Currencyname.."'s.");
					else

						if(GWARZ[LocId].farm_count >= GWCOMM[Server].farm_L)then
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You have  "..GWARZ[LocId].farm_count.." farm\'s at this location.");
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You can only purchase "..GWCOMM[Server].farm_L.." farm\'s per location.");
						else

							if(GWARZ[LocId].pig_count < (GWARZ[LocId].farm_count * GWCOMM[Server].pig_L))then
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."you still need to finish populating your other farm.");
							else

								PerformIngameSpawn(2, GWCOMM[Server].farm_id+GWARZ[LocId].team, player:GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, 1)
								PreparedStatements(1, "farm_count", GWARZ[LocId].farm_count+1, LocId)
								player:RemoveItem(GWCOMM[Server].currency, GWCOMM[Server].farm_cost)
								player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."Congratulations Grunt "..player:GetName()..".|r");
								player:SendBroadcastMessage(GWCOMM[Guildname].color_14..""..player:GetGuildName().." has added a farm at location: "..LocId..".|r");
							end
						end
					end
				end
				return false;
			end
			
			if(ChatCache[2] == GWCOMM[Guildname].barrack)then

				if(GWARZ[LocId].guild_name ~= player:GetGuildName())then
					player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Your Guild does not own this land.");
				else

					if(player:GetItemCount(GWCOMM[Server].currency) < GWCOMM[Server].barrack_cost)then
						player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You require more "..Currencyname.."'s.");
					else

						if(GWARZ[LocId].barrack_count >= (GWCOMM[Server].farm_L * GWCOMM[Server].barrack_L))then
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You have  "..GWARZ[LocId].barrack_count.." barrack\'s at this location.");
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You can only purchase "..GWCOMM[Server].farm_L*GWCOMM[Server].barrack_L.." barrack\'s per location.");
						else

							if(GWARZ[LocId].barrack_count >= GWARZ[LocId].farm_count*GWCOMM[Server].barrack_L)then
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Each farm supports "..GWCOMM[Server].barrack_L.." barracks. You need another farm.");
							else

								PerformIngameSpawn(2, GWCOMM[Server].barrack_id+GWARZ[LocId].team, player:GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, 1)
								PreparedStatements(1, "barrack_count", GWARZ[LocId].barrack_count+1, LocId)
								player:RemoveItem(GWCOMM[Server].currency, GWCOMM[Server].barrack_cost)
								player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."Congratulations Commander "..player:GetName()..".|r");
								player:SendBroadcastMessage(GWCOMM[Guildname].color_14..""..player:GetGuildName().." has added a barracks at location: "..LocId..".|r");
							return false;
							end
						end
					end
				end
			end
			
			if(ChatCache[2] == GWCOMM[Guildname].hall)then

				if(player:GetGuildName() ~= GWARZ[LocId].guild_name)then
					player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Your Guild does not own this land.");
				else
					if(player:GetItemCount(GWCOMM[Server].currency) < GWCOMM[Server].hall_cost)then
						player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Each hall costs "..GWCOMM[Server].hall_cost.." "..Currencyname..". You dont have eough.");
					else
						if(GWARZ[LocId].hall_count >= GWCOMM[Server].hall_L)then
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You have "..GWARZ[LocId].hall_count.." hall at this location.");				
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You can only have "..GWCOMM[Server].hall_L.." hall per area.");	
						else
							if(GWARZ[LocId].barrack_count >= 1)then
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Each Hall require's 1 barracks per location to provide guards for defensive support.");
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Gotta protect your HQ.");
							else
								PerformIngameSpawn(2, GWCOMM[Server].hall_id+GWARZ[LocId].team, player:GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, 1)
								PreparedStatements(1, "hall_count", GWARZ[LocId].hall_count+1, LocId)
								player:RemoveItem(GWCOMM[Server].currency, GWCOMM[Server].hall_cost)
								player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."Congradulations!.|r");
								player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."Commandant "..player:GetName()..".|r");
							end
						end
					end
				end
			return false;
			end
			
			if(ChatCache[2] == GWCOMM[Guildname].pig)then

				if(GWARZ[LocId].guild_name ~= player:GetGuildName())then
					player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Your Guild does not own this land.");
				else
					if(player:GetItemCount(GWCOMM["SERVER"].currency) < GWCOMM[Server].pig_cost)then
						player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Each pig costs "..GWCOMM["SERVER"].pig_cost.." "..Currencyname..".");
					else
						if(GWARZ[LocId].pig_count >= (GWCOMM[Server].pig_L * GWCOMM[Server].farm_L))then
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You have "..(GWARZ[LocId].pig_count*GWCOMM[Server].farm_L).." pigs at this location.")	;			
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You can only have "..GWCOMM[Server].pig_L.." pig's per farm and "..GWCOMM[Server].farm_L.." farm's per location.")	;
						else
							if(GWARZ[LocId].pig_count < GWCOMM[Server].pig_L)and(GWARZ[LocId].farm_count==0)then
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You must first have a farm here before you can add pigs.");
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Piggies gotta live somewhere...");
							else
								if(GWARZ[LocId].pig_count >= (GWARZ[LocId].farm_count * GWCOMM[Server].pig_L))then
									player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You require another farm before you can add any more pigs.");
								else								
									PerformIngameSpawn(1, GWCOMM[Server].pig_id+GWARZ[LocId].team, player:GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, 1)
									PreparedStatements(1, "pig_count", GWARZ[LocId].pig_count+1, LocId)
									player:RemoveItem(GWCOMM[Server].currency, GWCOMM[Server].pig_cost)
									player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."Congradulations!.|r");
									player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."Farmer "..player:GetName()..".|r");
								end
							end
						end
					end
				end
			return false;
			end
			
			if(ChatCache[2] == GWCOMM[Guildname].guard)then

				if(GWARZ[LocId].guild_name ~= player:GetGuildName())then
					player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Your Guild does not own this land.");
				else
					if(player:GetItemCount(GWCOMM[Server].currency) < GWCOMM[Server].guard_cost)then
						player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Each guard costs "..GWCOMM[Server].guard_cost.." "..Currencyname..".");
					else
						if(GWARZ[LocId].guard_count >= (GWCOMM[Server].guard_L * (GWCOMM[Server].barrack_L * GWCOMM[Server].farm_L)))then
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You have "..GWARZ[LocId].guard_count.." guards at this location.");
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You can only have "..(GWCOMM[Server].guard_L*GWCOMM[Server].farm_L).." per location.");
						else
							if(GWARZ[LocId].guard_count >= (GWARZ[LocId].barrack_count * GWCOMM[Server].guard_L))then
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You must add another barracks to produce more guards.");
							else
								PerformIngameSpawn(1, GWCOMM[Server].guard_id+GWARZ[LocId].team, player:GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, 1)
								PreparedStatements(1, "guard_count", GWARZ[LocId].guard_count+1, LocId)
								player:RemoveItem(GWCOMM[Server].currency, GWCOMM[Server].guard_cost)
								player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."Guard added by Commander "..player:GetName()..".|r");
							end
						end
					end
				end
			return false;
			end

			if(ChatCache[2] == GWCOMM[Guildname].vendor1)then

				if(GWCOMM[Guildname].vendor1_id > 0)then
				
					if(GWARZ[LocId].guild_name ~= player:GetGuildName())then
						player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Your Guild does not own this land.");
					else
						if(player:GetItemCount(GWCOMM[Server].currency) < GWCOMM[Server].vendor1_cost)then
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Each vendor1 costs "..GWCOMM[Server].vendor1_cost.." "..Currencyname..".");
						else
							if(GWARZ[LocId].vendor1_count >= GWCOMM[Server].vendor1_L)then
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You have "..GWARZ[LocId].vendor1_count.." vendor1's at this location.");
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You can only have "..GWCOMM[Server].vendor1_L.." per location.");
							else
								PerformIngameSpawn(1, GWCOMM[Server].vendor1_id+GWARZ[LocId].team, player:GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, 1)
								PreparedStatements(1, "vendor1_count", GWARZ[LocId].vendor1_count+1, LocId)
								player:RemoveItem(GWCOMM[Server].currency, GWCOMM[Server].vendor1_cost)
								player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."Vendor1 added by Commander "..player:GetName()..".|r");
							end
						end
					end
					return false;
				else
					player:SendBroadcastMessage("Vendor1 is NOT enabled..")
					return false;
				end
			end

			if(ChatCache[2] == GWCOMM[Guildname].vendor2)then
			
				if(GWCOMM[Guildname].vendor2_id > 0)then
				
					if(GWARZ[LocId].guild_name ~= player:GetGuildName())then
						player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Your Guild does not own this land.");
					else
						if(player:GetItemCount(GWCOMM[Server].currency) < GWCOMM[Server].vendor2_cost)then
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Each vendor1 costs "..GWCOMM[Server].vendor2_cost.." "..Currencyname..".");
						else
							if(GWARZ[LocId].vendor2_count >= GWCOMM[Server].vendor2_L)then
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You have "..GWARZ[LocId].vendor2_count.." vendor1's at this location.");
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You can only have "..GWCOMM[Server].vendor2_L.." per location.");
							else
								PerformIngameSpawn(1, GWCOMM[Server].vendor2_id+GWARZ[LocId].team, player:GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, 1)
								PreparedStatements(1, "vendor2_count", GWARZ[LocId].vendor2_count+1, LocId)
								player:RemoveItem(GWCOMM[Server].currency, GWCOMM[Server].vendor2_cost)
								player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."Vendor2 added by Commander "..player:GetName()..".|r");
							end
						end
					end
					return false;
				else
					player:SendBroadcastMessage("Vendor2 is NOT enabled..")
					return false;
				end				
			end

			if(ChatCache[2] == GWCOMM[Guildname].vendor3)then
			
				if(GWCOMM[Guildname].vendor3_id > 0)then
				
					if(GWARZ[LocId].guild_name ~= player:GetGuildName())then
						player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Your Guild does not own this land.");
					else
						if(player:GetItemCount(GWCOMM[Server].currency) < GWCOMM[Server].vendor3_cost)then
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Each vendor1 costs "..GWCOMM[Server].vendor3_cost.." "..Currencyname..".");
						else
							if(GWARZ[LocId].vendor3_count >= GWCOMM[Server].vendor3_L)then
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You have "..GWARZ[LocId].vendor3_count.." vendor1's at this location.");
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You can only have "..GWCOMM[Server].vendor3_L.." per location.");
							else
								PerformIngameSpawn(1, GWCOMM[Server].vendor3_id+GWARZ[LocId].team, player:GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, 1)
								PreparedStatements(1, "vendor3_count", GWARZ[LocId].vendor3_count+1, LocId)
								player:RemoveItem(GWCOMM[Server].currency, GWCOMM[Server].vendor3_cost)
								player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."Vendor3 added by Commander "..player:GetName()..".|r");
							end
						end
					end
					return false;
				else
					player:SendBroadcastMessage("Vendor3 is NOT enabled..")
					return false;
				end				
			end
		end

-- ******************* Sell commands ******************

		if(player:GetGuildRank() <= GWCOMM[Guildname].GLD_lvls)and(ChatCache[1] == "sell")then
		
			if(ChatCache[2]==GWCOMM[Guildname].loc)then
			
				if(GWARZ[LocId].guild_name~=player:GetGuildName())then
					player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Your guild does not own this land.");
				else

					if(player:GetNearestGameObject(1, (GWCOMM["SERVER"].flag_id+0 or GWCOMM["SERVER"].flag_id+1))==nil)then
						player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You must be next to your guild flag.");
						player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."move closer and try again.");
					else

						local flagid = player:GetNearestGameObject(1, (GWCOMM[Server].flag_id+0 or GWCOMM[Server].flag_id+1)):GetGUIDLow()
						player:GetNearestGameObject(2, (GWCOMM[Server].flag_id+0 or GWCOMM[Server].flag_id+1)):Despawn()
						PreparedStatements(1, "guild_name", Server, LocId)
						PreparedStatements(1, "team", 2, LocId)
						PreparedStatements(1, "flag_id", 0, LocId)
						PreparedStatements(1, "fs_time", 0, LocId)
						PreparedStatements(1, "guild_id", 0, LocId)
						player:AddItem(GWCOMM[Server].currency, GWCOMM[Server].loc_cost)
						player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."!Congratulations! Realtor "..player:GetName().." has sold this land. For "..Zoneprice.." "..Currencyname.."'s.|r");
					end
				end
			return false;
			end
			
			if(ChatCache[2] == GWCOMM[Guildname].farm)then

				if(player:GetGuildName() ~= GWARZ[LocId].guild_name)then
					player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Your guild does not own this land.");
				end

				if(player:GetGuildName() == GWARZ[LocId].guild_name)then

					if(GWARZ[LocId].farm_count == 0)then
						player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Your guild does not own a farm at this location.");
					else

						if(GWARZ[LocId].pig_count > ((GWCOMM[Server].pig_L) * (GWARZ[LocId].farm_count-1)))then
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You must sell off all the pigs first before removing there housing.");
						else	

							if(player:GetNearestGameObject(10, (GWCOMM[Server].farm_id+0 or GWCOMM[Server].farm_id+1)) == nil)then
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You must be closer.")
							else

								local farmspawnid = player:GetNearestGameObject(10, (GWCOMM[Server].farm_id+0 or GWCOMM[Server].farm_id+1)):GetGUIDLow() -- use this to avoid ghost respawns						
								player:GetNearestGameObject(10, (GWCOMM[Server].farm_id+0 or GWCOMM[Server].farm_id+1)):Despawn()
								PreparedStatements(2, "gameobject", farmspawnid)
								PreparedStatements(1, "farm_count", GWARZ[LocId].farm_count-1, LocId)
								player:AddItem(GWCOMM[Server].currency, GWCOMM[Server].farm_cost)
								player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."!Congratulations!"..player:GetGuildName().." has sold a guild farm. For "..GWCOMM[Server].farm_cost.." "..Currencyname.."'s.|r");
							end
						end
					end
				end
			return false;
			end
			
			if(ChatCache[2] == GWCOMM[Guildname].barrack)then

				if(player:GetGuildName() ~= GWARZ[LocId].guild_name)then
					player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Your guild does not own this land.");
				end

				if(player:GetGuildName() == GWARZ[LocId].guild_name)then

					if(GWARZ[LocId].barrack_count == 0)then
						player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Your guild does not own a barracks at this location.");
					else

						if(GWARZ[LocId].guard_count > ((GWCOMM[Server].guard_L) * (GWARZ[LocId].barrack_count-1)))then
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You must remove more guards before removing there housing.");
						else	

							if(player:GetNearestGameObject(10, (GWCOMM[Server].barrack_id+0 or GWCOMM[Server].barrack_id+1)) == nil)then
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You must be closer.");
							else

								local barrackspawnid = player:GetNearestGameObject(10, (GWCOMM[Server].barrack_id+0 or GWCOMM[Server].barrack_id+1)):GetGUIDLow() -- use this to avoid ghost respawns						
								player:GetNearestGameObject(10, (GWCOMM[Server].barrack_id+0 or GWCOMM[Server].barrack_id+1)):Despawn()
								PreparedStatements(2, "gameobject", barrackspawnid)
								PreparedStatements(1, "barrack_count", GWARZ[LocId].barrack_count-1, LocId)
								player:AddItem(GWCOMM[Server].currency, GWCOMM[Server].barrack_cost)
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."!Congratulations! Builder "..player:GetGuildName().." has sold a garrison. For "..GWCOMM[Server].barrack_cost.." "..Currencyname.."'s.|r");
							end
						end
					end
				end
			return false;
			end
			
			if(ChatCache[2] == GWCOMM[Guildname].hall)then

				if(player:GetGuildName() ~= GWARZ[LocId].guild_name)then
					player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Your guild does not own this land.");
				end

				if(player:GetGuildName() == GWARZ[LocId].guild_name)then

					if(GWARZ[LocId].hall_count <= 0)then
						player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Your guild does not own a hall at this location.");
					else

						if(player:GetNearestGameObject(45, (GWCOMM[Server].hall_id+0 or GWCOMM[Server].hall_id+1)) == nil)then
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You must be near to your hall to sell it.");
						else

							local hallspawnid = player:GetNearestGameObject(45, (GWCOMM[Server].hall_id+0 or GWCOMM[Server].hall_id+1)):GetGUIDLow() -- use this to avoid ghost respawns						
							player:GetNearestGameObject(45, (GWCOMM[Server].hall_id+0 or GWCOMM[Server].hall_id+1)):RemoveFromWorld() -- :Despawn()
							PreparedStatements(2, "gameobject", hallspawnid)
							PreparedStatements(1, "hall_count", GWARZ[LocId].hall_count-1, LocId)
							player:AddItem(GWCOMM[Server].currency, GWCOMM[Server].hall_cost)
							player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."!Congratulations!"..player:GetGuildName().." has sold a Hall. For "..GWCOMM[Server].hall_cost.." "..Currencyname.."'s.|r");
						end
					end
				end
			return false;
			end
			
			if(ChatCache[2] == GWCOMM[Guildname].pig)then

				if(player:GetGuildName() ~= GWARZ[LocId].guild_name)then
					player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Your guild does not own this land.");
				else
					if(GWARZ[LocId].pig_count == 0)then
						player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You DONT have any pigs in this area.");
					else
						if(player:GetSelection() == nil)then
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You must select a pig.");
						else

							local Pnpc = player:GetSelection():GetEntry();
							local pig = GWCOMM[Server].pig_id;
							
							if not((Pnpc == pig)or(Pnpc == pig+1))then
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."you must select a guild pig.");
							else

								local pigspawnid = player:GetSelection():GetGUIDLow()
								player:GetSelection():DespawnOrUnsummon()
								PreparedStatements(2, "creature", pigspawnid)
								PreparedStatements(1, "pig_count", GWARZ[LocId].pig_count-1, LocId)
								player:AddItem(GWCOMM[Server].currency, GWCOMM["SERVER"].pig_cost)
								player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."Butcher "..player:GetName().." sold 1 pig to the market.|r");
							end
						end
					end
				end
			return false;
			end
			
			if(ChatCache[2] == GWCOMM[Guildname].guard)then

				if(player:GetGuildName()~=GWARZ[LocId].guild_name)then
					player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Your guild does not own this land.");
				else

					if(GWARZ[LocId].guard_count == 0)then
						player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You DONT have any guards in this area.");
					else

						if(player:GetSelection() == nil)then
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You must select a guard.");
						else

							local Gnpc = player:GetSelection():GetEntry();
							local guard = GWCOMM[Server].guard_id;
							
							if not((Gnpc == guard)or(Gnpc == guard+1))then
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You must select a guild guard.");
							else

								local guardspawnid = player:GetSelection():GetGUIDLow()
								player:GetSelection():DespawnOrUnsummon()
								PreparedStatements(2, "creature", guardspawnid)
								PreparedStatements(1, "guard_count", GWARZ[LocId].guard_count-1, LocId)
								player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."Guard removed.|r");
							end
						end
					end
				end
			end	
			
			if(ChatCache[2] == GWCOMM[Guildname].vendor1)then

				if(GWCOMM[Guildname].vendor1_id > 0)then
				
					if(player:GetGuildName()~=GWARZ[LocId].guild_name)then
				
					player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Your guild does not own this land.");
				else
					if(GWARZ[LocId].vendor1_count == 0)then
						player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You DONT have any vendor1's in this area.");
					else

						if(player:GetSelection() == nil)then
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You must select a Vendor1.");
						else
						
							local Bnpc = player:GetSelection():GetEntry();
							local vendor1 = GWCOMM[Server].vendor1_id;
							
							if not((Bnpc == vendor1)or(Bnpc == vendor1+1))then
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You must select a Vendor1.");

							else
								local vendorspawnid1 = player:GetSelection():GetGUIDLow();
								player:GetSelection():SetPhaseMask(0); 
								player:GetSelection():DespawnOrUnsummon();
								PreparedStatements(2, "creature", vendorspawnid1)
								PreparedStatements(1, "vendor1_count", GWARZ[LocId].vendor1_count-1, LocId)
								player:AddItem(GWCOMM[Server].currency, GWCOMM[Server].vendor1_cost)
								player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."Vendor1 sold.|r");
							end
						end
					end
				end
				else
					player:SendBroadcastMessage("Vendor1 is NOT enabled..")
					return false;
				end
			end	
			
			if(ChatCache[2] == GWCOMM[Guildname].vendor2)then

				if(GWCOMM[Guildname].vendor2_id > 0)then
				
					if(player:GetGuildName()~=GWARZ[LocId].guild_name)then
				
					player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Your guild does not own this land.");
				else
					if(GWARZ[LocId].vendor2_count == 0)then
						player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You DONT have any vendor2's in this area.");
					else

						if(player:GetSelection() == nil)then
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You must select a Vendor2.");
						else
						
							local Bnpc = player:GetSelection():GetEntry();
							local vendor2 = GWCOMM[Server].vendor2_id;
							
							if not((Bnpc == vendor2)or(Bnpc == vendor2+1))then
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You must select a Vendor2.");

							else
								local vendorspawnid2 = player:GetSelection():GetGUIDLow();
								player:GetSelection():SetPhaseMask(0); 
								player:GetSelection():DespawnOrUnsummon();
								PreparedStatements(2, "creature", vendorspawnid2)
								PreparedStatements(1, "vendor2_count", GWARZ[LocId].vendor2_count-1, LocId)
								player:AddItem(GWCOMM[Server].currency, GWCOMM[Server].vendor2_cost)
								player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."Vendor2 sold.|r");
							end
						end
					end
				end
				else
					player:SendBroadcastMessage("Vendor2 is NOT enabled..")
					return false;
				end
			end	
			
			if(ChatCache[2] == GWCOMM[Guildname].vendor3)then

				if(GWCOMM[Guildname].vendor3_id > 0)then
				
					if(player:GetGuildName()~=GWARZ[LocId].guild_name)then
				
					player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."Your guild does not own this land.");
				else
					if(GWARZ[LocId].vendor3_count == 0)then
						player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You DONT have any vendor3's in this area.");
					else

						if(player:GetSelection() == nil)then
							player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You must select a Vendor3.");
						else
						
							local Bnpc = player:GetSelection():GetEntry();
							local vendor3 = GWCOMM[Server].vendor3_id;
							
							if not((Bnpc == vendor3)or(Bnpc == vendor3+1))then
								player:SendBroadcastMessage(GWCOMM[Guildname].color_15.."You must select a Vendor3.");

							else
								local vendorspawnid3 = player:GetSelection():GetGUIDLow();
								player:GetSelection():SetPhaseMask(0); 
								player:GetSelection():DespawnOrUnsummon();
								PreparedStatements(2, "creature", vendorspawnid3)
								PreparedStatements(1, "vendor3_count", GWARZ[LocId].vendor3_count-1, LocId)
								player:AddItem(GWCOMM[Server].currency, GWCOMM[Server].vendor3_cost)
								player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."Vendor3 sold.|r");
							end
						end
					end
				end
				else
					player:SendBroadcastMessage("Vendor3 is NOT enabled..")
					return false;
				end
			end	

		return false;
		end
		
-- ****************************************************
-- **************** Game Master Commands **************
-- ****************************************************
		
		if(player:GetGMRank() >= GWCOMM[Server].GM_minimum)then
		
			if(ChatCache[1] == "lock")and(ChatCache[2] == GWCOMM[Server].loc)then
				PreparedStatements(1, "guild_name", Server, LocId)
				PreparedStatements(1, "team", 3, LocId)
				PreparedStatements(1, "flag_id", 0, LocId)
				PreparedStatements(1, "fs_time", 0, LocId)
				player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."Area: "..GWARZ[LocId].entry.." succesfully |r"..GWCOMM[Guildname].color_7.."LOCKED|r.");
			return false;
			end
		
			if(ChatCache[1] == "reset")and(ChatCache[2] == GWCOMM[Server].loc)then
				PreparedStatements(1, "guild_name", Server, LocId)
				PreparedStatements(1, "team", 2, LocId)
				PreparedStatements(1, "flag_id", 0, LocId)
				PreparedStatements(1, "fs_time", 0, LocId)
				player:SendBroadcastMessage(GWCOMM[Guildname].color_14.."Area: "..GWARZ[LocId].entry.." succesfully reset.|r");
			return false;
			end
			
			if(ChatCache[1] == "reset")and(ChatCache[2] == GWCOMM[Server].farm)then
				PreparedStatements(1, "farm_count", 0, LocId)
				player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." farm count reset.|r");
			return false;
			end
			
			if(ChatCache[1] == "reset")and(ChatCache[2] == GWCOMM[Server].barrack)then
				PreparedStatements(1, "barrack_count", 0, LocId)
				player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." barrack count reset.|r");
			return false;
			end
			
			if(ChatCache[1] == "reset")and(ChatCache[2] == GWCOMM[Server].hall)then
				PreparedStatements(1, "hall_count", 0, LocId)
				player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." hall count reset.|r");
			return false;
			end
			
			if(ChatCache[1] == "reset")and(ChatCache[2] == GWCOMM[Server].pig)then
				PreparedStatements(1, "pig_count", 0, LocId)
				player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." pig count reset.|r");
			return false;
			end
			
			if(ChatCache[1] == "reset")and(ChatCache[2] == GWCOMM[Server].guard)then
				PreparedStatements(1, "guard_count", 0, LocId)
				player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." guard count reset.|r");
			return false;
			end
			
			if(ChatCache[1] == "reset")and(ChatCache[2] == GWCOMM[Server].buffer)then
				PreparedStatements(1, "vendor1_count", 0, LocId)
				player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." vendor1 count reset.|r");
			return false;
			end

			if(ChatCache[1] == "reload")and(ChatCache[2] == GWCOMM[Server].table)then
				GWtable = {}
				LoadGWtable()
				player:SendBroadcastMessage("|cff00cc00Grumbo\'z Guild Warz Tables Reloaded.|r");
			return false;
			end

			if((ChatCache[1]=="spawn")and(ChatCache[2]=="flag"))then
				if(GWARZ[LocId].team >= 2)then
					player:SendBroadcastMessage("|cffFF0000The Server controls This Land. !! NO NEW FLAG SPAWNED !!|r");
				else
					GMFlagid = PerformIngameSpawn(2, GWCOMM[Server].flag_id+GWARZ[LocId].team, player:GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, 1):GetGUIDLow() -- no flag spawns +GWARZ[LocId].Team
					PreparedStatements(1, "flag_id", GMFlagid, LocId)
					PreparedStatements(1, "fs_time", GetGameTime(), LocId)
					player:SendBroadcastMessage("|cff00cc00New flag spawned for Guild Warz location: "..GWARZ[LocId].entry.."|r");
				end
			return false;
			end
			
			if(ChatCache[1] == GWCOMM[Server].details_loc)then
				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."*************************************");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_8.."Location details:");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Location ID:|r "..GWCOMM[Guildname].color_2..""..GWARZ[LocId].entry.."|r.");

				if(GWARZ[LocId].team==0)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Guild Name:|r "..GWCOMM[Guildname].color_4..""..GWARZ[LocId].guild_name.."|r.");end
				if(GWARZ[LocId].team==1)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Guild Name:|r "..GWCOMM[Guildname].color_5..""..GWARZ[LocId].guild_name.."|r.");end
				if(GWARZ[LocId].team==2)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Guild Name:|r "..GWCOMM[Guildname].color_6..""..GWARZ[LocId].guild_name.."|r.");end
				if(GWARZ[LocId].team==3)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Guild Name:|r "..GWCOMM[Guildname].color_7..""..GWARZ[LocId].guild_name.."|r.");end

				if(GWARZ[LocId].team==0)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Faction: "..GWCOMM[Guildname].color_4.."Alliance.|r");end
				if(GWARZ[LocId].team==1)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Faction: "..GWCOMM[Guildname].color_5.."Horde.|r");end
				if(GWARZ[LocId].team==2)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Faction: "..GWCOMM[Guildname].color_6.."For Sale.|r");end
				if(GWARZ[LocId].team==3)then player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Faction: "..GWCOMM[Guildname].color_7.."LOCKED|r");end

				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Team:|r  "..GWCOMM[Guildname].color_2..""..GWARZ[LocId].team.."|r.");

				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Farm count:|r  "..GWCOMM[Guildname].color_2..""..GWARZ[LocId].farm_count.."|r.");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Barrack count:|r  "..GWCOMM[Guildname].color_2..""..GWARZ[LocId].barrack_count.."|r.");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Hall count:|r  "..GWCOMM[Guildname].color_2..""..GWARZ[LocId].hall_count.."|r.");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Pig count:|r  "..GWCOMM[Guildname].color_2..""..GWARZ[LocId].pig_count.."|r.");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."guard count:|r  "..GWCOMM[Guildname].color_2..""..GWARZ[LocId].guard_count.."|r.");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."vendor1 count:|r  "..GWCOMM[Guildname].color_2..""..GWARZ[LocId].vendor1_count.."|r.");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."vendor2 count:|r  "..GWCOMM[Guildname].color_2..""..GWARZ[LocId].vendor2_count.."|r.");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."vendor3 count:|r  "..GWCOMM[Guildname].color_2..""..GWARZ[LocId].vendor3_count.."|r.");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."flag spawn id:|r  "..GWCOMM[Guildname].color_2..""..GWARZ[LocId].flag_id.."|r.");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."flag spawn time:|r  "..GWCOMM[Guildname].color_2..""..GWARZ[LocId].spawn_time.."|r.");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Guild ID:|r  "..GWCOMM[Guildname].color_2..""..GWARZ[LocId].guild_id.."|r.");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_1.."Game Time:|r  "..GWCOMM[Guildname].color_2..""..GetGameTime().."|r.");
				player:SendBroadcastMessage(GWCOMM[Guildname].color_9.."*************************************");
			return false;
			end
		end
	end
end
	
RegisterPlayerEvent(21, GWcommands)

print ("Guild Warz core version: "..core_version)

-- ****************************************************
-- Pig Payz System -- Ty rochet2 of EmuDevs.com
-- ****************************************************

local function pig_payz(eventid, timer, cycles, player)

	if(player:IsInGuild() == true)then
		
		local pig = 0
		local Glocdb = WorldDBQuery("SELECT `entry` FROM "..guild_warz_DB..".zones WHERE `guild_name` = '"..player:GetGuildName().."' AND `pig_count` > '0';");

		if(Glocdb==nil)then
			player:SendBroadcastMessage("PigPayz: 0 gold.", 0);
			player:SendBroadcastMessage("Zorkster says:Your guild does not own any pigs.", 0);
			player:SendBroadcastMessage("Zorkster says:Inform Your guild master to start some farms.", 0);
		else
			repeat
				local Gloc = Glocdb:GetUInt32(0)
				local Pigcnt = GWARZ[Gloc].pig_count
				pig = (pig+Pigcnt)

			until Glocdb:NextRow()~=true;

			Pigpayz=(GWCOMM[Server].pig_payz*pig)
			player:ModifyMoney(Pigpayz)
			player:SendBroadcastMessage("DemiiGods says:|cff00cc00Your Guild\'s hard work pays off.|r");
			player:SendBroadcastMessage("|cff00cc00PigPayz: "..Pigpayz / '10000'.." gold.|r");
		end
		return false;
	else
		player:SendBroadcastMessage("Requin shouts:|cffff0000Join a guild to earn hourly rewards from Grumbo\'z Guild Warz.|r");
	end
end

local function pig_payz_timer(eventid, player)

	player:RegisterEvent(pig_payz, GWCOMM[Server].pig_payz_timer, 0) 

end

RegisterPlayerEvent(3, pig_payz_timer)

print ("Pig Payz version: "..pigpayz_version);

-- ****************************************************
-- ********** Guild Warz teleporter system ************
-- ** a mild mutation of Grandelf1's guild teleporter *
-- ****************************************************

function Guildteleport(event, player, message, type, language)

local ChatMsg = GWCOMM[player:GetGuildName()].tele
local startpos, endpos = string.find(message, ChatMsg)

	if(startpos == 1) then
		local text = message:gsub(ChatMsg, "")
		if(player:IsInGuild()==true)then
			local Loc = tonumber(text)
			if(GWARZ[Loc]==nil)then
				player:SendBroadcastMessage("Grumbo says:|cffcc0000error.... teleport entry doesn't exsist.|r");
			else
				if(GWARZ[Loc].guild_name~=player:GetGuildName())then
					player:SendBroadcastMessage("Raider says:Your guild doesn't own that area.");
					player:SendBroadcastMessage("Raider says:You cannot teleport there.");
				else
					player:Teleport(GWARZ[Loc].map_id, GWARZ[Loc].x, GWARZ[Loc].y, GWARZ[Loc].z, 1.0)
					player:SendBroadcastMessage("DeadByDawn says:|cff00cc00Teleport complete.|r");
				end
			end
		end
	return false;
	end
end

RegisterPlayerEvent(21, Guildteleport)

print("Teleporter version: "..tele_version);

-- ****************************************************
-- *************** GUILD WARZ PvP System **************
-- ****************************************************

-- ************* Guild Warz Flag actions **************

function TransferFlag(player, locid, go)
	if(go:GetGUIDLow() ~= GWARZ[locid].flag_id)then
		go:Despawn()
		player:SendBroadcastMessage("|cffcc0000error.... Phantom flag removed.|r");
		PreparedStatements(2, "gameobject", go:GetGUIDLow())
		return false;
	end
	
	if(player:IsInGuild()==false)then
		
		if(GWCOMM[GWARZ[locid].guild_name].guild_invite == 1)then
			player:SendBroadcastMessage("|cff00cc00Grumbo\'z Guild Warz System:|r")
			player:SendBroadcastMessage("|cff00cc00"..GWARZ[locid].guild_name.." own\'s this location "..player:GetName()..".|r");
			player:SendBroadcastMessage("|cff00cc00Join a Guild to participate in Grumbo\'z Guild Warz System.|r");
			player:SendBroadcastMessage("|cff00cc00Brought to you by Grumbo.|r");
			Gwarz_Guild_Flag_Hello(1, player, go)
			return false;
		else
			player:SendBroadcastMessage("|cff00cc00Grumbo\'z Guild Warz System:|r");
			player:SendBroadcastMessage("|cff00cc00"..GWARZ[locid].guild_name.." own\'s this location "..player:GetName()..".|r");
			player:SendBroadcastMessage("|cff00cc00Join a Guild to participate in Grumbo\'z Guild Warz System.|r");
			player:SendBroadcastMessage("|cff00cc00Brought to you by Grumbo.|r");
			player:SendBroadcastMessage("|cff00cc00This Guild Master has disabled the guild\'s invite system.|r");
			return false;
		end
	end

	if((player:GetGuildName()==GWARZ[locid].guild_name)or((GWCOMM[Server].anarchy==0)and(player:GetTeam()==GWARZ[locid].team)))then
		player:SendBroadcastMessage("|cff00cc00"..GWARZ[locid].guild_name.." own\'s this location.|r");
		player:SendBroadcastMessage("|cff00cc00Grumbo\'z Guild Warz System.|r");
		return false;
	end
	
	if((player:GetTeam()~=GWARZ[locid].team)and(player:IsInGuild()==true))or((player:GetTeam()==GWARZ[locid].team)and(player:IsInGuild()==true)and(GWCOMM[Server].anarchy==1))then

		if((GWARZ[locid].spawn_time+GWCOMM[Server].spawn_timer > GetGameTime())and(GWCOMM[Server].flag_timer==1))then
			player:SendBroadcastMessage("|cffff0000!!..Cooldown Timer in Affect..!!|r");
		else

			if(GWARZ[locid].guard_count~=0)and(GWCOMM[Server].flag_require==1)then  -- this lil check added to make it tougher to take the land. idea by renatokeys
				player:SendBroadcastMessage("!!..You must clear ALL guards..!!");
			else
				if(	player:GetNearestGameObject(2, (GWCOMM[Server].flag_id+GWARZ[locid].team)))then

					if(((GWARZ[locid].guard_count==0)and(GWCOMM[Server].flag_require==1))or(GWCOMM[Server].flag_require==0))then
						player:GetNearestGameObject(2, (GWCOMM[Server].flag_id+GWARZ[locid].team)):Despawn()
						Nflag = (PerformIngameSpawn(2, (GWCOMM[Server].flag_id)+(player:GetTeam()), player:GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, 1):GetGUIDLow())
						PreparedStatements(2, "gameobject", go:GetGUIDLow())
						SendWorldMessage("|cffff0000!! "..player:GetGuildName().." takes location:"..GWARZ[locid].entry.." from "..GWARZ[locid].guild_name.." !!|r", 1);
						PreparedStatements(1, "guild_name", player:GetGuildName(), locid)
						PreparedStatements(1, "team", player:GetTeam(), locid)
						PreparedStatements(1, "x", player:GetX(), locid)
						PreparedStatements(1, "y", player:GetY(), locid)
						PreparedStatements(1, "z", player:GetZ(), locid)
						PreparedStatements(1, "flag_id", Nflag, locid)
						PreparedStatements(1, "flag_id", Nflag, locid)
						PreparedStatements(1, "fs_time", GetGameTime(), locid)
						PreparedStatements(1, "guild_id", player:GetGuildId(), locid)
					end
				end
			end
		end
	end
	return false;
end

function Tagflag(event, player, go)
	if(player ~= nil)then
		local LocId = GetLocationId(player)
		TransferFlag(player, LocId, go)
	end
end

RegisterGameObjectGossipEvent(GWCOMM[Server].flag_id, 1, Tagflag)
RegisterGameObjectGossipEvent(GWCOMM[Server].flag_id+1, 1, Tagflag)

-- *********** Guild Invite Flag Action ***********

function Gwarz_Guild_Flag_Hello(eventid, player, object)
	local locid = GetLocationId(player)
	player:GossipClearMenu()
	player:GossipMenuAddItem(1,"Join "..GWARZ[locid].guild_name..".",0,10)
	player:GossipMenuAddItem(1,"Nevermind.",0,11)
	player:GossipSendMenu(1, object)
end

function Gwarz_Guild_Flag_Select(eventid, player, object, sender, intid, code)
local locid = GetLocationId(player)
	if (intid == 10) then
		GetGuildByName(GWARZ[locid].guild_name):AddMember(player, 255) -- attempts to add the new member at lowest(255) guild level.
	end
	if (intid == 11) then
	end
player:GossipComplete()
end

RegisterGameObjectGossipEvent(GWCOMM[Server].flag_id, 2, Gwarz_Guild_Flag_Select)
RegisterGameObjectGossipEvent(GWCOMM[Server].flag_id+1, 2, Gwarz_Guild_Flag_Select)

-- *********** Guild Guard combat actions *************
-- these are just basic scripts for the guards. if some one can script a good guard script with the idea in mind to have them guard the flag. I would love to add it.

local function FactionReset(event, timer, cycle, player)
	
	player:SetFaction(GGW[player:GetAccountId()].faction)
end


local function PigWatch(eventid, creature, player)

local LocId = GetLocationId(player)

	if(player:GetObjectType()=="Player")then
	
	local Pteam = GGW[player:GetAccountId()].team
	local LocId = GetLocationId(player)
	
		if(LocId == nil)then
			LocId = CreateLocation(player:GetMapId(), player:GetAreaId(), player:GetZoneId())
		end
	
		if(player:IsInGuild()==true)then

			if((Pteam~=GWARZ[LocId].team)and(player:GetGuildName()~=GWARZ[LocId].guild_name))or((GWCOMM[Server].anarchy==1)and(Pteam==GWARZ[LocId].team)and(player:GetGuildName()~=GWARZ[LocId].guild_name))then
	
				if(GWARZ[LocId].team < 2)then

					if(creature:IsWithinDistInMap(player, 40))then
						
						if(GWARZ[LocId].team==0)then
							player:SetFaction(2)
							local faction_reset = player:RegisterEvent(FactionReset, 10000, 1)
						else
							player:SetFaction(1)
							local faction_reset = player:RegisterEvent(FactionReset, 10000, 1)
						end
					end
				else
				end
			else
			end
		else
		end
	else
	end
end

RegisterCreatureEvent(GWCOMM[Server].pig_id, 27, PigWatch)
RegisterCreatureEvent(GWCOMM[Server].pig_id+1, 27, PigWatch)

function Guardffa(eventid, creature, player)

	if(player:GetObjectType()=="Player")then
	
	local Pteam = GGW[player:GetAccountId()].team
	local LocId = GetLocationId(player)
	
		if(LocId == nil)then
			LocId = CreateLocation(player:GetMapId(), player:GetAreaId(), player:GetZoneId())
		end
	
		if(player:IsInGuild()==true)then
		
			if((Pteam~=GWARZ[LocId].team)and(player:GetGuildName()~=GWARZ[LocId].guild_name))or((GWCOMM[Server].anarchy==1)and(Pteam==GWARZ[LocId].team)and(player:GetGuildName()~=GWARZ[LocId].guild_name))then
		
				if(GWARZ[LocId].team < 2)then
		
					if(creature:IsWithinDistInMap(player, 40))then
						
						if(GWARZ[LocId].team==0)then -- ally faction 84 team 0 ::  horde faction 83 team 1
							player:SetFaction(2) -- 83
							local faction_reset = player:RegisterEvent(FactionReset, 10000, 1)
							creature:AttackStart(player)
						else
							player:SetFaction(1) -- 84
							local faction_reset = player:RegisterEvent(FactionReset, 10000, 1)
							creature:AttackStart(player)
						end
					end
				else
				end
			else
			end
		else
		end
	else
	end
end

RegisterCreatureEvent(GWCOMM[Server].guard_id, 27, Guardffa)
RegisterCreatureEvent(GWCOMM[Server].guard_id+1, 27, Guardffa)

function Guardcombat(eventid, creature, player)

	if(player:GetObjectType()=="Player")then

		local LocId = GetLocationId(creature)
		
		if(LocId == nil)then
			LocId = CreateLocation(creature:GetMapId(), creature:GetAreaId(), creature:GetZoneId())
		end
		
		for _, v in ipairs(GetPlayersInWorld()) do
	
			if(v and v:GetGuildName()==GWARZ[LocId].guild_name) then
				v:SendBroadcastMessage("|cffff0000!!LOCATION "..GWARZ[LocId].entry.." IS UNDER ATTACK!!|r");
			end
		end
	end
end

RegisterCreatureEvent(GWCOMM[Server].guard_id, 1, Guardcombat)
RegisterCreatureEvent(GWCOMM[Server].guard_id+1, 1, Guardcombat)

function Guarddied(eventid, creature, player)
	
	local LocId = GetLocationId(creature)
	
	PreparedStatements(2, "creature", creature:GetGUIDLow())
	PreparedStatements(1, "guard_count", GWARZ[LocId].guard_count-1, LocId)
	
	local Drop = (math.random(1, 4))
	
	for _, v in ipairs(GetPlayersInWorld()) do
		
		if(v and v:GetGuildName()==GWARZ[LocId].guild_name) then
			v:SendBroadcastMessage("|cffcc0000!! I HAVE FAILED AT DEFENDING LOCATION "..LocId.." !!|r");
		end
	end
	
	if(Drop==4)then
		player:AddItem(Guard_Died_Drop, math.random(1, 4))
	end
	
	creature:DespawnOrUnsummon()
end

RegisterCreatureEvent(GWCOMM[Server].guard_id, 4, Guarddied)
RegisterCreatureEvent(GWCOMM[Server].guard_id+1, 4, Guarddied)

function Guardhit(eventid, creature, attacker, damage)

	if(attacker:GetObjectType()=="Player")then

		local LocId = GetLocationId(creature)
	
		if(LocId == nil)then
			LocId = CreateLocation(creature:GetMapId(), creature:GetAreaId(), creature:GetZoneId())
		end
	
		if(attacker:GetObjectType()=="Player")then
			local a = (math.random(1, 4))
			
			if(a==4)then
				
				for _, v in ipairs(GetPlayersInWorld()) do
					
					if(v and v:GetGuildName()==GWARZ[LocId].guild_name) then
						v:SendBroadcastMessage("|cffff0000!!HURRY!! I NEED ASSISTANCE AT LOCATION "..LocId.."...!!HURRY!!|r");
					end
				end
			end
		end
	end
end

RegisterCreatureEvent(GWCOMM[Server].guard_id, 9, Guardhit)
RegisterCreatureEvent(GWCOMM[Server].guard_id+1, 9, Guardhit)

function Guardkill(eventid, creature, victim)
	
	local LocId = GetLocationId(creature)
	
	for _, v in ipairs(GetPlayersInWorld()) do
		
		if(v and v:GetGuildName()==GWARZ[LocId].guild_name) then
			
			v:SendBroadcastMessage("|cff00cc00!! I HAVE KILLED A "..victim:GetObjectType().." INTRUDEING AT LOCATION "..GWARZ[LocId].entry.." !!|r");
			v:SendBroadcastMessage("|cff00cc00I found some gold on him.|r");
			v:ModifyMoney(math.random(100000, 1000000))
		end
	end
end

RegisterCreatureEvent(GWCOMM[Server].guard_id, 3, Guardkill)
RegisterCreatureEvent(GWCOMM[Server].guard_id+1, 3, Guardkill)

print ("PVP core: "..pvp_version)

-- ****************************************************
-- NPC functions
-- ****************************************************

local function buff_NPC(event, player, creature) -- provided by Pyre of EmuDevs.com

local LocId = GetLocationId(creature)
	
	if(GWARZ[LocId].guild_name ~= player:GetGuildName())then
		creature:SendUnitYell("!!Evil doe`r!!", 0)
	else
		player:GossipClearMenu()
		player:GossipMenuAddItem(0, "Armor + 10%", 0, 1)
		player:GossipMenuAddItem(0, "Damage + 1 - 10%", 0, 2)
		player:GossipMenuAddItem(0, "Resistances + 25", 0, 3)
		player:GossipMenuAddItem(0, "Agility + 10%", 0, 4)
		player:GossipMenuAddItem(0, "Intelligence + 10%", 0, 5)
		player:GossipMenuAddItem(0, "Spirit + 10%", 0, 6)
		player:GossipMenuAddItem(0, "Strength + 10%", 0, 7)
		player:GossipMenuAddItem(0, "Stamina + 10%", 0, 8)
		player:GossipMenuAddItem(0, "Heal Me", 0, 9)
		player:GossipSendMenu(1, creature)
	end
end

if(GWCOMM[Server].vendor1_id > 0)then 

	local function On_Buff_Select(event, player, object, sender, intid, code)
	
		if(intid == 1) then	player:AddAura(23767, player);end
		if(intid == 2) then	player:AddAura(23768, player);end
		if(intid == 3) then	player:AddAura(23769, player);end
		if(intid == 4) then	player:AddAura(23736, player);end
		if(intid == 5) then player:AddAura(23766, player);end
		if(intid == 6) then	player:AddAura(23738, player);end
		if(intid == 7) then	player:AddAura(23735, player);end
		if(intid == 8) then	player:AddAura(23737, player);end
		if(intid == 9) then	player:AddAura(25840, player);end
		player:GossipComplete()
	end

	RegisterCreatureGossipEvent(GWCOMM[Server].vendor1_id, 1, buff_NPC)
	RegisterCreatureGossipEvent(GWCOMM[Server].vendor1_id+1, 1, buff_NPC)
	RegisterCreatureGossipEvent(GWCOMM[Server].vendor1_id, 2, On_Buff_Select)
	RegisterCreatureGossipEvent(GWCOMM[Server].vendor1_id+1, 2, On_Buff_Select)
	print("Vendor1 loaded.")
else
	player:SendBroadcastMessage("default vendor1 disabled.")
end

if(GWCOMM[Server].vendor2_id > 0)then print("Vendor2 loaded.")else print("Vendor2 Disabled.");end
if(GWCOMM[Server].vendor3_id > 0)then print("Vendor3 loaded.")else print("Vendor3 Disabled.");end

print ("Vendor core: "..vendor_version)

-- ****************************************************
-- ******************** End OF Line ******************* 
-- ****************************************************

print ("GUILD WARZ ver: "..GW_version.." Loaded.")
local duration = (string.format("Load Time: %0.03f seconds.", os.clock() - start));
print(duration)
print("-----------------------------------\n") 
