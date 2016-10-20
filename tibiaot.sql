/*
Navicat MySQL Data Transfer

Source Server         : tibia
Source Server Version : 100113
Source Host           : localhost:3306
Source Database       : tibiaot

Target Server Type    : MYSQL
Target Server Version : 100113
File Encoding         : 65001

Date: 2016-10-20 18:30:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL,
  `salt` varchar(40) NOT NULL DEFAULT '',
  `premdays` int(11) NOT NULL DEFAULT '0',
  `lastday` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `key` varchar(32) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'internal usage',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES ('1', '1', '356a192b7913b04c54574d18c28d46e6395428ab', '', '65535', '1476934864', '', '0', '0', '0', '1');
INSERT INTO `accounts` VALUES ('2', '746917', 'b630b19786022f3eda8cbf5049728d521eec4e43', 'K3NDbSHhLu8HN9BoHah-6Mcgk4QJ9ca73jx6jc8', '84', '1476928027', '', '0', '0', '0', '1');
INSERT INTO `accounts` VALUES ('3', '7777778', '32e9f8a02faebbd50b3dff7f84b275b06cea8054', '978pm3rVGWsHumTx89u-7fq6IOjz4ZRIC3av6L5', '0', '1476851766', '', '0', '0', '0', '1');
INSERT INTO `accounts` VALUES ('4', '292000', 'f96df819f310e3f0225a14771bee23709c7d6f94', '2Crgw928iqB3r7574Fy-dO82SArYgnIngUjIYzP', '0', '1476934864', '', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for account_viplist
-- ----------------------------
DROP TABLE IF EXISTS `account_viplist`;
CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  UNIQUE KEY `account_id_2` (`account_id`,`player_id`),
  KEY `account_id` (`account_id`),
  KEY `player_id` (`player_id`),
  KEY `world_id` (`world_id`),
  CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of account_viplist
-- ----------------------------
INSERT INTO `account_viplist` VALUES ('2', '0', '8');

-- ----------------------------
-- Table structure for bans
-- ----------------------------
DROP TABLE IF EXISTS `bans`;
CREATE TABLE `bans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '1 - ip banishment, 2 - namelock, 3 - account banishment, 4 - notation, 5 - deletion',
  `value` int(10) unsigned NOT NULL COMMENT 'ip address (integer), player guid or account number',
  `param` int(10) unsigned NOT NULL DEFAULT '4294967295' COMMENT 'used only for ip banishment mask (integer)',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `expires` int(11) NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `reason` int(10) unsigned NOT NULL DEFAULT '0',
  `action` int(10) unsigned NOT NULL DEFAULT '0',
  `statement` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`value`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bans
-- ----------------------------

-- ----------------------------
-- Table structure for environment_killers
-- ----------------------------
DROP TABLE IF EXISTS `environment_killers`;
CREATE TABLE `environment_killers` (
  `kill_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  KEY `kill_id` (`kill_id`),
  CONSTRAINT `environment_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of environment_killers
-- ----------------------------
INSERT INTO `environment_killers` VALUES ('1', 'a Dark Torturer');
INSERT INTO `environment_killers` VALUES ('3', 'a hellfire fighter');
INSERT INTO `environment_killers` VALUES ('4', 'a fire devil');
INSERT INTO `environment_killers` VALUES ('5', 'a plaguesmith');
INSERT INTO `environment_killers` VALUES ('6', 'a defiler');
INSERT INTO `environment_killers` VALUES ('7', 'a Diabolic Imp');
INSERT INTO `environment_killers` VALUES ('8', 'a Dark Torturer');
INSERT INTO `environment_killers` VALUES ('9', 'a plaguesmith');
INSERT INTO `environment_killers` VALUES ('10', 'a defiler');
INSERT INTO `environment_killers` VALUES ('11', 'a fire devil');
INSERT INTO `environment_killers` VALUES ('12', 'Lucifer');
INSERT INTO `environment_killers` VALUES ('13', 'Devovorga');
INSERT INTO `environment_killers` VALUES ('14', 'a Hand of Cursed Fate');
INSERT INTO `environment_killers` VALUES ('15', 'a Blightwalker');
INSERT INTO `environment_killers` VALUES ('16', 'a Dark Torturer');
INSERT INTO `environment_killers` VALUES ('17', 'a betrayed wraith');
INSERT INTO `environment_killers` VALUES ('18', 'a plaguesmith');
INSERT INTO `environment_killers` VALUES ('19', 'a destroyer');
INSERT INTO `environment_killers` VALUES ('20', 'a Juggernaut');
INSERT INTO `environment_killers` VALUES ('21', 'a destroyer');
INSERT INTO `environment_killers` VALUES ('22', 'a fury');
INSERT INTO `environment_killers` VALUES ('23', 'a Hand of Cursed Fate');
INSERT INTO `environment_killers` VALUES ('24', 'a Dark Torturer');
INSERT INTO `environment_killers` VALUES ('25', 'a plaguesmith');
INSERT INTO `environment_killers` VALUES ('26', 'a demon');
INSERT INTO `environment_killers` VALUES ('27', 'a betrayed wraith');
INSERT INTO `environment_killers` VALUES ('28', 'a Blightwalker');
INSERT INTO `environment_killers` VALUES ('29', 'zugurosh');
INSERT INTO `environment_killers` VALUES ('30', 'a mercury blob');
INSERT INTO `environment_killers` VALUES ('31', 'a mutated rat');
INSERT INTO `environment_killers` VALUES ('32', 'an acid blob');
INSERT INTO `environment_killers` VALUES ('33', 'a mercury blob');
INSERT INTO `environment_killers` VALUES ('34', 'a mutated rat');
INSERT INTO `environment_killers` VALUES ('35', 'a mutated rat');
INSERT INTO `environment_killers` VALUES ('36', 'a mutated human');
INSERT INTO `environment_killers` VALUES ('37', 'a mercury blob');
INSERT INTO `environment_killers` VALUES ('38', 'an acid blob');
INSERT INTO `environment_killers` VALUES ('39', 'a slime');
INSERT INTO `environment_killers` VALUES ('40', 'a demon');
INSERT INTO `environment_killers` VALUES ('42', 'Ferumbras');
INSERT INTO `environment_killers` VALUES ('43', 'a demon');
INSERT INTO `environment_killers` VALUES ('44', 'Ferumbras');
INSERT INTO `environment_killers` VALUES ('45', 'a fire elemental');
INSERT INTO `environment_killers` VALUES ('46', 'a demon');
INSERT INTO `environment_killers` VALUES ('47', 'a demon');
INSERT INTO `environment_killers` VALUES ('48', 'a demon');
INSERT INTO `environment_killers` VALUES ('49', 'Ferumbras');
INSERT INTO `environment_killers` VALUES ('50', 'a demon');
INSERT INTO `environment_killers` VALUES ('51', 'Ferumbras');
INSERT INTO `environment_killers` VALUES ('52', 'a demon');
INSERT INTO `environment_killers` VALUES ('53', 'a demon');
INSERT INTO `environment_killers` VALUES ('54', 'a demon');
INSERT INTO `environment_killers` VALUES ('55', 'a demon');
INSERT INTO `environment_killers` VALUES ('56', 'a demon');
INSERT INTO `environment_killers` VALUES ('57', 'a demon');
INSERT INTO `environment_killers` VALUES ('58', 'a fire elemental');
INSERT INTO `environment_killers` VALUES ('59', 'a fire elemental');
INSERT INTO `environment_killers` VALUES ('60', 'Frazzlemaw');
INSERT INTO `environment_killers` VALUES ('62', 'a silencer');
INSERT INTO `environment_killers` VALUES ('63', 'Frazzlemaw');
INSERT INTO `environment_killers` VALUES ('65', 'a guzzlemaw');
INSERT INTO `environment_killers` VALUES ('66', 'Frazzlemaw');
INSERT INTO `environment_killers` VALUES ('67', 'a guzzlemaw');
INSERT INTO `environment_killers` VALUES ('68', 'a silencer');

-- ----------------------------
-- Table structure for global_storage
-- ----------------------------
DROP TABLE IF EXISTS `global_storage`;
CREATE TABLE `global_storage` (
  `key` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  UNIQUE KEY `key` (`key`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of global_storage
-- ----------------------------
INSERT INTO `global_storage` VALUES ('1010', '0', '1476934409');
INSERT INTO `global_storage` VALUES ('3030', '0', '0');
INSERT INTO `global_storage` VALUES ('3031', '0', '0');
INSERT INTO `global_storage` VALUES ('3032', '0', '-1');
INSERT INTO `global_storage` VALUES ('3033', '0', '-1');
INSERT INTO `global_storage` VALUES ('3039', '0', '-1');
INSERT INTO `global_storage` VALUES ('4000', '0', '-1');
INSERT INTO `global_storage` VALUES ('4001', '0', '-1');
INSERT INTO `global_storage` VALUES ('5000', '0', '-1');
INSERT INTO `global_storage` VALUES ('5001', '0', '-1');
INSERT INTO `global_storage` VALUES ('5002', '0', '-1');
INSERT INTO `global_storage` VALUES ('11257', '0', '1');
INSERT INTO `global_storage` VALUES ('11258', '0', '1');
INSERT INTO `global_storage` VALUES ('42299', '0', '0');
INSERT INTO `global_storage` VALUES ('42300', '0', '0');
INSERT INTO `global_storage` VALUES ('42301', '0', '0');
INSERT INTO `global_storage` VALUES ('42302', '0', '0');
INSERT INTO `global_storage` VALUES ('42303', '0', '0');
INSERT INTO `global_storage` VALUES ('42304', '0', '0');
INSERT INTO `global_storage` VALUES ('42305', '0', '0');
INSERT INTO `global_storage` VALUES ('42306', '0', '0');
INSERT INTO `global_storage` VALUES ('42307', '0', '0');
INSERT INTO `global_storage` VALUES ('42308', '0', '0');
INSERT INTO `global_storage` VALUES ('42309', '0', '0');
INSERT INTO `global_storage` VALUES ('42400', '0', '1073758322');
INSERT INTO `global_storage` VALUES ('42401', '0', '1073758323');
INSERT INTO `global_storage` VALUES ('42402', '0', '1073758324');
INSERT INTO `global_storage` VALUES ('42403', '0', '1073758325');
INSERT INTO `global_storage` VALUES ('42404', '0', '1073758326');
INSERT INTO `global_storage` VALUES ('42405', '0', '1073758327');
INSERT INTO `global_storage` VALUES ('42406', '0', '1073758328');
INSERT INTO `global_storage` VALUES ('42407', '0', '1073758329');
INSERT INTO `global_storage` VALUES ('42408', '0', '1073758330');
INSERT INTO `global_storage` VALUES ('42409', '0', '1073758331');
INSERT INTO `global_storage` VALUES ('415029', '0', '1');
INSERT INTO `global_storage` VALUES ('415030', '0', '0.359');
INSERT INTO `global_storage` VALUES ('415031', '0', '1');

-- ----------------------------
-- Table structure for guilds
-- ----------------------------
DROP TABLE IF EXISTS `guilds`;
CREATE TABLE `guilds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `checkdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL,
  `balance` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of guilds
-- ----------------------------

-- ----------------------------
-- Table structure for guild_invites
-- ----------------------------
DROP TABLE IF EXISTS `guild_invites`;
CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `guild_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id` (`player_id`,`guild_id`),
  KEY `guild_id` (`guild_id`),
  CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of guild_invites
-- ----------------------------

-- ----------------------------
-- Table structure for guild_kills
-- ----------------------------
DROP TABLE IF EXISTS `guild_kills`;
CREATE TABLE `guild_kills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `war_id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`),
  KEY `war_id` (`war_id`),
  KEY `death_id` (`death_id`),
  CONSTRAINT `guild_kills_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  CONSTRAINT `guild_kills_ibfk_2` FOREIGN KEY (`war_id`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `guild_kills_ibfk_3` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of guild_kills
-- ----------------------------

-- ----------------------------
-- Table structure for guild_ranks
-- ----------------------------
DROP TABLE IF EXISTS `guild_ranks`;
CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 - leader, 2 - vice leader, 3 - member',
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`),
  CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of guild_ranks
-- ----------------------------

-- ----------------------------
-- Table structure for guild_wars
-- ----------------------------
DROP TABLE IF EXISTS `guild_wars`;
CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `enemy_id` int(11) NOT NULL,
  `begin` bigint(20) NOT NULL DEFAULT '0',
  `end` bigint(20) NOT NULL DEFAULT '0',
  `frags` int(10) unsigned NOT NULL DEFAULT '0',
  `payment` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guild_kills` int(10) unsigned NOT NULL DEFAULT '0',
  `enemy_kills` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `guild_id` (`guild_id`),
  KEY `enemy_id` (`enemy_id`),
  CONSTRAINT `guild_wars_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  CONSTRAINT `guild_wars_ibfk_2` FOREIGN KEY (`enemy_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of guild_wars
-- ----------------------------

-- ----------------------------
-- Table structure for houses
-- ----------------------------
DROP TABLE IF EXISTS `houses`;
CREATE TABLE `houses` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL,
  `paid` int(10) unsigned NOT NULL DEFAULT '0',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `lastwarning` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `town` int(10) unsigned NOT NULL DEFAULT '0',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `rent` int(10) unsigned NOT NULL DEFAULT '0',
  `doors` int(10) unsigned NOT NULL DEFAULT '0',
  `beds` int(10) unsigned NOT NULL DEFAULT '0',
  `tiles` int(10) unsigned NOT NULL DEFAULT '0',
  `guild` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clear` tinyint(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of houses
-- ----------------------------
INSERT INTO `houses` VALUES ('1', '0', '0', '0', '0', '0', 'Enigma Square I', '0', '68', '68000', '3500', '3', '0', '71', '0', '0');
INSERT INTO `houses` VALUES ('2', '0', '0', '0', '0', '0', 'Enigma Square II', '0', '60', '60000', '3150', '3', '0', '63', '0', '0');
INSERT INTO `houses` VALUES ('3', '0', '0', '0', '0', '0', 'Enigma Square III', '0', '50', '50000', '2700', '4', '0', '54', '0', '0');
INSERT INTO `houses` VALUES ('4', '0', '0', '0', '0', '0', 'Enigma Square IV', '0', '73', '73000', '3800', '3', '0', '94', '0', '0');
INSERT INTO `houses` VALUES ('5', '0', '0', '0', '0', '0', 'Enigma Square V', '0', '67', '69000', '3700', '3', '2', '94', '0', '0');
INSERT INTO `houses` VALUES ('6', '0', '0', '0', '0', '0', 'Enigma Square VI', '0', '59', '59000', '3100', '3', '0', '74', '0', '0');
INSERT INTO `houses` VALUES ('7', '0', '0', '0', '0', '0', 'Enigma Square VII', '0', '68', '68000', '3500', '2', '0', '101', '0', '0');
INSERT INTO `houses` VALUES ('8', '0', '0', '0', '0', '0', 'Enigma Square VIII', '0', '81', '81000', '4150', '2', '0', '110', '0', '0');
INSERT INTO `houses` VALUES ('9', '0', '0', '0', '0', '0', 'Enigma Square IX', '0', '60', '60000', '3050', '1', '0', '85', '0', '0');
INSERT INTO `houses` VALUES ('10', '0', '0', '0', '0', '0', 'Enigma Plaza I', '0', '20', '20000', '1050', '1', '0', '21', '0', '0');
INSERT INTO `houses` VALUES ('11', '0', '0', '0', '0', '0', 'Enigma Plaza II', '0', '28', '28000', '1450', '1', '0', '29', '0', '0');
INSERT INTO `houses` VALUES ('12', '0', '0', '0', '0', '0', 'Enigma Plaza III', '0', '21', '21000', '1100', '1', '0', '22', '0', '0');
INSERT INTO `houses` VALUES ('13', '0', '0', '0', '0', '0', 'Enigma Plaza IV', '0', '34', '34000', '1750', '1', '0', '35', '0', '0');
INSERT INTO `houses` VALUES ('14', '0', '0', '0', '0', '0', 'Boat Lane I', '0', '123', '123000', '6300', '3', '0', '126', '0', '0');
INSERT INTO `houses` VALUES ('15', '0', '0', '0', '0', '0', 'Boat Lane II', '0', '78', '78000', '4000', '3', '0', '81', '0', '0');
INSERT INTO `houses` VALUES ('16', '0', '0', '0', '0', '0', 'Western Flat I', '0', '30', '30000', '1600', '2', '0', '32', '0', '0');
INSERT INTO `houses` VALUES ('17', '0', '0', '0', '0', '0', 'Western Flat II', '0', '30', '30000', '1600', '2', '0', '32', '0', '0');
INSERT INTO `houses` VALUES ('18', '0', '0', '0', '0', '0', 'Western Flat III', '0', '30', '30000', '1550', '1', '0', '31', '0', '0');
INSERT INTO `houses` VALUES ('19', '0', '0', '0', '0', '0', 'Western Flat IV', '0', '30', '30000', '1550', '1', '0', '31', '0', '0');
INSERT INTO `houses` VALUES ('20', '0', '0', '0', '0', '0', 'Western Flat V', '0', '30', '30000', '1550', '1', '0', '31', '0', '0');
INSERT INTO `houses` VALUES ('21', '0', '0', '0', '0', '0', '', '0', '74', '80000', '0', '6', '6', '148', '0', '0');
INSERT INTO `houses` VALUES ('22', '0', '0', '0', '0', '0', 'Forbidden 1', '0', '75', '81000', '0', '6', '6', '143', '0', '0');
INSERT INTO `houses` VALUES ('23', '0', '0', '0', '0', '0', 'Eastern Flat II', '0', '30', '30000', '1600', '2', '0', '32', '0', '0');
INSERT INTO `houses` VALUES ('24', '0', '0', '0', '0', '0', 'Eastern Flat III', '0', '30', '30000', '1550', '1', '0', '31', '0', '0');
INSERT INTO `houses` VALUES ('25', '0', '0', '0', '0', '0', 'Eastern Flat IV', '0', '30', '30000', '1550', '1', '0', '31', '0', '0');
INSERT INTO `houses` VALUES ('26', '0', '0', '0', '0', '0', 'Eastern Flat V', '0', '30', '30000', '1550', '1', '0', '31', '0', '0');
INSERT INTO `houses` VALUES ('27', '0', '0', '0', '0', '0', 'Eastern Flat VI', '0', '30', '30000', '1550', '1', '0', '31', '0', '0');
INSERT INTO `houses` VALUES ('28', '0', '0', '0', '0', '0', 'Ocean Mansion', '0', '39', '39000', '2000', '2', '0', '41', '0', '0');
INSERT INTO `houses` VALUES ('29', '0', '0', '0', '0', '0', 'Ocean Plaza I', '0', '16', '16000', '850', '1', '0', '17', '0', '0');
INSERT INTO `houses` VALUES ('30', '0', '0', '0', '0', '0', 'Ocean Plaza II', '0', '16', '16000', '850', '1', '0', '17', '0', '0');
INSERT INTO `houses` VALUES ('31', '0', '0', '0', '0', '0', 'Ocean Plaza III', '0', '16', '16000', '850', '1', '0', '17', '0', '0');
INSERT INTO `houses` VALUES ('32', '0', '0', '0', '0', '0', 'Guildhouse of the Park', '0', '214', '214000', '11500', '9', '0', '223', '0', '0');
INSERT INTO `houses` VALUES ('33', '0', '0', '0', '0', '0', '', '0', '15', '16000', '0', '1', '1', '21', '0', '0');
INSERT INTO `houses` VALUES ('34', '0', '0', '0', '0', '0', '', '0', '9', '10000', '0', '1', '1', '12', '0', '0');
INSERT INTO `houses` VALUES ('35', '0', '0', '0', '0', '0', '', '0', '12', '13000', '0', '1', '1', '16', '0', '0');
INSERT INTO `houses` VALUES ('36', '0', '0', '0', '0', '0', '', '0', '14', '15000', '0', '1', '1', '19', '0', '0');
INSERT INTO `houses` VALUES ('37', '0', '0', '0', '0', '0', '', '0', '64', '67000', '0', '4', '3', '89', '0', '0');
INSERT INTO `houses` VALUES ('38', '0', '0', '0', '0', '0', 'Park Flat II', '0', '24', '24000', '1500', '2', '0', '26', '0', '0');
INSERT INTO `houses` VALUES ('39', '0', '0', '0', '0', '0', 'Park Flat III', '0', '28', '28000', '1450', '1', '0', '29', '0', '0');
INSERT INTO `houses` VALUES ('40', '0', '0', '0', '0', '0', 'Park Lane I', '0', '75', '75000', '3750', '1', '0', '76', '0', '0');
INSERT INTO `houses` VALUES ('41', '0', '0', '0', '0', '0', 'Park Lane II', '0', '75', '75000', '3750', '1', '0', '76', '0', '0');
INSERT INTO `houses` VALUES ('42', '0', '0', '0', '0', '0', 'River Street I', '0', '24', '24000', '1250', '1', '0', '25', '0', '0');
INSERT INTO `houses` VALUES ('43', '0', '0', '0', '0', '0', 'River Street II', '0', '24', '24000', '1250', '1', '0', '25', '0', '0');
INSERT INTO `houses` VALUES ('44', '0', '0', '0', '0', '0', 'River Street III', '0', '24', '24000', '1250', '1', '0', '25', '0', '0');
INSERT INTO `houses` VALUES ('45', '0', '0', '0', '0', '0', 'Wizard\'s House I', '0', '24', '24000', '1250', '1', '0', '25', '0', '0');
INSERT INTO `houses` VALUES ('46', '0', '0', '0', '0', '0', 'Wizard\'s House II', '0', '24', '24000', '1250', '1', '0', '25', '0', '0');
INSERT INTO `houses` VALUES ('47', '0', '0', '0', '0', '0', 'Wizard\'s House III', '0', '24', '24000', '1250', '1', '0', '25', '0', '0');
INSERT INTO `houses` VALUES ('48', '0', '0', '0', '0', '0', 'Mystical House', '0', '71', '71000', '0', '3', '0', '74', '0', '0');
INSERT INTO `houses` VALUES ('49', '0', '0', '0', '0', '0', 'Guildhouse of the River', '0', '217', '217000', '11400', '11', '0', '228', '0', '0');
INSERT INTO `houses` VALUES ('120', '0', '0', '0', '0', '0', '', '0', '12', '13000', '0', '1', '1', '15', '0', '0');
INSERT INTO `houses` VALUES ('121', '0', '0', '0', '0', '0', '', '0', '13', '14000', '0', '1', '1', '16', '0', '0');
INSERT INTO `houses` VALUES ('122', '0', '0', '0', '0', '0', '', '0', '10', '11000', '0', '1', '1', '13', '0', '0');
INSERT INTO `houses` VALUES ('123', '0', '0', '0', '0', '0', '', '0', '16', '18000', '0', '1', '2', '21', '0', '0');
INSERT INTO `houses` VALUES ('124', '0', '0', '0', '0', '0', '', '0', '7', '8000', '0', '1', '1', '10', '0', '0');
INSERT INTO `houses` VALUES ('125', '0', '0', '0', '0', '0', '', '0', '9', '10000', '0', '2', '1', '13', '0', '0');
INSERT INTO `houses` VALUES ('126', '0', '0', '0', '0', '0', '', '0', '13', '14000', '0', '1', '1', '16', '0', '0');
INSERT INTO `houses` VALUES ('127', '0', '0', '0', '0', '0', '', '0', '12', '13000', '0', '1', '1', '16', '0', '0');
INSERT INTO `houses` VALUES ('128', '0', '0', '0', '0', '0', '', '0', '9', '10000', '0', '1', '1', '13', '0', '0');
INSERT INTO `houses` VALUES ('129', '0', '0', '0', '0', '0', '', '0', '11', '12000', '0', '1', '1', '15', '0', '0');
INSERT INTO `houses` VALUES ('130', '0', '0', '0', '0', '0', '', '0', '13', '14000', '0', '1', '1', '16', '0', '0');
INSERT INTO `houses` VALUES ('131', '0', '0', '0', '0', '0', '', '0', '11', '13000', '0', '1', '2', '17', '0', '0');
INSERT INTO `houses` VALUES ('132', '0', '0', '0', '0', '0', '', '0', '7', '8000', '0', '1', '1', '10', '0', '0');
INSERT INTO `houses` VALUES ('133', '0', '0', '0', '0', '0', '', '0', '14', '15000', '0', '1', '1', '17', '0', '0');
INSERT INTO `houses` VALUES ('134', '0', '0', '0', '0', '0', '', '0', '18', '19000', '0', '1', '1', '21', '0', '0');
INSERT INTO `houses` VALUES ('135', '0', '0', '0', '0', '0', '', '0', '127', '135000', '0', '12', '8', '160', '0', '0');
INSERT INTO `houses` VALUES ('136', '0', '0', '0', '0', '0', '', '0', '25', '27000', '0', '2', '2', '31', '0', '0');
INSERT INTO `houses` VALUES ('137', '0', '0', '0', '0', '0', '', '0', '21', '23000', '0', '2', '2', '28', '0', '0');
INSERT INTO `houses` VALUES ('138', '0', '0', '0', '0', '0', '', '0', '16', '17000', '0', '1', '1', '19', '0', '0');
INSERT INTO `houses` VALUES ('139', '0', '0', '0', '0', '0', '', '0', '10', '11000', '0', '1', '1', '13', '0', '0');
INSERT INTO `houses` VALUES ('140', '0', '0', '0', '0', '0', '', '0', '18', '19000', '0', '2', '1', '22', '0', '0');
INSERT INTO `houses` VALUES ('141', '0', '0', '0', '0', '0', '', '0', '18', '20000', '0', '2', '2', '25', '0', '0');
INSERT INTO `houses` VALUES ('142', '0', '0', '0', '0', '0', '', '0', '14', '15000', '0', '2', '1', '19', '0', '0');
INSERT INTO `houses` VALUES ('143', '0', '0', '0', '0', '0', '', '0', '24', '24000', '0', '2', '0', '26', '0', '0');
INSERT INTO `houses` VALUES ('144', '0', '0', '0', '0', '0', '', '0', '15', '15000', '0', '1', '0', '16', '0', '0');
INSERT INTO `houses` VALUES ('145', '0', '0', '0', '0', '0', '', '0', '15', '15000', '0', '1', '0', '16', '0', '0');
INSERT INTO `houses` VALUES ('146', '0', '0', '0', '0', '0', '', '0', '20', '20000', '0', '2', '0', '22', '0', '0');
INSERT INTO `houses` VALUES ('147', '0', '0', '0', '0', '0', '', '0', '9', '10000', '0', '1', '1', '12', '0', '0');
INSERT INTO `houses` VALUES ('148', '0', '0', '0', '0', '0', '', '0', '6', '6000', '0', '1', '0', '7', '0', '0');
INSERT INTO `houses` VALUES ('149', '0', '0', '0', '0', '0', '', '0', '12', '13000', '0', '2', '1', '16', '0', '0');
INSERT INTO `houses` VALUES ('150', '0', '0', '0', '0', '0', '', '0', '4', '4000', '0', '1', '0', '5', '0', '0');
INSERT INTO `houses` VALUES ('151', '0', '0', '0', '0', '0', '', '0', '8', '9000', '0', '1', '1', '11', '0', '0');
INSERT INTO `houses` VALUES ('152', '0', '0', '0', '0', '0', '', '0', '16', '17000', '0', '1', '1', '19', '0', '0');
INSERT INTO `houses` VALUES ('153', '0', '0', '0', '0', '0', '', '0', '14', '15000', '0', '1', '1', '17', '0', '0');
INSERT INTO `houses` VALUES ('154', '0', '0', '0', '0', '0', '', '0', '14', '16000', '0', '2', '2', '20', '0', '0');
INSERT INTO `houses` VALUES ('155', '0', '0', '0', '0', '0', '', '0', '22', '24000', '0', '1', '2', '27', '0', '0');
INSERT INTO `houses` VALUES ('156', '0', '0', '0', '0', '0', '', '0', '24', '25000', '0', '2', '1', '28', '0', '0');
INSERT INTO `houses` VALUES ('157', '0', '0', '0', '0', '0', '', '0', '17', '19000', '0', '2', '2', '23', '0', '0');
INSERT INTO `houses` VALUES ('158', '0', '0', '0', '0', '0', '', '0', '14', '15000', '0', '1', '1', '17', '0', '0');
INSERT INTO `houses` VALUES ('159', '0', '0', '0', '0', '0', '', '0', '15', '16000', '0', '1', '1', '18', '0', '0');
INSERT INTO `houses` VALUES ('160', '0', '0', '0', '0', '0', '', '0', '12', '13000', '0', '2', '1', '17', '0', '0');
INSERT INTO `houses` VALUES ('161', '0', '0', '0', '0', '0', '', '0', '9', '9000', '0', '1', '0', '10', '0', '0');
INSERT INTO `houses` VALUES ('162', '0', '0', '0', '0', '0', '', '0', '13', '14000', '0', '2', '1', '17', '0', '0');
INSERT INTO `houses` VALUES ('163', '0', '0', '0', '0', '0', '', '0', '9', '10000', '0', '1', '1', '12', '0', '0');
INSERT INTO `houses` VALUES ('164', '0', '0', '0', '0', '0', '', '0', '36', '38000', '0', '1', '2', '41', '0', '0');
INSERT INTO `houses` VALUES ('165', '0', '0', '0', '0', '0', '', '0', '23', '25000', '0', '1', '2', '28', '0', '0');
INSERT INTO `houses` VALUES ('166', '0', '0', '0', '0', '0', '', '0', '21', '22000', '0', '1', '1', '24', '0', '0');
INSERT INTO `houses` VALUES ('167', '0', '0', '0', '0', '0', '', '0', '32', '34000', '0', '2', '2', '38', '0', '0');
INSERT INTO `houses` VALUES ('168', '0', '0', '0', '0', '0', '', '0', '22', '23000', '0', '1', '1', '25', '0', '0');
INSERT INTO `houses` VALUES ('169', '0', '0', '0', '0', '0', '', '0', '15', '16000', '0', '1', '1', '18', '0', '0');
INSERT INTO `houses` VALUES ('170', '0', '0', '0', '0', '0', '', '0', '22', '24000', '0', '1', '2', '27', '0', '0');
INSERT INTO `houses` VALUES ('171', '0', '0', '0', '0', '0', '', '0', '14', '15000', '0', '1', '1', '17', '0', '0');
INSERT INTO `houses` VALUES ('172', '0', '0', '0', '0', '0', '', '0', '22', '23000', '0', '1', '1', '25', '0', '0');
INSERT INTO `houses` VALUES ('173', '0', '0', '0', '0', '0', '', '0', '19', '20000', '0', '1', '1', '22', '0', '0');
INSERT INTO `houses` VALUES ('174', '0', '0', '0', '0', '0', '', '0', '18', '19000', '0', '3', '1', '23', '0', '0');
INSERT INTO `houses` VALUES ('175', '0', '0', '0', '0', '0', 'Thist 3', '2', '22', '23000', '0', '1', '1', '25', '0', '0');
INSERT INTO `houses` VALUES ('176', '0', '0', '0', '0', '0', 'Thist 4', '2', '20', '21000', '0', '1', '1', '23', '0', '0');
INSERT INTO `houses` VALUES ('177', '0', '0', '0', '0', '0', 'Thist 5', '2', '24', '24000', '0', '1', '0', '25', '0', '0');
INSERT INTO `houses` VALUES ('178', '0', '0', '0', '0', '0', 'Thist 6', '2', '17', '18000', '0', '2', '1', '21', '0', '0');
INSERT INTO `houses` VALUES ('179', '0', '0', '0', '0', '0', 'Thist 7', '2', '27', '27000', '0', '1', '0', '28', '0', '0');
INSERT INTO `houses` VALUES ('180', '0', '0', '0', '0', '0', 'Thist 8', '2', '21', '22000', '0', '2', '1', '25', '0', '0');
INSERT INTO `houses` VALUES ('181', '0', '0', '0', '0', '0', 'Thist 9', '2', '26', '27000', '0', '2', '1', '30', '0', '0');
INSERT INTO `houses` VALUES ('182', '0', '0', '0', '0', '0', '', '0', '14', '15000', '0', '1', '1', '17', '0', '0');
INSERT INTO `houses` VALUES ('183', '0', '0', '0', '0', '0', '', '0', '24', '24000', '0', '1', '0', '25', '0', '0');
INSERT INTO `houses` VALUES ('184', '0', '0', '0', '0', '0', '', '0', '25', '26000', '0', '2', '1', '29', '0', '0');
INSERT INTO `houses` VALUES ('271', '0', '0', '0', '0', '0', 'Thist 1', '2', '16', '16000', '0', '1', '0', '17', '0', '0');
INSERT INTO `houses` VALUES ('272', '0', '0', '0', '0', '0', '', '0', '13', '13000', '0', '1', '0', '13', '0', '0');
INSERT INTO `houses` VALUES ('273', '0', '0', '0', '0', '0', 'Forbidden', '0', '16', '16000', '0', '1', '0', '17', '0', '0');
INSERT INTO `houses` VALUES ('274', '0', '0', '0', '0', '0', '', '0', '13', '13000', '0', '1', '0', '13', '0', '0');
INSERT INTO `houses` VALUES ('275', '0', '0', '0', '0', '0', '', '0', '17', '17000', '0', '1', '0', '17', '0', '0');
INSERT INTO `houses` VALUES ('276', '0', '0', '0', '0', '0', '', '0', '12', '12000', '0', '1', '0', '13', '0', '0');
INSERT INTO `houses` VALUES ('277', '0', '0', '0', '0', '0', '', '0', '17', '17000', '0', '1', '0', '17', '0', '0');
INSERT INTO `houses` VALUES ('278', '0', '0', '0', '0', '0', '', '0', '13', '13000', '0', '1', '0', '13', '0', '0');
INSERT INTO `houses` VALUES ('279', '0', '0', '0', '0', '0', 'Kroten 1', '3', '20', '22000', '0', '1', '2', '26', '0', '0');
INSERT INTO `houses` VALUES ('280', '0', '0', '0', '0', '0', 'Kroten 2', '3', '10', '11000', '0', '1', '1', '15', '0', '0');
INSERT INTO `houses` VALUES ('281', '0', '0', '0', '0', '0', 'Kroten 3', '3', '10', '11000', '0', '1', '1', '15', '0', '0');
INSERT INTO `houses` VALUES ('282', '0', '0', '0', '0', '0', 'Kroten 4', '3', '10', '11000', '0', '1', '1', '15', '0', '0');
INSERT INTO `houses` VALUES ('283', '0', '0', '0', '0', '0', 'Kroten 5', '3', '20', '22000', '0', '3', '2', '30', '0', '0');
INSERT INTO `houses` VALUES ('284', '0', '0', '0', '0', '0', 'Kroten 6', '3', '32', '36000', '0', '2', '4', '64', '0', '0');
INSERT INTO `houses` VALUES ('285', '0', '0', '0', '0', '0', 'Kroten 7', '3', '10', '11000', '0', '1', '1', '15', '0', '0');
INSERT INTO `houses` VALUES ('286', '0', '0', '0', '0', '0', 'Kroten 8', '3', '64', '69000', '0', '4', '5', '81', '0', '0');
INSERT INTO `houses` VALUES ('287', '0', '0', '0', '0', '0', 'Kroten 9', '3', '12', '14000', '0', '1', '2', '19', '0', '0');
INSERT INTO `houses` VALUES ('288', '0', '0', '0', '0', '0', 'Kroten 10', '3', '7', '8000', '0', '1', '1', '10', '0', '0');
INSERT INTO `houses` VALUES ('289', '0', '0', '0', '0', '0', 'Kroten 11', '3', '18', '19000', '0', '2', '1', '23', '0', '0');
INSERT INTO `houses` VALUES ('290', '0', '0', '0', '0', '0', 'Kroten 12', '3', '66', '70000', '0', '5', '4', '86', '0', '0');
INSERT INTO `houses` VALUES ('291', '0', '0', '0', '0', '0', 'Kroten 13', '3', '4', '5000', '0', '1', '1', '8', '0', '0');
INSERT INTO `houses` VALUES ('292', '0', '0', '0', '0', '0', 'Kroten 14', '3', '4', '5000', '0', '1', '1', '8', '0', '0');
INSERT INTO `houses` VALUES ('293', '0', '0', '0', '0', '0', 'Kroten 15', '3', '24', '26000', '0', '1', '2', '32', '0', '0');
INSERT INTO `houses` VALUES ('294', '0', '0', '0', '0', '0', 'Kroten 16', '3', '21', '23000', '0', '2', '2', '29', '0', '0');
INSERT INTO `houses` VALUES ('295', '0', '0', '0', '0', '0', 'Kroten 17', '3', '36', '38000', '0', '1', '2', '46', '0', '0');
INSERT INTO `houses` VALUES ('296', '0', '0', '0', '0', '0', '', '0', '19', '21000', '0', '1', '2', '24', '0', '0');
INSERT INTO `houses` VALUES ('297', '0', '0', '0', '0', '0', '', '0', '8', '9000', '0', '1', '1', '11', '0', '0');
INSERT INTO `houses` VALUES ('298', '0', '0', '0', '0', '0', '', '0', '10', '11000', '0', '1', '1', '13', '0', '0');
INSERT INTO `houses` VALUES ('299', '0', '0', '0', '0', '0', '', '0', '16', '18000', '0', '1', '2', '21', '0', '0');
INSERT INTO `houses` VALUES ('300', '0', '0', '0', '0', '0', 'Sku 5', '5', '19', '20000', '0', '2', '1', '23', '0', '0');
INSERT INTO `houses` VALUES ('301', '0', '0', '0', '0', '0', 'Sku 6', '5', '21', '24000', '0', '1', '3', '28', '0', '0');
INSERT INTO `houses` VALUES ('302', '0', '0', '0', '0', '0', 'Sku 7', '5', '30', '32000', '0', '2', '2', '37', '0', '0');
INSERT INTO `houses` VALUES ('303', '0', '0', '0', '0', '0', 'Sku 8', '5', '21', '23000', '0', '2', '2', '27', '0', '0');
INSERT INTO `houses` VALUES ('304', '0', '0', '0', '0', '0', 'Sku 9', '5', '24', '26000', '0', '1', '2', '29', '0', '0');
INSERT INTO `houses` VALUES ('305', '0', '0', '0', '0', '0', 'Sku 10', '5', '19', '21000', '0', '1', '2', '24', '0', '0');
INSERT INTO `houses` VALUES ('306', '0', '0', '0', '0', '0', 'Sku 11', '5', '12', '12000', '0', '1', '0', '13', '0', '0');
INSERT INTO `houses` VALUES ('335', '0', '0', '0', '0', '0', 'Castle 1', '1', '138', '147000', '0', '11', '9', '254', '0', '0');
INSERT INTO `houses` VALUES ('390', '0', '0', '0', '0', '0', '', '0', '16', '17000', '0', '1', '1', '22', '0', '0');
INSERT INTO `houses` VALUES ('391', '0', '0', '0', '0', '0', '', '0', '12', '13000', '0', '1', '1', '16', '0', '0');
INSERT INTO `houses` VALUES ('392', '0', '0', '0', '0', '0', '', '0', '9', '10000', '0', '1', '1', '12', '0', '0');
INSERT INTO `houses` VALUES ('393', '0', '0', '0', '0', '0', '', '0', '13', '14000', '0', '1', '1', '16', '0', '0');
INSERT INTO `houses` VALUES ('394', '0', '0', '0', '0', '0', '', '0', '10', '11000', '0', '1', '1', '15', '0', '0');
INSERT INTO `houses` VALUES ('395', '0', '0', '0', '0', '0', '', '0', '20', '22000', '0', '1', '2', '30', '0', '0');
INSERT INTO `houses` VALUES ('396', '0', '0', '0', '0', '0', '', '0', '14', '15000', '0', '1', '1', '18', '0', '0');
INSERT INTO `houses` VALUES ('397', '0', '0', '0', '0', '0', '', '0', '11', '12000', '0', '1', '1', '14', '0', '0');
INSERT INTO `houses` VALUES ('398', '0', '0', '0', '0', '0', '', '0', '9', '10000', '0', '1', '1', '14', '0', '0');
INSERT INTO `houses` VALUES ('399', '0', '0', '0', '0', '0', '', '0', '13', '14000', '0', '1', '1', '17', '0', '0');
INSERT INTO `houses` VALUES ('400', '0', '0', '0', '0', '0', '', '0', '34', '36000', '0', '1', '2', '46', '0', '0');
INSERT INTO `houses` VALUES ('401', '0', '0', '0', '0', '0', '', '0', '9', '10000', '0', '1', '1', '16', '0', '0');
INSERT INTO `houses` VALUES ('402', '0', '0', '0', '0', '0', '', '0', '15', '17000', '0', '1', '2', '23', '0', '0');
INSERT INTO `houses` VALUES ('403', '0', '0', '0', '0', '0', '', '0', '17', '18000', '0', '1', '1', '23', '0', '0');
INSERT INTO `houses` VALUES ('404', '0', '0', '0', '0', '0', '', '0', '32', '33000', '0', '3', '1', '45', '0', '0');
INSERT INTO `houses` VALUES ('405', '0', '0', '0', '0', '0', '', '0', '44', '46000', '0', '1', '2', '49', '0', '0');
INSERT INTO `houses` VALUES ('406', '0', '0', '0', '0', '0', '', '0', '23', '24000', '0', '3', '1', '37', '0', '0');
INSERT INTO `houses` VALUES ('407', '0', '0', '0', '0', '0', '', '0', '15', '16000', '0', '1', '1', '18', '0', '0');
INSERT INTO `houses` VALUES ('408', '0', '0', '0', '0', '0', '', '0', '93', '97000', '0', '5', '4', '141', '0', '0');
INSERT INTO `houses` VALUES ('409', '0', '0', '0', '0', '0', '', '0', '23', '25000', '0', '3', '2', '45', '0', '0');
INSERT INTO `houses` VALUES ('411', '0', '0', '0', '0', '0', '', '0', '10', '11000', '0', '1', '1', '20', '0', '0');
INSERT INTO `houses` VALUES ('412', '0', '0', '0', '0', '0', '', '0', '9', '10000', '0', '1', '1', '18', '0', '0');
INSERT INTO `houses` VALUES ('413', '0', '0', '0', '0', '0', '', '0', '108', '116000', '0', '6', '8', '176', '0', '0');
INSERT INTO `houses` VALUES ('414', '0', '0', '0', '0', '0', '', '0', '10', '11000', '0', '1', '1', '15', '0', '0');
INSERT INTO `houses` VALUES ('415', '0', '0', '0', '0', '0', '', '0', '8', '9000', '0', '1', '1', '15', '0', '0');
INSERT INTO `houses` VALUES ('416', '0', '0', '0', '0', '0', '', '0', '12', '13000', '0', '1', '1', '16', '0', '0');
INSERT INTO `houses` VALUES ('417', '0', '0', '0', '0', '0', '', '0', '7', '8000', '0', '2', '1', '14', '0', '0');
INSERT INTO `houses` VALUES ('418', '0', '0', '0', '0', '0', '', '0', '16', '17000', '0', '4', '1', '26', '0', '0');
INSERT INTO `houses` VALUES ('419', '0', '0', '0', '0', '0', '', '0', '20', '21000', '0', '1', '1', '27', '0', '0');
INSERT INTO `houses` VALUES ('420', '0', '0', '0', '0', '0', '', '0', '26', '27000', '0', '2', '1', '34', '0', '0');
INSERT INTO `houses` VALUES ('421', '0', '0', '0', '0', '0', '', '0', '12', '13000', '0', '1', '1', '18', '0', '0');
INSERT INTO `houses` VALUES ('422', '0', '0', '0', '0', '0', '', '0', '23', '25000', '0', '1', '2', '35', '0', '0');
INSERT INTO `houses` VALUES ('1267', '0', '0', '0', '0', '0', 'Paradises 5', '1', '62', '66000', '0', '7', '4', '151', '0', '0');
INSERT INTO `houses` VALUES ('1268', '0', '0', '0', '0', '0', 'Paradises 6', '1', '58', '62000', '0', '7', '4', '145', '0', '0');
INSERT INTO `houses` VALUES ('1269', '0', '0', '0', '0', '0', 'Unnamed House #1269', '1', '57', '61000', '0', '7', '4', '148', '0', '0');
INSERT INTO `houses` VALUES ('1271', '0', '0', '0', '0', '0', 'Unnamed House #1271', '1', '14', '15000', '0', '1', '1', '25', '0', '0');
INSERT INTO `houses` VALUES ('1272', '0', '0', '0', '0', '0', 'Unnamed House #1272', '1', '14', '15000', '0', '1', '1', '25', '0', '0');
INSERT INTO `houses` VALUES ('1273', '0', '0', '0', '0', '0', 'Unnamed House #1273', '1', '13', '14000', '0', '1', '1', '25', '0', '0');
INSERT INTO `houses` VALUES ('1274', '0', '0', '0', '0', '0', 'Unnamed House #1274', '1', '10', '11000', '0', '1', '1', '25', '0', '0');
INSERT INTO `houses` VALUES ('1275', '0', '0', '0', '0', '0', 'Unnamed House #1275', '1', '14', '15000', '0', '1', '1', '25', '0', '0');
INSERT INTO `houses` VALUES ('1276', '0', '0', '0', '0', '0', 'Unnamed House #1276', '1', '19', '21000', '0', '1', '2', '35', '0', '0');
INSERT INTO `houses` VALUES ('1277', '0', '0', '0', '0', '0', 'Unnamed House #1277', '1', '20', '22000', '0', '1', '2', '40', '0', '0');
INSERT INTO `houses` VALUES ('1278', '0', '0', '0', '0', '0', 'Unnamed House #1278', '1', '14', '15000', '0', '1', '1', '25', '0', '0');
INSERT INTO `houses` VALUES ('1279', '0', '0', '0', '0', '0', 'Unnamed House #1279', '1', '79', '80000', '0', '3', '1', '116', '0', '0');
INSERT INTO `houses` VALUES ('1280', '0', '0', '0', '0', '0', 'Unnamed House #1280', '1', '61', '64000', '0', '5', '3', '111', '0', '0');
INSERT INTO `houses` VALUES ('1281', '0', '0', '0', '0', '0', 'Unnamed House #1281', '1', '94', '98000', '0', '6', '4', '159', '0', '0');
INSERT INTO `houses` VALUES ('1282', '0', '0', '0', '0', '0', 'Unnamed House #1282', '1', '42', '47000', '0', '4', '5', '81', '0', '0');
INSERT INTO `houses` VALUES ('1283', '0', '0', '0', '0', '0', 'Unnamed House #1283', '1', '48', '49000', '0', '3', '1', '76', '0', '0');
INSERT INTO `houses` VALUES ('1284', '0', '0', '0', '0', '0', 'Unnamed House #1284', '1', '111', '132000', '0', '9', '21', '199', '0', '0');
INSERT INTO `houses` VALUES ('1285', '0', '0', '0', '0', '0', 'Unnamed House #1285', '1', '54', '56000', '0', '5', '2', '94', '0', '0');
INSERT INTO `houses` VALUES ('1286', '0', '0', '0', '0', '0', 'Unnamed House #1286', '1', '24', '26000', '0', '2', '2', '45', '0', '0');
INSERT INTO `houses` VALUES ('1287', '0', '0', '0', '0', '0', 'Unnamed House #1287', '1', '14', '15000', '0', '1', '1', '25', '0', '0');
INSERT INTO `houses` VALUES ('1288', '0', '0', '0', '0', '0', 'Unnamed House #1288', '1', '22', '24000', '0', '2', '2', '50', '0', '0');
INSERT INTO `houses` VALUES ('1289', '0', '0', '0', '0', '0', 'Unnamed House #1289', '1', '17', '18000', '0', '2', '1', '35', '0', '0');
INSERT INTO `houses` VALUES ('1290', '0', '0', '0', '0', '0', 'Unnamed House #1290', '1', '13', '14000', '0', '1', '1', '34', '0', '0');
INSERT INTO `houses` VALUES ('1291', '0', '0', '0', '0', '0', 'Unnamed House #1291', '1', '76', '80000', '0', '3', '4', '112', '0', '0');
INSERT INTO `houses` VALUES ('1292', '0', '0', '0', '0', '0', 'Unnamed House #1292', '1', '16', '17000', '0', '2', '1', '39', '0', '0');
INSERT INTO `houses` VALUES ('1293', '0', '0', '0', '0', '0', 'Unnamed House #1293', '1', '61', '65000', '0', '6', '4', '100', '0', '0');
INSERT INTO `houses` VALUES ('1294', '0', '0', '0', '0', '0', 'Unnamed House #1294', '1', '97', '101000', '0', '5', '4', '157', '0', '0');
INSERT INTO `houses` VALUES ('1295', '0', '0', '0', '0', '0', 'Unnamed House #1295', '1', '107', '112000', '0', '12', '5', '210', '0', '0');
INSERT INTO `houses` VALUES ('1296', '0', '0', '0', '0', '0', 'Unnamed House #1296', '1', '68', '71000', '0', '3', '3', '106', '0', '0');
INSERT INTO `houses` VALUES ('1297', '0', '0', '0', '0', '0', 'Unnamed House #1297', '1', '85', '93000', '0', '9', '8', '211', '0', '0');
INSERT INTO `houses` VALUES ('1298', '0', '0', '0', '0', '0', 'Unnamed House #1298', '1', '28', '30000', '0', '5', '2', '65', '0', '0');
INSERT INTO `houses` VALUES ('1299', '0', '0', '0', '0', '0', 'Unnamed House #1299', '1', '14', '15000', '0', '1', '1', '43', '0', '0');
INSERT INTO `houses` VALUES ('1304', '0', '0', '0', '0', '0', 'Unnamed House #1304', '1', '18', '19000', '0', '2', '1', '46', '0', '0');
INSERT INTO `houses` VALUES ('1305', '0', '0', '0', '0', '0', 'Unnamed House #1305', '1', '77', '79000', '0', '7', '2', '147', '0', '0');
INSERT INTO `houses` VALUES ('1306', '0', '0', '0', '0', '0', 'Unnamed House #1306', '1', '94', '98000', '0', '4', '4', '158', '0', '0');
INSERT INTO `houses` VALUES ('1307', '0', '0', '0', '0', '0', 'Unnamed House #1307', '1', '22', '23000', '0', '1', '1', '47', '0', '0');
INSERT INTO `houses` VALUES ('1308', '0', '0', '0', '0', '0', 'Unnamed House #1308', '1', '14', '15000', '0', '2', '1', '34', '0', '0');
INSERT INTO `houses` VALUES ('1309', '0', '0', '0', '0', '0', 'Unnamed House #1309', '1', '12', '13000', '0', '2', '1', '35', '0', '0');
INSERT INTO `houses` VALUES ('1312', '0', '0', '0', '0', '0', 'Unnamed House #1312', '1', '155', '159000', '0', '7', '4', '291', '0', '0');
INSERT INTO `houses` VALUES ('1313', '0', '0', '0', '0', '0', 'Unnamed House #1313', '1', '38', '41000', '0', '2', '3', '89', '0', '0');
INSERT INTO `houses` VALUES ('1314', '0', '0', '0', '0', '0', 'Unnamed House #1314', '1', '94', '99000', '0', '5', '5', '174', '0', '0');
INSERT INTO `houses` VALUES ('1315', '0', '0', '0', '0', '0', 'Unnamed House #1315', '1', '62', '68000', '0', '3', '6', '144', '0', '0');
INSERT INTO `houses` VALUES ('1316', '0', '0', '0', '0', '0', 'Unnamed House #1316', '1', '35', '39000', '0', '3', '4', '73', '0', '0');
INSERT INTO `houses` VALUES ('1317', '0', '0', '0', '0', '0', 'Unnamed House #1317', '1', '38', '42000', '0', '4', '4', '86', '0', '0');
INSERT INTO `houses` VALUES ('1318', '0', '0', '0', '0', '0', 'Unnamed House #1318', '1', '48', '53000', '0', '6', '5', '120', '0', '0');
INSERT INTO `houses` VALUES ('1319', '0', '0', '0', '0', '0', 'Unnamed House #1319', '1', '18', '19000', '0', '2', '1', '47', '0', '0');
INSERT INTO `houses` VALUES ('1321', '0', '0', '0', '0', '0', 'Unnamed House #1321', '1', '52', '54000', '0', '6', '2', '137', '0', '0');
INSERT INTO `houses` VALUES ('1322', '0', '0', '0', '0', '0', 'Unnamed House #1322', '1', '14', '15000', '0', '2', '1', '34', '0', '0');
INSERT INTO `houses` VALUES ('1323', '0', '0', '0', '0', '0', 'Unnamed House #1323', '1', '12', '13000', '0', '2', '1', '37', '0', '0');
INSERT INTO `houses` VALUES ('1324', '0', '0', '0', '0', '0', 'Unnamed House #1324', '1', '15', '17000', '0', '2', '2', '44', '0', '0');
INSERT INTO `houses` VALUES ('1325', '0', '0', '0', '0', '0', 'Unnamed House #1325', '1', '58', '61000', '0', '7', '3', '145', '0', '0');
INSERT INTO `houses` VALUES ('1326', '0', '0', '0', '0', '0', 'Unnamed House #1326', '1', '27', '27000', '0', '3', '0', '54', '0', '0');
INSERT INTO `houses` VALUES ('1327', '0', '0', '0', '0', '0', 'Unnamed House #1327', '1', '20', '25000', '0', '1', '5', '68', '0', '0');
INSERT INTO `houses` VALUES ('1330', '0', '0', '0', '0', '0', 'Unnamed House #1330', '1', '45', '47000', '0', '2', '2', '117', '0', '0');
INSERT INTO `houses` VALUES ('1331', '0', '0', '0', '0', '0', 'Unnamed House #1331', '1', '41', '43000', '0', '2', '2', '106', '0', '0');
INSERT INTO `houses` VALUES ('1332', '0', '0', '0', '0', '0', 'Unnamed House #1332', '1', '25', '26000', '0', '1', '1', '69', '0', '0');
INSERT INTO `houses` VALUES ('1333', '0', '0', '0', '0', '0', 'Unnamed House #1333', '1', '31', '33000', '0', '2', '2', '77', '0', '0');
INSERT INTO `houses` VALUES ('1334', '0', '0', '0', '0', '0', 'Unnamed House #1334', '1', '29', '31000', '0', '3', '2', '83', '0', '0');
INSERT INTO `houses` VALUES ('1335', '0', '0', '0', '0', '0', 'Unnamed House #1335', '1', '40', '42000', '0', '1', '2', '104', '0', '0');
INSERT INTO `houses` VALUES ('1336', '0', '0', '0', '0', '0', 'Unnamed House #1336', '1', '26', '28000', '0', '2', '2', '82', '0', '0');
INSERT INTO `houses` VALUES ('1337', '0', '0', '0', '0', '0', 'Unnamed House #1337', '1', '20', '21000', '0', '2', '1', '59', '0', '0');
INSERT INTO `houses` VALUES ('1338', '0', '0', '0', '0', '0', 'Unnamed House #1338', '1', '135', '141000', '0', '5', '6', '302', '0', '0');
INSERT INTO `houses` VALUES ('1339', '0', '0', '0', '0', '0', 'Unnamed House #1339', '1', '69', '71000', '0', '3', '2', '189', '0', '0');
INSERT INTO `houses` VALUES ('1340', '0', '0', '0', '0', '0', 'Unnamed House #1340', '1', '47', '50000', '0', '3', '3', '139', '0', '0');
INSERT INTO `houses` VALUES ('1341', '0', '0', '0', '0', '0', 'Unnamed House #1341', '1', '29', '30000', '0', '3', '1', '79', '0', '0');
INSERT INTO `houses` VALUES ('1342', '0', '0', '0', '0', '0', 'Unnamed House #1342', '1', '53', '55000', '0', '3', '2', '127', '0', '0');
INSERT INTO `houses` VALUES ('1343', '0', '0', '0', '0', '0', 'Unnamed House #1343', '1', '26', '28000', '0', '2', '2', '82', '0', '0');
INSERT INTO `houses` VALUES ('1344', '0', '0', '0', '0', '0', 'Unnamed House #1344', '1', '20', '21000', '0', '3', '1', '57', '0', '0');
INSERT INTO `houses` VALUES ('1345', '0', '0', '0', '0', '0', 'Unnamed House #1345', '1', '34', '35000', '0', '1', '1', '80', '0', '0');
INSERT INTO `houses` VALUES ('1346', '0', '0', '0', '0', '0', 'Unnamed House #1346', '1', '27', '28000', '0', '2', '1', '76', '0', '0');
INSERT INTO `houses` VALUES ('1347', '0', '0', '0', '0', '0', 'Unnamed House #1347', '1', '33', '34000', '0', '3', '1', '92', '0', '0');
INSERT INTO `houses` VALUES ('1348', '0', '0', '0', '0', '0', 'Unnamed House #1348', '1', '20', '22000', '0', '1', '2', '40', '0', '0');
INSERT INTO `houses` VALUES ('1349', '0', '0', '0', '0', '0', 'Unnamed House #1349', '1', '26', '28000', '0', '1', '2', '49', '0', '0');
INSERT INTO `houses` VALUES ('1350', '0', '0', '0', '0', '0', 'Unnamed House #1350', '1', '65', '67000', '0', '4', '2', '123', '0', '0');
INSERT INTO `houses` VALUES ('1351', '0', '0', '0', '0', '0', 'Unnamed House #1351', '1', '50', '51000', '0', '2', '1', '79', '0', '0');
INSERT INTO `houses` VALUES ('1352', '0', '0', '0', '0', '0', 'Unnamed House #1352', '1', '10', '11000', '0', '1', '1', '25', '0', '0');
INSERT INTO `houses` VALUES ('1353', '0', '0', '0', '0', '0', 'Unnamed House #1353', '1', '10', '11000', '0', '2', '1', '30', '0', '0');
INSERT INTO `houses` VALUES ('1354', '0', '0', '0', '0', '0', 'Unnamed House #1354', '1', '27', '28000', '0', '2', '1', '54', '0', '0');
INSERT INTO `houses` VALUES ('1763', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '8', '0', '0');
INSERT INTO `houses` VALUES ('1765', '0', '0', '0', '0', '0', '', '0', '1', '1000', '0', '0', '0', '10', '0', '0');
INSERT INTO `houses` VALUES ('2040', '0', '0', '0', '0', '0', 'Unnamed House #2040', '1', '46', '48000', '0', '1', '2', '83', '0', '0');
INSERT INTO `houses` VALUES ('2041', '0', '0', '0', '0', '0', 'Unnamed House #2041', '1', '26', '27000', '0', '1', '1', '49', '0', '0');
INSERT INTO `houses` VALUES ('2042', '0', '0', '0', '0', '0', 'Unnamed House #2042', '1', '31', '33000', '0', '3', '2', '69', '0', '0');
INSERT INTO `houses` VALUES ('2043', '0', '0', '0', '0', '0', 'Unnamed House #2043', '1', '48', '49000', '0', '1', '1', '83', '0', '0');
INSERT INTO `houses` VALUES ('2044', '0', '0', '0', '0', '0', 'Unnamed House #2044', '1', '18', '19000', '0', '1', '1', '40', '0', '0');
INSERT INTO `houses` VALUES ('2045', '0', '0', '0', '0', '0', 'Unnamed House #2045', '1', '6', '7000', '0', '0', '1', '24', '0', '0');
INSERT INTO `houses` VALUES ('2046', '0', '0', '0', '0', '0', 'Unnamed House #2046', '1', '10', '11000', '0', '0', '1', '24', '0', '0');
INSERT INTO `houses` VALUES ('2047', '0', '0', '0', '0', '0', 'Unnamed House #2047', '1', '14', '15000', '0', '0', '1', '30', '0', '0');
INSERT INTO `houses` VALUES ('2048', '0', '0', '0', '0', '0', 'Unnamed House #2048', '1', '6', '7000', '0', '0', '1', '21', '0', '0');
INSERT INTO `houses` VALUES ('2049', '0', '0', '0', '0', '0', 'Unnamed House #2049', '1', '10', '11000', '0', '0', '1', '21', '0', '0');
INSERT INTO `houses` VALUES ('2050', '0', '0', '0', '0', '0', 'Unnamed House #2050', '1', '14', '15000', '0', '0', '1', '28', '0', '0');
INSERT INTO `houses` VALUES ('2051', '0', '0', '0', '0', '0', 'Unnamed House #2051', '1', '0', '0', '0', '0', '0', '5', '0', '0');
INSERT INTO `houses` VALUES ('2052', '0', '0', '0', '0', '0', 'Unnamed House #2052', '1', '163', '167000', '0', '3', '4', '293', '0', '0');
INSERT INTO `houses` VALUES ('2053', '0', '0', '0', '0', '0', 'Unnamed House #2053', '1', '15', '17000', '0', '2', '2', '47', '0', '0');
INSERT INTO `houses` VALUES ('2054', '0', '0', '0', '0', '0', 'Unnamed House #2054', '1', '18', '20000', '0', '2', '2', '51', '0', '0');
INSERT INTO `houses` VALUES ('2055', '0', '0', '0', '0', '0', 'Unnamed House #2055', '1', '12', '13000', '0', '2', '1', '33', '0', '0');
INSERT INTO `houses` VALUES ('2056', '0', '0', '0', '0', '0', 'Unnamed House #2056', '1', '23', '24000', '0', '2', '1', '49', '0', '0');
INSERT INTO `houses` VALUES ('2057', '0', '0', '0', '0', '0', 'Unnamed House #2057', '1', '19', '20000', '0', '2', '1', '49', '0', '0');
INSERT INTO `houses` VALUES ('2058', '0', '0', '0', '0', '0', 'Unnamed House #2058', '1', '16', '17000', '0', '2', '1', '47', '0', '0');
INSERT INTO `houses` VALUES ('2059', '0', '0', '0', '0', '0', 'Unnamed House #2059', '1', '13', '14000', '0', '1', '1', '30', '0', '0');
INSERT INTO `houses` VALUES ('2060', '0', '0', '0', '0', '0', 'Unnamed House #2060', '1', '13', '14000', '0', '1', '1', '35', '0', '0');
INSERT INTO `houses` VALUES ('2061', '0', '0', '0', '0', '0', 'Unnamed House #2061', '1', '12', '13000', '0', '1', '1', '37', '0', '0');
INSERT INTO `houses` VALUES ('2062', '0', '0', '0', '0', '0', 'Unnamed House #2062', '1', '16', '18000', '0', '1', '2', '40', '0', '0');
INSERT INTO `houses` VALUES ('2063', '0', '0', '0', '0', '0', 'Unnamed House #2063', '1', '43', '44000', '0', '2', '1', '106', '0', '0');
INSERT INTO `houses` VALUES ('2064', '0', '2', '1476388136', '0', '0', 'Unnamed House #2064', '1', '40', '43000', '0', '2', '3', '90', '0', '0');
INSERT INTO `houses` VALUES ('2065', '0', '0', '0', '0', '0', 'Unnamed House #2065', '1', '47', '51000', '0', '4', '4', '119', '0', '0');
INSERT INTO `houses` VALUES ('2066', '0', '0', '0', '0', '0', 'Unnamed House #2066', '1', '106', '109000', '0', '5', '3', '209', '0', '0');
INSERT INTO `houses` VALUES ('2067', '0', '0', '0', '0', '0', 'Unnamed House #2067', '1', '13', '14000', '0', '1', '1', '41', '0', '0');
INSERT INTO `houses` VALUES ('2068', '0', '0', '0', '0', '0', 'Unnamed House #2068', '1', '13', '14000', '0', '1', '1', '42', '0', '0');
INSERT INTO `houses` VALUES ('2069', '0', '0', '0', '0', '0', 'Unnamed House #2069', '1', '12', '14000', '0', '1', '2', '36', '0', '0');
INSERT INTO `houses` VALUES ('2070', '0', '0', '0', '0', '0', 'Unnamed House #2070', '1', '17', '19000', '0', '1', '2', '36', '0', '0');
INSERT INTO `houses` VALUES ('2071', '0', '0', '0', '0', '0', 'Unnamed House #2071', '1', '14', '16000', '0', '1', '2', '40', '0', '0');
INSERT INTO `houses` VALUES ('2072', '0', '0', '0', '0', '0', 'Unnamed House #2072', '1', '10', '11000', '0', '1', '1', '30', '0', '0');
INSERT INTO `houses` VALUES ('2073', '0', '0', '0', '0', '0', 'Unnamed House #2073', '1', '13', '14000', '0', '1', '1', '25', '0', '0');
INSERT INTO `houses` VALUES ('2074', '0', '0', '0', '0', '0', 'Unnamed House #2074', '1', '14', '15000', '0', '1', '1', '33', '0', '0');
INSERT INTO `houses` VALUES ('2075', '0', '0', '0', '0', '0', 'Unnamed House #2075', '1', '4', '5000', '0', '1', '1', '15', '0', '0');
INSERT INTO `houses` VALUES ('2076', '0', '0', '0', '0', '0', 'Unnamed House #2076', '1', '4', '5000', '0', '1', '1', '15', '0', '0');
INSERT INTO `houses` VALUES ('2077', '0', '0', '0', '0', '0', 'Unnamed House #2077', '1', '15', '17000', '0', '1', '2', '35', '0', '0');
INSERT INTO `houses` VALUES ('2078', '0', '0', '0', '0', '0', 'Unnamed House #2078', '1', '10', '11000', '0', '1', '1', '27', '0', '0');
INSERT INTO `houses` VALUES ('2079', '0', '0', '0', '0', '0', 'Unnamed House #2079', '1', '10', '11000', '0', '1', '1', '28', '0', '0');
INSERT INTO `houses` VALUES ('2080', '0', '0', '0', '0', '0', 'Unnamed House #2080', '1', '10', '11000', '0', '1', '1', '24', '0', '0');
INSERT INTO `houses` VALUES ('2081', '0', '0', '0', '0', '0', 'Unnamed House #2081', '1', '10', '11000', '0', '1', '1', '21', '0', '0');
INSERT INTO `houses` VALUES ('2082', '0', '0', '0', '0', '0', 'Unnamed House #2082', '1', '10', '11000', '0', '1', '1', '30', '0', '0');
INSERT INTO `houses` VALUES ('2083', '0', '0', '0', '0', '0', 'Unnamed House #2083', '1', '14', '15000', '0', '1', '1', '36', '0', '0');
INSERT INTO `houses` VALUES ('2084', '0', '0', '0', '0', '0', 'Unnamed House #2084', '1', '10', '11000', '0', '1', '1', '25', '0', '0');
INSERT INTO `houses` VALUES ('2085', '0', '0', '0', '0', '0', 'Unnamed House #2085', '1', '11', '12000', '0', '1', '1', '25', '0', '0');
INSERT INTO `houses` VALUES ('2086', '0', '0', '0', '0', '0', 'Unnamed House #2086', '1', '10', '11000', '0', '1', '1', '25', '0', '0');
INSERT INTO `houses` VALUES ('2087', '0', '0', '0', '0', '0', 'Unnamed House #2087', '1', '15', '17000', '0', '1', '2', '35', '0', '0');
INSERT INTO `houses` VALUES ('2088', '0', '0', '0', '0', '0', 'Unnamed House #2088', '1', '10', '11000', '0', '1', '1', '23', '0', '0');
INSERT INTO `houses` VALUES ('2089', '0', '0', '0', '0', '0', 'Unnamed House #2089', '1', '10', '11000', '0', '1', '1', '25', '0', '0');
INSERT INTO `houses` VALUES ('2090', '0', '0', '0', '0', '0', 'Unnamed House #2090', '1', '10', '11000', '0', '1', '1', '25', '0', '0');
INSERT INTO `houses` VALUES ('2091', '0', '0', '0', '0', '0', 'Unnamed House #2091', '1', '10', '11000', '0', '1', '1', '25', '0', '0');
INSERT INTO `houses` VALUES ('2092', '0', '0', '0', '0', '0', 'Unnamed House #2092', '1', '14', '16000', '0', '1', '2', '35', '0', '0');
INSERT INTO `houses` VALUES ('2093', '0', '0', '0', '0', '0', 'Unnamed House #2093', '1', '25', '28000', '0', '1', '3', '70', '0', '0');
INSERT INTO `houses` VALUES ('2094', '0', '0', '0', '0', '0', 'Unnamed House #2094', '1', '49', '52000', '0', '5', '3', '118', '0', '0');
INSERT INTO `houses` VALUES ('2095', '0', '0', '0', '0', '0', 'Unnamed House #2095', '1', '10', '11000', '0', '1', '1', '13', '0', '0');
INSERT INTO `houses` VALUES ('2096', '0', '0', '0', '0', '0', 'Unnamed House #2096', '1', '10', '11000', '0', '1', '1', '28', '0', '0');
INSERT INTO `houses` VALUES ('2097', '0', '0', '0', '0', '0', 'Unnamed House #2097', '1', '68', '75000', '0', '7', '7', '143', '0', '0');
INSERT INTO `houses` VALUES ('2098', '0', '0', '0', '0', '0', 'Unnamed House #2098', '1', '7', '8000', '0', '1', '1', '15', '0', '0');
INSERT INTO `houses` VALUES ('2099', '0', '0', '0', '0', '0', 'Unnamed House #2099', '1', '29', '30000', '0', '3', '1', '59', '0', '0');
INSERT INTO `houses` VALUES ('2100', '0', '0', '0', '0', '0', 'Unnamed House #2100', '1', '15', '15000', '0', '1', '0', '41', '0', '0');
INSERT INTO `houses` VALUES ('2101', '0', '0', '0', '0', '0', 'Unnamed House #2101', '1', '15', '15000', '0', '1', '0', '41', '0', '0');
INSERT INTO `houses` VALUES ('2102', '0', '0', '0', '0', '0', 'Unnamed House #2102', '1', '16', '18000', '0', '1', '2', '33', '0', '0');
INSERT INTO `houses` VALUES ('2103', '0', '0', '0', '0', '0', 'Unnamed House #2103', '1', '16', '18000', '0', '1', '2', '33', '0', '0');
INSERT INTO `houses` VALUES ('2104', '0', '0', '0', '0', '0', 'Unnamed House #2104', '1', '16', '18000', '0', '1', '2', '33', '0', '0');
INSERT INTO `houses` VALUES ('2105', '0', '0', '0', '0', '0', 'Unnamed House #2105', '1', '18', '20000', '0', '1', '2', '39', '0', '0');
INSERT INTO `houses` VALUES ('2107', '0', '0', '0', '0', '0', 'Unnamed House #2107', '1', '92', '94000', '0', '4', '2', '125', '0', '0');
INSERT INTO `houses` VALUES ('2108', '0', '0', '0', '0', '0', 'Unnamed House #2108', '1', '11', '13000', '60000', '1', '2', '27', '0', '0');
INSERT INTO `houses` VALUES ('2109', '0', '0', '0', '0', '0', 'Unnamed House #2109', '1', '8', '9000', '45000', '1', '1', '18', '0', '0');
INSERT INTO `houses` VALUES ('2110', '0', '0', '0', '0', '0', 'Unnamed House #2110', '1', '8', '9000', '45000', '1', '1', '18', '0', '0');
INSERT INTO `houses` VALUES ('2112', '0', '0', '0', '0', '0', '45000', '1', '7', '8000', '0', '1', '1', '16', '0', '0');
INSERT INTO `houses` VALUES ('2113', '0', '0', '0', '0', '0', 'Unnamed House #2113', '1', '7', '8000', '45000', '1', '1', '15', '0', '0');
INSERT INTO `houses` VALUES ('2114', '0', '0', '0', '0', '0', 'Unnamed House #2114', '1', '12', '14000', '60000', '1', '2', '23', '0', '0');
INSERT INTO `houses` VALUES ('2115', '0', '0', '0', '0', '0', 'Unnamed House #2115', '1', '12', '14000', '60000', '1', '2', '24', '0', '0');
INSERT INTO `houses` VALUES ('2116', '0', '0', '0', '0', '0', 'Unnamed House #2116', '1', '7', '8000', '45000', '1', '1', '16', '0', '0');
INSERT INTO `houses` VALUES ('2118', '0', '0', '0', '0', '0', 'Unnamed House #2118', '1', '8', '9000', '45000', '1', '1', '15', '0', '0');
INSERT INTO `houses` VALUES ('2119', '0', '0', '0', '0', '0', 'Unnamed House #2119', '1', '7', '8000', '45000', '1', '1', '18', '0', '0');
INSERT INTO `houses` VALUES ('2120', '0', '0', '0', '0', '0', 'Unnamed House #2120', '1', '7', '8000', '45000', '1', '1', '18', '0', '0');
INSERT INTO `houses` VALUES ('2121', '0', '0', '0', '0', '0', 'Unnamed House #2121', '1', '12', '14000', '60000', '1', '2', '27', '0', '0');
INSERT INTO `houses` VALUES ('2122', '0', '0', '0', '0', '0', 'Forbidden Tower', '1', '44', '45000', '0', '2', '1', '68', '0', '0');
INSERT INTO `houses` VALUES ('2123', '0', '0', '0', '0', '0', 'Yalahar House #1', '7', '179', '182000', '0', '4', '3', '263', '0', '0');
INSERT INTO `houses` VALUES ('2124', '0', '0', '0', '0', '0', 'Yalahar House #2', '7', '122', '126000', '0', '5', '4', '212', '0', '0');
INSERT INTO `houses` VALUES ('2125', '0', '0', '0', '0', '0', 'Yalahar House #3', '7', '115', '117000', '0', '4', '2', '186', '0', '0');
INSERT INTO `houses` VALUES ('2126', '0', '0', '0', '0', '0', 'Yalahar House #4', '7', '88', '90000', '0', '2', '2', '132', '0', '0');
INSERT INTO `houses` VALUES ('2127', '0', '0', '0', '0', '0', 'Yalahar House #5', '7', '176', '181000', '0', '7', '5', '276', '0', '0');
INSERT INTO `houses` VALUES ('2128', '0', '0', '0', '0', '0', 'Yalahar House #6', '7', '152', '154000', '0', '8', '2', '258', '0', '0');
INSERT INTO `houses` VALUES ('2129', '0', '0', '0', '0', '0', 'Yalahar House #7', '7', '123', '125000', '0', '6', '2', '229', '0', '0');
INSERT INTO `houses` VALUES ('2130', '0', '0', '0', '0', '0', 'Yalahar House #8', '7', '144', '148000', '0', '3', '4', '229', '0', '0');
INSERT INTO `houses` VALUES ('2131', '0', '0', '0', '0', '0', 'Forbidden Castle of Gods', '1', '980', '1000000', '10000000', '12', '20', '1369', '0', '0');
INSERT INTO `houses` VALUES ('2133', '0', '0', '0', '0', '0', 'Yalahar House #9', '7', '321', '351000', '0', '24', '30', '696', '0', '0');
INSERT INTO `houses` VALUES ('2134', '0', '0', '0', '0', '0', 'Yalahar House #10', '7', '237', '241000', '0', '4', '4', '359', '0', '0');
INSERT INTO `houses` VALUES ('2135', '0', '0', '0', '0', '0', 'Yalahar House #11', '7', '130', '134000', '0', '4', '4', '269', '0', '0');
INSERT INTO `houses` VALUES ('2136', '0', '0', '0', '0', '0', 'Yalahar House #12', '7', '135', '137000', '0', '4', '2', '194', '0', '0');
INSERT INTO `houses` VALUES ('2137', '0', '0', '0', '0', '0', 'Yalahar House #13', '7', '136', '138000', '0', '5', '2', '231', '0', '0');
INSERT INTO `houses` VALUES ('2138', '0', '0', '0', '0', '0', 'Yalahar House #14', '7', '447', '474000', '0', '12', '27', '813', '0', '0');
INSERT INTO `houses` VALUES ('2139', '0', '0', '0', '0', '0', 'Yalahar House #15', '7', '97', '99000', '0', '4', '2', '188', '0', '0');
INSERT INTO `houses` VALUES ('2140', '0', '0', '0', '0', '0', 'Yalahar House #16', '7', '114', '116000', '0', '2', '2', '163', '0', '0');
INSERT INTO `houses` VALUES ('2141', '0', '0', '0', '0', '0', 'Yalahar House #17', '7', '82', '86000', '0', '5', '4', '177', '0', '0');
INSERT INTO `houses` VALUES ('2142', '0', '0', '0', '0', '0', 'Yalahar House #18', '7', '119', '122000', '0', '6', '3', '232', '0', '0');
INSERT INTO `houses` VALUES ('2143', '0', '0', '0', '0', '0', 'Yalahar House #19', '7', '423', '456000', '0', '20', '33', '958', '0', '0');
INSERT INTO `houses` VALUES ('2144', '0', '0', '0', '0', '0', 'Western Flat VI', '0', '30', '30000', '1550', '1', '0', '31', '0', '0');
INSERT INTO `houses` VALUES ('2145', '0', '0', '0', '0', '0', 'Eastern Flat I', '0', '30', '30000', '1600', '2', '0', '32', '0', '0');
INSERT INTO `houses` VALUES ('2146', '0', '0', '0', '0', '0', 'Dream Lane I', '0', '24', '24000', '1250', '1', '0', '25', '0', '0');
INSERT INTO `houses` VALUES ('2147', '0', '0', '0', '0', '0', 'Dream Lane II', '0', '32', '32000', '1650', '1', '0', '33', '0', '0');
INSERT INTO `houses` VALUES ('2148', '0', '0', '0', '0', '0', 'Dream Lane III', '0', '24', '24000', '1250', '1', '0', '25', '0', '0');
INSERT INTO `houses` VALUES ('2149', '0', '0', '0', '0', '0', 'Dream Lane IV', '0', '24', '24000', '1250', '1', '0', '25', '0', '0');
INSERT INTO `houses` VALUES ('2150', '0', '0', '0', '0', '0', 'Park Flat I', '0', '28', '28000', '0', '2', '0', '30', '0', '0');

-- ----------------------------
-- Table structure for house_auctions
-- ----------------------------
DROP TABLE IF EXISTS `house_auctions`;
CREATE TABLE `house_auctions` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  `bid` int(10) unsigned NOT NULL DEFAULT '0',
  `limit` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` bigint(20) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `house_id` (`house_id`,`world_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `house_auctions_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE,
  CONSTRAINT `house_auctions_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of house_auctions
-- ----------------------------

-- ----------------------------
-- Table structure for house_data
-- ----------------------------
DROP TABLE IF EXISTS `house_data`;
CREATE TABLE `house_data` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  UNIQUE KEY `house_id` (`house_id`,`world_id`),
  CONSTRAINT `house_data_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of house_data
-- ----------------------------

-- ----------------------------
-- Table structure for house_lists
-- ----------------------------
DROP TABLE IF EXISTS `house_lists`;
CREATE TABLE `house_lists` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `listid` int(11) NOT NULL,
  `list` text NOT NULL,
  UNIQUE KEY `house_id` (`house_id`,`world_id`,`listid`),
  CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of house_lists
-- ----------------------------

-- ----------------------------
-- Table structure for killers
-- ----------------------------
DROP TABLE IF EXISTS `killers`;
CREATE TABLE `killers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `death_id` int(11) NOT NULL,
  `final_hit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `unjustified` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `war` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `death_id` (`death_id`),
  CONSTRAINT `killers_ibfk_1` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of killers
-- ----------------------------
INSERT INTO `killers` VALUES ('1', '1', '1', '0', '0');
INSERT INTO `killers` VALUES ('2', '1', '0', '1', '0');
INSERT INTO `killers` VALUES ('3', '1', '0', '0', '0');
INSERT INTO `killers` VALUES ('4', '1', '0', '0', '0');
INSERT INTO `killers` VALUES ('5', '1', '0', '0', '0');
INSERT INTO `killers` VALUES ('6', '1', '0', '0', '0');
INSERT INTO `killers` VALUES ('7', '1', '0', '0', '0');
INSERT INTO `killers` VALUES ('8', '2', '1', '0', '0');
INSERT INTO `killers` VALUES ('9', '2', '0', '0', '0');
INSERT INTO `killers` VALUES ('10', '2', '0', '0', '0');
INSERT INTO `killers` VALUES ('11', '2', '0', '0', '0');
INSERT INTO `killers` VALUES ('12', '3', '1', '0', '0');
INSERT INTO `killers` VALUES ('13', '3', '0', '0', '0');
INSERT INTO `killers` VALUES ('14', '4', '1', '0', '0');
INSERT INTO `killers` VALUES ('15', '4', '0', '0', '0');
INSERT INTO `killers` VALUES ('16', '4', '0', '0', '0');
INSERT INTO `killers` VALUES ('17', '4', '0', '0', '0');
INSERT INTO `killers` VALUES ('18', '4', '0', '0', '0');
INSERT INTO `killers` VALUES ('19', '4', '0', '0', '0');
INSERT INTO `killers` VALUES ('20', '5', '1', '0', '0');
INSERT INTO `killers` VALUES ('21', '5', '0', '0', '0');
INSERT INTO `killers` VALUES ('22', '5', '0', '0', '0');
INSERT INTO `killers` VALUES ('23', '5', '0', '0', '0');
INSERT INTO `killers` VALUES ('24', '5', '0', '0', '0');
INSERT INTO `killers` VALUES ('25', '5', '0', '0', '0');
INSERT INTO `killers` VALUES ('26', '5', '0', '0', '0');
INSERT INTO `killers` VALUES ('27', '5', '0', '0', '0');
INSERT INTO `killers` VALUES ('28', '5', '0', '0', '0');
INSERT INTO `killers` VALUES ('29', '6', '1', '0', '0');
INSERT INTO `killers` VALUES ('30', '7', '1', '0', '0');
INSERT INTO `killers` VALUES ('31', '7', '0', '0', '0');
INSERT INTO `killers` VALUES ('32', '7', '0', '0', '0');
INSERT INTO `killers` VALUES ('33', '7', '0', '0', '0');
INSERT INTO `killers` VALUES ('34', '8', '1', '0', '0');
INSERT INTO `killers` VALUES ('35', '9', '1', '0', '0');
INSERT INTO `killers` VALUES ('36', '9', '0', '0', '0');
INSERT INTO `killers` VALUES ('37', '9', '0', '0', '0');
INSERT INTO `killers` VALUES ('38', '9', '0', '0', '0');
INSERT INTO `killers` VALUES ('39', '9', '0', '0', '0');
INSERT INTO `killers` VALUES ('40', '10', '1', '0', '0');
INSERT INTO `killers` VALUES ('41', '10', '0', '0', '0');
INSERT INTO `killers` VALUES ('42', '10', '0', '0', '0');
INSERT INTO `killers` VALUES ('43', '11', '1', '0', '0');
INSERT INTO `killers` VALUES ('44', '11', '0', '0', '0');
INSERT INTO `killers` VALUES ('45', '11', '0', '0', '0');
INSERT INTO `killers` VALUES ('46', '12', '1', '0', '0');
INSERT INTO `killers` VALUES ('47', '12', '0', '0', '0');
INSERT INTO `killers` VALUES ('48', '13', '1', '0', '0');
INSERT INTO `killers` VALUES ('49', '13', '0', '0', '0');
INSERT INTO `killers` VALUES ('50', '14', '1', '0', '0');
INSERT INTO `killers` VALUES ('51', '14', '0', '0', '0');
INSERT INTO `killers` VALUES ('52', '15', '1', '0', '0');
INSERT INTO `killers` VALUES ('53', '16', '1', '0', '0');
INSERT INTO `killers` VALUES ('54', '17', '1', '0', '0');
INSERT INTO `killers` VALUES ('55', '18', '1', '0', '0');
INSERT INTO `killers` VALUES ('56', '19', '1', '0', '0');
INSERT INTO `killers` VALUES ('57', '20', '1', '0', '0');
INSERT INTO `killers` VALUES ('58', '20', '0', '0', '0');
INSERT INTO `killers` VALUES ('59', '21', '1', '0', '0');
INSERT INTO `killers` VALUES ('60', '22', '1', '0', '0');
INSERT INTO `killers` VALUES ('61', '22', '0', '0', '0');
INSERT INTO `killers` VALUES ('62', '22', '0', '0', '0');
INSERT INTO `killers` VALUES ('63', '23', '1', '0', '0');
INSERT INTO `killers` VALUES ('64', '23', '0', '0', '0');
INSERT INTO `killers` VALUES ('65', '23', '0', '0', '0');
INSERT INTO `killers` VALUES ('66', '24', '1', '0', '0');
INSERT INTO `killers` VALUES ('67', '24', '0', '0', '0');
INSERT INTO `killers` VALUES ('68', '24', '0', '0', '0');

-- ----------------------------
-- Table structure for players
-- ----------------------------
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) unsigned NOT NULL DEFAULT '0',
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(11) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '0',
  `manamax` int(11) NOT NULL DEFAULT '0',
  `manaspent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `soul` int(10) unsigned NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) unsigned NOT NULL DEFAULT '0',
  `lastip` int(10) unsigned NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `skulltime` int(11) NOT NULL DEFAULT '0',
  `rank_id` int(11) NOT NULL DEFAULT '0',
  `guildnick` varchar(255) NOT NULL DEFAULT '',
  `lastlogout` bigint(20) unsigned NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `balance` bigint(20) NOT NULL DEFAULT '0',
  `stamina` bigint(20) unsigned NOT NULL DEFAULT '151200000' COMMENT 'stored in miliseconds',
  `direction` int(11) NOT NULL DEFAULT '2',
  `loss_experience` int(11) NOT NULL DEFAULT '100',
  `loss_mana` int(11) NOT NULL DEFAULT '100',
  `loss_skills` int(11) NOT NULL DEFAULT '100',
  `loss_containers` int(11) NOT NULL DEFAULT '100',
  `loss_items` int(11) NOT NULL DEFAULT '100',
  `premend` int(11) NOT NULL DEFAULT '0' COMMENT 'NOT IN USE BY THE SERVER',
  `online` tinyint(1) NOT NULL DEFAULT '0',
  `marriage` int(10) unsigned NOT NULL DEFAULT '0',
  `promotion` int(11) NOT NULL DEFAULT '0',
  `deleted` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `cast` tinyint(4) NOT NULL DEFAULT '0',
  `castViewers` int(11) NOT NULL DEFAULT '0',
  `castDescription` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`deleted`),
  KEY `account_id` (`account_id`),
  KEY `group_id` (`group_id`),
  KEY `online` (`online`),
  KEY `deleted` (`deleted`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of players
-- ----------------------------
INSERT INTO `players` VALUES ('1', 'Account Manager', '0', '1', '1', '1', '0', '150', '150', '0', '0', '0', '0', '0', '110', '0', '0', '0', '0', '0', '0', '0', '1060', '1036', '8', '', '400', '0', '1476847666', '29592251', '0', '0', '0', '0', '', '1476847694', '0', '0', '151200000', '0', '100', '100', '100', '100', '100', '0', '0', '0', '0', '0', '', '0', '0', '');
INSERT INTO `players` VALUES ('2', 'Solido', '0', '6', '2', '308', '4', '1685', '1685', '477569200', '68', '76', '78', '39', '302', '0', '9', '1535', '1535', '19800', '100', '1', '1163', '1321', '7', '', '1935', '1', '1476937304', '16820416', '1', '0', '0', '0', '', '1476937361', '0', '0', '151200000', '2', '100', '100', '100', '100', '100', '0', '0', '0', '0', '0', '', '0', '0', '');
INSERT INTO `players` VALUES ('3', 'Knight Test', '0', '1', '2', '8', '0', '185', '185', '4200', '68', '76', '78', '39', '128', '0', '0', '35', '35', '0', '100', '1', '1060', '1036', '8', '', '435', '1', '1476293121', '16777343', '1', '0', '0', '0', '', '1476293137', '0', '0', '151200000', '2', '100', '100', '100', '100', '100', '0', '0', '0', '0', '1476293166', '', '0', '0', '');
INSERT INTO `players` VALUES ('4', 'Knight Test', '0', '1', '2', '207', '4', '2049', '3170', '144122262', '68', '76', '78', '39', '131', '3', '7', '446', '1030', '198739', '200', '1', '1267', '1267', '7', '', '5410', '1', '1476848469', '16820416', '1', '0', '0', '0', '', '1476848480', '31', '0', '151200000', '2', '100', '100', '100', '100', '100', '0', '0', '0', '1', '0', '', '0', '0', '');
INSERT INTO `players` VALUES ('5', 'Martel', '0', '6', '3', '108', '2', '685', '685', '19859200', '68', '76', '78', '39', '302', '0', '0', '3035', '3035', '1000', '100', '1', '1141', '1303', '7', 0x010000400002FFFFFFFF03FFFFFFFF1A000000001B00000000FE, '1435', '1', '1476851782', '29592251', '1', '0', '0', '0', '', '1476852716', '0', '0', '151200000', '2', '100', '100', '100', '100', '100', '0', '0', '0', '0', '0', '', '0', '0', '');
INSERT INTO `players` VALUES ('6', 'Zekra', '0', '1', '3', '271', '2', '1500', '1500', '324992793', '114', '114', '114', '114', '151', '3', '93', '7885', '7925', '8981168', '300', '1', '1029', '1045', '7', '', '3065', '1', '1476850406', '29592251', '1', '0', '0', '0', '', '1476851304', '31', '0', '151200000', '2', '100', '100', '100', '100', '100', '0', '0', '0', '1', '0', '', '0', '0', '');
INSERT INTO `players` VALUES ('7', 'Ruxaxup', '0', '1', '2', '114', '4', '1775', '1775', '23737743', '68', '76', '78', '39', '273', '0', '6', '565', '565', '489850', '200', '1', '1063', '1042', '7', '', '3085', '1', '1476928125', '16820416', '1', '0', '0', '0', '', '1476928127', '0', '7210', '151200000', '2', '100', '100', '100', '100', '100', '0', '0', '0', '1', '0', '', '0', '0', '');
INSERT INTO `players` VALUES ('8', 'Tu gfa en bici', '0', '1', '4', '123', '3', '1335', '1335', '30220849', '68', '76', '78', '39', '129', '0', '17', '1760', '1760', '296088', '200', '1', '1265', '1266', '7', 0x010040000002FFFFFFFF03E45101001A000000001B00000000150100000014983A0000FE010004000002FFFFFFFF03A00F00001A000000001B00000000FE, '2735', '1', '1476848799', '2059063741', '1', '0', '0', '0', '', '1476850227', '31', '0', '149882832', '2', '100', '100', '100', '100', '100', '0', '0', '0', '1', '0', '', '0', '0', '');
INSERT INTO `players` VALUES ('9', 'Ayaxx', '0', '1', '3', '40', '3', '505', '505', '964200', '68', '76', '78', '39', '128', '0', '7', '515', '515', '4387', '100', '1', '1042', '1061', '10', 0x010020000002FFFFFFFF03D49504001A000000001B0000000004A00F0000050F00000006D00700000714000000FE010040000002FFFFFFFF030CEC02001A000000001B00000000150100000014C0D40100FE010000800002FFFFFFFF03EC2C00001A000000001B00000000FE, '1075', '1', '1476759451', '29592251', '1', '0', '0', '0', '', '1476759791', '0', '0', '150916000', '2', '100', '100', '100', '100', '100', '0', '0', '0', '0', '0', '', '0', '0', '');
INSERT INTO `players` VALUES ('10', 'Soma Cruz', '0', '1', '3', '122', '2', '755', '755', '29082597', '95', '116', '38', '95', '133', '0', '87', '3455', '3455', '5123487', '100', '1', '1030', '1045', '7', '', '1575', '1', '1476853489', '29592251', '1', '0', '0', '0', '', '1476853497', '0', '0', '150293082', '2', '100', '100', '100', '100', '100', '0', '0', '0', '0', '0', '', '0', '0', '');

-- ----------------------------
-- Table structure for player_deaths
-- ----------------------------
DROP TABLE IF EXISTS `player_deaths`;
CREATE TABLE `player_deaths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player_deaths
-- ----------------------------
INSERT INTO `player_deaths` VALUES ('1', '4', '1476330434', '208');
INSERT INTO `player_deaths` VALUES ('2', '6', '1476330438', '274');
INSERT INTO `player_deaths` VALUES ('3', '4', '1476331808', '206');
INSERT INTO `player_deaths` VALUES ('4', '4', '1476332519', '206');
INSERT INTO `player_deaths` VALUES ('5', '6', '1476332536', '272');
INSERT INTO `player_deaths` VALUES ('6', '6', '1476411203', '271');
INSERT INTO `player_deaths` VALUES ('7', '7', '1476645164', '66');
INSERT INTO `player_deaths` VALUES ('8', '7', '1476653625', '83');
INSERT INTO `player_deaths` VALUES ('9', '7', '1476671321', '84');
INSERT INTO `player_deaths` VALUES ('10', '4', '1476762606', '208');
INSERT INTO `player_deaths` VALUES ('11', '8', '1476762611', '112');
INSERT INTO `player_deaths` VALUES ('12', '8', '1476763007', '111');
INSERT INTO `player_deaths` VALUES ('13', '4', '1476763029', '207');
INSERT INTO `player_deaths` VALUES ('14', '6', '1476763036', '272');
INSERT INTO `player_deaths` VALUES ('15', '10', '1476848355', '108');
INSERT INTO `player_deaths` VALUES ('16', '7', '1476848392', '101');
INSERT INTO `player_deaths` VALUES ('17', '8', '1476848423', '121');
INSERT INTO `player_deaths` VALUES ('18', '10', '1476848741', '106');
INSERT INTO `player_deaths` VALUES ('19', '7', '1476848743', '100');
INSERT INTO `player_deaths` VALUES ('20', '8', '1476848798', '120');
INSERT INTO `player_deaths` VALUES ('21', '10', '1476849324', '110');
INSERT INTO `player_deaths` VALUES ('22', '7', '1476853083', '109');
INSERT INTO `player_deaths` VALUES ('23', '7', '1476853477', '114');
INSERT INTO `player_deaths` VALUES ('24', '10', '1476853487', '123');

-- ----------------------------
-- Table structure for player_depotitems
-- ----------------------------
DROP TABLE IF EXISTS `player_depotitems`;
CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range, eg. 0-100 is reserved for depot lockers and all above 100 will be normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player_depotitems
-- ----------------------------
INSERT INTO `player_depotitems` VALUES ('6', '101', '1', '2589', '1', '');
INSERT INTO `player_depotitems` VALUES ('6', '102', '101', '2594', '1', '');
INSERT INTO `player_depotitems` VALUES ('7', '101', '0', '2589', '1', '');
INSERT INTO `player_depotitems` VALUES ('7', '102', '101', '2594', '1', '');
INSERT INTO `player_depotitems` VALUES ('8', '101', '1', '2589', '1', '');
INSERT INTO `player_depotitems` VALUES ('8', '102', '101', '2594', '1', '');
INSERT INTO `player_depotitems` VALUES ('10', '101', '1', '2589', '1', '');
INSERT INTO `player_depotitems` VALUES ('10', '102', '101', '2594', '1', '');
INSERT INTO `player_depotitems` VALUES ('10', '103', '102', '8901', '1', '');
INSERT INTO `player_depotitems` VALUES ('10', '104', '102', '2498', '1', '');
INSERT INTO `player_depotitems` VALUES ('10', '105', '102', '2645', '1', '');
INSERT INTO `player_depotitems` VALUES ('10', '106', '102', '2494', '1', '');

-- ----------------------------
-- Table structure for player_items
-- ----------------------------
DROP TABLE IF EXISTS `player_items`;
CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player_items
-- ----------------------------
INSERT INTO `player_items` VALUES ('2', '2', '101', '2139', '1', '');
INSERT INTO `player_items` VALUES ('2', '3', '102', '12707', '1', '');
INSERT INTO `player_items` VALUES ('2', '8', '103', '12769', '1', '');
INSERT INTO `player_items` VALUES ('2', '10', '104', '12673', '30', 0x0F1E);
INSERT INTO `player_items` VALUES ('2', '102', '105', '2152', '92', 0x0F5C);
INSERT INTO `player_items` VALUES ('2', '102', '106', '12678', '1', '');
INSERT INTO `player_items` VALUES ('2', '102', '107', '2304', '96', 0x0F60);
INSERT INTO `player_items` VALUES ('2', '102', '108', '2148', '2', 0x0F02);
INSERT INTO `player_items` VALUES ('2', '102', '109', '2286', '99', 0x0F63);
INSERT INTO `player_items` VALUES ('2', '102', '110', '2315', '97', 0x0F61);
INSERT INTO `player_items` VALUES ('2', '102', '111', '2313', '86', 0x0F56);
INSERT INTO `player_items` VALUES ('2', '102', '112', '2173', '1', '');
INSERT INTO `player_items` VALUES ('2', '102', '113', '2268', '86', 0x0F56);
INSERT INTO `player_items` VALUES ('2', '102', '114', '12770', '1', '');
INSERT INTO `player_items` VALUES ('2', '102', '115', '2273', '95', 0x0F5F);
INSERT INTO `player_items` VALUES ('2', '102', '116', '2160', '80', 0x0F50);
INSERT INTO `player_items` VALUES ('2', '102', '117', '12699', '1', '');
INSERT INTO `player_items` VALUES ('2', '102', '118', '11360', '1', 0x0F01);
INSERT INTO `player_items` VALUES ('2', '102', '119', '11360', '99', 0x0F63);
INSERT INTO `player_items` VALUES ('2', '102', '120', '7636', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('2', '102', '121', '11207', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('2', '102', '122', '7839', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('2', '102', '123', '6528', '1', '');
INSERT INTO `player_items` VALUES ('2', '102', '124', '8881', '1', '');
INSERT INTO `player_items` VALUES ('2', '102', '125', '12768', '1', '');
INSERT INTO `player_items` VALUES ('4', '1', '101', '12661', '1', '');
INSERT INTO `player_items` VALUES ('4', '2', '102', '2171', '1', '');
INSERT INTO `player_items` VALUES ('4', '3', '103', '1988', '1', '');
INSERT INTO `player_items` VALUES ('4', '4', '104', '2472', '1', '');
INSERT INTO `player_items` VALUES ('4', '5', '105', '12647', '1', '');
INSERT INTO `player_items` VALUES ('4', '6', '106', '12677', '1', 0x800200060061747461636B023B0000000B006465736372697074696F6E01170000002041747461636B20696E6372656173656420627920392E);
INSERT INTO `player_items` VALUES ('4', '7', '107', '12646', '1', '');
INSERT INTO `player_items` VALUES ('4', '8', '108', '11234', '1', '');
INSERT INTO `player_items` VALUES ('4', '10', '109', '12707', '1', '');
INSERT INTO `player_items` VALUES ('4', '103', '110', '2195', '1', '');
INSERT INTO `player_items` VALUES ('4', '103', '111', '5903', '1', '');
INSERT INTO `player_items` VALUES ('4', '103', '112', '12666', '1', 0x80020008006465636179696E67020000000008006475726174696F6E0228032F00);
INSERT INTO `player_items` VALUES ('4', '103', '113', '2148', '62', 0x0F3E);
INSERT INTO `player_items` VALUES ('4', '103', '114', '2152', '25', 0x0F19);
INSERT INTO `player_items` VALUES ('4', '103', '115', '2160', '13', 0x0F0D);
INSERT INTO `player_items` VALUES ('4', '103', '116', '12662', '1', '');
INSERT INTO `player_items` VALUES ('4', '103', '117', '2520', '1', '');
INSERT INTO `player_items` VALUES ('4', '103', '118', '2165', '1', 0x80020008006465636179696E67020000000008006475726174696F6E02209B0800);
INSERT INTO `player_items` VALUES ('4', '103', '119', '5808', '1', '');
INSERT INTO `player_items` VALUES ('4', '103', '120', '2164', '20', 0x8001000700636861726765730214000000);
INSERT INTO `player_items` VALUES ('4', '103', '121', '7454', '1', '');
INSERT INTO `player_items` VALUES ('4', '103', '122', '2494', '1', '');
INSERT INTO `player_items` VALUES ('4', '103', '123', '12427', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('4', '103', '124', '2554', '1', '');
INSERT INTO `player_items` VALUES ('4', '103', '125', '2120', '1', '');
INSERT INTO `player_items` VALUES ('4', '103', '126', '9971', '3', 0x0F03);
INSERT INTO `player_items` VALUES ('4', '103', '127', '2789', '47', 0x0F2F);
INSERT INTO `player_items` VALUES ('4', '109', '128', '7884', '1', '');
INSERT INTO `player_items` VALUES ('4', '109', '129', '12707', '1', '');
INSERT INTO `player_items` VALUES ('4', '109', '130', '8310', '48', 0x0F30);
INSERT INTO `player_items` VALUES ('4', '109', '131', '12676', '1', '');
INSERT INTO `player_items` VALUES ('4', '109', '132', '12707', '1', '');
INSERT INTO `player_items` VALUES ('4', '129', '133', '6132', '1', 0x80020008006465636179696E67020000000008006475726174696F6E02400BAA00);
INSERT INTO `player_items` VALUES ('4', '129', '134', '2305', '93', 0x0F5D);
INSERT INTO `player_items` VALUES ('4', '129', '135', '12704', '1', '');
INSERT INTO `player_items` VALUES ('4', '129', '136', '2160', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('4', '129', '137', '11296', '1', '');
INSERT INTO `player_items` VALUES ('4', '129', '138', '11298', '1', '');
INSERT INTO `player_items` VALUES ('4', '129', '139', '2472', '1', '');
INSERT INTO `player_items` VALUES ('4', '129', '140', '12678', '1', '');
INSERT INTO `player_items` VALUES ('4', '129', '141', '12707', '1', '');
INSERT INTO `player_items` VALUES ('4', '141', '142', '8473', '54', 0x0F36);
INSERT INTO `player_items` VALUES ('4', '141', '143', '8473', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('4', '141', '144', '8473', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('4', '141', '145', '7620', '52', 0x0F34);
INSERT INTO `player_items` VALUES ('4', '141', '146', '7620', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('4', '141', '147', '12707', '1', '');
INSERT INTO `player_items` VALUES ('5', '1', '101', '8820', '1', '');
INSERT INTO `player_items` VALUES ('5', '2', '102', '2173', '1', '');
INSERT INTO `player_items` VALUES ('5', '3', '103', '1988', '1', '');
INSERT INTO `player_items` VALUES ('5', '4', '104', '8819', '1', '');
INSERT INTO `player_items` VALUES ('5', '6', '105', '2456', '1', '');
INSERT INTO `player_items` VALUES ('5', '7', '106', '2648', '1', '');
INSERT INTO `player_items` VALUES ('5', '8', '107', '2643', '1', '');
INSERT INTO `player_items` VALUES ('5', '9', '108', '2164', '100', 0x8001000700636861726765730264000000);
INSERT INTO `player_items` VALUES ('5', '10', '109', '12627', '47', 0x0F2F);
INSERT INTO `player_items` VALUES ('5', '103', '110', '2152', '27', 0x0F1B);
INSERT INTO `player_items` VALUES ('5', '103', '111', '5806', '1', 0x8001000B006465736372697074696F6E0163000000497420697320676976656E20746F2074686520636F75726167656F757320766963746F72206F66207468652062617262617269616E206172656E6120736372617070657220646966666963756C74792E0A4177617264656420746F20536F6C69646F2E);
INSERT INTO `player_items` VALUES ('5', '103', '112', '7406', '1', '');
INSERT INTO `player_items` VALUES ('5', '103', '113', '5807', '1', 0x8001000B006465736372697074696F6E0164000000497420697320676976656E20746F2074686520636F75726167656F757320766963746F72206F66207468652062617262617269616E206172656E6120677265656E686F726E20646966666963756C74792E0A4177617264656420746F20536F6C69646F2E);
INSERT INTO `player_items` VALUES ('5', '103', '114', '2160', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('5', '103', '115', '8851', '1', '');
INSERT INTO `player_items` VALUES ('5', '103', '116', '7620', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('5', '103', '117', '2175', '1', '');
INSERT INTO `player_items` VALUES ('5', '103', '118', '2182', '1', '');
INSERT INTO `player_items` VALUES ('5', '103', '119', '2553', '1', '');
INSERT INTO `player_items` VALUES ('5', '103', '120', '12427', '99', 0x0F63);
INSERT INTO `player_items` VALUES ('5', '103', '121', '6528', '1', '');
INSERT INTO `player_items` VALUES ('5', '103', '122', '2365', '1', '');
INSERT INTO `player_items` VALUES ('5', '103', '123', '5791', '1', '');
INSERT INTO `player_items` VALUES ('5', '103', '124', '2354', '1', 0x80020008006465636179696E67020100000008006475726174696F6E02F0FCDB04);
INSERT INTO `player_items` VALUES ('5', '103', '125', '2361', '1', '');
INSERT INTO `player_items` VALUES ('5', '103', '126', '6132', '1', '');
INSERT INTO `player_items` VALUES ('5', '103', '127', '2260', '50', 0x0F32);
INSERT INTO `player_items` VALUES ('5', '103', '128', '12646', '1', '');
INSERT INTO `player_items` VALUES ('5', '103', '129', '2789', '95', 0x0F5F);
INSERT INTO `player_items` VALUES ('5', '122', '130', '2175', '1', '');
INSERT INTO `player_items` VALUES ('5', '122', '131', '2148', '50', 0x0F32);
INSERT INTO `player_items` VALUES ('6', '1', '101', '9778', '1', '');
INSERT INTO `player_items` VALUES ('6', '3', '102', '2365', '1', '');
INSERT INTO `player_items` VALUES ('6', '4', '103', '12604', '1', '');
INSERT INTO `player_items` VALUES ('6', '5', '104', '12669', '1', '');
INSERT INTO `player_items` VALUES ('6', '6', '105', '12702', '1', '');
INSERT INTO `player_items` VALUES ('6', '7', '106', '11298', '1', '');
INSERT INTO `player_items` VALUES ('6', '8', '107', '2195', '1', '');
INSERT INTO `player_items` VALUES ('6', '10', '108', '2160', '95', 0x0F5F);
INSERT INTO `player_items` VALUES ('6', '102', '109', '6132', '1', 0x80020008006465636179696E67020000000008006475726174696F6E02E8166500);
INSERT INTO `player_items` VALUES ('6', '102', '110', '12666', '1', 0x80020008006465636179696E67020000000008006475726174696F6E02C8F43300);
INSERT INTO `player_items` VALUES ('6', '102', '111', '2148', '50', 0x0F32);
INSERT INTO `player_items` VALUES ('6', '102', '112', '2152', '79', 0x0F4F);
INSERT INTO `player_items` VALUES ('6', '102', '113', '1988', '1', '');
INSERT INTO `player_items` VALUES ('6', '102', '114', '1988', '1', '');
INSERT INTO `player_items` VALUES ('6', '102', '115', '9971', '2', 0x0F02);
INSERT INTO `player_items` VALUES ('6', '102', '116', '8844', '14', 0x0F0E);
INSERT INTO `player_items` VALUES ('6', '102', '117', '5911', '1', 0x0F01);
INSERT INTO `player_items` VALUES ('6', '102', '118', '6500', '10', 0x0F0A);
INSERT INTO `player_items` VALUES ('6', '102', '119', '2789', '21', 0x0F15);
INSERT INTO `player_items` VALUES ('6', '102', '120', '12707', '1', '');
INSERT INTO `player_items` VALUES ('6', '113', '121', '2646', '1', '');
INSERT INTO `player_items` VALUES ('6', '113', '122', '8901', '1', '');
INSERT INTO `player_items` VALUES ('6', '114', '123', '2520', '1', '');
INSERT INTO `player_items` VALUES ('6', '114', '124', '8890', '1', '');
INSERT INTO `player_items` VALUES ('6', '114', '125', '2200', '255', 0x80010007006368617267657302FF000000);
INSERT INTO `player_items` VALUES ('6', '114', '126', '2179', '1', '');
INSERT INTO `player_items` VALUES ('6', '114', '127', '2150', '7', 0x0F07);
INSERT INTO `player_items` VALUES ('6', '114', '128', '2387', '1', '');
INSERT INTO `player_items` VALUES ('6', '114', '129', '2176', '1', '');
INSERT INTO `player_items` VALUES ('6', '120', '130', '7590', '39', 0x0F27);
INSERT INTO `player_items` VALUES ('6', '120', '131', '7590', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('6', '120', '132', '7590', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('6', '120', '133', '2274', '24', 0x0F18);
INSERT INTO `player_items` VALUES ('6', '120', '134', '2274', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('6', '120', '135', '2274', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('6', '120', '136', '2274', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('6', '120', '137', '2274', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('6', '120', '138', '2268', '99', 0x0F63);
INSERT INTO `player_items` VALUES ('6', '120', '139', '2268', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('6', '120', '140', '2268', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('6', '120', '141', '2268', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('6', '120', '142', '2269', '63', 0x0F3F);
INSERT INTO `player_items` VALUES ('6', '120', '143', '5891', '1', 0x0F01);
INSERT INTO `player_items` VALUES ('6', '120', '144', '7590', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('7', '1', '101', '2493', '1', '');
INSERT INTO `player_items` VALUES ('7', '2', '102', '2173', '1', '');
INSERT INTO `player_items` VALUES ('7', '3', '103', '1988', '1', '');
INSERT INTO `player_items` VALUES ('7', '4', '104', '2486', '1', '');
INSERT INTO `player_items` VALUES ('7', '5', '105', '2520', '1', '');
INSERT INTO `player_items` VALUES ('7', '6', '106', '2431', '1', '');
INSERT INTO `player_items` VALUES ('7', '7', '107', '2478', '1', '');
INSERT INTO `player_items` VALUES ('7', '8', '108', '2645', '1', '');
INSERT INTO `player_items` VALUES ('7', '10', '109', '7620', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('7', '103', '110', '7620', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('7', '103', '111', '5880', '2', 0x0F02);
INSERT INTO `player_items` VALUES ('7', '103', '112', '12765', '4', 0x0F04);
INSERT INTO `player_items` VALUES ('7', '103', '113', '12764', '7', 0x0F07);
INSERT INTO `player_items` VALUES ('7', '103', '114', '2120', '1', '');
INSERT INTO `player_items` VALUES ('7', '103', '115', '2149', '2', 0x0F02);
INSERT INTO `player_items` VALUES ('7', '103', '116', '7368', '9', 0x0F09);
INSERT INTO `player_items` VALUES ('7', '103', '117', '1988', '1', '');
INSERT INTO `player_items` VALUES ('7', '103', '118', '2129', '1', '');
INSERT INTO `player_items` VALUES ('7', '103', '119', '1987', '1', '');
INSERT INTO `player_items` VALUES ('7', '103', '120', '2145', '8', 0x0F08);
INSERT INTO `player_items` VALUES ('7', '103', '121', '7588', '11', 0x0F0B);
INSERT INTO `player_items` VALUES ('7', '103', '122', '1987', '1', '');
INSERT INTO `player_items` VALUES ('7', '103', '123', '2170', '200', 0x80010007006368617267657302C8000000);
INSERT INTO `player_items` VALUES ('7', '103', '124', '2801', '1', 0x0F01);
INSERT INTO `player_items` VALUES ('7', '103', '125', '2789', '82', 0x0F52);
INSERT INTO `player_items` VALUES ('7', '117', '126', '7620', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('7', '117', '127', '7413', '1', '');
INSERT INTO `player_items` VALUES ('7', '117', '128', '7413', '1', '');
INSERT INTO `player_items` VALUES ('7', '117', '129', '7407', '1', '');
INSERT INTO `player_items` VALUES ('7', '117', '130', '7407', '1', '');
INSERT INTO `player_items` VALUES ('7', '117', '131', '7454', '1', '');
INSERT INTO `player_items` VALUES ('7', '117', '132', '7413', '1', '');
INSERT INTO `player_items` VALUES ('7', '117', '133', '7454', '1', '');
INSERT INTO `player_items` VALUES ('7', '117', '134', '7387', '1', '');
INSERT INTO `player_items` VALUES ('7', '117', '135', '7413', '1', '');
INSERT INTO `player_items` VALUES ('7', '117', '136', '7620', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('7', '117', '137', '8473', '11', 0x0F0B);
INSERT INTO `player_items` VALUES ('7', '117', '138', '7591', '28', 0x0F1C);
INSERT INTO `player_items` VALUES ('7', '117', '139', '7591', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('7', '117', '140', '7591', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('7', '117', '141', '7620', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('7', '117', '142', '7620', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('7', '117', '143', '1988', '1', '');
INSERT INTO `player_items` VALUES ('7', '117', '144', '1988', '1', '');
INSERT INTO `player_items` VALUES ('7', '119', '145', '2161', '213', 0x80010007006368617267657302D5000000);
INSERT INTO `player_items` VALUES ('7', '119', '146', '7889', '200', 0x80010007006368617267657302C8000000);
INSERT INTO `player_items` VALUES ('7', '122', '147', '7889', '200', 0x80010007006368617267657302C8000000);
INSERT INTO `player_items` VALUES ('7', '122', '148', '2335', '1', '');
INSERT INTO `player_items` VALUES ('7', '122', '149', '2335', '1', '');
INSERT INTO `player_items` VALUES ('8', '1', '101', '2493', '1', '');
INSERT INTO `player_items` VALUES ('8', '3', '102', '1988', '1', '');
INSERT INTO `player_items` VALUES ('8', '4', '103', '2494', '1', '');
INSERT INTO `player_items` VALUES ('8', '5', '104', '7368', '23', 0x0F17);
INSERT INTO `player_items` VALUES ('8', '6', '105', '2514', '1', '');
INSERT INTO `player_items` VALUES ('8', '7', '106', '2470', '1', '');
INSERT INTO `player_items` VALUES ('8', '8', '107', '2645', '1', '');
INSERT INTO `player_items` VALUES ('8', '10', '108', '2160', '2', 0x0F02);
INSERT INTO `player_items` VALUES ('8', '102', '109', '2520', '1', '');
INSERT INTO `player_items` VALUES ('8', '102', '110', '2152', '37', 0x0F25);
INSERT INTO `player_items` VALUES ('8', '102', '111', '7368', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('8', '102', '112', '7368', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('8', '102', '113', '7368', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('8', '102', '114', '8472', '73', 0x0F49);
INSERT INTO `player_items` VALUES ('8', '102', '115', '8472', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('8', '102', '116', '8472', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('8', '102', '117', '7405', '1', '');
INSERT INTO `player_items` VALUES ('8', '102', '118', '2149', '3', 0x0F03);
INSERT INTO `player_items` VALUES ('8', '102', '119', '2789', '44', 0x0F2C);
INSERT INTO `player_items` VALUES ('9', '3', '101', '1988', '1', '');
INSERT INTO `player_items` VALUES ('9', '4', '102', '2660', '1', '');
INSERT INTO `player_items` VALUES ('9', '5', '103', '3965', '1', 0x0F01);
INSERT INTO `player_items` VALUES ('9', '6', '104', '2541', '1', '');
INSERT INTO `player_items` VALUES ('9', '7', '105', '8923', '1', '');
INSERT INTO `player_items` VALUES ('9', '8', '106', '2643', '1', '');
INSERT INTO `player_items` VALUES ('9', '10', '107', '7618', '16', 0x0F10);
INSERT INTO `player_items` VALUES ('9', '101', '108', '2399', '6', 0x0F06);
INSERT INTO `player_items` VALUES ('9', '101', '109', '2160', '1', 0x0F01);
INSERT INTO `player_items` VALUES ('9', '101', '110', '2152', '1', 0x0F01);
INSERT INTO `player_items` VALUES ('9', '101', '111', '2148', '67', 0x0F43);
INSERT INTO `player_items` VALUES ('9', '101', '112', '2789', '97', 0x0F61);
INSERT INTO `player_items` VALUES ('10', '1', '101', '2493', '1', '');
INSERT INTO `player_items` VALUES ('10', '2', '102', '2199', '144', 0x8001000700636861726765730290000000);
INSERT INTO `player_items` VALUES ('10', '3', '103', '1988', '1', '');
INSERT INTO `player_items` VALUES ('10', '4', '104', '8871', '1', '');
INSERT INTO `player_items` VALUES ('10', '5', '105', '2183', '1', '');
INSERT INTO `player_items` VALUES ('10', '6', '106', '2520', '1', '');
INSERT INTO `player_items` VALUES ('10', '7', '107', '11298', '1', '');
INSERT INTO `player_items` VALUES ('10', '8', '108', '2643', '1', '');
INSERT INTO `player_items` VALUES ('10', '9', '109', '2205', '1', 0x80020008006465636179696E67020100000008006475726174696F6E02980A0800);
INSERT INTO `player_items` VALUES ('10', '10', '110', '2160', '77', 0x0F4D);
INSERT INTO `player_items` VALUES ('10', '103', '111', '7886', '1', '');
INSERT INTO `player_items` VALUES ('10', '103', '112', '2148', '10', 0x0F0A);
INSERT INTO `player_items` VALUES ('10', '103', '113', '2152', '3', 0x0F03);
INSERT INTO `player_items` VALUES ('10', '103', '114', '9971', '1', 0x0F01);
INSERT INTO `player_items` VALUES ('10', '103', '115', '2274', '60', 0x0F3C);
INSERT INTO `player_items` VALUES ('10', '103', '116', '2269', '99', 0x0F63);
INSERT INTO `player_items` VALUES ('10', '103', '117', '1988', '1', '');
INSERT INTO `player_items` VALUES ('10', '103', '118', '2173', '1', '');
INSERT INTO `player_items` VALUES ('10', '103', '119', '2305', '78', 0x0F4E);
INSERT INTO `player_items` VALUES ('10', '103', '120', '12707', '1', '');
INSERT INTO `player_items` VALUES ('10', '103', '121', '2789', '88', 0x0F58);
INSERT INTO `player_items` VALUES ('10', '117', '122', '2164', '32', 0x8001000700636861726765730220000000);
INSERT INTO `player_items` VALUES ('10', '117', '123', '2168', '1', 0x80020008006465636179696E67020000000008006475726174696F6E02788C0F00);
INSERT INTO `player_items` VALUES ('10', '117', '124', '2168', '1', 0x80020008006465636179696E67020000000008006475726174696F6E02E8320D00);
INSERT INTO `player_items` VALUES ('10', '117', '125', '2164', '100', 0x8001000700636861726765730264000000);
INSERT INTO `player_items` VALUES ('10', '117', '126', '2164', '100', 0x8001000700636861726765730264000000);
INSERT INTO `player_items` VALUES ('10', '117', '127', '2164', '100', 0x8001000700636861726765730264000000);
INSERT INTO `player_items` VALUES ('10', '117', '128', '2164', '100', 0x8001000700636861726765730264000000);
INSERT INTO `player_items` VALUES ('10', '117', '129', '2164', '100', 0x8001000700636861726765730264000000);
INSERT INTO `player_items` VALUES ('10', '117', '130', '2164', '100', 0x8001000700636861726765730264000000);
INSERT INTO `player_items` VALUES ('10', '117', '131', '2164', '100', 0x8001000700636861726765730264000000);
INSERT INTO `player_items` VALUES ('10', '117', '132', '2164', '100', 0x8001000700636861726765730264000000);
INSERT INTO `player_items` VALUES ('10', '117', '133', '2164', '100', 0x8001000700636861726765730264000000);
INSERT INTO `player_items` VALUES ('10', '117', '134', '2164', '100', 0x8001000700636861726765730264000000);
INSERT INTO `player_items` VALUES ('10', '117', '135', '2164', '100', 0x8001000700636861726765730264000000);
INSERT INTO `player_items` VALUES ('10', '117', '136', '2164', '100', 0x8001000700636861726765730264000000);
INSERT INTO `player_items` VALUES ('10', '117', '137', '2164', '100', 0x8001000700636861726765730264000000);
INSERT INTO `player_items` VALUES ('10', '117', '138', '2164', '100', 0x8001000700636861726765730264000000);
INSERT INTO `player_items` VALUES ('10', '120', '139', '7590', '66', 0x0F42);
INSERT INTO `player_items` VALUES ('10', '120', '140', '7590', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('10', '120', '141', '2268', '33', 0x0F21);
INSERT INTO `player_items` VALUES ('10', '120', '142', '2268', '100', 0x0F64);
INSERT INTO `player_items` VALUES ('10', '120', '143', '2268', '100', 0x0F64);

-- ----------------------------
-- Table structure for player_killers
-- ----------------------------
DROP TABLE IF EXISTS `player_killers`;
CREATE TABLE `player_killers` (
  `kill_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  KEY `kill_id` (`kill_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `player_killers_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player_killers
-- ----------------------------
INSERT INTO `player_killers` VALUES ('2', '6');
INSERT INTO `player_killers` VALUES ('41', '6');
INSERT INTO `player_killers` VALUES ('61', '10');
INSERT INTO `player_killers` VALUES ('64', '10');

-- ----------------------------
-- Table structure for player_namelocks
-- ----------------------------
DROP TABLE IF EXISTS `player_namelocks`;
CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `new_name` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT '0',
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player_namelocks
-- ----------------------------

-- ----------------------------
-- Table structure for player_skills
-- ----------------------------
DROP TABLE IF EXISTS `player_skills`;
CREATE TABLE `player_skills` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `skillid` tinyint(2) NOT NULL DEFAULT '0',
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id_2` (`player_id`,`skillid`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_skills_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player_skills
-- ----------------------------
INSERT INTO `player_skills` VALUES ('2', '0', '10', '0');
INSERT INTO `player_skills` VALUES ('2', '1', '10', '0');
INSERT INTO `player_skills` VALUES ('2', '2', '11', '30');
INSERT INTO `player_skills` VALUES ('2', '3', '10', '0');
INSERT INTO `player_skills` VALUES ('2', '4', '38', '0');
INSERT INTO `player_skills` VALUES ('2', '5', '87', '38659');
INSERT INTO `player_skills` VALUES ('2', '6', '10', '0');
INSERT INTO `player_skills` VALUES ('3', '0', '10', '0');
INSERT INTO `player_skills` VALUES ('3', '1', '10', '0');
INSERT INTO `player_skills` VALUES ('3', '2', '10', '0');
INSERT INTO `player_skills` VALUES ('3', '3', '10', '0');
INSERT INTO `player_skills` VALUES ('3', '4', '10', '0');
INSERT INTO `player_skills` VALUES ('3', '5', '10', '0');
INSERT INTO `player_skills` VALUES ('3', '6', '10', '0');
INSERT INTO `player_skills` VALUES ('4', '0', '10', '0');
INSERT INTO `player_skills` VALUES ('4', '1', '10', '0');
INSERT INTO `player_skills` VALUES ('4', '2', '111', '384139');
INSERT INTO `player_skills` VALUES ('4', '3', '10', '0');
INSERT INTO `player_skills` VALUES ('4', '4', '10', '0');
INSERT INTO `player_skills` VALUES ('4', '5', '106', '403942');
INSERT INTO `player_skills` VALUES ('4', '6', '10', '0');
INSERT INTO `player_skills` VALUES ('5', '0', '56', '0');
INSERT INTO `player_skills` VALUES ('5', '1', '10', '0');
INSERT INTO `player_skills` VALUES ('5', '2', '10', '0');
INSERT INTO `player_skills` VALUES ('5', '3', '10', '0');
INSERT INTO `player_skills` VALUES ('5', '4', '42', '0');
INSERT INTO `player_skills` VALUES ('5', '5', '10', '0');
INSERT INTO `player_skills` VALUES ('5', '6', '10', '0');
INSERT INTO `player_skills` VALUES ('6', '0', '10', '0');
INSERT INTO `player_skills` VALUES ('6', '1', '10', '0');
INSERT INTO `player_skills` VALUES ('6', '2', '10', '0');
INSERT INTO `player_skills` VALUES ('6', '3', '10', '0');
INSERT INTO `player_skills` VALUES ('6', '4', '10', '0');
INSERT INTO `player_skills` VALUES ('6', '5', '16', '556');
INSERT INTO `player_skills` VALUES ('6', '6', '10', '0');
INSERT INTO `player_skills` VALUES ('7', '0', '13', '27');
INSERT INTO `player_skills` VALUES ('7', '1', '10', '0');
INSERT INTO `player_skills` VALUES ('7', '2', '10', '0');
INSERT INTO `player_skills` VALUES ('7', '3', '96', '165688');
INSERT INTO `player_skills` VALUES ('7', '4', '10', '0');
INSERT INTO `player_skills` VALUES ('7', '5', '89', '82677');
INSERT INTO `player_skills` VALUES ('7', '6', '10', '0');
INSERT INTO `player_skills` VALUES ('8', '0', '10', '0');
INSERT INTO `player_skills` VALUES ('8', '1', '10', '0');
INSERT INTO `player_skills` VALUES ('8', '2', '10', '0');
INSERT INTO `player_skills` VALUES ('8', '3', '10', '0');
INSERT INTO `player_skills` VALUES ('8', '4', '104', '225395');
INSERT INTO `player_skills` VALUES ('8', '5', '92', '32432');
INSERT INTO `player_skills` VALUES ('8', '6', '10', '0');
INSERT INTO `player_skills` VALUES ('9', '0', '10', '0');
INSERT INTO `player_skills` VALUES ('9', '1', '10', '0');
INSERT INTO `player_skills` VALUES ('9', '2', '10', '0');
INSERT INTO `player_skills` VALUES ('9', '3', '10', '0');
INSERT INTO `player_skills` VALUES ('9', '4', '96', '6243');
INSERT INTO `player_skills` VALUES ('9', '5', '83', '40298');
INSERT INTO `player_skills` VALUES ('9', '6', '10', '0');
INSERT INTO `player_skills` VALUES ('10', '0', '10', '0');
INSERT INTO `player_skills` VALUES ('10', '1', '10', '0');
INSERT INTO `player_skills` VALUES ('10', '2', '10', '0');
INSERT INTO `player_skills` VALUES ('10', '3', '10', '0');
INSERT INTO `player_skills` VALUES ('10', '4', '10', '0');
INSERT INTO `player_skills` VALUES ('10', '5', '12', '159');
INSERT INTO `player_skills` VALUES ('10', '6', '10', '0');

-- ----------------------------
-- Table structure for player_spells
-- ----------------------------
DROP TABLE IF EXISTS `player_spells`;
CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`name`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player_spells
-- ----------------------------

-- ----------------------------
-- Table structure for player_storage
-- ----------------------------
DROP TABLE IF EXISTS `player_storage`;
CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `key` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id_2` (`player_id`,`key`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player_storage
-- ----------------------------
INSERT INTO `player_storage` VALUES ('1', '30001', '1');
INSERT INTO `player_storage` VALUES ('1', '42300', '0');
INSERT INTO `player_storage` VALUES ('1', '42301', '0');
INSERT INTO `player_storage` VALUES ('1', '42302', '0');
INSERT INTO `player_storage` VALUES ('1', '42303', '0');
INSERT INTO `player_storage` VALUES ('1', '42304', '0');
INSERT INTO `player_storage` VALUES ('1', '42305', '0');
INSERT INTO `player_storage` VALUES ('1', '42306', '0');
INSERT INTO `player_storage` VALUES ('1', '42307', '0');
INSERT INTO `player_storage` VALUES ('1', '42308', '0');
INSERT INTO `player_storage` VALUES ('1', '42309', '0');
INSERT INTO `player_storage` VALUES ('1', '42310', '0');
INSERT INTO `player_storage` VALUES ('1', '42311', '0');
INSERT INTO `player_storage` VALUES ('1', '42312', '0');
INSERT INTO `player_storage` VALUES ('1', '42313', '0');
INSERT INTO `player_storage` VALUES ('1', '42314', '0');
INSERT INTO `player_storage` VALUES ('1', '42315', '0');
INSERT INTO `player_storage` VALUES ('1', '42316', '0');
INSERT INTO `player_storage` VALUES ('1', '42317', '0');
INSERT INTO `player_storage` VALUES ('1', '42318', '0');
INSERT INTO `player_storage` VALUES ('1', '42319', '0');
INSERT INTO `player_storage` VALUES ('1', '42320', '0');
INSERT INTO `player_storage` VALUES ('1', '42321', '0');
INSERT INTO `player_storage` VALUES ('1', '42322', '0');
INSERT INTO `player_storage` VALUES ('1', '42323', '0');
INSERT INTO `player_storage` VALUES ('1', '42324', '0');
INSERT INTO `player_storage` VALUES ('1', '42325', '0');
INSERT INTO `player_storage` VALUES ('1', '42326', '0');
INSERT INTO `player_storage` VALUES ('1', '42327', '0');
INSERT INTO `player_storage` VALUES ('1', '42328', '0');
INSERT INTO `player_storage` VALUES ('1', '42329', '0');
INSERT INTO `player_storage` VALUES ('1', '42350', '0');
INSERT INTO `player_storage` VALUES ('1', '42352', '0');
INSERT INTO `player_storage` VALUES ('1', '42355', '0');
INSERT INTO `player_storage` VALUES ('1', '50000', '-1');
INSERT INTO `player_storage` VALUES ('2', '3005', '3');
INSERT INTO `player_storage` VALUES ('2', '5953', '1');
INSERT INTO `player_storage` VALUES ('2', '5954', '1');
INSERT INTO `player_storage` VALUES ('2', '5955', '1');
INSERT INTO `player_storage` VALUES ('2', '5956', '1');
INSERT INTO `player_storage` VALUES ('2', '5957', '1');
INSERT INTO `player_storage` VALUES ('2', '8560', '1');
INSERT INTO `player_storage` VALUES ('2', '8742', '1');
INSERT INTO `player_storage` VALUES ('2', '10274', '1');
INSERT INTO `player_storage` VALUES ('2', '10275', '1');
INSERT INTO `player_storage` VALUES ('2', '10276', '1');
INSERT INTO `player_storage` VALUES ('2', '10277', '1');
INSERT INTO `player_storage` VALUES ('2', '10278', '1');
INSERT INTO `player_storage` VALUES ('2', '10279', '1');
INSERT INTO `player_storage` VALUES ('2', '10280', '1');
INSERT INTO `player_storage` VALUES ('2', '10300', '1');
INSERT INTO `player_storage` VALUES ('2', '30001', '1');
INSERT INTO `player_storage` VALUES ('2', '42300', '0');
INSERT INTO `player_storage` VALUES ('2', '42301', '0');
INSERT INTO `player_storage` VALUES ('2', '42302', '0');
INSERT INTO `player_storage` VALUES ('2', '42303', '0');
INSERT INTO `player_storage` VALUES ('2', '42304', '0');
INSERT INTO `player_storage` VALUES ('2', '42305', '0');
INSERT INTO `player_storage` VALUES ('2', '42306', '0');
INSERT INTO `player_storage` VALUES ('2', '42307', '0');
INSERT INTO `player_storage` VALUES ('2', '42308', '0');
INSERT INTO `player_storage` VALUES ('2', '42309', '0');
INSERT INTO `player_storage` VALUES ('2', '42310', '0');
INSERT INTO `player_storage` VALUES ('2', '42311', '0');
INSERT INTO `player_storage` VALUES ('2', '42312', '0');
INSERT INTO `player_storage` VALUES ('2', '42313', '0');
INSERT INTO `player_storage` VALUES ('2', '42314', '0');
INSERT INTO `player_storage` VALUES ('2', '42315', '0');
INSERT INTO `player_storage` VALUES ('2', '42316', '0');
INSERT INTO `player_storage` VALUES ('2', '42317', '0');
INSERT INTO `player_storage` VALUES ('2', '42318', '0');
INSERT INTO `player_storage` VALUES ('2', '42319', '0');
INSERT INTO `player_storage` VALUES ('2', '42320', '0');
INSERT INTO `player_storage` VALUES ('2', '42321', '0');
INSERT INTO `player_storage` VALUES ('2', '42322', '0');
INSERT INTO `player_storage` VALUES ('2', '42323', '0');
INSERT INTO `player_storage` VALUES ('2', '42324', '0');
INSERT INTO `player_storage` VALUES ('2', '42325', '0');
INSERT INTO `player_storage` VALUES ('2', '42326', '0');
INSERT INTO `player_storage` VALUES ('2', '42327', '0');
INSERT INTO `player_storage` VALUES ('2', '42328', '0');
INSERT INTO `player_storage` VALUES ('2', '42329', '0');
INSERT INTO `player_storage` VALUES ('2', '42350', '0');
INSERT INTO `player_storage` VALUES ('2', '42352', '0');
INSERT INTO `player_storage` VALUES ('2', '42355', '0');
INSERT INTO `player_storage` VALUES ('2', '42360', '1');
INSERT INTO `player_storage` VALUES ('2', '42361', '1');
INSERT INTO `player_storage` VALUES ('2', '42370', '1');
INSERT INTO `player_storage` VALUES ('2', '42371', '1');
INSERT INTO `player_storage` VALUES ('2', '50000', '-1');
INSERT INTO `player_storage` VALUES ('2', '50001', '-1');
INSERT INTO `player_storage` VALUES ('2', '56123', '4');
INSERT INTO `player_storage` VALUES ('2', '65000', '-1');
INSERT INTO `player_storage` VALUES ('2', '65001', '1476402340');
INSERT INTO `player_storage` VALUES ('2', '65002', '6');
INSERT INTO `player_storage` VALUES ('2', '65003', '0.4');
INSERT INTO `player_storage` VALUES ('2', '65004', '0.3');
INSERT INTO `player_storage` VALUES ('2', '65005', '50');
INSERT INTO `player_storage` VALUES ('2', '65006', '90');
INSERT INTO `player_storage` VALUES ('2', '65007', '90');
INSERT INTO `player_storage` VALUES ('2', '65009', '0');
INSERT INTO `player_storage` VALUES ('3', '30001', '1');
INSERT INTO `player_storage` VALUES ('3', '42300', '0');
INSERT INTO `player_storage` VALUES ('3', '42301', '0');
INSERT INTO `player_storage` VALUES ('3', '42302', '0');
INSERT INTO `player_storage` VALUES ('3', '42303', '0');
INSERT INTO `player_storage` VALUES ('3', '42304', '0');
INSERT INTO `player_storage` VALUES ('3', '42305', '0');
INSERT INTO `player_storage` VALUES ('3', '42306', '0');
INSERT INTO `player_storage` VALUES ('3', '42307', '0');
INSERT INTO `player_storage` VALUES ('3', '42308', '0');
INSERT INTO `player_storage` VALUES ('3', '42309', '0');
INSERT INTO `player_storage` VALUES ('3', '42310', '0');
INSERT INTO `player_storage` VALUES ('3', '42311', '0');
INSERT INTO `player_storage` VALUES ('3', '42312', '0');
INSERT INTO `player_storage` VALUES ('3', '42313', '0');
INSERT INTO `player_storage` VALUES ('3', '42314', '0');
INSERT INTO `player_storage` VALUES ('3', '42315', '0');
INSERT INTO `player_storage` VALUES ('3', '42316', '0');
INSERT INTO `player_storage` VALUES ('3', '42317', '0');
INSERT INTO `player_storage` VALUES ('3', '42318', '0');
INSERT INTO `player_storage` VALUES ('3', '42319', '0');
INSERT INTO `player_storage` VALUES ('3', '42320', '0');
INSERT INTO `player_storage` VALUES ('3', '42321', '0');
INSERT INTO `player_storage` VALUES ('3', '42322', '0');
INSERT INTO `player_storage` VALUES ('3', '42323', '0');
INSERT INTO `player_storage` VALUES ('3', '42324', '0');
INSERT INTO `player_storage` VALUES ('3', '42325', '0');
INSERT INTO `player_storage` VALUES ('3', '42326', '0');
INSERT INTO `player_storage` VALUES ('3', '42327', '0');
INSERT INTO `player_storage` VALUES ('3', '42328', '0');
INSERT INTO `player_storage` VALUES ('3', '42329', '0');
INSERT INTO `player_storage` VALUES ('3', '42350', '0');
INSERT INTO `player_storage` VALUES ('3', '42352', '0');
INSERT INTO `player_storage` VALUES ('3', '42355', '0');
INSERT INTO `player_storage` VALUES ('3', '50000', '-1');
INSERT INTO `player_storage` VALUES ('4', '100', '30');
INSERT INTO `player_storage` VALUES ('4', '600', '3');
INSERT INTO `player_storage` VALUES ('4', '3000', '33');
INSERT INTO `player_storage` VALUES ('4', '3001', '2');
INSERT INTO `player_storage` VALUES ('4', '3002', '12');
INSERT INTO `player_storage` VALUES ('4', '3014', '37');
INSERT INTO `player_storage` VALUES ('4', '3016', '7');
INSERT INTO `player_storage` VALUES ('4', '3017', '13');
INSERT INTO `player_storage` VALUES ('4', '5010', '1');
INSERT INTO `player_storage` VALUES ('4', '5054', '-1');
INSERT INTO `player_storage` VALUES ('4', '5055', '-1');
INSERT INTO `player_storage` VALUES ('4', '10278', '1');
INSERT INTO `player_storage` VALUES ('4', '30001', '1');
INSERT INTO `player_storage` VALUES ('4', '30228', '1');
INSERT INTO `player_storage` VALUES ('4', '42300', '0');
INSERT INTO `player_storage` VALUES ('4', '42301', '0');
INSERT INTO `player_storage` VALUES ('4', '42302', '0');
INSERT INTO `player_storage` VALUES ('4', '42303', '0');
INSERT INTO `player_storage` VALUES ('4', '42304', '0');
INSERT INTO `player_storage` VALUES ('4', '42305', '0');
INSERT INTO `player_storage` VALUES ('4', '42306', '0');
INSERT INTO `player_storage` VALUES ('4', '42307', '0');
INSERT INTO `player_storage` VALUES ('4', '42308', '0');
INSERT INTO `player_storage` VALUES ('4', '42309', '0');
INSERT INTO `player_storage` VALUES ('4', '42310', '0');
INSERT INTO `player_storage` VALUES ('4', '42311', '0');
INSERT INTO `player_storage` VALUES ('4', '42312', '0');
INSERT INTO `player_storage` VALUES ('4', '42313', '0');
INSERT INTO `player_storage` VALUES ('4', '42314', '0');
INSERT INTO `player_storage` VALUES ('4', '42315', '0');
INSERT INTO `player_storage` VALUES ('4', '42316', '0');
INSERT INTO `player_storage` VALUES ('4', '42317', '0');
INSERT INTO `player_storage` VALUES ('4', '42318', '0');
INSERT INTO `player_storage` VALUES ('4', '42319', '0');
INSERT INTO `player_storage` VALUES ('4', '42320', '0');
INSERT INTO `player_storage` VALUES ('4', '42321', '0');
INSERT INTO `player_storage` VALUES ('4', '42322', '0');
INSERT INTO `player_storage` VALUES ('4', '42323', '0');
INSERT INTO `player_storage` VALUES ('4', '42324', '0');
INSERT INTO `player_storage` VALUES ('4', '42325', '0');
INSERT INTO `player_storage` VALUES ('4', '42326', '0');
INSERT INTO `player_storage` VALUES ('4', '42327', '0');
INSERT INTO `player_storage` VALUES ('4', '42328', '0');
INSERT INTO `player_storage` VALUES ('4', '42329', '0');
INSERT INTO `player_storage` VALUES ('4', '42350', '0');
INSERT INTO `player_storage` VALUES ('4', '42352', '0');
INSERT INTO `player_storage` VALUES ('4', '42355', '0');
INSERT INTO `player_storage` VALUES ('4', '50000', '-1');
INSERT INTO `player_storage` VALUES ('4', '50001', '1');
INSERT INTO `player_storage` VALUES ('4', '65000', '-1');
INSERT INTO `player_storage` VALUES ('4', '65001', '1476764395');
INSERT INTO `player_storage` VALUES ('4', '65002', '6');
INSERT INTO `player_storage` VALUES ('4', '65003', '0.4');
INSERT INTO `player_storage` VALUES ('4', '65004', '0.3');
INSERT INTO `player_storage` VALUES ('4', '65005', '25');
INSERT INTO `player_storage` VALUES ('4', '65006', '90');
INSERT INTO `player_storage` VALUES ('4', '65007', '90');
INSERT INTO `player_storage` VALUES ('4', '65008', '35');
INSERT INTO `player_storage` VALUES ('4', '65009', '75');
INSERT INTO `player_storage` VALUES ('4', '65534', '1');
INSERT INTO `player_storage` VALUES ('4', '10001501', '262147');
INSERT INTO `player_storage` VALUES ('5', '3001', '2');
INSERT INTO `player_storage` VALUES ('5', '3002', '4');
INSERT INTO `player_storage` VALUES ('5', '5953', '1');
INSERT INTO `player_storage` VALUES ('5', '5954', '1');
INSERT INTO `player_storage` VALUES ('5', '5955', '1');
INSERT INTO `player_storage` VALUES ('5', '5956', '1');
INSERT INTO `player_storage` VALUES ('5', '5957', '1');
INSERT INTO `player_storage` VALUES ('5', '8560', '1');
INSERT INTO `player_storage` VALUES ('5', '8742', '1');
INSERT INTO `player_storage` VALUES ('5', '10274', '1');
INSERT INTO `player_storage` VALUES ('5', '10275', '1');
INSERT INTO `player_storage` VALUES ('5', '10276', '1');
INSERT INTO `player_storage` VALUES ('5', '10277', '1');
INSERT INTO `player_storage` VALUES ('5', '10278', '1');
INSERT INTO `player_storage` VALUES ('5', '10279', '1');
INSERT INTO `player_storage` VALUES ('5', '10280', '1');
INSERT INTO `player_storage` VALUES ('5', '30001', '1');
INSERT INTO `player_storage` VALUES ('5', '42300', '1');
INSERT INTO `player_storage` VALUES ('5', '42301', '1');
INSERT INTO `player_storage` VALUES ('5', '42302', '1');
INSERT INTO `player_storage` VALUES ('5', '42303', '1');
INSERT INTO `player_storage` VALUES ('5', '42304', '1');
INSERT INTO `player_storage` VALUES ('5', '42305', '1');
INSERT INTO `player_storage` VALUES ('5', '42306', '1');
INSERT INTO `player_storage` VALUES ('5', '42307', '1');
INSERT INTO `player_storage` VALUES ('5', '42308', '1');
INSERT INTO `player_storage` VALUES ('5', '42309', '1');
INSERT INTO `player_storage` VALUES ('5', '42310', '1');
INSERT INTO `player_storage` VALUES ('5', '42311', '1');
INSERT INTO `player_storage` VALUES ('5', '42312', '1');
INSERT INTO `player_storage` VALUES ('5', '42313', '1');
INSERT INTO `player_storage` VALUES ('5', '42314', '1');
INSERT INTO `player_storage` VALUES ('5', '42315', '1');
INSERT INTO `player_storage` VALUES ('5', '42316', '1');
INSERT INTO `player_storage` VALUES ('5', '42317', '1');
INSERT INTO `player_storage` VALUES ('5', '42318', '1');
INSERT INTO `player_storage` VALUES ('5', '42319', '1');
INSERT INTO `player_storage` VALUES ('5', '42320', '0');
INSERT INTO `player_storage` VALUES ('5', '42321', '0');
INSERT INTO `player_storage` VALUES ('5', '42322', '0');
INSERT INTO `player_storage` VALUES ('5', '42323', '0');
INSERT INTO `player_storage` VALUES ('5', '42324', '0');
INSERT INTO `player_storage` VALUES ('5', '42325', '0');
INSERT INTO `player_storage` VALUES ('5', '42326', '0');
INSERT INTO `player_storage` VALUES ('5', '42327', '0');
INSERT INTO `player_storage` VALUES ('5', '42328', '0');
INSERT INTO `player_storage` VALUES ('5', '42329', '0');
INSERT INTO `player_storage` VALUES ('5', '42330', '1');
INSERT INTO `player_storage` VALUES ('5', '42350', '0');
INSERT INTO `player_storage` VALUES ('5', '42351', '0');
INSERT INTO `player_storage` VALUES ('5', '42352', '0');
INSERT INTO `player_storage` VALUES ('5', '42355', '2');
INSERT INTO `player_storage` VALUES ('5', '42360', '1');
INSERT INTO `player_storage` VALUES ('5', '42361', '1');
INSERT INTO `player_storage` VALUES ('5', '42370', '1');
INSERT INTO `player_storage` VALUES ('5', '50000', '-1');
INSERT INTO `player_storage` VALUES ('5', '56123', '5');
INSERT INTO `player_storage` VALUES ('5', '65002', '7');
INSERT INTO `player_storage` VALUES ('5', '65003', '0');
INSERT INTO `player_storage` VALUES ('5', '65006', '0');
INSERT INTO `player_storage` VALUES ('5', '65007', '0');
INSERT INTO `player_storage` VALUES ('6', '103', '0');
INSERT INTO `player_storage` VALUES ('6', '600', '6');
INSERT INTO `player_storage` VALUES ('6', '1900', '-1');
INSERT INTO `player_storage` VALUES ('6', '3000', '32');
INSERT INTO `player_storage` VALUES ('6', '3002', '11');
INSERT INTO `player_storage` VALUES ('6', '3013', '13');
INSERT INTO `player_storage` VALUES ('6', '3017', '18');
INSERT INTO `player_storage` VALUES ('6', '5010', '1');
INSERT INTO `player_storage` VALUES ('6', '5054', '-1');
INSERT INTO `player_storage` VALUES ('6', '5055', '-1');
INSERT INTO `player_storage` VALUES ('6', '10278', '1');
INSERT INTO `player_storage` VALUES ('6', '30001', '1');
INSERT INTO `player_storage` VALUES ('6', '30228', '1');
INSERT INTO `player_storage` VALUES ('6', '42300', '0');
INSERT INTO `player_storage` VALUES ('6', '42301', '0');
INSERT INTO `player_storage` VALUES ('6', '42302', '0');
INSERT INTO `player_storage` VALUES ('6', '42303', '0');
INSERT INTO `player_storage` VALUES ('6', '42304', '0');
INSERT INTO `player_storage` VALUES ('6', '42305', '0');
INSERT INTO `player_storage` VALUES ('6', '42306', '0');
INSERT INTO `player_storage` VALUES ('6', '42307', '0');
INSERT INTO `player_storage` VALUES ('6', '42308', '0');
INSERT INTO `player_storage` VALUES ('6', '42309', '0');
INSERT INTO `player_storage` VALUES ('6', '42310', '0');
INSERT INTO `player_storage` VALUES ('6', '42311', '0');
INSERT INTO `player_storage` VALUES ('6', '42312', '0');
INSERT INTO `player_storage` VALUES ('6', '42313', '0');
INSERT INTO `player_storage` VALUES ('6', '42314', '0');
INSERT INTO `player_storage` VALUES ('6', '42315', '0');
INSERT INTO `player_storage` VALUES ('6', '42316', '0');
INSERT INTO `player_storage` VALUES ('6', '42317', '0');
INSERT INTO `player_storage` VALUES ('6', '42318', '0');
INSERT INTO `player_storage` VALUES ('6', '42319', '0');
INSERT INTO `player_storage` VALUES ('6', '42320', '0');
INSERT INTO `player_storage` VALUES ('6', '42321', '0');
INSERT INTO `player_storage` VALUES ('6', '42322', '0');
INSERT INTO `player_storage` VALUES ('6', '42323', '0');
INSERT INTO `player_storage` VALUES ('6', '42324', '0');
INSERT INTO `player_storage` VALUES ('6', '42325', '0');
INSERT INTO `player_storage` VALUES ('6', '42326', '0');
INSERT INTO `player_storage` VALUES ('6', '42327', '0');
INSERT INTO `player_storage` VALUES ('6', '42328', '0');
INSERT INTO `player_storage` VALUES ('6', '42329', '0');
INSERT INTO `player_storage` VALUES ('6', '42350', '0');
INSERT INTO `player_storage` VALUES ('6', '42352', '0');
INSERT INTO `player_storage` VALUES ('6', '42355', '0');
INSERT INTO `player_storage` VALUES ('6', '50000', '-1');
INSERT INTO `player_storage` VALUES ('6', '56123', '1');
INSERT INTO `player_storage` VALUES ('6', '65000', '-1');
INSERT INTO `player_storage` VALUES ('6', '65001', '1476328294');
INSERT INTO `player_storage` VALUES ('6', '65002', '6');
INSERT INTO `player_storage` VALUES ('6', '65003', '0.4');
INSERT INTO `player_storage` VALUES ('6', '65004', '0.3');
INSERT INTO `player_storage` VALUES ('6', '65005', '0');
INSERT INTO `player_storage` VALUES ('6', '65006', '40');
INSERT INTO `player_storage` VALUES ('6', '65007', '90');
INSERT INTO `player_storage` VALUES ('6', '10001501', '196611');
INSERT INTO `player_storage` VALUES ('6', '10001502', '393219');
INSERT INTO `player_storage` VALUES ('6', '10001503', '655363');
INSERT INTO `player_storage` VALUES ('6', '10001504', '786435');
INSERT INTO `player_storage` VALUES ('7', '100', '100');
INSERT INTO `player_storage` VALUES ('7', '103', '0');
INSERT INTO `player_storage` VALUES ('7', '1002', '1');
INSERT INTO `player_storage` VALUES ('7', '1003', '1');
INSERT INTO `player_storage` VALUES ('7', '1007', '1');
INSERT INTO `player_storage` VALUES ('7', '1900', '-1');
INSERT INTO `player_storage` VALUES ('7', '3000', '15');
INSERT INTO `player_storage` VALUES ('7', '3005', '56');
INSERT INTO `player_storage` VALUES ('7', '3014', '29');
INSERT INTO `player_storage` VALUES ('7', '3038', '1');
INSERT INTO `player_storage` VALUES ('7', '4046', '1');
INSERT INTO `player_storage` VALUES ('7', '5010', '1');
INSERT INTO `player_storage` VALUES ('7', '5054', '-1');
INSERT INTO `player_storage` VALUES ('7', '5055', '-1');
INSERT INTO `player_storage` VALUES ('7', '30001', '1');
INSERT INTO `player_storage` VALUES ('7', '42300', '0');
INSERT INTO `player_storage` VALUES ('7', '42301', '0');
INSERT INTO `player_storage` VALUES ('7', '42302', '0');
INSERT INTO `player_storage` VALUES ('7', '42303', '0');
INSERT INTO `player_storage` VALUES ('7', '42304', '0');
INSERT INTO `player_storage` VALUES ('7', '42305', '0');
INSERT INTO `player_storage` VALUES ('7', '42306', '0');
INSERT INTO `player_storage` VALUES ('7', '42307', '0');
INSERT INTO `player_storage` VALUES ('7', '42308', '0');
INSERT INTO `player_storage` VALUES ('7', '42309', '0');
INSERT INTO `player_storage` VALUES ('7', '42310', '0');
INSERT INTO `player_storage` VALUES ('7', '42311', '0');
INSERT INTO `player_storage` VALUES ('7', '42312', '0');
INSERT INTO `player_storage` VALUES ('7', '42313', '0');
INSERT INTO `player_storage` VALUES ('7', '42314', '0');
INSERT INTO `player_storage` VALUES ('7', '42315', '0');
INSERT INTO `player_storage` VALUES ('7', '42316', '0');
INSERT INTO `player_storage` VALUES ('7', '42317', '0');
INSERT INTO `player_storage` VALUES ('7', '42318', '0');
INSERT INTO `player_storage` VALUES ('7', '42319', '0');
INSERT INTO `player_storage` VALUES ('7', '42320', '0');
INSERT INTO `player_storage` VALUES ('7', '42321', '0');
INSERT INTO `player_storage` VALUES ('7', '42322', '0');
INSERT INTO `player_storage` VALUES ('7', '42323', '0');
INSERT INTO `player_storage` VALUES ('7', '42324', '0');
INSERT INTO `player_storage` VALUES ('7', '42325', '0');
INSERT INTO `player_storage` VALUES ('7', '42326', '0');
INSERT INTO `player_storage` VALUES ('7', '42327', '0');
INSERT INTO `player_storage` VALUES ('7', '42328', '0');
INSERT INTO `player_storage` VALUES ('7', '42329', '0');
INSERT INTO `player_storage` VALUES ('7', '42350', '0');
INSERT INTO `player_storage` VALUES ('7', '42352', '0');
INSERT INTO `player_storage` VALUES ('7', '42355', '0');
INSERT INTO `player_storage` VALUES ('7', '50000', '-1');
INSERT INTO `player_storage` VALUES ('7', '65000', '-1');
INSERT INTO `player_storage` VALUES ('7', '65001', '1476853564');
INSERT INTO `player_storage` VALUES ('7', '65003', '0');
INSERT INTO `player_storage` VALUES ('7', '65004', '0.3');
INSERT INTO `player_storage` VALUES ('7', '65005', '20');
INSERT INTO `player_storage` VALUES ('7', '65006', '0');
INSERT INTO `player_storage` VALUES ('7', '65007', '50');
INSERT INTO `player_storage` VALUES ('7', '65008', '110');
INSERT INTO `player_storage` VALUES ('8', '100', '100');
INSERT INTO `player_storage` VALUES ('8', '1002', '1');
INSERT INTO `player_storage` VALUES ('8', '1003', '1');
INSERT INTO `player_storage` VALUES ('8', '1007', '1');
INSERT INTO `player_storage` VALUES ('8', '3000', '23');
INSERT INTO `player_storage` VALUES ('8', '3005', '47');
INSERT INTO `player_storage` VALUES ('8', '3007', '6');
INSERT INTO `player_storage` VALUES ('8', '3014', '64');
INSERT INTO `player_storage` VALUES ('8', '3017', '38');
INSERT INTO `player_storage` VALUES ('8', '3038', '1');
INSERT INTO `player_storage` VALUES ('8', '4046', '1');
INSERT INTO `player_storage` VALUES ('8', '5010', '1');
INSERT INTO `player_storage` VALUES ('8', '5054', '-1');
INSERT INTO `player_storage` VALUES ('8', '5055', '-1');
INSERT INTO `player_storage` VALUES ('8', '30001', '1');
INSERT INTO `player_storage` VALUES ('8', '42300', '0');
INSERT INTO `player_storage` VALUES ('8', '42301', '0');
INSERT INTO `player_storage` VALUES ('8', '42302', '0');
INSERT INTO `player_storage` VALUES ('8', '42303', '0');
INSERT INTO `player_storage` VALUES ('8', '42304', '0');
INSERT INTO `player_storage` VALUES ('8', '42305', '0');
INSERT INTO `player_storage` VALUES ('8', '42306', '0');
INSERT INTO `player_storage` VALUES ('8', '42307', '0');
INSERT INTO `player_storage` VALUES ('8', '42308', '0');
INSERT INTO `player_storage` VALUES ('8', '42309', '0');
INSERT INTO `player_storage` VALUES ('8', '42310', '0');
INSERT INTO `player_storage` VALUES ('8', '42311', '0');
INSERT INTO `player_storage` VALUES ('8', '42312', '0');
INSERT INTO `player_storage` VALUES ('8', '42313', '0');
INSERT INTO `player_storage` VALUES ('8', '42314', '0');
INSERT INTO `player_storage` VALUES ('8', '42315', '0');
INSERT INTO `player_storage` VALUES ('8', '42316', '0');
INSERT INTO `player_storage` VALUES ('8', '42317', '0');
INSERT INTO `player_storage` VALUES ('8', '42318', '0');
INSERT INTO `player_storage` VALUES ('8', '42319', '0');
INSERT INTO `player_storage` VALUES ('8', '42320', '0');
INSERT INTO `player_storage` VALUES ('8', '42321', '0');
INSERT INTO `player_storage` VALUES ('8', '42322', '0');
INSERT INTO `player_storage` VALUES ('8', '42323', '0');
INSERT INTO `player_storage` VALUES ('8', '42324', '0');
INSERT INTO `player_storage` VALUES ('8', '42325', '0');
INSERT INTO `player_storage` VALUES ('8', '42326', '0');
INSERT INTO `player_storage` VALUES ('8', '42327', '0');
INSERT INTO `player_storage` VALUES ('8', '42328', '0');
INSERT INTO `player_storage` VALUES ('8', '42329', '0');
INSERT INTO `player_storage` VALUES ('8', '42350', '0');
INSERT INTO `player_storage` VALUES ('8', '42352', '0');
INSERT INTO `player_storage` VALUES ('8', '42355', '0');
INSERT INTO `player_storage` VALUES ('8', '50000', '-1');
INSERT INTO `player_storage` VALUES ('8', '65000', '4');
INSERT INTO `player_storage` VALUES ('8', '65001', '1476850227');
INSERT INTO `player_storage` VALUES ('8', '65003', '0.3');
INSERT INTO `player_storage` VALUES ('8', '65004', '0');
INSERT INTO `player_storage` VALUES ('8', '65005', '15');
INSERT INTO `player_storage` VALUES ('8', '65006', '65');
INSERT INTO `player_storage` VALUES ('8', '65007', '0');
INSERT INTO `player_storage` VALUES ('8', '65008', '120');
INSERT INTO `player_storage` VALUES ('9', '100', '30');
INSERT INTO `player_storage` VALUES ('9', '3014', '31');
INSERT INTO `player_storage` VALUES ('9', '30001', '1');
INSERT INTO `player_storage` VALUES ('9', '42300', '0');
INSERT INTO `player_storage` VALUES ('9', '42301', '0');
INSERT INTO `player_storage` VALUES ('9', '42302', '0');
INSERT INTO `player_storage` VALUES ('9', '42303', '0');
INSERT INTO `player_storage` VALUES ('9', '42304', '0');
INSERT INTO `player_storage` VALUES ('9', '42305', '0');
INSERT INTO `player_storage` VALUES ('9', '42306', '0');
INSERT INTO `player_storage` VALUES ('9', '42307', '0');
INSERT INTO `player_storage` VALUES ('9', '42308', '0');
INSERT INTO `player_storage` VALUES ('9', '42309', '0');
INSERT INTO `player_storage` VALUES ('9', '42310', '0');
INSERT INTO `player_storage` VALUES ('9', '42311', '0');
INSERT INTO `player_storage` VALUES ('9', '42312', '0');
INSERT INTO `player_storage` VALUES ('9', '42313', '0');
INSERT INTO `player_storage` VALUES ('9', '42314', '0');
INSERT INTO `player_storage` VALUES ('9', '42315', '0');
INSERT INTO `player_storage` VALUES ('9', '42316', '0');
INSERT INTO `player_storage` VALUES ('9', '42317', '0');
INSERT INTO `player_storage` VALUES ('9', '42318', '0');
INSERT INTO `player_storage` VALUES ('9', '42319', '0');
INSERT INTO `player_storage` VALUES ('9', '42320', '0');
INSERT INTO `player_storage` VALUES ('9', '42321', '0');
INSERT INTO `player_storage` VALUES ('9', '42322', '0');
INSERT INTO `player_storage` VALUES ('9', '42323', '0');
INSERT INTO `player_storage` VALUES ('9', '42324', '0');
INSERT INTO `player_storage` VALUES ('9', '42325', '0');
INSERT INTO `player_storage` VALUES ('9', '42326', '0');
INSERT INTO `player_storage` VALUES ('9', '42327', '0');
INSERT INTO `player_storage` VALUES ('9', '42328', '0');
INSERT INTO `player_storage` VALUES ('9', '42329', '0');
INSERT INTO `player_storage` VALUES ('9', '42350', '0');
INSERT INTO `player_storage` VALUES ('9', '42352', '0');
INSERT INTO `player_storage` VALUES ('9', '42355', '0');
INSERT INTO `player_storage` VALUES ('9', '50000', '-1');
INSERT INTO `player_storage` VALUES ('9', '65000', '-1');
INSERT INTO `player_storage` VALUES ('9', '65001', '1476655815');
INSERT INTO `player_storage` VALUES ('9', '65003', '0');
INSERT INTO `player_storage` VALUES ('9', '65004', '0.05');
INSERT INTO `player_storage` VALUES ('9', '65005', '25');
INSERT INTO `player_storage` VALUES ('9', '65006', '0');
INSERT INTO `player_storage` VALUES ('9', '65007', '5');
INSERT INTO `player_storage` VALUES ('9', '65008', '40');
INSERT INTO `player_storage` VALUES ('10', '600', '1');
INSERT INTO `player_storage` VALUES ('10', '1002', '1');
INSERT INTO `player_storage` VALUES ('10', '1003', '1');
INSERT INTO `player_storage` VALUES ('10', '1007', '1');
INSERT INTO `player_storage` VALUES ('10', '3000', '20');
INSERT INTO `player_storage` VALUES ('10', '3007', '4');
INSERT INTO `player_storage` VALUES ('10', '5010', '1');
INSERT INTO `player_storage` VALUES ('10', '30001', '1');
INSERT INTO `player_storage` VALUES ('10', '42300', '0');
INSERT INTO `player_storage` VALUES ('10', '42301', '0');
INSERT INTO `player_storage` VALUES ('10', '42302', '0');
INSERT INTO `player_storage` VALUES ('10', '42303', '0');
INSERT INTO `player_storage` VALUES ('10', '42304', '0');
INSERT INTO `player_storage` VALUES ('10', '42305', '0');
INSERT INTO `player_storage` VALUES ('10', '42306', '0');
INSERT INTO `player_storage` VALUES ('10', '42307', '0');
INSERT INTO `player_storage` VALUES ('10', '42308', '0');
INSERT INTO `player_storage` VALUES ('10', '42309', '0');
INSERT INTO `player_storage` VALUES ('10', '42310', '0');
INSERT INTO `player_storage` VALUES ('10', '42311', '0');
INSERT INTO `player_storage` VALUES ('10', '42312', '0');
INSERT INTO `player_storage` VALUES ('10', '42313', '0');
INSERT INTO `player_storage` VALUES ('10', '42314', '0');
INSERT INTO `player_storage` VALUES ('10', '42315', '0');
INSERT INTO `player_storage` VALUES ('10', '42316', '0');
INSERT INTO `player_storage` VALUES ('10', '42317', '0');
INSERT INTO `player_storage` VALUES ('10', '42318', '0');
INSERT INTO `player_storage` VALUES ('10', '42319', '0');
INSERT INTO `player_storage` VALUES ('10', '42320', '0');
INSERT INTO `player_storage` VALUES ('10', '42321', '0');
INSERT INTO `player_storage` VALUES ('10', '42322', '0');
INSERT INTO `player_storage` VALUES ('10', '42323', '0');
INSERT INTO `player_storage` VALUES ('10', '42324', '0');
INSERT INTO `player_storage` VALUES ('10', '42325', '0');
INSERT INTO `player_storage` VALUES ('10', '42326', '0');
INSERT INTO `player_storage` VALUES ('10', '42327', '0');
INSERT INTO `player_storage` VALUES ('10', '42328', '0');
INSERT INTO `player_storage` VALUES ('10', '42329', '0');
INSERT INTO `player_storage` VALUES ('10', '42350', '0');
INSERT INTO `player_storage` VALUES ('10', '42352', '0');
INSERT INTO `player_storage` VALUES ('10', '42355', '0');
INSERT INTO `player_storage` VALUES ('10', '50000', '-1');
INSERT INTO `player_storage` VALUES ('10', '65003', '0');
INSERT INTO `player_storage` VALUES ('10', '65004', '0.3');
INSERT INTO `player_storage` VALUES ('10', '65005', '15');
INSERT INTO `player_storage` VALUES ('10', '65006', '0');
INSERT INTO `player_storage` VALUES ('10', '65007', '70');
INSERT INTO `player_storage` VALUES ('10', '65008', '120');

-- ----------------------------
-- Table structure for player_viplist
-- ----------------------------
DROP TABLE IF EXISTS `player_viplist`;
CREATE TABLE `player_viplist` (
  `player_id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`vip_id`),
  KEY `player_id` (`player_id`),
  KEY `vip_id` (`vip_id`),
  CONSTRAINT `player_viplist_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  CONSTRAINT `player_viplist_ibfk_2` FOREIGN KEY (`vip_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player_viplist
-- ----------------------------

-- ----------------------------
-- Table structure for server_config
-- ----------------------------
DROP TABLE IF EXISTS `server_config`;
CREATE TABLE `server_config` (
  `config` varchar(35) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `config` (`config`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of server_config
-- ----------------------------
INSERT INTO `server_config` VALUES ('db_version', '29');
INSERT INTO `server_config` VALUES ('encryption', '2');

-- ----------------------------
-- Table structure for server_motd
-- ----------------------------
DROP TABLE IF EXISTS `server_motd`;
CREATE TABLE `server_motd` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  UNIQUE KEY `id` (`id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of server_motd
-- ----------------------------
INSERT INTO `server_motd` VALUES ('1', '0', 'Welcome to The Forgotten Server!');
INSERT INTO `server_motd` VALUES ('2', '0', 'Welcome to the Forgotten Server!');

-- ----------------------------
-- Table structure for server_record
-- ----------------------------
DROP TABLE IF EXISTS `server_record`;
CREATE TABLE `server_record` (
  `record` int(11) NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL,
  UNIQUE KEY `record` (`record`,`world_id`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of server_record
-- ----------------------------
INSERT INTO `server_record` VALUES ('0', '0', '0');
INSERT INTO `server_record` VALUES ('1', '0', '1476292593');
INSERT INTO `server_record` VALUES ('2', '0', '1476328059');
INSERT INTO `server_record` VALUES ('3', '0', '1476645841');

-- ----------------------------
-- Table structure for server_reports
-- ----------------------------
DROP TABLE IF EXISTS `server_reports`;
CREATE TABLE `server_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '1',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL DEFAULT '0',
  `report` text NOT NULL,
  `reads` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `world_id` (`world_id`),
  KEY `reads` (`reads`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `server_reports_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of server_reports
-- ----------------------------

-- ----------------------------
-- Table structure for tiles
-- ----------------------------
DROP TABLE IF EXISTS `tiles`;
CREATE TABLE `tiles` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `house_id` int(10) unsigned NOT NULL,
  `x` int(5) unsigned NOT NULL,
  `y` int(5) unsigned NOT NULL,
  `z` tinyint(2) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`,`world_id`),
  KEY `x` (`x`,`y`,`z`),
  KEY `house_id` (`house_id`,`world_id`),
  CONSTRAINT `tiles_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tiles
-- ----------------------------

-- ----------------------------
-- Table structure for tile_items
-- ----------------------------
DROP TABLE IF EXISTS `tile_items`;
CREATE TABLE `tile_items` (
  `tile_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  UNIQUE KEY `tile_id` (`tile_id`,`world_id`,`sid`),
  KEY `sid` (`sid`),
  CONSTRAINT `tile_items_ibfk_1` FOREIGN KEY (`tile_id`) REFERENCES `tiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tile_items
-- ----------------------------

-- ----------------------------
-- Table structure for tile_store
-- ----------------------------
DROP TABLE IF EXISTS `tile_store`;
CREATE TABLE `tile_store` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  KEY `house_id` (`house_id`),
  CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tile_store
-- ----------------------------
INSERT INTO `tile_store` VALUES ('1', '0', 0x070516030601000000C5048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F7573652027456E69676D61205371756172652049272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363830303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1', '0', 0x060516030701000000C5048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F7573652027456E69676D61205371756172652049272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363830303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1', '0', 0x08051C030701000000C5048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F7573652027456E69676D61205371756172652049272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2', '0', 0xFD041B030601000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F7573652027456E69676D6120537175617265204949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363030303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2', '0', 0xFD041B030701000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F7573652027456E69676D6120537175617265204949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2', '0', '');
INSERT INTO `tile_store` VALUES ('3', '0', 0xF70416030601000000C3048002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F7573652027456E69676D612053717561726520494949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353030303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('3', '0', 0xF70416030701000000C3048002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F7573652027456E69676D612053717561726520494949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('3', '0', 0xF50419030601000000C5048002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F7573652027456E69676D612053717561726520494949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353030303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('3', '0', 0xF5041C030701000000C5048002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F7573652027456E69676D612053717561726520494949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('4', '0', 0xED041E030601000000C5048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F7573652027456E69676D6120537175617265204956272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('4', '0', 0xEC041E030701000000C5048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F7573652027456E69676D6120537175617265204956272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('4', '0', 0xF20421030701000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F7573652027456E69676D6120537175617265204956272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('5', '0', 0xE9042B030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('5', '0', 0xEB042B030701000000C3048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F7573652027456E69676D61205371756172652056272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363930303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('5', '0', 0xE9042C030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('5', '0', 0xEC042C030601000000C5048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F7573652027456E69676D61205371756172652056272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363930303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('5', '0', 0xEC042D030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('5', '0', 0xEC042E030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('5', '0', 0xF2042A030701000000C3048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F7573652027456E69676D61205371756172652056272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('6', '0', 0xFD042F030701000000C5048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F7573652027456E69676D6120537175617265205649272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('6', '0', 0xFA0431030601000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F7573652027456E69676D6120537175617265205649272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353930303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('6', '0', 0xF90431030701000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F7573652027456E69676D6120537175617265205649272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353930303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('7', '0', 0x05052F030701000000C5048002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F7573652027456E69676D612053717561726520564949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('7', '0', 0x080534030701000000C3048002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F7573652027456E69676D612053717561726520564949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363830303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('8', '0', 0x08052A030701000000C3048002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F7573652027456E69676D61205371756172652056494949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('8', '0', 0x0D052C030701000000C5048002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F7573652027456E69676D61205371756172652056494949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('9', '0', 0x080524030701000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F7573652027456E69676D6120537175617265204958272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('10', '0', 0xED0438030701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F7573652027456E69676D6120506C617A612049272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('11', '0', 0xED043C030701000000C3048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F7573652027456E69676D6120506C617A61204949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('12', '0', 0xF1043E030701000000C5048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F7573652027456E69676D6120506C617A6120494949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('13', '0', 0xFA043C030701000000C3048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F7573652027456E69676D6120506C617A61204956272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('14', '0', 0xD70411030601000000C3048002000B006465736372697074696F6E015600000049742062656C6F6E677320746F20686F7573652027426F6174204C616E652049272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323330303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('14', '0', 0xD40413030701000000C5048002000B006465736372697074696F6E015600000049742062656C6F6E677320746F20686F7573652027426F6174204C616E652049272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('14', '0', 0xD70411030701000000C3048002000B006465736372697074696F6E015600000049742062656C6F6E677320746F20686F7573652027426F6174204C616E652049272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323330303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('15', '0', 0xE3040F030701000000C3048002000B006465736372697074696F6E015600000049742062656C6F6E677320746F20686F7573652027426F6174204C616E65204949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373830303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('15', '0', 0xE30410030601000000C3048002000B006465736372697074696F6E015600000049742062656C6F6E677320746F20686F7573652027426F6174204C616E65204949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373830303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('15', '0', 0xE60411030701000000C5048002000B006465736372697074696F6E015600000049742062656C6F6E677320746F20686F7573652027426F6174204C616E65204949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('16', '0', 0xF90407030701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F75736520275765737465726E20466C61742049272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('16', '0', 0xF6040A030701000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F75736520275765737465726E20466C61742049272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('17', '0', 0xFD0407030701000000C3048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F75736520275765737465726E20466C6174204949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('17', '0', '');
INSERT INTO `tile_store` VALUES ('18', '0', 0xF90407030601000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520275765737465726E20466C617420494949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('19', '0', 0xFD0407030601000000C3048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F75736520275765737465726E20466C6174204956272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('20', '0', 0xF90407030501000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F75736520275765737465726E20466C61742056272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('21', '0', 0x3304C4030501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('21', '0', 0x3304C5030501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('21', '0', 0x3304C7030501000000C5048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383030303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('21', '0', 0x3304C5030601000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('21', '0', 0x3304C5030701000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383030303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('21', '0', 0x3504C4030501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('21', '0', 0x3504C5030501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('21', '0', 0x3504C4030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('21', '0', 0x3504C5030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('21', '0', 0x3504C7030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('21', '0', 0x3504C4030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('21', '0', 0x3504C5030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('21', '0', 0x3504C7030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('21', '0', 0x3304C8030601000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383030303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('21', '0', 0x3204CA030701000000C6048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('21', '0', 0x3304C8030701000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383030303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('21', '0', 0x3504C8030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('21', '0', 0x3504C8030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('22', '0', 0x3A04C4030501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('22', '0', 0x3A04C5030501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('22', '0', 0x3A04C7030501000000C5048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F7573652027466F7262696464656E2031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383130303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('22', '0', 0x3A04C5030601000000C3048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F7573652027466F7262696464656E2031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383130303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('22', '0', 0x3A04C5030701000000C3048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F7573652027466F7262696464656E2031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383130303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('22', '0', 0x3C04C4030501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('22', '0', 0x3C04C5030501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('22', '0', 0x3C04C4030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('22', '0', 0x3C04C5030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('22', '0', 0x3C04C7030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('22', '0', 0x3C04C4030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('22', '0', 0x3C04C5030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('22', '0', 0x3C04C7030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('22', '0', 0x3A04C8030601000000C3048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F7573652027466F7262696464656E2031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383130303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('22', '0', 0x3904CA030701000000C6048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F7573652027466F7262696464656E2031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('22', '0', 0x3A04C8030701000000C3048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F7573652027466F7262696464656E2031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('22', '0', 0x3C04C8030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('22', '0', 0x3C04C8030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('23', '0', 0x0E0507030701000000C3048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F75736520274561737465726E20466C6174204949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('23', '0', 0x11050A030701000000C5048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F75736520274561737465726E20466C6174204949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('24', '0', 0x0A0507030601000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274561737465726E20466C617420494949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('25', '0', 0x0E0507030601000000C3048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F75736520274561737465726E20466C6174204956272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('26', '0', 0x0A0507030501000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F75736520274561737465726E20466C61742056272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('27', '0', 0x0E0507030501000000C3048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F75736520274561737465726E20466C6174205649272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('28', '0', 0x0605FB020701000000C3048002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F75736520274F6365616E204D616E73696F6E272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('28', '0', '');
INSERT INTO `tile_store` VALUES ('29', '0', 0x0905F4020701000000C5048002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F75736520274F6365616E20506C617A612049272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('30', '0', 0x0E05F4020701000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F75736520274F6365616E20506C617A61204949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('31', '0', 0x1305F4020701000000C5048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F75736520274F6365616E20506C617A6120494949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('32', '0', 0x37051E030601000000C5048002000B006465736372697074696F6E016100000049742062656C6F6E677320746F20686F75736520274775696C64686F757365206F6620746865205061726B272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313430303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('32', '0', 0x37051E030701000000C5048002000B006465736372697074696F6E016100000049742062656C6F6E677320746F20686F75736520274775696C64686F757365206F6620746865205061726B272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('32', '0', 0x39051F030501000000C3048002000B006465736372697074696F6E016100000049742062656C6F6E677320746F20686F75736520274775696C64686F757365206F6620746865205061726B272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313430303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('32', '0', 0x39051F030701000000C3048002000B006465736372697074696F6E016100000049742062656C6F6E677320746F20686F75736520274775696C64686F757365206F6620746865205061726B272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313430303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('32', '0', 0x350522030701000000C3048002000B006465736372697074696F6E016100000049742062656C6F6E677320746F20686F75736520274775696C64686F757365206F6620746865205061726B272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('32', '0', 0x3C0520030601000000C5048002000B006465736372697074696F6E016100000049742062656C6F6E677320746F20686F75736520274775696C64686F757365206F6620746865205061726B272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313430303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('32', '0', 0x3D0524030601000000C5048002000B006465736372697074696F6E016100000049742062656C6F6E677320746F20686F75736520274775696C64686F757365206F6620746865205061726B272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313430303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('32', '0', 0x3D0524030701000000C5048002000B006465736372697074696F6E016100000049742062656C6F6E677320746F20686F75736520274775696C64686F757365206F6620746865205061726B272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313430303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('32', '0', 0x380528030701000000C5048002000B006465736372697074696F6E016100000049742062656C6F6E677320746F20686F75736520274775696C64686F757365206F6620746865205061726B272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('33', '0', 0x7F049C060801000000BC048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('33', '0', 0x83049E060801000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('33', '0', 0x83049F060801000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('34', '0', 0x820495060801000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('34', '0', 0x820496060801000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('34', '0', 0x800498060801000000BC048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('35', '0', 0x7D0496060801000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('35', '0', 0x7D0497060801000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('35', '0', 0x7B0499060801000000BC048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('36', '0', 0x76049A060801000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('36', '0', 0x76049B060801000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('36', '0', 0x7A049C060801000000B9048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('37', '0', 0x7C046B060601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('37', '0', 0x7C046C060601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('37', '0', 0x80046B060501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('37', '0', 0x80046B060601000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363730303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('37', '0', 0x85046B060501000000B9048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363730303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('37', '0', 0x88046B060601000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('37', '0', 0x80046C060501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('37', '0', 0x81046E060601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('37', '0', 0x82046E060601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('37', '0', 0x84046D060601000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363730303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('38', '0', 0x2F050F030701000000C3048002000B006465736372697074696F6E015600000049742062656C6F6E677320746F20686F75736520275061726B20466C6174204949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('38', '0', 0x320511030701000000C5048002000B006465736372697074696F6E015600000049742062656C6F6E677320746F20686F75736520275061726B20466C6174204949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('39', '0', 0x2B050F030601000000C3048002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F75736520275061726B20466C617420494949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('40', '0', 0x170537030701000000C5048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F75736520275061726B204C616E652049272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('41', '0', 0x200537030701000000C5048002000B006465736372697074696F6E015600000049742062656C6F6E677320746F20686F75736520275061726B204C616E65204949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('42', '0', 0xD70428030701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F75736520275269766572205374726565742049272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('43', '0', 0xD70421030701000000C3048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F7573652027526976657220537472656574204949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('44', '0', 0xD7041A030701000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F757365202752697665722053747265657420494949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('45', '0', 0xE20427030701000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F757365202757697A617264277320486F7573652049272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('46', '0', 0xE2042C030701000000C3048002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202757697A617264277320486F757365204949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('47', '0', 0xE20427030601000000C3048002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202757697A617264277320486F75736520494949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('48', '0', 0xDE041C030601000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F75736520274D7973746963616C20486F757365272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373130303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('48', '0', 0xDE041C030701000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F75736520274D7973746963616C20486F757365272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('48', '0', 0xE2041A030701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F75736520274D7973746963616C20486F757365272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('49', '0', 0xD70435030501000000C3048002000B006465736372697074696F6E016200000049742062656C6F6E677320746F20686F75736520274775696C64686F757365206F6620746865205269766572272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313730303020676F6C6420636F696E732E0600646F6F726964020A00000000);
INSERT INTO `tile_store` VALUES ('49', '0', 0xD70435030601000000C3048002000B006465736372697074696F6E016200000049742062656C6F6E677320746F20686F75736520274775696C64686F757365206F6620746865205269766572272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313730303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('49', '0', 0xD70435030701000000C3048002000B006465736372697074696F6E016200000049742062656C6F6E677320746F20686F75736520274775696C64686F757365206F6620746865205269766572272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313730303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('49', '0', 0xDD0435030601000000C5048002000B006465736372697074696F6E016200000049742062656C6F6E677320746F20686F75736520274775696C64686F757365206F6620746865205269766572272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313730303020676F6C6420636F696E732E0600646F6F726964020900000000);
INSERT INTO `tile_store` VALUES ('49', '0', 0xDD0435030701000000C5048002000B006465736372697074696F6E016200000049742062656C6F6E677320746F20686F75736520274775696C64686F757365206F6620746865205269766572272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313730303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('49', '0', 0xD90438030501000000C5048002000B006465736372697074696F6E016200000049742062656C6F6E677320746F20686F75736520274775696C64686F757365206F6620746865205269766572272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313730303020676F6C6420636F696E732E0600646F6F726964020B00000000);
INSERT INTO `tile_store` VALUES ('49', '0', 0xD80438030601000000C5048002000B006465736372697074696F6E016200000049742062656C6F6E677320746F20686F75736520274775696C64686F757365206F6620746865205269766572272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313730303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('49', '0', 0xD90438030701000000C5048002000B006465736372697074696F6E016200000049742062656C6F6E677320746F20686F75736520274775696C64686F757365206F6620746865205269766572272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313730303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('49', '0', 0xDD0439030601000000C5048002000B006465736372697074696F6E016200000049742062656C6F6E677320746F20686F75736520274775696C64686F757365206F6620746865205269766572272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313730303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('49', '0', 0xDD0439030701000000C5048002000B006465736372697074696F6E016200000049742062656C6F6E677320746F20686F75736520274775696C64686F757365206F6620746865205269766572272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313730303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('49', '0', 0xE00438030701000000C3048002000B006465736372697074696F6E016200000049742062656C6F6E677320746F20686F75736520274775696C64686F757365206F6620746865205269766572272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('120', '0', 0xE602B3040501000000FC0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('120', '0', 0xE602B4040501000000FD0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('120', '0', 0xE802B6040501000000CF0D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('121', '0', 0xE002B9040501000000FC0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('121', '0', 0xE002BA040501000000FD0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('121', '0', 0xE402BA040501000000D80D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('122', '0', 0xEF02BE0405010000009E148002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('122', '0', 0xED02C2040501000000FE0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('122', '0', 0xEE02C2040501000000FF0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('123', '0', 0xF102C0040501000000FE0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('123', '0', 0xF202C0040501000000FF0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('123', '0', 0xF502C0040501000000CF0D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('123', '0', 0xF102C4040501000000FE0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('123', '0', 0xF202C4040501000000FF0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('124', '0', 0xF802C2040501000000FC0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('124', '0', 0xF802C3040501000000FD0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('124', '0', 0xFC02C2040501000000D80D8002000B006465736372697074696F6E014900000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('125', '0', 0xF802C5040501000000FC0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('125', '0', 0xF802C6040501000000FD0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('125', '0', 0xFD02C50405010000003D198002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('125', '0', 0xFD02C6040501000000D80D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('126', '0', 0xF802C5040401000000FC0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('126', '0', 0xF802C6040401000000FD0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('126', '0', 0xFD02C6040401000000D80D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('127', '0', 0xF202C1040401000000CF0D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('127', '0', 0xF502C1040401000000FC0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('127', '0', 0xF502C2040401000000FD0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('128', '0', 0xED02BF040401000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('128', '0', 0xED02C0040401000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('128', '0', 0xF002C0040401000000A1148002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('129', '0', 0xE602B3040401000000FC0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('129', '0', 0xE602B4040401000000FD0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('129', '0', 0xE802B6040401000000CF0D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313230303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('130', '0', 0xE002B9040401000000FE0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('130', '0', 0xE102B9040401000000FF0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('130', '0', 0xE402BA040401000000D80D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('131', '0', 0xED02D3040401000000FC0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('131', '0', 0xED02D4040401000000FD0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('131', '0', 0xF002D3040401000000FC0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('131', '0', 0xF102D1040401000000A1148002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('131', '0', 0xF002D4040401000000FD0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('132', '0', 0xF002DB040401000000FC0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('132', '0', 0xF002DC040401000000FD0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('132', '0', 0xF102DE0404010000009E148002000B006465736372697074696F6E014900000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('133', '0', 0xFC02AA040401000000D80D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('133', '0', 0xFE02AD040401000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('133', '0', 0xFE02AE040401000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('134', '0', 0xFA02AA040501000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('134', '0', 0xFA02AB040501000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('134', '0', 0xFE02AB040501000000D80D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313930303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('135', '0', 0x07039F0405010000003C198002000B006465736372697074696F6E014B00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333530303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('135', '0', 0x08039F040501000000CF0D8002000B006465736372697074696F6E014B00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('135', '0', '');
INSERT INTO `tile_store` VALUES ('135', '0', 0x0103A3040301000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('135', '0', 0x0203A1040401000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('135', '0', 0x0303A1040401000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('135', '0', 0x0303A3040501000000D80D8002000B006465736372697074696F6E014B00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333530303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('135', '0', 0x0503A2040301000000D80D8002000B006465736372697074696F6E014B00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333530303020676F6C6420636F696E732E0600646F6F726964020A00000000);
INSERT INTO `tile_store` VALUES ('135', '0', 0x0403A2040401000000D80D8002000B006465736372697074696F6E014B00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333530303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('135', '0', 0x0803A3040501000000CF0D8002000B006465736372697074696F6E014B00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333530303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('135', '0', '');
INSERT INTO `tile_store` VALUES ('135', '0', '');
INSERT INTO `tile_store` VALUES ('135', '0', 0x0303A6040301000000D80D8002000B006465736372697074696F6E014B00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333530303020676F6C6420636F696E732E0600646F6F726964020C00000000);
INSERT INTO `tile_store` VALUES ('135', '0', 0x0103A7040401000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('135', '0', 0x0203A7040401000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('135', '0', 0x0303A5040401000000D80D8002000B006465736372697074696F6E014B00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333530303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('135', '0', '');
INSERT INTO `tile_store` VALUES ('135', '0', 0x0103A7040501000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('135', '0', 0x0303A5040501000000D80D8002000B006465736372697074696F6E014B00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333530303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('135', '0', 0x0703A4040301000000D80D8002000B006465736372697074696F6E014B00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333530303020676F6C6420636F696E732E0600646F6F726964020B00000000);
INSERT INTO `tile_store` VALUES ('135', '0', 0x0603A5040401000000CF0D8002000B006465736372697074696F6E014B00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333530303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('135', '0', 0x0403A6040501000000CF0D8002000B006465736372697074696F6E014B00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333530303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('135', '0', 0x0903A4040301000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('135', '0', 0x0903A5040301000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('135', '0', 0x0803A4040401000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('135', '0', 0x0903A4040401000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('135', '0', 0x0903A4040501000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('135', '0', 0x0903A5040501000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('136', '0', 0x0F03AD040501000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('136', '0', 0x0F03AE040501000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('136', '0', 0x1203A9040501000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('136', '0', 0x1303A9040501000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('136', '0', 0x1703AB0405010000006F188002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('136', '0', 0x1203AD04050100000005148002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323730303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('137', '0', 0x1203A9040401000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('137', '0', 0x1303A9040401000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('137', '0', 0x1103AD040401000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('137', '0', 0x1103AE040401000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('137', '0', 0x1203AC04040100000005148002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323330303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('137', '0', 0x1603AC040401000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('138', '0', 0x0F03AE040301000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('138', '0', 0x1003AE040301000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('138', '0', 0x1203AD04030100000005148002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('139', '0', 0x1203A9040301000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('139', '0', 0x1203AA040301000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('139', '0', 0x1603AC040301000000C5048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('140', '0', 0x1C03AA040301000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('140', '0', 0x1C03AB040301000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('140', '0', 0x1D03AD040301000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313930303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('140', '0', 0x1F03AF040301000000BC048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('141', '0', 0x1C03AA040401000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('141', '0', 0x1C03AB040401000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('141', '0', 0x1D03AF040401000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323030303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('141', '0', 0x2003AE040401000000B9048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('141', '0', 0x1E03B0040401000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('141', '0', 0x1F03B0040401000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('142', '0', 0x1703B6040401000000B9048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('142', '0', 0x1403B8040401000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('142', '0', 0x1403BA040401000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('142', '0', 0x1503BA040401000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('143', '0', 0x0C03C90404010000009E148002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('143', '0', 0x1003C6040401000000A1148002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('144', '0', 0x1903C80404010000009E148002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('145', '0', 0x1203D0040401000000D80D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('146', '0', 0x1403CF040401000000D80D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('146', '0', 0x1803D1040401000000D80D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323030303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('147', '0', 0x1003C2040501000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('147', '0', 0x1103C2040501000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('147', '0', 0x1203C0040501000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('148', '0', 0x1703C0040501000000C5048002000B006465736372697074696F6E014900000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('149', '0', 0x0F03BF040401000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('149', '0', 0x0F03C0040401000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('149', '0', 0x1103C2040401000000BC048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('149', '0', 0x1403C1040401000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('150', '0', 0x1603BF040401000000C3048002000B006465736372697074696F6E014900000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('151', '0', 0x1203BF040301000000A1148002000B006465736372697074696F6E014900000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('151', '0', 0x0F03C0040301000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('151', '0', 0x0F03C1040301000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('152', '0', 0x1503BF040301000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('152', '0', 0x1803BE040301000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('152', '0', 0x1803BF040301000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('153', '0', 0x1403B7040501000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('153', '0', 0x1703B5040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('153', '0', 0x1703B6040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('154', '0', 0x1F03AA040501000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('154', '0', 0x1F03AB040501000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('154', '0', 0x1C03AD040501000000C5048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('154', '0', 0x1F03AD040501000000BC048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313630303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('154', '0', 0x1E03B0040501000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('154', '0', 0x1F03B0040501000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('155', '0', 0x1F03A1040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('155', '0', 0x1F03A2040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('155', '0', 0x1D03A6040501000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('155', '0', 0x2103A1040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('155', '0', 0x2103A2040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('156', '0', 0x1E03A2040401000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('156', '0', 0x1F03A2040401000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('156', '0', 0x1D03A5040401000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323530303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('156', '0', 0x2203A5040401000000B9048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('157', '0', 0x0C03C5040501000000FC0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('157', '0', 0x0C03C6040501000000FD0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('157', '0', 0x0F03C7040501000000A1148002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('157', '0', 0x0E03CA0405010000009E148002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('157', '0', 0x1103C5040501000000FC0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('157', '0', 0x1103C6040501000000FD0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('158', '0', 0x1703C5040501000000FE0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('158', '0', 0x1803C5040501000000FF0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('158', '0', 0x1603C90405010000009E148002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('159', '0', 0x1103CF040501000000CF0D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313630303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('159', '0', 0x1003D4040501000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('159', '0', 0x1103D4040501000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('160', '0', 0xED02D4040501000000FE0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('160', '0', 0xEE02D4040501000000FF0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('160', '0', 0xF002D2040501000000CF0D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('160', '0', 0xF202D1040501000000D80D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('161', '0', 0xF302DC040501000000D80D8002000B006465736372697074696F6E014900000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('162', '0', 0x2803B3040601000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('162', '0', 0x2903B1040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('162', '0', 0x2A03B1040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('162', '0', 0x2B03B5040601000000BC048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('163', '0', 0x2803B1040501000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('163', '0', 0x2B03B2040501000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('163', '0', 0x2B03B3040501000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('164', '0', 0xF402B2040601000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('164', '0', 0xF402B3040601000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('164', '0', 0xF602B2040601000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('164', '0', 0xF602B3040601000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('164', '0', 0xFA02B70406010000006F188002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333830303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('165', '0', 0xFB02AF040601000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('165', '0', 0xFD02AD040601000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('165', '0', 0xFE02AD040601000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('165', '0', 0xFB02B0040601000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('165', '0', 0xFD02B3040601000000C5048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323530303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('166', '0', 0xEF02BA040601000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('166', '0', 0xF002BA040601000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('166', '0', 0xF402BB04060100000063218002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323230303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('167', '0', 0xF902BF04060100000065218002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('167', '0', 0xF202C0040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('167', '0', 0xF202C1040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('167', '0', 0xF502C10406010000005E218002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333430303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('167', '0', 0xF702C5040601000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('167', '0', 0xF802C5040601000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('168', '0', 0x0903B9040601000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('168', '0', 0x0903BA040601000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('168', '0', 0x0303BD0406010000006F188002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323330303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('169', '0', '');
INSERT INTO `tile_store` VALUES ('169', '0', '');
INSERT INTO `tile_store` VALUES ('169', '0', 0x0403CB0406010000006F188002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('170', '0', 0x0B03CA04060100000063218002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('170', '0', 0x1003C8040601000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('170', '0', 0x1003CB040601000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('170', '0', 0x1103C8040601000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('170', '0', 0x1103CB040601000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('171', '0', 0x1203BA040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('171', '0', 0x1303BA040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('171', '0', 0x1603BA04060100000071188002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('172', '0', 0x1103BF040601000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('172', '0', 0x1903BF0406010000006F188002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('172', '0', 0x1103C0040601000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('173', '0', 0x1203AC040601000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('173', '0', 0x1203AD040601000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('173', '0', 0x1403B104060100000071188002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('174', '0', 0x1803B8040701000000FC0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('174', '0', 0x1803B9040701000000FD0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('174', '0', 0x1903BA040701000000CF0D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313930303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('174', '0', 0x1803BE040701000000CF0D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('174', '0', 0x1B03BC040701000000D80D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313930303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('175', '0', 0x0A03BD040701000000FC0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('175', '0', 0x0A03BE040701000000FD0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('175', '0', 0x1103BC040701000000A1148002000B006465736372697074696F6E015100000049742062656C6F6E677320746F20686F757365202754686973742033272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('176', '0', 0x0703B7040701000000FE0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('176', '0', 0x0803B7040701000000FF0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('176', '0', 0x0D03B8040701000000D80D8002000B006465736372697074696F6E015100000049742062656C6F6E677320746F20686F757365202754686973742034272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('177', '0', 0x0F03B4040701000000CF0D8002000B006465736372697074696F6E015100000049742062656C6F6E677320746F20686F757365202754686973742035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('178', '0', 0x1303B2040701000000FE0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('178', '0', 0x1403B2040701000000FF0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('178', '0', 0x1403B60407010000009E148002000B006465736372697074696F6E015100000049742062656C6F6E677320746F20686F757365202754686973742036272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('178', '0', 0x1703B4040701000000A1148002000B006465736372697074696F6E015100000049742062656C6F6E677320746F20686F757365202754686973742036272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313830303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('179', '0', 0xFC02BF0407010000006F188002000B006465736372697074696F6E015100000049742062656C6F6E677320746F20686F757365202754686973742037272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323730303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('180', '0', 0xFA02C10407010000009E148002000B006465736372697074696F6E015100000049742062656C6F6E677320746F20686F757365202754686973742038272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323230303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('180', '0', 0xFE02C20407010000009E148002000B006465736372697074696F6E015100000049742062656C6F6E677320746F20686F757365202754686973742038272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323230303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('180', '0', 0xFA02C4040701000000FC0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('180', '0', 0xFA02C5040701000000FD0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('181', '0', 0xED02BD040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('181', '0', 0xEE02BD040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('181', '0', 0xEF02BF0407010000005D218002000B006465736372697074696F6E015100000049742062656C6F6E677320746F20686F757365202754686973742039272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323730303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('181', '0', 0xF302C004070100000063218002000B006465736372697074696F6E015100000049742062656C6F6E677320746F20686F757365202754686973742039272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('182', '0', 0xF002B7040701000000FE0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('182', '0', 0xF102B7040701000000FF0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('182', '0', 0xF402BA040701000000D80D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('183', '0', 0xF702B5040701000000CF0D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('184', '0', 0xFE02AE040701000000FE0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('184', '0', 0xFF02AE040701000000FF0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('184', '0', 0xFF02B50407010000009E148002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323630303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('184', '0', 0x0103B1040701000000A1148002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323630303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('271', '0', 0x1304C9030701000000C5048002000B006465736372697074696F6E015100000049742062656C6F6E677320746F20686F757365202754686973742031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('272', '0', 0x1904C9030701000000C6048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('273', '0', 0x1304CC030701000000C5048002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F7573652027466F7262696464656E272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313630303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('274', '0', 0x1904CC030701000000C6048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('275', '0', 0x1304C9030601000000C6048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('276', '0', 0x1904C9030601000000C5048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313230303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('277', '0', 0x1304CC030601000000C6048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('278', '0', 0x1904CC030601000000C6048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('279', '0', 0x5808DE060601000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('279', '0', 0x5808DF060601000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('279', '0', 0x5A08DE060601000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('279', '0', 0x5A08DF060601000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('279', '0', 0x5B08DE060701000000721B00);
INSERT INTO `tile_store` VALUES ('279', '0', 0x5908E0060701000000EB1A8002000B006465736372697074696F6E015200000049742062656C6F6E677320746F20686F75736520274B726F74656E2031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323230303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('280', '0', 0x5E08DC060701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('280', '0', 0x5E08DD060701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('280', '0', 0x6108DD060701000000721B00);
INSERT INTO `tile_store` VALUES ('280', '0', 0x5F08E0060701000000EB1A8002000B006465736372697074696F6E015200000049742062656C6F6E677320746F20686F75736520274B726F74656E2032272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('280', '0', 0x6008E0060701000000711B00);
INSERT INTO `tile_store` VALUES ('281', '0', 0x5808E3060701000000711B00);
INSERT INTO `tile_store` VALUES ('281', '0', 0x5908E3060701000000EB1A8002000B006465736372697074696F6E015200000049742062656C6F6E677320746F20686F75736520274B726F74656E2033272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('281', '0', 0x5708E6060701000000721B00);
INSERT INTO `tile_store` VALUES ('281', '0', 0x5808E6060701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('281', '0', 0x5808E7060701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('282', '0', 0x5E08E3060701000000711B00);
INSERT INTO `tile_store` VALUES ('282', '0', 0x5F08E3060701000000EB1A8002000B006465736372697074696F6E015200000049742062656C6F6E677320746F20686F75736520274B726F74656E2034272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('282', '0', 0x6008E6060701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('282', '0', 0x6008E7060701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('282', '0', 0x6108E6060701000000721B00);
INSERT INTO `tile_store` VALUES ('283', '0', 0x5E08EF060601000000721B00);
INSERT INTO `tile_store` VALUES ('283', '0', 0x5F08EF060601000000851E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('283', '0', 0x5F08EF060701000000851E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('283', '0', 0x6008EB060701000000711B00);
INSERT INTO `tile_store` VALUES ('283', '0', 0x6008EF060601000000861E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('283', '0', 0x6108ED060601000000F41A8002000B006465736372697074696F6E015200000049742062656C6F6E677320746F20686F75736520274B726F74656E2035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323230303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('283', '0', 0x6008EF060701000000861E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('283', '0', 0x6108EC060701000000F41A8002000B006465736372697074696F6E015200000049742062656C6F6E677320746F20686F75736520274B726F74656E2035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323230303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('283', '0', 0x6308EE060701000000F41A8002000B006465736372697074696F6E015200000049742062656C6F6E677320746F20686F75736520274B726F74656E2035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323230303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('283', '0', 0x6308EF060701000000721B00);
INSERT INTO `tile_store` VALUES ('284', '0', 0x7708F4060601000000711B00);
INSERT INTO `tile_store` VALUES ('284', '0', 0x7708F4060701000000EB1A8002000B006465736372697074696F6E015200000049742062656C6F6E677320746F20686F75736520274B726F74656E2036272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333630303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('284', '0', 0x7908F5060601000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('284', '0', 0x7908F6060601000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('284', '0', 0x7908F7060601000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('284', '0', 0x7908F6060701000000EB1A8002000B006465736372697074696F6E015200000049742062656C6F6E677320746F20686F75736520274B726F74656E2036272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('284', '0', 0x7608F9060601000000851E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('284', '0', 0x7708F9060601000000861E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('284', '0', 0x7608F9060701000000851E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('284', '0', 0x7708F9060701000000861E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('284', '0', 0x7808FA060601000000711B00);
INSERT INTO `tile_store` VALUES ('284', '0', 0x7908F8060601000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('285', '0', 0x8508F9060601000000EB1A8002000B006465736372697074696F6E015200000049742062656C6F6E677320746F20686F75736520274B726F74656E2037272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('285', '0', 0x8608F9060601000000711B00);
INSERT INTO `tile_store` VALUES ('285', '0', 0x8308FD060601000000721B00);
INSERT INTO `tile_store` VALUES ('285', '0', 0x8608FC060601000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('285', '0', 0x8608FD060601000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('286', '0', 0x8A08F7060601000000F41A8002000B006465736372697074696F6E015200000049742062656C6F6E677320746F20686F75736520274B726F74656E2038272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363930303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('286', '0', 0x8F08F6060501000000F41A8002000B006465736372697074696F6E015200000049742062656C6F6E677320746F20686F75736520274B726F74656E2038272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363930303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('286', '0', 0x8B08FA060501000000851E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('286', '0', 0x8A08F9060601000000721B00);
INSERT INTO `tile_store` VALUES ('286', '0', 0x8C08FA060501000000861E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('286', '0', 0x8D08F8060501000000EB1A8002000B006465736372697074696F6E015200000049742062656C6F6E677320746F20686F75736520274B726F74656E2038272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363930303020676F6C6420636F696E732E0600646F6F726964020900000000);
INSERT INTO `tile_store` VALUES ('286', '0', 0x8E08F8060601000000EB1A8002000B006465736372697074696F6E015200000049742062656C6F6E677320746F20686F75736520274B726F74656E2038272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363930303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('286', '0', 0x8F08FB060601000000711B00);
INSERT INTO `tile_store` VALUES ('286', '0', 0x9108F7060601000000851E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('286', '0', 0x9208F7060601000000861E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('286', '0', 0x9308F6060601000000721B00);
INSERT INTO `tile_store` VALUES ('286', '0', 0x9008F9060501000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('286', '0', 0x9008FA060501000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('286', '0', 0x9208F9060501000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('286', '0', 0x9208FA060501000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('286', '0', 0x9208F9060601000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('286', '0', 0x9208FA060601000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('287', '0', 0x7E08E9060601000000721B00);
INSERT INTO `tile_store` VALUES ('287', '0', 0x7F08E8060601000000851E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('287', '0', 0x7F08EB060601000000851E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('287', '0', 0x8008E8060601000000861E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('287', '0', 0x8008EB060601000000861E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('287', '0', 0x8308EB060601000000F41A8002000B006465736372697074696F6E015200000049742062656C6F6E677320746F20686F75736520274B726F74656E2039272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('287', '0', 0x8108EC060601000000731B00);
INSERT INTO `tile_store` VALUES ('288', '0', 0x8C08E8060701000000F41A8002000B006465736372697074696F6E015200000049742062656C6F6E677320746F20686F75736520274B726F74656E203130272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('288', '0', 0x8F08E8060701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('288', '0', 0x8F08E9060701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('289', '0', 0x8908E0060701000000821B8002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F75736520274B726F74656E203131272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313930303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('289', '0', 0x8D08E0060701000000791B8002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F75736520274B726F74656E203131272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('289', '0', 0x8E08E2060701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('289', '0', 0x8E08E3060701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('289', '0', 0x8F08E2060701000000761B00);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7B08CF060601000000751B00);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7808D2060601000000791B8002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F75736520274B726F74656E203132272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373030303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7A08D3060601000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7808D2060701000000791B8002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F75736520274B726F74656E203132272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373030303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7A08D006070100000064080F0200);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7C08D3060601000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7C08D006070100000064080F0200);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7C08D3060701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7D08D2060701000000761B00);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7608D4060601000000761B00);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7608D4060701000000761B00);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7608D5060701000000821B8002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F75736520274B726F74656E203132272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7A08D4060601000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7B08D6060601000000791B8002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F75736520274B726F74656E203132272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373030303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7A08D7060701000000821B8002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F75736520274B726F74656E203132272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7C08D4060601000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7D08D5060601000000761B00);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7C08D4060701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7B08D8060701000000851E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7C08D8060701000000861E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('290', '0', 0x7C08D9060701000000751B00);
INSERT INTO `tile_store` VALUES ('291', '0', 0x7808C7060701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('291', '0', 0x7608C8060701000000721B00);
INSERT INTO `tile_store` VALUES ('291', '0', 0x7808C8060701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('291', '0', 0x7808CA060701000000EB1A8002000B006465736372697074696F6E015200000049742062656C6F6E677320746F20686F75736520274B726F74656E203133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('292', '0', 0x7C08C7060701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('292', '0', 0x7C08C8060701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('292', '0', 0x7D08CA060701000000EB1A8002000B006465736372697074696F6E015200000049742062656C6F6E677320746F20686F75736520274B726F74656E203134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('292', '0', 0x7E08C8060701000000721B00);
INSERT INTO `tile_store` VALUES ('293', '0', 0x6908C6060701000000711B00);
INSERT INTO `tile_store` VALUES ('293', '0', 0x6A08C7060701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('293', '0', 0x6C08C7060701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('293', '0', 0x6A08C8060701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('293', '0', 0x6C08C8060701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('293', '0', 0x6D08C9060701000000721B00);
INSERT INTO `tile_store` VALUES ('293', '0', 0x6808CC060701000000711B00);
INSERT INTO `tile_store` VALUES ('293', '0', 0x6908CC060701000000EB1A8002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F75736520274B726F74656E203135272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('294', '0', 0x6C08D2060701000000711B00);
INSERT INTO `tile_store` VALUES ('294', '0', 0x6D08D3060701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('294', '0', 0x6708D5060701000000721B00);
INSERT INTO `tile_store` VALUES ('294', '0', 0x6708D6060701000000F41A8002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F75736520274B726F74656E203136272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323330303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('294', '0', 0x6A08D4060701000000F41A8002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F75736520274B726F74656E203136272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('294', '0', 0x6C08D7060701000000861E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('294', '0', 0x6D08D4060701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('294', '0', 0x6E08D7060701000000721B00);
INSERT INTO `tile_store` VALUES ('295', '0', 0x5908D6060601000000721B00);
INSERT INTO `tile_store` VALUES ('295', '0', 0x5A08D7060601000000851E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('295', '0', 0x5B08D7060601000000861E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('295', '0', 0x5908D6060701000000721B00);
INSERT INTO `tile_store` VALUES ('295', '0', 0x5E08D4060601000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('295', '0', 0x5E08D5060601000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('295', '0', 0x5F08D6060701000000F41A8002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F75736520274B726F74656E203137272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('295', '0', 0x5D08D8060601000000711B00);
INSERT INTO `tile_store` VALUES ('295', '0', 0x5D08D8060701000000711B00);
INSERT INTO `tile_store` VALUES ('296', '0', 0xC30437050701000000CF0D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('296', '0', 0xC50438050701000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('296', '0', 0xC5043A050701000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('296', '0', 0xC60438050701000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('296', '0', 0xC6043A050701000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('297', '0', 0xC90434050701000000CF0D8002000B006465736372697074696F6E014900000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('297', '0', 0xCB0435050701000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('297', '0', 0xCB0436050701000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('298', '0', 0xCC0432050701000000D80D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('298', '0', 0xCD0434050701000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('298', '0', 0xCE0434050701000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('299', '0', 0xC7042A050701000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('299', '0', 0xC8042A050701000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('299', '0', 0xCB0429050701000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('299', '0', 0xCB042A050701000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('299', '0', 0xC9042D050701000000CF0D8002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('300', '0', 0xBE0439050601000000D80D8002000B006465736372697074696F6E014F00000049742062656C6F6E677320746F20686F7573652027536B752035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('300', '0', 0xBD043C050601000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('300', '0', 0xBE043C050601000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('300', '0', 0xC10437050601000000CF0D8002000B006465736372697074696F6E014F00000049742062656C6F6E677320746F20686F7573652027536B752035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('301', '0', 0xC50427050601000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('301', '0', 0xC60427050601000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('301', '0', 0xC20428050601000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('301', '0', 0xC20429050601000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('301', '0', 0xC2042B050601000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('301', '0', 0xC2042C050601000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('301', '0', 0xC4042D050601000000CF0D8002000B006465736372697074696F6E014F00000049742062656C6F6E677320746F20686F7573652027536B752036272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('302', '0', 0xCC0426050601000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('302', '0', 0xCC0427050601000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('302', '0', 0xCA042A050601000000CF0D8002000B006465736372697074696F6E014F00000049742062656C6F6E677320746F20686F7573652027536B752037272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333230303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('302', '0', 0xCC0428050501000000CF0D8002000B006465736372697074696F6E014F00000049742062656C6F6E677320746F20686F7573652027536B752037272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333230303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('302', '0', 0xCC0428050601000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('302', '0', 0xCC0429050601000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('303', '0', 0xCF0426050601000000CF0D8002000B006465736372697074696F6E014F00000049742062656C6F6E677320746F20686F7573652027536B752038272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323330303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('303', '0', 0xD00423050601000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('303', '0', 0xD10423050601000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('303', '0', 0xD0042A050601000000CF0D8002000B006465736372697074696F6E014F00000049742062656C6F6E677320746F20686F7573652027536B752038272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('303', '0', 0xD20428050601000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('303', '0', 0xD20429050601000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('304', '0', 0xD1042F050601000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('304', '0', 0xCF0430050501000000D80D8002000B006465736372697074696F6E014F00000049742062656C6F6E677320746F20686F7573652027536B752039272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('304', '0', 0xCC0431050601000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('304', '0', 0xCD0431050601000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('304', '0', 0xD10430050601000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('305', '0', 0xC70439050501000000CF0D8002000B006465736372697074696F6E015000000049742062656C6F6E677320746F20686F7573652027536B75203130272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('305', '0', 0xC9043A050501000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('305', '0', 0xC9043B050501000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('305', '0', 0xC9043C050501000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('305', '0', 0xC9043D050501000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('306', '0', 0xCD043B050501000000CF0D8002000B006465736372697074696F6E015000000049742062656C6F6E677320746F20686F7573652027536B75203131272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313230303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('335', '0', 0xB3031C040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('335', '0', 0xB3031D040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('335', '0', 0xB6031E040501000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('335', '0', 0xB7031E040501000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('335', '0', 0xB5031E0406010000006C188002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F7573652027436173746C652031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343730303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('335', '0', 0xB4031E0407010000006C188002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F7573652027436173746C652031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('335', '0', 0xB6031C040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('335', '0', 0xB6031D040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('335', '0', 0xB8031E0406010000006C188002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F7573652027436173746C652031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343730303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('335', '0', 0xBA031F040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('335', '0', 0xBB031C040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('335', '0', 0xBB031D040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('335', '0', 0xBB031F040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('335', '0', 0xB8031C040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('335', '0', 0xB8031D040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('335', '0', 0xBB031E0407010000006C188002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F7573652027436173746C652031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343730303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('335', '0', 0xB60321040501000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('335', '0', 0xB70321040501000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('335', '0', 0xB403210406010000006C188002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F7573652027436173746C652031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343730303020676F6C6420636F696E732E0600646F6F726964020A00000000);
INSERT INTO `tile_store` VALUES ('335', '0', 0xB6032304060100000069188002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F7573652027436173746C652031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343730303020676F6C6420636F696E732E0600646F6F726964020900000000);
INSERT INTO `tile_store` VALUES ('335', '0', 0xB403210407010000006C188002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F7573652027436173746C652031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343730303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('335', '0', 0xB60322040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('335', '0', 0xB60323040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('335', '0', 0xBA032004050100000069188002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F7573652027436173746C652031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343730303020676F6C6420636F696E732E0600646F6F726964020B00000000);
INSERT INTO `tile_store` VALUES ('335', '0', 0xBB0322040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('335', '0', 0xBB0323040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('335', '0', 0xB803210407010000006C188002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F7573652027436173746C652031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343730303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('335', '0', 0xBB03210407010000006C188002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F7573652027436173746C652031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343730303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('335', '0', 0xBC032004070100000069188002000B006465736372697074696F6E015300000049742062656C6F6E677320746F20686F7573652027436173746C652031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343730303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('390', '0', 0x4B0492060701000000C5048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('390', '0', 0x480496060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('390', '0', 0x480497060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('391', '0', 0x4F0492060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('391', '0', 0x500492060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('391', '0', 0x520495060701000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('392', '0', 0x4D0498060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('392', '0', 0x4D0499060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('392', '0', 0x510499060701000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('393', '0', 0x4C049D060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('393', '0', 0x4C049E060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('393', '0', 0x50049C060701000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('394', '0', 0x4D0496060601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('394', '0', 0x4D0497060601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('394', '0', 0x510499060601000000B9048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('395', '0', 0x480499060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('395', '0', 0x48049A060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('395', '0', 0x49049B060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('395', '0', 0x4A049B060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('395', '0', 0x50049B060601000000B9048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323230303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('396', '0', 0x570499060701000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('396', '0', 0x5B0499060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('396', '0', 0x5B049A060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('397', '0', 0x5A0492060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('397', '0', 0x5B0492060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('397', '0', 0x580494060701000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313230303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('398', '0', 0x600492060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('398', '0', 0x600493060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('398', '0', 0x620490060701000000C5048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('399', '0', 0x59048A060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('399', '0', 0x5A048A060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('399', '0', 0x5D048A060701000000C5048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('400', '0', 0x600481060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('400', '0', 0x600482060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('400', '0', 0x610480060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('400', '0', 0x620480060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('400', '0', 0x630488060701000000C5048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('401', '0', 0x5F0484060601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('401', '0', 0x600484060601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('401', '0', 0x640486060601000000B9048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('402', '0', 0x600481060601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('402', '0', 0x600482060601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('402', '0', 0x650481060601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('402', '0', 0x650482060601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('402', '0', 0x650484060601000000B9048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('403', '0', 0x560470060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('403', '0', 0x570470060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('403', '0', 0x590473060701000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('404', '0', 0x3A04A3060701000000B9048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333330303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('404', '0', 0x3C04A1060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('404', '0', 0x3D04A1060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('404', '0', 0x3C04A506070100000026198002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('404', '0', 0x4104A5060701000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333330303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('405', '0', 0x2E04A4060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('405', '0', 0x2F04A4060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('405', '0', 0x3304A0060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('405', '0', 0x3304A1060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('405', '0', 0x3304A4060701000000C5048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('406', '0', 0x3104AB060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('406', '0', 0x3304AA060701000000C5048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('406', '0', 0x3104AC060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('406', '0', 0x3204AF06070100000026198002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('406', '0', 0x3304AF060701000000BC048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('407', '0', 0x3A04AE060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('407', '0', 0x3A04AF060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('407', '0', 0x3E04AC060701000000C5048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('408', '0', 0x4404AF060601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('408', '0', 0x4404AF060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('408', '0', 0x4504AE060701000000C5048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('408', '0', 0x4404AF060801000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('408', '0', 0x4504AF060801000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('408', '0', 0x4404B0060601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('408', '0', 0x4404B0060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('408', '0', 0x4404B3060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('408', '0', 0x4504B3060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('408', '0', 0x4A04B306060100000026198002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393730303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('408', '0', 0x4B04B106060100000027198002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393730303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('408', '0', 0x4B04B2060601000000B9048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393730303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('408', '0', 0x4B04B1060701000000B9048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393730303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('409', '0', 0x6B049A060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('409', '0', 0x6B049B060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('409', '0', 0x6D0498060701000000C5048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('409', '0', 0x6D049A060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('409', '0', 0x6D049B060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('409', '0', 0x710496060701000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323530303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('409', '0', 0x700499060701000000C5048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323530303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('411', '0', 0x6C049F060701000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('411', '0', 0x6804A0060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('411', '0', 0x6804A1060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('412', '0', 0x7104A3060701000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('412', '0', 0x7504A3060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('412', '0', 0x7504A4060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('413', '0', 0x5B04A3060601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('413', '0', 0x5B04A3060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('413', '0', 0x5C04A3060601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('413', '0', 0x5E04A2060601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('413', '0', 0x5F04A2060601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('413', '0', 0x5E04A2060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('413', '0', 0x5F04A2060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('413', '0', 0x5A04A6060601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('413', '0', 0x5A04A7060601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('413', '0', 0x5A04A6060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('413', '0', 0x5A04A7060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('413', '0', 0x5B04A4060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('413', '0', 0x5B04A5060801000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('413', '0', 0x5B04A6060801000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('413', '0', 0x5E04A7060801000000E1048002000B006465736372697074696F6E014B00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313630303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('413', '0', 0x5F04A8060701000000B9048002000B006465736372697074696F6E014B00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('413', '0', 0x6004A1060801000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('413', '0', 0x6104A1060801000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('413', '0', 0x6004A6060601000000BC048002000B006465736372697074696F6E014B00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313630303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('413', '0', 0x6004A5060701000000BC048002000B006465736372697074696F6E014B00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313630303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('413', '0', 0x6004A4060801000000E4048002000B006465736372697074696F6E014B00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313630303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('413', '0', 0x6304A8060701000000B9048002000B006465736372697074696F6E014B00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313630303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('414', '0', 0x7E0492060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('414', '0', 0x7E0493060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('414', '0', 0x7A0494060701000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('415', '0', 0x840497060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('415', '0', 0x83049B060701000000C5048002000B006465736372697074696F6E014900000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('415', '0', 0x840498060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('416', '0', 0x85049B060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('416', '0', 0x84049D060701000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('416', '0', 0x85049C060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('417', '0', 0x7E049D060601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('417', '0', 0x7E049E060601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('417', '0', 0x80049F060601000000C3048002000B006465736372697074696F6E014900000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203830303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('417', '0', 0x82049D060601000000C5048002000B006465736372697074696F6E014900000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('418', '0', 0x7C0460060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('418', '0', 0x7D0460060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('418', '0', 0x7D046406070100000026198002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313730303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('418', '0', 0x81046206070100000027198002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('418', '0', 0x810463060701000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('418', '0', 0x80046406070100000026198002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('419', '0', 0x76045F060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('419', '0', 0x78045E060701000000C5048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('419', '0', 0x760460060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('420', '0', 0x71045B060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('420', '0', 0x76045A06070100000027198002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323730303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('420', '0', 0x71045C060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('420', '0', 0x76045C060701000000C3048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323730303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('421', '0', 0x7F0457060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('421', '0', 0x7F0458060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('421', '0', 0x81045A060701000000C5048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('422', '0', 0x860455060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('422', '0', 0x870455060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('422', '0', 0x890455060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('422', '0', 0x890456060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('422', '0', 0x87045C060701000000C5048002000B006465736372697074696F6E014A00000049742062656C6F6E677320746F20686F7573652027272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1267', '0', 0xF60322040701000000261900);
INSERT INTO `tile_store` VALUES ('1267', '0', 0xFB0323040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1267', '0', 0xFA0322040701000000C6048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F75736520275061726164697365732035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363630303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('1267', '0', 0xFC0323040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1267', '0', 0xF30325040701000000271900);
INSERT INTO `tile_store` VALUES ('1267', '0', 0xF50326040601000000C6048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F75736520275061726164697365732035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363630303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1267', '0', 0xF40324040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1267', '0', 0xF40325040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1267', '0', 0xF50324040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1267', '0', 0xF50325040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1267', '0', 0xF80324040601000000C4048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F75736520275061726164697365732035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363630303020676F6C6420636F696E732E0600646F6F726964020900000000);
INSERT INTO `tile_store` VALUES ('1267', '0', 0xFB0324040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1267', '0', 0xF80324040701000000C4048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F75736520275061726164697365732035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363630303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('1267', '0', 0xF80327040701000000C4048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F75736520275061726164697365732035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363630303020676F6C6420636F696E732E0600646F6F726964020B00000000);
INSERT INTO `tile_store` VALUES ('1267', '0', 0xFA0325040701000000261900);
INSERT INTO `tile_store` VALUES ('1267', '0', 0xFB0324040701000000C3048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F75736520275061726164697365732035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363630303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('1267', '0', 0xFC0324040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1267', '0', 0xF60328040601000000C4048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F75736520275061726164697365732035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363630303020676F6C6420636F696E732E0600646F6F726964020A00000000);
INSERT INTO `tile_store` VALUES ('1267', '0', 0xF60329040701000000261900);
INSERT INTO `tile_store` VALUES ('1268', '0', 0xEF032F040701000000271900);
INSERT INTO `tile_store` VALUES ('1268', '0', 0xF3032C040601000000261900);
INSERT INTO `tile_store` VALUES ('1268', '0', 0xF0032E040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1268', '0', 0xF0032F040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1268', '0', 0xF1032E040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1268', '0', 0xF1032F040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1268', '0', 0xF4032E040601000000C4048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F75736520275061726164697365732036272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363230303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('1268', '0', 0xF7032D040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1268', '0', 0xF7032E040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1268', '0', 0xF4032E040701000000C3048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F75736520275061726164697365732036272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363230303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1268', '0', 0xF6032C040701000000C6048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F75736520275061726164697365732036272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363230303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1268', '0', 0xF7032E040701000000C3048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F75736520275061726164697365732036272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363230303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('1268', '0', 0xF8032D040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1268', '0', 0xF8032E040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1268', '0', 0xF10330040601000000C5048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F75736520275061726164697365732036272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363230303020676F6C6420636F696E732E0600646F6F726964020900000000);
INSERT INTO `tile_store` VALUES ('1268', '0', 0xF10333040601000000261900);
INSERT INTO `tile_store` VALUES ('1268', '0', 0xF20332040601000000C3048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F75736520275061726164697365732036272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363230303020676F6C6420636F696E732E0600646F6F726964020A00000000);
INSERT INTO `tile_store` VALUES ('1268', '0', 0xF20333040701000000261900);
INSERT INTO `tile_store` VALUES ('1268', '0', 0xF40331040701000000C3048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F75736520275061726164697365732036272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363230303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('1269', '0', 0xFB032F040701000000271900);
INSERT INTO `tile_store` VALUES ('1269', '0', 0xFF032C040601000000261900);
INSERT INTO `tile_store` VALUES ('1269', '0', 0xFC032E040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1269', '0', 0xFC032F040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1269', '0', 0xFD032E040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1269', '0', 0xFD032F040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1269', '0', 0xFE032C040701000000261900);
INSERT INTO `tile_store` VALUES ('1269', '0', 0xFD0330040601000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323639272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363130303020676F6C6420636F696E732E0600646F6F726964020B00000000);
INSERT INTO `tile_store` VALUES ('1269', '0', 0xFD0333040601000000261900);
INSERT INTO `tile_store` VALUES ('1269', '0', 0xFE0332040601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323639272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363130303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1269', '0', 0xFE0333040701000000261900);
INSERT INTO `tile_store` VALUES ('1269', '0', '');
INSERT INTO `tile_store` VALUES ('1269', '0', 0x03042D040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1269', '0', 0x03042E040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1269', '0', '');
INSERT INTO `tile_store` VALUES ('1269', '0', 0x02042C040701000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323639272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363130303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('1269', '0', 0x02042F040701000000261900);
INSERT INTO `tile_store` VALUES ('1269', '0', 0x03042E040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323639272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363130303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('1269', '0', 0x04042D040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1269', '0', 0x04042E040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1269', '0', '');
INSERT INTO `tile_store` VALUES ('1271', '0', 0x0A0427040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1271', '0', 0x0B0426040701000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323731272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1271', '0', 0x0A0428040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1272', '0', 0x0F0427040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1272', '0', 0x0F0428040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1272', '0', 0x100426040701000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323732272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1273', '0', 0x09042D040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323733272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1273', '0', 0x0D042C040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1273', '0', 0x0D042D040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1274', '0', 0x0A0433040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1274', '0', 0x0B0432040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323734272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1274', '0', 0x0D0432040701000000261900);
INSERT INTO `tile_store` VALUES ('1274', '0', 0x0A0434040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1275', '0', 0x0F0433040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1275', '0', 0x0F0434040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1275', '0', 0x100432040701000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323735272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1275', '0', 0x120432040701000000261900);
INSERT INTO `tile_store` VALUES ('1276', '0', 0x140432040701000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323736272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1276', '0', 0x180433040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1276', '0', 0x190433040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1276', '0', 0x180434040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1276', '0', 0x190434040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1277', '0', 0x15042D040701000000271900);
INSERT INTO `tile_store` VALUES ('1277', '0', 0x15042F040701000000271900);
INSERT INTO `tile_store` VALUES ('1277', '0', 0x150431040701000000C4048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323737272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323230303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1277', '0', 0x180430040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1277', '0', 0x180431040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1277', '0', 0x190430040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1277', '0', 0x190431040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1278', '0', 0x160427040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1278', '0', 0x180426040701000000261900);
INSERT INTO `tile_store` VALUES ('1278', '0', 0x15042A040701000000C4048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323738272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1278', '0', 0x160428040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1279', '0', 0x0A0427040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1279', '0', 0x0B0426040601000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323739272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1279', '0', 0x0A0428040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1279', '0', 0x0D09CC060701000000EF1A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323739272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383030303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1279', '0', 0x1109C8060701000000721B00);
INSERT INTO `tile_store` VALUES ('1279', '0', 0x1109CA060701000000721B00);
INSERT INTO `tile_store` VALUES ('1279', '0', 0x1009CF060701000000721B00);
INSERT INTO `tile_store` VALUES ('1279', '0', 0x0909D0060701000000F71A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323739272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383030303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('1279', '0', 0x0D09D1060701000000711B00);
INSERT INTO `tile_store` VALUES ('1280', '0', 0x0F0427040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1280', '0', 0x0F0428040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1280', '0', 0x100426040601000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323830272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1280', '0', 0x0109C5060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1280', '0', 0x0109C6060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1280', '0', 0x0209C7060701000000EE1A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323830272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363430303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('1280', '0', 0x0309C5060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1280', '0', 0x0309C6060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1280', '0', 0x0409C5060601000000721B00);
INSERT INTO `tile_store` VALUES ('1280', '0', 0x0409C5060701000000721B00);
INSERT INTO `tile_store` VALUES ('1280', '0', 0x0209CA060601000000EE1A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323830272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363430303020676F6C6420636F696E732E0600646F6F726964020900000000);
INSERT INTO `tile_store` VALUES ('1280', '0', '');
INSERT INTO `tile_store` VALUES ('1280', '0', 0x0109CA060701000000680600);
INSERT INTO `tile_store` VALUES ('1280', '0', 0x0409C8060601000000721B00);
INSERT INTO `tile_store` VALUES ('1280', '0', 0x0409CA060701000000721B00);
INSERT INTO `tile_store` VALUES ('1280', '0', 0x0209CD060701000000EE1A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323830272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363430303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('1281', '0', 0x160427040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1281', '0', 0x180426040601000000261900);
INSERT INTO `tile_store` VALUES ('1281', '0', 0x15042A040601000000C4048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323831272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1281', '0', 0x160428040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1281', '0', 0x1A0428040601000000271900);
INSERT INTO `tile_store` VALUES ('1281', '0', 0x1A0429040601000000C4048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323831272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393830303020676F6C6420636F696E732E0600646F6F726964022E00000000);
INSERT INTO `tile_store` VALUES ('1281', '0', 0xF708C5060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1281', '0', 0xF708C6060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1281', '0', 0xF808C5060601000000EE1A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323831272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393830303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('1281', '0', 0xFA08C4060601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1281', '0', 0xFB08C4060601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1281', '0', 0xF808C5060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1281', '0', 0xF808C6060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1281', '0', 0xFB08C7060701000000EE1A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323831272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393830303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('1281', '0', 0xFC08C5060701000000721B00);
INSERT INTO `tile_store` VALUES ('1281', '0', 0xF908CA060601000000EE1A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323831272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393830303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('1281', '0', 0xFC08C8060601000000741B00);
INSERT INTO `tile_store` VALUES ('1281', '0', 0xFC08CA060701000000721B00);
INSERT INTO `tile_store` VALUES ('1281', '0', 0xF808CD060701000000711B00);
INSERT INTO `tile_store` VALUES ('1281', '0', 0xFB08CD060701000000711B00);
INSERT INTO `tile_store` VALUES ('1281', '0', 0xFC08CC060701000000F71A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323831272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393830303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1282', '0', 0x0A042C040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1282', '0', 0x0A042D040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1282', '0', 0x0B0430040601000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323832272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1282', '0', 0xED08C6060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1282', '0', 0xEE08C6060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1282', '0', 0xEC08CA060701000000F71A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323832272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1282', '0', 0xEF08C8060701000000EF1A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323832272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343730303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1282', '0', 0xEF08CC060701000000EF1A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323832272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343730303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1282', '0', 0xF008C6060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1282', '0', 0xF108C6060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1282', '0', 0xF008CD060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1282', '0', 0xF008CE060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1282', '0', 0xF108CD060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1282', '0', 0xF108CE060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1283', '0', 0x0A0433040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1283', '0', 0x0B0432040601000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323833272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1283', '0', 0x0D0432040601000000261900);
INSERT INTO `tile_store` VALUES ('1283', '0', 0x0A0434040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1283', '0', 0x0B0437040601000000261900);
INSERT INTO `tile_store` VALUES ('1283', '0', 0x0C0437040601000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323833272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343930303020676F6C6420636F696E732E0600646F6F726964023200000000);
INSERT INTO `tile_store` VALUES ('1283', '0', 0xF008BE060601000000F71A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323833272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343930303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1284', '0', 0x0F0433040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0x0F0434040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0x100432040601000000C5048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323834272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333230303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1284', '0', 0x120432040601000000261900);
INSERT INTO `tile_store` VALUES ('1284', '0', 0x100437040601000000261900);
INSERT INTO `tile_store` VALUES ('1284', '0', 0x110437040601000000C6048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323834272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333230303020676F6C6420636F696E732E0600646F6F726964023000000000);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xDF08C80607010000001A0700);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xDF08C9060701000000F81A8002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323834272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333230303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xDF08CA0607010000001A0700);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xDC08CC060601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xDD08CC060601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xDF08CD060601000000F71A8002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323834272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333230303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xDF08CD060701000000F71A8002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323834272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333230303020676F6C6420636F696E732E0600646F6F726964020C00000000);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE008C5060601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE008C7060601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE108C5060601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE108C7060601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE108C7060701000000EF1A8002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323834272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333230303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE408C5060601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE408C6060601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE508C5060601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE508C6060601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE408C5060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE408C6060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE508C5060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE508C6060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE008C8060601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE108C8060601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE208C9060701000000F81A8002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323834272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333230303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE408C8060601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE408C9060601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE508C8060601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE508C9060601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE408C8060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE408C9060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE508C8060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE508C9060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE208CC060601000000F81A8002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323834272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333230303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE308CD060601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE308CE060601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE208CD060701000000F71A8002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323834272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333230303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE408CD060601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE408CE060601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE508CD060601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE508CE060601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE408CD060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE408CE060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE508CD060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xE508CE060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xDC08D1060601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xDD08D1060601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xDD08D0060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xDD08D1060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xDE08D0060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1284', '0', 0xDE08D1060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1285', '0', 0x140432040601000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323835272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1285', '0', 0x180433040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1285', '0', 0x190433040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1285', '0', 0x150437040601000000261900);
INSERT INTO `tile_store` VALUES ('1285', '0', 0x170437040601000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323835272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964022B00000000);
INSERT INTO `tile_store` VALUES ('1285', '0', 0x180434040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1285', '0', 0x190434040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1285', '0', 0xDA08D8060701000000F71A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323835272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1285', '0', 0xDF08DA060601000000EF1A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323835272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1285', '0', 0xDE08D9060701000000EE1A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323835272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1286', '0', 0x15042D040601000000271900);
INSERT INTO `tile_store` VALUES ('1286', '0', 0x15042F040601000000271900);
INSERT INTO `tile_store` VALUES ('1286', '0', 0x18042C040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1286', '0', 0x18042D040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1286', '0', 0x19042C040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1286', '0', 0x19042D040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1286', '0', 0x1A042D040601000000271900);
INSERT INTO `tile_store` VALUES ('1286', '0', 0x1A042E040601000000C4048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323836272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323630303020676F6C6420636F696E732E0600646F6F726964022F00000000);
INSERT INTO `tile_store` VALUES ('1286', '0', 0x150431040601000000C4048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323836272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323630303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1286', '0', 0x1A0430040601000000271900);
INSERT INTO `tile_store` VALUES ('1287', '0', 0x0A0427040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1287', '0', 0x0B0426040501000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323837272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1287', '0', 0x0A0428040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1288', '0', 0x0F0427040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1288', '0', 0x0F0428040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1288', '0', 0x100426040501000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323838272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1288', '0', 0xC808D6060701000000F71A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323838272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1288', '0', 0xC908D5060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1288', '0', 0xCA08D5060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1288', '0', 0xCB08D6060701000000721B00);
INSERT INTO `tile_store` VALUES ('1289', '0', 0x160427040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1289', '0', 0x180426040501000000261900);
INSERT INTO `tile_store` VALUES ('1289', '0', 0x15042A040501000000C4048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323839272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1289', '0', 0x160428040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1289', '0', 0x1A0428040501000000271900);
INSERT INTO `tile_store` VALUES ('1289', '0', 0x1A0429040501000000C4048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323839272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313830303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1290', '0', 0x0A042C040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1290', '0', 0x0A042D040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1290', '0', 0x0E042D040501000000271900);
INSERT INTO `tile_store` VALUES ('1290', '0', 0x0E042F040501000000271900);
INSERT INTO `tile_store` VALUES ('1290', '0', 0x0B0430040501000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323930272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1291', '0', 0x0A0433040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1291', '0', 0x0B0432040501000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323931272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1291', '0', 0x0D0432040501000000261900);
INSERT INTO `tile_store` VALUES ('1291', '0', 0x0A0434040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1291', '0', 0x0B0437040501000000261900);
INSERT INTO `tile_store` VALUES ('1291', '0', 0x0C0437040501000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323931272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383030303020676F6C6420636F696E732E0600646F6F726964024500000000);
INSERT INTO `tile_store` VALUES ('1291', '0', 0xCB08C7060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1291', '0', 0xCC08C7060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1291', '0', 0xCB08CA060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1291', '0', 0xCB08CB060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1291', '0', 0xCC08CA060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1291', '0', 0xCC08CB060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1291', '0', 0xD208C9060701000000F71A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323931272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1292', '0', 0x0F0433040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1292', '0', 0x0F0434040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1292', '0', 0x100432040501000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323932272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1292', '0', 0x120432040501000000261900);
INSERT INTO `tile_store` VALUES ('1292', '0', 0x100437040501000000261900);
INSERT INTO `tile_store` VALUES ('1292', '0', 0x110437040501000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323932272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313730303020676F6C6420636F696E732E0600646F6F726964024300000000);
INSERT INTO `tile_store` VALUES ('1293', '0', 0x140432040501000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323933272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1293', '0', 0x180433040501000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1293', '0', 0x190433040501000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1293', '0', 0x150437040501000000261900);
INSERT INTO `tile_store` VALUES ('1293', '0', 0x170437040501000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323933272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363530303020676F6C6420636F696E732E0600646F6F726964024100000000);
INSERT INTO `tile_store` VALUES ('1293', '0', 0x180434040501000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1293', '0', 0x190434040501000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1293', '0', 0xCF08D6060601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1293', '0', 0xCF08DA060601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1293', '0', 0xD008D6060601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1293', '0', 0xD108D7060601000000F81A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323933272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363530303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1293', '0', 0xD008DA060601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1293', '0', 0xD308D8060601000000EF1A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323933272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363530303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1293', '0', 0xD308D9060701000000F81A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323933272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363530303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1293', '0', 0xD508D9060701000000F71A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323933272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1294', '0', 0x15042D040501000000271900);
INSERT INTO `tile_store` VALUES ('1294', '0', 0x15042F040501000000271900);
INSERT INTO `tile_store` VALUES ('1294', '0', 0x18042C040501000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1294', '0', 0x18042D040501000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1294', '0', 0x19042C040501000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1294', '0', 0x19042D040501000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1294', '0', 0x1A042D040501000000271900);
INSERT INTO `tile_store` VALUES ('1294', '0', 0x1A042E040501000000C3048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323934272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303130303020676F6C6420636F696E732E0600646F6F726964023D00000000);
INSERT INTO `tile_store` VALUES ('1294', '0', 0x150431040501000000C3048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323934272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1294', '0', 0x1A0430040501000000271900);
INSERT INTO `tile_store` VALUES ('1294', '0', 0xDE08E6060701000000EE1A8002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323934272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303130303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('1294', '0', 0xD908EB060601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1294', '0', 0xDA08EB060601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1294', '0', 0xDA08EA060701000000EF1A8002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323934272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303130303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1294', '0', 0xDD08E8060601000000721B00);
INSERT INTO `tile_store` VALUES ('1294', '0', 0xDD08EA060601000000F81A8002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323934272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303130303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('1294', '0', 0xDC08E9060701000000660600);
INSERT INTO `tile_store` VALUES ('1294', '0', 0xD908EC060601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1294', '0', 0xDA08EC060601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1294', '0', 0xDB08ED060601000000711B00);
INSERT INTO `tile_store` VALUES ('1294', '0', 0xDD08EC060601000000721B00);
INSERT INTO `tile_store` VALUES ('1294', '0', 0xE008E8060701000000721B00);
INSERT INTO `tile_store` VALUES ('1294', '0', 0xE008EC060701000000721B00);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x1E0417040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x18041804070100000025198002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323935272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313230303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x18041B04070100000025198002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323935272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313230303020676F6C6420636F696E732E0600646F6F726964020B00000000);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x1A0419040701000000C5048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323935272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313230303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x1B0418040701000000C3048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323935272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313230303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x1C041A040601000000C5048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323935272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313230303020676F6C6420636F696E732E0600646F6F726964020A00000000);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x1E0418040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x1F0419040701000000251900);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x1A041D040701000000C5048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323935272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313230303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x1B041C040701000000C3048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323935272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313230303020676F6C6420636F696E732E0600646F6F726964020C00000000);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x1D041D040701000000241900);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x8F08D7060701000000721B00);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x8808D9060701000000721B8002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323935272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313230303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x8808DA060701000000F71A8002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323935272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313230303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x8B08DA060701000000F81A8002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323935272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313230303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x8D08DA060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x8D08DB060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x8E08DA060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x8E08DB060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x8A08DC060701000000711B00);
INSERT INTO `tile_store` VALUES ('1295', '0', 0x8D08DC060701000000711B00);
INSERT INTO `tile_store` VALUES ('1295', '0', 0xCF08E0060701000000EE1A8002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323935272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313230303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('1295', '0', 0xCF08E7060701000000711B00);
INSERT INTO `tile_store` VALUES ('1295', '0', 0xD408E2060701000000721B00);
INSERT INTO `tile_store` VALUES ('1295', '0', 0xD008E5060701000000F81A8002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323935272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313230303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1295', '0', 0xD208E5060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1295', '0', 0xD208E6060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1295', '0', 0xD208E7060701000000711B00);
INSERT INTO `tile_store` VALUES ('1295', '0', 0xD308E5060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1295', '0', 0xD308E6060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1296', '0', 0x190412040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323936272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1296', '0', 0x1D0410040701000000241900);
INSERT INTO `tile_store` VALUES ('1296', '0', 0x1E0412040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323936272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373130303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('1296', '0', 0x1A0415040701000000241900);
INSERT INTO `tile_store` VALUES ('1296', '0', 0x1C0414040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1296', '0', 0x1C0415040701000000241900);
INSERT INTO `tile_store` VALUES ('1296', '0', 0x1D0414040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1296', '0', 0xC708E2060601000000F81A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323936272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373130303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1296', '0', 0xC908E3060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1296', '0', 0xCA08E3060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1296', '0', 0xC908E4060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1296', '0', 0xCA08E4060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x2E0403040701000000251900);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x2F0403040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x2F0404040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x330403040601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323937272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393330303020676F6C6420636F696E732E0600646F6F726964021000000000);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x370402040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x370403040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x340403040701000000620600);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x350401040701000000241900);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x360401040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323937272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393330303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x380403040601000000251900);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x300407040601000000251900);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x310407040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x320405040601000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323937272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393330303020676F6C6420636F696E732E0600646F6F726964020E00000000);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x310404040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323937272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393330303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x320406040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323937272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393330303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x350404040601000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323937272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393330303020676F6C6420636F696E732E0600646F6F726964021200000000);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x350407040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x370407040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x360405040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323937272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393330303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x360407040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x370407040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x380407040601000000251900);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x380404040701000000251900);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x310408040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x300408040701000000251900);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x330409040701000000241900);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x350408040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x350409040601000000241900);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x370408040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x370409040601000000241900);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x360408040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x360409040701000000241900);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x370408040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1297', '0', 0x420409040601000000241900);
INSERT INTO `tile_store` VALUES ('1297', '0', 0xCB08EB060701000000F71A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323937272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393330303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1297', '0', 0xD108EA060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1297', '0', 0xD208EA060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1297', '0', 0xD008EC060701000000F81A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323937272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393330303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1297', '0', 0xD308EC060701000000721B00);
INSERT INTO `tile_store` VALUES ('1298', '0', 0x0B04FE030701000000241900);
INSERT INTO `tile_store` VALUES ('1298', '0', 0x0C04FF030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1298', '0', 0x070403040701000000251900);
INSERT INTO `tile_store` VALUES ('1298', '0', 0x090400040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323938272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1298', '0', 0x0A0401040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323938272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1298', '0', 0x0C0400040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1298', '0', 0x0A0404040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323938272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1298', '0', 0xCB08EF060701000000F71A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323938272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1298', '0', 0xD108EE060701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1298', '0', 0xD208EE060701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1298', '0', 0xCE08F1060701000000711B00);
INSERT INTO `tile_store` VALUES ('1298', '0', 0xD008F0060701000000F81A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323938272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1298', '0', 0xD208F1060701000000711B00);
INSERT INTO `tile_store` VALUES ('1299', '0', 0x0F04FE030701000000241900);
INSERT INTO `tile_store` VALUES ('1299', '0', 0x0C0402040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1299', '0', 0x0C0403040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1299', '0', 0x0F0401040701000000640600);
INSERT INTO `tile_store` VALUES ('1299', '0', 0x0D0404040701000000241900);
INSERT INTO `tile_store` VALUES ('1299', '0', 0x0F0404040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331323939272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('1299', '0', 0x110400040701000000251900);
INSERT INTO `tile_store` VALUES ('1299', '0', 0x110403040701000000251900);
INSERT INTO `tile_store` VALUES ('1304', '0', 0xFF03EF030701000000241900);
INSERT INTO `tile_store` VALUES ('1304', '0', 0xFF03F3030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333034272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313930303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1304', '0', 0xFF03F6030701000000241900);
INSERT INTO `tile_store` VALUES ('1304', '0', '');
INSERT INTO `tile_store` VALUES ('1304', '0', '');
INSERT INTO `tile_store` VALUES ('1304', '0', 0x0104F5030701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1304', '0', 0x0104F6030701000000241900);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1404F2030601000000241900);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1604F3030601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1704F2030601000000241900);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1704F3030601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1504F2030701000000241900);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1704F2030701000000241900);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1204F4030601000000251900);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1204F4030701000000251900);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1404F7030601000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373930303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1604F4030601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1604F7030601000000241900);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1704F4030601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1704F7030601000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1404F5030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373930303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1504F7030701000000660600);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1904F5030501000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373930303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1804F6030601000000251900);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1804F4030701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373930303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1804F6030701000000251900);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1204F8030701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373930303020676F6C6420636F696E732E0600646F6F726964020900000000);
INSERT INTO `tile_store` VALUES ('1305', '0', 0x1704F8030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373930303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1306', '0', 0x1404EB030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333036272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1306', '0', 0x1504EB030701000000241900);
INSERT INTO `tile_store` VALUES ('1306', '0', 0x1104ED030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333036272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393830303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('1306', '0', 0x1604EE030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1306', '0', 0x1604EF030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1306', '0', 0x1704EE030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1306', '0', 0x1704EF030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1306', '0', 0x1804ED030701000000251900);
INSERT INTO `tile_store` VALUES ('1306', '0', 0x1804EF030701000000251900);
INSERT INTO `tile_store` VALUES ('1306', '0', 0xE508D7060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1306', '0', 0xE608D7060701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1306', '0', 0xE908D7060701000000F81A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333036272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1306', '0', 0xEF08D7060701000000F81A8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333036272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393830303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1306', '0', 0xE508D8060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1306', '0', 0xE608D8060701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1306', '0', 0xE708D9060701000000711B00);
INSERT INTO `tile_store` VALUES ('1306', '0', 0xEC08D9060701000000711B00);
INSERT INTO `tile_store` VALUES ('1307', '0', 0x1004E6030701000000251900);
INSERT INTO `tile_store` VALUES ('1307', '0', 0x1004E7030701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333037272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1307', '0', 0x1204E4030701000000241900);
INSERT INTO `tile_store` VALUES ('1307', '0', 0x1604E4030701000000241900);
INSERT INTO `tile_store` VALUES ('1307', '0', 0x1604E5030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1307', '0', 0x1604E6030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1307', '0', 0x1204E9030701000000241900);
INSERT INTO `tile_store` VALUES ('1307', '0', 0x1604E9030701000000241900);
INSERT INTO `tile_store` VALUES ('1307', '0', 0x1704E8030701000000251900);
INSERT INTO `tile_store` VALUES ('1308', '0', 0x1A04E7030701000000251900);
INSERT INTO `tile_store` VALUES ('1308', '0', 0x1B04E6030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1308', '0', 0x1B04E7030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1308', '0', 0x1C04E5030701000000241900);
INSERT INTO `tile_store` VALUES ('1308', '0', 0x1D04E7030701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333038272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1308', '0', 0x1F04E5030701000000241900);
INSERT INTO `tile_store` VALUES ('1308', '0', 0x2104E7030701000000251900);
INSERT INTO `tile_store` VALUES ('1308', '0', 0x2104E8030701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333038272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1309', '0', 0x1A04EA030701000000251900);
INSERT INTO `tile_store` VALUES ('1309', '0', 0x1C04E9030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1309', '0', 0x1C04EA030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1309', '0', 0x1A04EC030701000000251900);
INSERT INTO `tile_store` VALUES ('1309', '0', 0x1C04ED030701000000241900);
INSERT INTO `tile_store` VALUES ('1309', '0', 0x1D04EC030701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333039272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1309', '0', 0x1F04ED030701000000241900);
INSERT INTO `tile_store` VALUES ('1309', '0', 0x2104EC030701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333039272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x1B04F3030701000000271900);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x1A04F5030501000000C3048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333132272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031353930303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x1B04F6030601000000271900);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x1D04F4030601000000BC048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333132272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031353930303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x1E04F6030601000000C3048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333132272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031353930303020676F6C6420636F696E732E0600646F6F726964020C00000000);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x1B04F9030601000000271900);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x1B04F8030701000000271900);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x1D04FA030601000000BE048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333132272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031353930303020676F6C6420636F696E732E0600646F6F726964020F00000000);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x1E04F8030601000000C3048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333132272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031353930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x1D04FA030701000000261900);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x1F04FA030701000000261900);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x2104F4030601000000261900);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x2104F5030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x2104F6030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x2204F6030601000000271900);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x2204F6030701000000271900);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x2104F8030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x2104F9030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x2204F9030601000000271900);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x2104FA030701000000BE048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333132272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031353930303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x2204F9030701000000271900);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x9208CD060701000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x9208CE060701000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x9808CF0607010000008E1B8002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333132272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031353930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x9208D0060701000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1312', '0', 0x9308D0060701000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1313', '0', 0xED030A040701000000B90400);
INSERT INTO `tile_store` VALUES ('1313', '0', 0xEF0308040701000000261900);
INSERT INTO `tile_store` VALUES ('1313', '0', 0xF10308040701000000261900);
INSERT INTO `tile_store` VALUES ('1313', '0', 0xF20309040701000000BA0400);
INSERT INTO `tile_store` VALUES ('1313', '0', 0xF2030B040701000000BA0400);
INSERT INTO `tile_store` VALUES ('1313', '0', 0xF30308040701000000130700);
INSERT INTO `tile_store` VALUES ('1313', '0', 0xF40309040701000000BA0400);
INSERT INTO `tile_store` VALUES ('1313', '0', 0xF4030A040701000000130700);
INSERT INTO `tile_store` VALUES ('1313', '0', 0xF4030B040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1313', '0', 0xF0030C040701000000261900);
INSERT INTO `tile_store` VALUES ('1313', '0', 0xF4030C040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1313', '0', 0xF5030C040701000000271900);
INSERT INTO `tile_store` VALUES ('1313', '0', 0x9C08CE060701000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1313', '0', 0x9C08CF060701000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1313', '0', 0x9F08CF060701000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1313', '0', 0xA008CF060701000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1313', '0', 0xA108CF060701000000851A00);
INSERT INTO `tile_store` VALUES ('1313', '0', 0x9E08D0060701000000911B8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343130303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1313', '0', 0x9E08D4060701000000911B8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343130303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1313', '0', 0xA108D2060701000000851A00);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xF1030E040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xEE0310040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393930303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xF30311040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xF30312040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xF40311040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xF40312040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xF50310040701000000251900);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xF50312040701000000251900);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xA908CE060701000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xA908CF060701000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xAA08CE060701000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xAA08CF060701000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xA508D1060701000000851A00);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xA808D30607010000008E1B8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393930303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xAB08D30607010000008E1B8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393930303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xAC08D0060701000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xAD08D0060701000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xAE08D1060701000000851A00);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xA708D5060701000000841A00);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xAA08D5060701000000911B8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1314', '0', 0xAE08D4060701000000851A00);
INSERT INTO `tile_store` VALUES ('1315', '0', 0xE3030A040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333135272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363830303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1315', '0', 0xE4030A040701000000241900);
INSERT INTO `tile_store` VALUES ('1315', '0', 0xE0030C040701000000251900);
INSERT INTO `tile_store` VALUES ('1315', '0', 0xE0030E040701000000251900);
INSERT INTO `tile_store` VALUES ('1315', '0', 0xE2030D040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1315', '0', 0xE2030E040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1315', '0', 0xE3030D040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1315', '0', 0xE3030E040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1315', '0', 0xE4030F040701000000241900);
INSERT INTO `tile_store` VALUES ('1315', '0', 0xE5030C040701000000251900);
INSERT INTO `tile_store` VALUES ('1315', '0', 0xE5030E040701000000251900);
INSERT INTO `tile_store` VALUES ('1315', '0', 0xDC0311040801000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1315', '0', 0xDC0313040801000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1315', '0', 0xDD0311040801000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1315', '0', 0xDD0313040801000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1315', '0', 0x9D08DA060701000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1315', '0', 0x9E08DA060701000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1315', '0', 0x9F08DA060701000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1315', '0', 0x9E08DD060701000000841A00);
INSERT INTO `tile_store` VALUES ('1315', '0', 0xA008DA060701000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1315', '0', 0xA408D8060701000000901B8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333135272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363830303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('1315', '0', 0xA708DB060701000000851A00);
INSERT INTO `tile_store` VALUES ('1315', '0', 0xA108DC0607010000008E1B8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333135272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363830303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1315', '0', 0xA408DD060701000000841A00);
INSERT INTO `tile_store` VALUES ('1316', '0', 0xE2030A040601000000241900);
INSERT INTO `tile_store` VALUES ('1316', '0', 0xE4030A040601000000241900);
INSERT INTO `tile_store` VALUES ('1316', '0', 0xE0030C040601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333136272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333930303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1316', '0', 0xE0030E040601000000251900);
INSERT INTO `tile_store` VALUES ('1316', '0', 0xE3030D040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1316', '0', 0xE3030E040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1316', '0', 0xE4030D040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1316', '0', 0xE4030E040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1316', '0', 0xE5030C040601000000251900);
INSERT INTO `tile_store` VALUES ('1316', '0', 0xE5030E040601000000251900);
INSERT INTO `tile_store` VALUES ('1316', '0', 0xAA08D9060701000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1316', '0', 0xAB08D9060701000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1316', '0', 0xAC08DB0607010000008F1B8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333136272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333930303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1316', '0', 0xAE08D8060701000000911B8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333136272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333930303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('1316', '0', 0xAB08DC060701000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1316', '0', 0xAB08DD060701000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1316', '0', 0xAB08DE060701000000841A00);
INSERT INTO `tile_store` VALUES ('1316', '0', 0xAE08DE060701000000861A00);
INSERT INTO `tile_store` VALUES ('1316', '0', 0xB008DB060701000000871A00);
INSERT INTO `tile_store` VALUES ('1317', '0', 0xE1030B040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1317', '0', 0xE2030A040501000000241900);
INSERT INTO `tile_store` VALUES ('1317', '0', 0xE2030B040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1317', '0', 0xE4030A040501000000241900);
INSERT INTO `tile_store` VALUES ('1317', '0', 0xE0030C040501000000251900);
INSERT INTO `tile_store` VALUES ('1317', '0', 0xE0030E040501000000251900);
INSERT INTO `tile_store` VALUES ('1317', '0', 0xE1030C040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1317', '0', 0xE2030C040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1317', '0', 0xE2030F040501000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333137272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343230303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('1317', '0', 0xE4030F040501000000241900);
INSERT INTO `tile_store` VALUES ('1317', '0', 0xE5030C040501000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333137272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343230303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('1317', '0', 0xE5030E040501000000251900);
INSERT INTO `tile_store` VALUES ('1317', '0', 0xA308E3060701000000911B8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333137272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343230303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1317', '0', 0xA408E1060701000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1317', '0', 0xA408E2060701000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1317', '0', 0xA508E1060701000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1317', '0', 0xA508E2060701000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1317', '0', 0xA608E1060701000000851A00);
INSERT INTO `tile_store` VALUES ('1317', '0', 0xA308E6060701000000841A00);
INSERT INTO `tile_store` VALUES ('1317', '0', 0xA608E50607010000008F1B8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333137272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343230303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xDF0313040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333138272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xDD0315040701000000251900);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xDE0316040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xDE0317040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xDF0316040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xDF0317040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xE30313040701000000241900);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xE10315040601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333138272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353330303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xE30314040601000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xE30315040601000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xE10315040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333138272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353330303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xE30316040701000000241900);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xE40315040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333138272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353330303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xAE08E3060701000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xAF08E3060701000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xAE08E4060701000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xAE08E7060701000000841A00);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xAF08E4060701000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xB008E60607010000008F1B8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333138272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353330303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xB208E7060701000000841A00);
INSERT INTO `tile_store` VALUES ('1318', '0', 0xB408E50607010000008F1B8002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333138272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1319', '0', 0xE50318040701000000241900);
INSERT INTO `tile_store` VALUES ('1319', '0', 0xE6031A040701000000620600);
INSERT INTO `tile_store` VALUES ('1319', '0', 0xE80318040701000000241900);
INSERT INTO `tile_store` VALUES ('1319', '0', 0xE9031A040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313930303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('1319', '0', 0xE5031C040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1319', '0', 0xE5031F040701000000241900);
INSERT INTO `tile_store` VALUES ('1319', '0', 0xE7031D040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1319', '0', 0xE7031E040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1319', '0', 0xE7031F040701000000241900);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xEF0317040601000000251900);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xEF0317040701000000251900);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xEF031B040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333231272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020B00000000);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xF10315040601000000241900);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xF30316040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xF30317040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xF20315040701000000241900);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xF40315040601000000241900);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xF40316040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xF40317040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xF40315040701000000241900);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xF50317040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333231272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xF1031A040601000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333231272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020E00000000);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xF3031A040601000000241900);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xF10318040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333231272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020900000000);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xF2031A040701000000660600);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xF4031A040601000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333231272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020F00000000);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xF50319040601000000251900);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xF4031B040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333231272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xF50319040701000000251900);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xF1031C040601000000241900);
INSERT INTO `tile_store` VALUES ('1321', '0', 0xF1031C040701000000241900);
INSERT INTO `tile_store` VALUES ('1322', '0', 0xF7030A040701000000251900);
INSERT INTO `tile_store` VALUES ('1322', '0', 0xF80309040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1322', '0', 0xF8030A040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1322', '0', 0xF90308040701000000241900);
INSERT INTO `tile_store` VALUES ('1322', '0', 0xFA030A040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333232272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1322', '0', 0xFC0308040701000000241900);
INSERT INTO `tile_store` VALUES ('1322', '0', 0xFE030A040701000000251900);
INSERT INTO `tile_store` VALUES ('1322', '0', 0xFE030B040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333232272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1323', '0', 0xF7030D040701000000251900);
INSERT INTO `tile_store` VALUES ('1323', '0', 0xF7030F040701000000251900);
INSERT INTO `tile_store` VALUES ('1323', '0', 0xF9030C040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1323', '0', 0xF9030D040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1323', '0', 0xFA030F040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333233272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('1323', '0', 0xFE030F040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333233272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('1323', '0', 0xF90310040701000000241900);
INSERT INTO `tile_store` VALUES ('1323', '0', 0xFC0310040701000000241900);
INSERT INTO `tile_store` VALUES ('1324', '0', 0xF9030A040601000000241900);
INSERT INTO `tile_store` VALUES ('1324', '0', 0xF7030C040601000000251900);
INSERT INTO `tile_store` VALUES ('1324', '0', 0xF7030E040601000000251900);
INSERT INTO `tile_store` VALUES ('1324', '0', 0xF8030E040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1324', '0', 0xF8030F040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1324', '0', 0xFB030C040601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333234272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313730303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1324', '0', 0xFB030F040601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333234272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313730303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1324', '0', 0xFD030E040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1324', '0', 0xFD030F040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1324', '0', 0xFE030F040601000000251900);
INSERT INTO `tile_store` VALUES ('1324', '0', 0xFA0310040601000000241900);
INSERT INTO `tile_store` VALUES ('1324', '0', 0xFD0310040601000000241900);
INSERT INTO `tile_store` VALUES ('1325', '0', 0xEA0322040701000000261900);
INSERT INTO `tile_store` VALUES ('1325', '0', 0xEF0323040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1325', '0', 0xEE0322040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333235272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363130303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('1325', '0', 0xE70325040701000000271900);
INSERT INTO `tile_store` VALUES ('1325', '0', 0xE90326040601000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333235272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363130303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('1325', '0', 0xE80324040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1325', '0', 0xE80325040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1325', '0', 0xEC0324040601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333235272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363130303020676F6C6420636F696E732E0600646F6F726964020900000000);
INSERT INTO `tile_store` VALUES ('1325', '0', 0xEF0324040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1325', '0', 0xEC0324040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333235272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1325', '0', 0xEC0327040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333235272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363130303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('1325', '0', 0xEE0325040701000000261900);
INSERT INTO `tile_store` VALUES ('1325', '0', 0xEF0324040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333235272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363130303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1325', '0', 0xE90329040601000000261900);
INSERT INTO `tile_store` VALUES ('1325', '0', 0xEA0328040601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333235272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363130303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('1325', '0', 0xEA0329040701000000261900);
INSERT INTO `tile_store` VALUES ('1325', '0', 0xF00323040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1325', '0', 0xF00324040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1326', '0', 0x0504E7030701000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333236272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323730303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1326', '0', 0x0104E9030701000000271900);
INSERT INTO `tile_store` VALUES ('1326', '0', 0x0104EB030701000000271900);
INSERT INTO `tile_store` VALUES ('1326', '0', 0x0904E9030701000000271900);
INSERT INTO `tile_store` VALUES ('1326', '0', 0x0904EB030701000000271900);
INSERT INTO `tile_store` VALUES ('1326', '0', 0x0304EC030701000000261900);
INSERT INTO `tile_store` VALUES ('1326', '0', 0x0504EC030701000000130700);
INSERT INTO `tile_store` VALUES ('1326', '0', 0x0604EC030701000000BE048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333236272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323730303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('1326', '0', 0x0704EC030701000000BE048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333236272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323730303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0104E3030601000000271900);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0204E2030601000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0204E3030601000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0304E1030601000000261900);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0204E2030701000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0204E3030701000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0504E1030601000000261900);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0504E2030601000000AE06170000000000);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0604E2030601000000AF06170000000000);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0704E3030601000000271900);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0604E2030701000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0604E3030701000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0704E3030701000000271900);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0104E6030601000000271900);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0204E5030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0204E6030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0304E7030601000000261900);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0404E5030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0404E6030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0504E7030601000000261900);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0604E6030601000000271900);
INSERT INTO `tile_store` VALUES ('1327', '0', 0x0504E4030701000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333237272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323530303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1330', '0', 0x1C06C7040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1330', '0', 0x1D06C7040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1330', '0', 0x1C06C7040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1330', '0', 0x1D06C7040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1330', '0', 0x1D06CB040701000000B90400);
INSERT INTO `tile_store` VALUES ('1330', '0', 0x2006CA040601000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333330272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343730303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1330', '0', 0x2106C8040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333330272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343730303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1331', '0', 0x1406C3040701000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333331272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343330303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1331', '0', 0x1306C6040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1331', '0', 0x1306C7040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1331', '0', 0x1306C7040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1331', '0', 0x1606C5040601000000B90400);
INSERT INTO `tile_store` VALUES ('1331', '0', 0x1406C7040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1331', '0', 0x1606C5040701000000B90400);
INSERT INTO `tile_store` VALUES ('1331', '0', 0x1906C5040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333331272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343330303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1332', '0', 0x2206BF040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1332', '0', 0x2306BF040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1332', '0', 0x2106C0040701000000B90400);
INSERT INTO `tile_store` VALUES ('1332', '0', 0x2306C2040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333332272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323630303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1333', '0', 0xF305C5040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333333272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333330303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1333', '0', 0xF405C5040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1333', '0', 0xF505C5040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1333', '0', 0xF705C7040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1333', '0', 0xF705C8040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1333', '0', 0xF505C9040701000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333333272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1334', '0', 0xF605BB040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1334', '0', 0xF705B9040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333334272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1334', '0', 0xF605BE040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1334', '0', 0xF705BE040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1334', '0', 0xF605BC040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1334', '0', 0xF705BF040701000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333334272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1334', '0', 0xF805BD040701000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333334272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333130303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1335', '0', 0xE405AB040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1335', '0', 0xE405AA040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1335', '0', 0xE505AA040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1335', '0', 0xE805AB040601000000B90400);
INSERT INTO `tile_store` VALUES ('1335', '0', 0xE805AB040701000000B90400);
INSERT INTO `tile_store` VALUES ('1335', '0', 0xE405AC040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1335', '0', 0xE705AE040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333335272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343230303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1336', '0', 0xE905A3040601000000B90400);
INSERT INTO `tile_store` VALUES ('1336', '0', 0xE805A2040701000000B90400);
INSERT INTO `tile_store` VALUES ('1336', '0', 0xEB05A3040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333336272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323830303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1336', '0', 0xE705A6040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1336', '0', 0xE705A6040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1336', '0', 0xE805A6040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1336', '0', 0xE805A6040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1336', '0', 0xE905A4040701000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333336272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323830303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1337', '0', 0xEA059B040601000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333337272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1337', '0', 0xEB0599040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1337', '0', 0xEB059A040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1337', '0', 0xE90599040701000000B90400);
INSERT INTO `tile_store` VALUES ('1337', '0', 0xEC059B040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333337272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323130303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xF70573040501000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xF70573040701000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xF80573040501000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xF80573040701000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xFB0573040701000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xFC0573040601000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xF70576040501000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xF70577040501000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xF70575040601000000DC068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xFA0574040501000000B90400);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xFA0577040501000000B90400);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xF80575040601000000DD068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xF90574040601000000B90400);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xF80575040701000000BC048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333338272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343130303020676F6C6420636F696E732E0600646F6F726964020A00000000);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xFB0574040701000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xFC0574040601000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xFD0575040601000000BC048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333338272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xFD0575040701000000BC048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333338272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343130303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xFF0577040701000000B90400);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xF90578040601000000C5048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333338272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343130303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1338', '0', 0xFA0578040601000000C5048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333338272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343130303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1339', '0', 0xFD0590040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1339', '0', 0xFD0591040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1339', '0', 0xFF0592040601000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373130303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('1339', '0', 0xFD0590040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1339', '0', 0xFD0591040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1339', '0', 0xFF0593040701000000BC0400);
INSERT INTO `tile_store` VALUES ('1339', '0', 0xFD0592040801000000B90400);
INSERT INTO `tile_store` VALUES ('1339', '0', 0xFF059604070100000005068002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1339', '0', 0x020693040701000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373130303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1340', '0', 0x1B06A1040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333430272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353030303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1340', '0', 0x1C06A1040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1340', '0', 0x1D06A1040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1340', '0', 0x1F06A0040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1340', '0', 0x1F06A1040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1340', '0', 0x1E06A0040701000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333430272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1340', '0', 0x2206A1040601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333430272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353030303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1340', '0', 0x2006A0040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1340', '0', 0x2106A0040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1341', '0', 0x2906A2040501000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333431272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1341', '0', 0x2806A3040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1341', '0', 0x2906A0040601000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333431272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1341', '0', 0x2906A3040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1341', '0', 0x2B06A2040601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333431272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1342', '0', 0x2606AF040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1342', '0', 0x2706AF040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1342', '0', 0x2306B0040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333432272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353530303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1342', '0', 0x2706B3040601000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333432272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353530303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('1342', '0', 0x2706B3040701000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333432272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353530303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1342', '0', 0x2806B1040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1342', '0', 0x2806B2040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1342', '0', 0x2506B5040701000000B90400);
INSERT INTO `tile_store` VALUES ('1343', '0', 0x2F06AA040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1343', '0', 0x2F06AB040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1343', '0', 0x2D06AD040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1343', '0', 0x2E06AD040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1343', '0', 0x2C06AC040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333433272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1343', '0', 0x2E06AE040701000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333433272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323830303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1344', '0', 0x0B06B3040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1344', '0', 0x0F06B1040701000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333434272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323130303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1344', '0', 0x0F06B3040701000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333434272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323130303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1344', '0', 0x0B06B4040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1344', '0', 0x1006B5040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333434272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323130303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1345', '0', 0xFD05B3040601000000B90400);
INSERT INTO `tile_store` VALUES ('1345', '0', 0xFC05B3040701000000B90400);
INSERT INTO `tile_store` VALUES ('1345', '0', 0xFA05B4040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1345', '0', 0xFB05B4040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1345', '0', '');
INSERT INTO `tile_store` VALUES ('1346', '0', 0xFA059B040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333436272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323830303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('1346', '0', 0xF8059E040601000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333436272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323830303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1346', '0', 0xF9059D040701000000B90400);
INSERT INTO `tile_store` VALUES ('1346', '0', 0xFA059E040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1346', '0', 0xFB059E040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1346', '0', 0xFC059D040601000000B90400);
INSERT INTO `tile_store` VALUES ('1347', '0', 0x0806CB040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1347', '0', 0x0906CB040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1347', '0', 0x0906CD040601000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333437272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1347', '0', 0x0906CE040701000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333437272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1347', '0', 0x0E06CC040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333437272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333430303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1348', '0', 0x32040E040701000000251900);
INSERT INTO `tile_store` VALUES ('1348', '0', 0x35040C040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333438272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323230303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1348', '0', 0x320411040701000000251900);
INSERT INTO `tile_store` VALUES ('1348', '0', 0x330411040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1348', '0', 0x330412040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1348', '0', 0x340411040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1348', '0', 0x340412040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1349', '0', 0x3A040C040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333439272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323830303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1349', '0', 0x3D040E040701000000251900);
INSERT INTO `tile_store` VALUES ('1349', '0', 0x3B0411040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1349', '0', 0x3B0412040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1349', '0', 0x3C0411040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1349', '0', 0x3C0412040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1349', '0', 0x3D0411040701000000251900);
INSERT INTO `tile_store` VALUES ('1350', '0', 0x350413040601000000241900);
INSERT INTO `tile_store` VALUES ('1350', '0', 0x380413040601000000241900);
INSERT INTO `tile_store` VALUES ('1350', '0', 0x340414040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1350', '0', 0x340415040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1350', '0', 0x370416040701000000BB048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333530272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1350', '0', 0x390417040601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333530272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363730303020676F6C6420636F696E732E0600646F6F726964020D00000000);
INSERT INTO `tile_store` VALUES ('1350', '0', 0x380417040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1350', '0', 0x3C0415040601000000271900);
INSERT INTO `tile_store` VALUES ('1350', '0', 0x3C0415040701000000271900);
INSERT INTO `tile_store` VALUES ('1350', '0', 0x3C0417040701000000BB048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333530272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363730303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('1350', '0', 0x330418040601000000251900);
INSERT INTO `tile_store` VALUES ('1350', '0', 0x350419040601000000241900);
INSERT INTO `tile_store` VALUES ('1350', '0', 0x360418040601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333530272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363730303020676F6C6420636F696E732E0600646F6F726964020B00000000);
INSERT INTO `tile_store` VALUES ('1350', '0', 0x3B0419040601000000261900);
INSERT INTO `tile_store` VALUES ('1350', '0', 0x380418040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1350', '0', 0x3C0418040601000000271900);
INSERT INTO `tile_store` VALUES ('1351', '0', 0x33041A040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1351', '0', 0x33041B040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1351', '0', 0x350419040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333531272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353130303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('1351', '0', 0x3C041B040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333531272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1351', '0', 0x34041D040701000000241900);
INSERT INTO `tile_store` VALUES ('1351', '0', 0x38041D040701000000241900);
INSERT INTO `tile_store` VALUES ('1351', '0', 0x3B041D040701000000241900);
INSERT INTO `tile_store` VALUES ('1352', '0', 0x0804FF030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1352', '0', 0x080400040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1352', '0', 0x0A0402040601000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333532272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1353', '0', 0x0D04FF030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1353', '0', 0x0D0400040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1353', '0', 0x0E0402040601000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333533272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1353', '0', 0x110400040601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333533272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1354', '0', 0xF503FC030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1354', '0', 0xF503FD030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('1354', '0', 0xF603FF030601000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333534272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323830303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('1354', '0', 0xFB03FD030601000000251900);
INSERT INTO `tile_store` VALUES ('1354', '0', 0xFB03FF030601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202331333534272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('1354', '0', 0xF60302040601000000241900);
INSERT INTO `tile_store` VALUES ('1354', '0', 0xF90302040601000000241900);
INSERT INTO `tile_store` VALUES ('1354', '0', 0xFB0301040601000000251900);
INSERT INTO `tile_store` VALUES ('2040', '0', 0x3004DD030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2040', '0', 0x3004DE030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2040', '0', 0x2A04E0030601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2040', '0', 0x2B04E0030601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2040', '0', 0x2B04E1030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303430272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2041', '0', 0x3304E0030601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2041', '0', 0x3304E1030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303431272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2041', '0', 0x3404E0030601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2042', '0', 0x3404E4030701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303432272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2042', '0', 0x3504E6030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303432272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333330303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2042', '0', 0x3904E7030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2042', '0', 0x3A04E6030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303432272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333330303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2042', '0', 0x3B04E7030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2042', '0', 0x3904E8030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2042', '0', 0x3B04E8030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2043', '0', 0x2D04E6030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2043', '0', 0x2D04E7030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2043', '0', 0x2C04E5030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303433272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343930303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2044', '0', 0xFD03E7030701000000261900);
INSERT INTO `tile_store` VALUES ('2044', '0', 0xF803E9030701000000271900);
INSERT INTO `tile_store` VALUES ('2044', '0', 0xF803EB030701000000271900);
INSERT INTO `tile_store` VALUES ('2044', '0', 0xF903E8030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2044', '0', 0xF903E9030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2044', '0', 0xFE03E9030701000000271900);
INSERT INTO `tile_store` VALUES ('2044', '0', 0xFE03EB030701000000271900);
INSERT INTO `tile_store` VALUES ('2044', '0', 0xFC03EC030701000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303434272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313930303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('2045', '0', 0xEC03E10307010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2045', '0', 0xEC03E20307010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2045', '0', 0xF003E3030701000000BA0400);
INSERT INTO `tile_store` VALUES ('2046', '0', 0xEC03E5030701000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2046', '0', 0xEC03E6030701000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2046', '0', 0xF003E6030701000000BA0400);
INSERT INTO `tile_store` VALUES ('2047', '0', 0xEC03E9030701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2047', '0', 0xEC03EA030701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2047', '0', 0xF003E9030701000000BA0400);
INSERT INTO `tile_store` VALUES ('2048', '0', 0xEC03E1030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2048', '0', 0xEC03E2030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2048', '0', 0xF003E3030601000000BA0400);
INSERT INTO `tile_store` VALUES ('2049', '0', 0xEC03E5030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2049', '0', 0xEC03E6030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2049', '0', 0xF003E6030601000000BA0400);
INSERT INTO `tile_store` VALUES ('2050', '0', 0xEC03E9030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2050', '0', 0xEC03EA030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2050', '0', 0xF003E9030601000000BA0400);
INSERT INTO `tile_store` VALUES ('2052', '0', 0xDD0301040601000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2052', '0', 0xDD0302040601000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2052', '0', 0xDF0301040601000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2052', '0', 0xDF0302040601000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2052', '0', 0xDD0300040701000000BC048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303532272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031363730303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2052', '0', 0xDD0303040701000000BC048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303532272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031363730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2052', '0', 0xE10303040601000000B90400);
INSERT INTO `tile_store` VALUES ('2052', '0', 0xE00301040701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2052', '0', 0xE00302040701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2052', '0', 0xE30301040701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2052', '0', 0xE30302040701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2052', '0', 0xE10306040701000000BC048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303532272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031363730303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2053', '0', 0x1C04E7030601000000241900);
INSERT INTO `tile_store` VALUES ('2053', '0', 0x1A04E9030601000000251900);
INSERT INTO `tile_store` VALUES ('2053', '0', 0x1A04EB030601000000251900);
INSERT INTO `tile_store` VALUES ('2053', '0', 0x1B04EB030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2053', '0', 0x1E04E9030601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303533272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313730303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2053', '0', 0x1B04EC030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2053', '0', 0x1D04ED030601000000241900);
INSERT INTO `tile_store` VALUES ('2053', '0', 0x1E04EC030601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303533272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313730303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2053', '0', 0x2004EB030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2053', '0', 0x2004EC030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2053', '0', 0x2004ED030601000000241900);
INSERT INTO `tile_store` VALUES ('2053', '0', 0x2104EC030601000000251900);
INSERT INTO `tile_store` VALUES ('2054', '0', 0xEB03D7030701000000241900);
INSERT INTO `tile_store` VALUES ('2054', '0', 0xE903D9030701000000251900);
INSERT INTO `tile_store` VALUES ('2054', '0', 0xEA03D8030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2054', '0', 0xEA03D9030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2054', '0', 0xEC03DA030701000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303534272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2054', '0', 0xED03D8030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2054', '0', 0xED03D9030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2054', '0', 0xEE03D8030701000000251900);
INSERT INTO `tile_store` VALUES ('2054', '0', 0xEE03DB030701000000251900);
INSERT INTO `tile_store` VALUES ('2054', '0', 0xE903DC030701000000251900);
INSERT INTO `tile_store` VALUES ('2054', '0', 0xEC03DE030701000000261900);
INSERT INTO `tile_store` VALUES ('2054', '0', 0xEE03DD030701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303534272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323030303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2055', '0', 0xF003D3030701000000251900);
INSERT INTO `tile_store` VALUES ('2055', '0', 0xF103D1030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2055', '0', 0xF103D2030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2055', '0', 0xF203D0030701000000241900);
INSERT INTO `tile_store` VALUES ('2055', '0', 0xF003D6030701000000251900);
INSERT INTO `tile_store` VALUES ('2055', '0', 0xF203D4030701000000BC048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303535272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2055', '0', 0xF003D9030701000000251900);
INSERT INTO `tile_store` VALUES ('2055', '0', 0xF103DA030701000000241900);
INSERT INTO `tile_store` VALUES ('2055', '0', 0xF203DA030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303535272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2056', '0', 0xF403D1030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2056', '0', 0xF403D2030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2056', '0', 0xF503D0030701000000241900);
INSERT INTO `tile_store` VALUES ('2056', '0', 0xF603D0030701000000C50400);
INSERT INTO `tile_store` VALUES ('2056', '0', 0xF703D0030701000000241900);
INSERT INTO `tile_store` VALUES ('2056', '0', 0xF503D4030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303536272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2056', '0', 0xF503DA030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303536272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2056', '0', 0xF603DA030701000000241900);
INSERT INTO `tile_store` VALUES ('2057', '0', 0xFA03D0030701000000241900);
INSERT INTO `tile_store` VALUES ('2057', '0', 0xFA03D1030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2057', '0', 0xFA03D2030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2057', '0', 0xFB03D2030701000000251900);
INSERT INTO `tile_store` VALUES ('2057', '0', 0xFA03D4030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303537272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323030303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2057', '0', 0xFB03D5030701000000251900);
INSERT INTO `tile_store` VALUES ('2057', '0', 0xF903DA030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303537272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2057', '0', 0xFA03DA030701000000241900);
INSERT INTO `tile_store` VALUES ('2058', '0', 0xFE03CE030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2058', '0', 0xFE03CF030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2058', '0', 0xFF03CD030701000000241900);
INSERT INTO `tile_store` VALUES ('2058', '0', 0xFF03D0030701000000241900);
INSERT INTO `tile_store` VALUES ('2058', '0', 0x0104CF030701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303538272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313730303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('2058', '0', 0x0404CF030701000000251900);
INSERT INTO `tile_store` VALUES ('2058', '0', '');
INSERT INTO `tile_store` VALUES ('2058', '0', 0x0204D2030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303538272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313730303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2059', '0', 0xF103D1030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2059', '0', 0xF103D2030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2059', '0', 0xF503D2030601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303539272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2060', '0', 0xF103D6030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2060', '0', 0xF103D7030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2060', '0', 0xF503D7030601000000271900);
INSERT INTO `tile_store` VALUES ('2060', '0', 0xF203DA030601000000261900);
INSERT INTO `tile_store` VALUES ('2060', '0', 0xF403DA030601000000261900);
INSERT INTO `tile_store` VALUES ('2060', '0', 0xF503D8030601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303630272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2061', '0', 0xFA03D1030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2061', '0', 0xFA03D2030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2061', '0', 0xFB03D3030601000000271900);
INSERT INTO `tile_store` VALUES ('2061', '0', 0xF803D5030601000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303631272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2061', '0', 0xFA03D7030601000000261900);
INSERT INTO `tile_store` VALUES ('2061', '0', 0xFB03D5030601000000271900);
INSERT INTO `tile_store` VALUES ('2062', '0', 0x1604DA030701000000261900);
INSERT INTO `tile_store` VALUES ('2062', '0', 0x1704DB030701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2062', '0', 0x1804DB030701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2062', '0', 0x1404DC030701000000251900);
INSERT INTO `tile_store` VALUES ('2062', '0', 0x1704DC030701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2062', '0', 0x1804DC030701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2062', '0', 0x1904DF030701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303632272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2062', '0', 0x1704E0030701000000261900);
INSERT INTO `tile_store` VALUES ('2063', '0', 0x0C04DB030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2063', '0', 0x0F04DA030701000000261900);
INSERT INTO `tile_store` VALUES ('2063', '0', 0x0B04DD030602000000271900271900);
INSERT INTO `tile_store` VALUES ('2063', '0', 0x0B04DC030701000000271900);
INSERT INTO `tile_store` VALUES ('2063', '0', 0x0B04DF030701000000271900);
INSERT INTO `tile_store` VALUES ('2063', '0', 0x0C04DC030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2063', '0', 0x0E04DC030601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303633272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343430303020676F6C6420636F696E732E0600646F6F726964020A00000000);
INSERT INTO `tile_store` VALUES ('2063', '0', 0x1004DA030602000000261900261900);
INSERT INTO `tile_store` VALUES ('2063', '0', 0x0F04E0030601000000261900);
INSERT INTO `tile_store` VALUES ('2063', '0', 0x0E04E0030701000000BD048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303633272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343430303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2063', '0', 0x1104E0030701000000261900);
INSERT INTO `tile_store` VALUES ('2064', '0', 0x0304D9030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2064', '0', 0x0304DA030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2064', '0', 0x0204DA0307010000001A0700);
INSERT INTO `tile_store` VALUES ('2064', '0', 0x0204DB0307010000001A0700);
INSERT INTO `tile_store` VALUES ('2064', '0', 0x0704DA030701000000C4048002000B006465736372697074696F6E014200000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303634272E20536F6C69646F206F776E73207468697320686F7573652E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2064', '0', 0x0304DE030601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2064', '0', 0x0204DD030701000000251900);
INSERT INTO `tile_store` VALUES ('2064', '0', 0x0304DC030701000000A331170C0000003909009F16003D091700000000009A31800200060061747461636B02310000000B006465736372697074696F6E01180000002041747461636B20696E637265617365642062792034332E00D41C00D81C00E3080F6200F41780020008006465636179696E67020000000008006475726174696F6E0268E0B60000A331171E000000BE3100BF3100C03100C13100BA3100BB3100BC3100BD3100B03100B33100B63100B93100AF3100B23100B53100B83100AE3100B13100B43100B73100C23100C33100C53100C43100C73100C83100C93100C63100AC3100AD31000070080F640070080F5F0068080F460000);
INSERT INTO `tile_store` VALUES ('2064', '0', 0x0304DD030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2064', '0', 0x0304DE030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2064', '0', 0x0404DE030601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2064', '0', 0x0604DF030701000000241900);
INSERT INTO `tile_store` VALUES ('2064', '0', 0x0704DD030701000000251900);
INSERT INTO `tile_store` VALUES ('2064', '0', 0x0704DE030701000000C3048002000B006465736372697074696F6E014200000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303634272E20536F6C69646F206F776E73207468697320686F7573652E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0B04CB030701000000241900);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0804CD030601000000251900);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0904CD030601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0A04CD030601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0B04CE030601000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303635272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353130303020676F6C6420636F696E732E0600646F6F726964020E00000000);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0904CC030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0904CD030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0B04CE030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303635272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0C04CC030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0C04CD030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0C04CC030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0C04CD030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0804D0030601000000251900);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0A04D2030601000000241900);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0804D0030701000000C4048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303635272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353130303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0804D1030701000000251900);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0A04D2030701000000241900);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0B04D2030701000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303635272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353130303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0C04D2030601000000241900);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0D04D1030601000000251900);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0C04D2030701000000241900);
INSERT INTO `tile_store` VALUES ('2065', '0', 0x0D04D1030701000000251900);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xF703DE030701000000C6048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303636272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303930303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xF803DE030601000000261900);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xF803DE030701000000261900);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xFC03DE030701000000261900);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xFD03DE030701000000261900);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xFD03DF030701000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xF503E0030601000000271900);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xF703E2030601000000261900);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xF503E1030701000000C4048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303636272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xF703E2030701000000C6048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303636272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303930303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xF803E2030601000000261900);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xF903E0030601000000C4048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303636272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303930303020676F6C6420636F696E732E0600646F6F726964020E00000000);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xF903E1030701000000C4048002000B006465736372697074696F6E015E00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303636272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303930303020676F6C6420636F696E732E0600646F6F726964020C00000000);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xFC03E3030701000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xFD03E0030701000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xFD03E3030701000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xFE03E0030701000000271900);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xFE03E2030701000000271900);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xF903E4030701000000271900);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xFB03E5030701000000261900);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xFC03E4030701000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2066', '0', 0xFD03E4030701000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2067', '0', 0x1E04DE030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2067', '0', 0x1E04DF030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2067', '0', 0x1D04E10307010000001A0700);
INSERT INTO `tile_store` VALUES ('2067', '0', 0x1D04E20307010000001A0700);
INSERT INTO `tile_store` VALUES ('2067', '0', 0x1F04E3030701000000241900);
INSERT INTO `tile_store` VALUES ('2067', '0', 0x2004E0030701000000660600);
INSERT INTO `tile_store` VALUES ('2067', '0', 0x2204E0030701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303637272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2068', '0', 0x1E04DE030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2068', '0', 0x1E04DF030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2068', '0', 0x1D04E00306010000001A0700);
INSERT INTO `tile_store` VALUES ('2068', '0', 0x1D04E10306010000001A0700);
INSERT INTO `tile_store` VALUES ('2068', '0', 0x2004E0030601000000660600);
INSERT INTO `tile_store` VALUES ('2068', '0', 0x2204E1030601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303638272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2069', '0', 0x1504DC030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2069', '0', 0x1504DD030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2069', '0', 0x1504DE030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2069', '0', 0x1504DF030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2069', '0', 0x1904DC030601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303639272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2069', '0', 0x1904DF030601000000251900);
INSERT INTO `tile_store` VALUES ('2069', '0', 0x1704E0030601000000241900);
INSERT INTO `tile_store` VALUES ('2070', '0', 0x1404D7030601000000251900);
INSERT INTO `tile_store` VALUES ('2070', '0', 0x1604D5030601000000241900);
INSERT INTO `tile_store` VALUES ('2070', '0', 0x1704D6030601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2070', '0', 0x1704D7030601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2070', '0', 0x1804D6030601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2070', '0', 0x1804D7030601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2070', '0', 0x1404D9030601000000251900);
INSERT INTO `tile_store` VALUES ('2070', '0', 0x1904D8030601000000251900);
INSERT INTO `tile_store` VALUES ('2070', '0', 0x1904DA030601000000C4048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303730272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2071', '0', 0x1F04D1030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2071', '0', 0x1F04D2030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2071', '0', 0x1E04D5030601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303731272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313630303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2071', '0', 0x2004D0030601000000241900);
INSERT INTO `tile_store` VALUES ('2071', '0', 0x2104D1030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2071', '0', 0x2104D2030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2071', '0', 0x2004D7030601000000241900);
INSERT INTO `tile_store` VALUES ('2072', '0', 0x2C04D1030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2072', '0', 0x2C04D2030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2072', '0', 0x2D04D3030601000000271900);
INSERT INTO `tile_store` VALUES ('2072', '0', 0x2904D4030601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303732272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2072', '0', 0x2B04D5030601000000261900);
INSERT INTO `tile_store` VALUES ('2073', '0', 0x2C04CB030601000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2073', '0', 0x2904CF030601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303733272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2073', '0', 0x2C04CC030601000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2073', '0', 0x2D04CD030601000000251900);
INSERT INTO `tile_store` VALUES ('2073', '0', 0x2D04CF030601000000271900);
INSERT INTO `tile_store` VALUES ('2074', '0', 0x2904C6030601000000261900);
INSERT INTO `tile_store` VALUES ('2074', '0', 0x2B04C6030601000000241900);
INSERT INTO `tile_store` VALUES ('2074', '0', 0x2C04C7030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2074', '0', 0x2804CA030601000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303734272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2074', '0', 0x2C04C8030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2074', '0', 0x2D04C8030601000000251900);
INSERT INTO `tile_store` VALUES ('2075', '0', 0x2604C6030601000000241900);
INSERT INTO `tile_store` VALUES ('2075', '0', 0x2604C7030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2075', '0', 0x2604C8030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2075', '0', 0x2604CA030601000000C5048002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303735272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203530303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2076', '0', 0x2304C6030601000000241900);
INSERT INTO `tile_store` VALUES ('2076', '0', 0x2304C7030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2076', '0', 0x2104C8030601000000251900);
INSERT INTO `tile_store` VALUES ('2076', '0', 0x2304C8030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2076', '0', 0x2304CA030601000000C5048002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303736272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203530303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2077', '0', 0x1E04D3030701000000251900);
INSERT INTO `tile_store` VALUES ('2077', '0', 0x1F04D1030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2077', '0', 0x1F04D2030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2077', '0', 0x2004D0030701000000241900);
INSERT INTO `tile_store` VALUES ('2077', '0', 0x2104D1030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2077', '0', 0x2104D2030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2077', '0', 0x2204D2030701000000251900);
INSERT INTO `tile_store` VALUES ('2077', '0', 0x2004D7030701000000241900);
INSERT INTO `tile_store` VALUES ('2077', '0', 0x2204D4030701000000C4048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303737272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313730303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2077', '0', 0x2204D6030701000000251900);
INSERT INTO `tile_store` VALUES ('2078', '0', 0x2C04D3030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2078', '0', 0x2904D4030701000000251900);
INSERT INTO `tile_store` VALUES ('2078', '0', 0x2904D6030701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303738272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2078', '0', 0x2B04D7030701000000241900);
INSERT INTO `tile_store` VALUES ('2078', '0', 0x2C04D4030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2078', '0', 0x2D04D5030701000000251900);
INSERT INTO `tile_store` VALUES ('2079', '0', 0x2904CF030701000000251900);
INSERT INTO `tile_store` VALUES ('2079', '0', 0x2B04CD030701000000241900);
INSERT INTO `tile_store` VALUES ('2079', '0', 0x2C04CE030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2079', '0', 0x2C04CF030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2079', '0', 0x2904D1030701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303739272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2079', '0', 0x2D04D0030701000000251900);
INSERT INTO `tile_store` VALUES ('2080', '0', 0x2304C6030701000000241900);
INSERT INTO `tile_store` VALUES ('2080', '0', 0x2404C7030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2080', '0', 0x2104C9030701000000251900);
INSERT INTO `tile_store` VALUES ('2080', '0', 0x2304CB030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303830272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2080', '0', 0x2404C8030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2081', '0', 0x2704C6030701000000241900);
INSERT INTO `tile_store` VALUES ('2081', '0', 0x2804C7030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2081', '0', 0x2704CB030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303831272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2081', '0', 0x2804C8030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2082', '0', 0x2B04C6030701000000241900);
INSERT INTO `tile_store` VALUES ('2082', '0', 0x2C04C7030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2082', '0', 0x2B04CB030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303832272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2082', '0', 0x2C04C8030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2082', '0', 0x2D04C9030701000000251900);
INSERT INTO `tile_store` VALUES ('2083', '0', 0xDB031B040701000000251900);
INSERT INTO `tile_store` VALUES ('2083', '0', 0xDC031A040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2083', '0', 0xDC031B040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2083', '0', 0xDB031D040701000000251900);
INSERT INTO `tile_store` VALUES ('2083', '0', 0xDD031E040701000000241900);
INSERT INTO `tile_store` VALUES ('2083', '0', 0xDF031E040701000000241900);
INSERT INTO `tile_store` VALUES ('2083', '0', 0xE0031B040701000000251900);
INSERT INTO `tile_store` VALUES ('2083', '0', 0xE0031D040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303833272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2084', '0', 0xDB0323040701000000251900);
INSERT INTO `tile_store` VALUES ('2084', '0', 0xDC0322040701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2084', '0', 0xDC0323040701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2084', '0', 0xDD0321040701000000241900);
INSERT INTO `tile_store` VALUES ('2084', '0', 0xDF0324040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303834272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2085', '0', 0xDC03270407010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2085', '0', 0xDB0329040701000000251900);
INSERT INTO `tile_store` VALUES ('2085', '0', 0xDC03280407010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2085', '0', 0xDF0329040701000000C4048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303835272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313230303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2086', '0', 0xDD032E040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2086', '0', 0xDD032F040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2086', '0', 0xDC0330040701000000251900);
INSERT INTO `tile_store` VALUES ('2086', '0', 0xE00330040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303836272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2087', '0', 0xDC032D040601000000251900);
INSERT INTO `tile_store` VALUES ('2087', '0', 0xDC032F040601000000251900);
INSERT INTO `tile_store` VALUES ('2087', '0', 0xDD032C040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2087', '0', 0xDD032D040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2087', '0', 0xDF032C040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2087', '0', 0xDF032D040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2087', '0', 0xDC0331040601000000251900);
INSERT INTO `tile_store` VALUES ('2087', '0', 0xE00330040601000000C4048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303837272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313730303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2088', '0', 0xDC0327040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2088', '0', 0xDB0328040601000000251900);
INSERT INTO `tile_store` VALUES ('2088', '0', 0xDC0328040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2088', '0', 0xDF0329040601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303838272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2089', '0', 0xDB0323040601000000251900);
INSERT INTO `tile_store` VALUES ('2089', '0', 0xDC0322040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2089', '0', 0xDC0323040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2089', '0', 0xDD0321040601000000241900);
INSERT INTO `tile_store` VALUES ('2089', '0', 0xDF0324040601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303839272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2090', '0', 0xDB0323040501000000251900);
INSERT INTO `tile_store` VALUES ('2090', '0', 0xDC0322040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2090', '0', 0xDC0323040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2090', '0', 0xDD0321040501000000241900);
INSERT INTO `tile_store` VALUES ('2090', '0', 0xDF0324040501000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303930272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2091', '0', 0xDC0327040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2091', '0', 0xDB0328040501000000251900);
INSERT INTO `tile_store` VALUES ('2091', '0', 0xDB032A040501000000251900);
INSERT INTO `tile_store` VALUES ('2091', '0', 0xDC0328040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2091', '0', 0xDF0329040501000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303931272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2092', '0', 0xDC032D040501000000251900);
INSERT INTO `tile_store` VALUES ('2092', '0', 0xDC032F040501000000251900);
INSERT INTO `tile_store` VALUES ('2092', '0', 0xDD032C040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2092', '0', 0xDD032D040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2092', '0', 0xDF032C040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2092', '0', 0xDF032D040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2092', '0', 0xDC0331040501000000251900);
INSERT INTO `tile_store` VALUES ('2092', '0', 0xE00330040501000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303932272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313630303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2093', '0', 0x1E0432040601000000241900);
INSERT INTO `tile_store` VALUES ('2093', '0', 0x1C0434040601000000251900);
INSERT INTO `tile_store` VALUES ('2093', '0', 0x1E0436040601000000241900);
INSERT INTO `tile_store` VALUES ('2093', '0', 0x1C0434040701000000251900);
INSERT INTO `tile_store` VALUES ('2093', '0', 0x1D0435040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2093', '0', 0x1E0435040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2093', '0', 0x1E0436040701000000241900);
INSERT INTO `tile_store` VALUES ('2093', '0', 0x210432040601000000241900);
INSERT INTO `tile_store` VALUES ('2093', '0', 0x210432040701000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303933272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2093', '0', 0x200434040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2093', '0', 0x200435040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2093', '0', 0x210434040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2093', '0', 0x210435040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2093', '0', 0x220434040601000000251900);
INSERT INTO `tile_store` VALUES ('2093', '0', 0x210436040701000000241900);
INSERT INTO `tile_store` VALUES ('2093', '0', 0x220434040701000000251900);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x260432040601000000261900);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x270432040701000000241900);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x290432040601000000261900);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x280432040701000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303934272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353230303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x240434040601000000271900);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x250436040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x250437040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x260435040601000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303934272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353230303020676F6C6420636F696E732E0600646F6F726964021100000000);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x240434040701000000251900);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x250436040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x250437040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x270437040701000000C4048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303934272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353230303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x280435040601000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303934272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353230303020676F6C6420636F696E732E0600646F6F726964020E00000000);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x290436040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x290437040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x2A0434040601000000251900);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x2A0434040701000000251900);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x2A0436040701000000251900);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x260438040601000000261900);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x260438040701000000241900);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x290438040601000000261900);
INSERT INTO `tile_store` VALUES ('2094', '0', 0x280438040701000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303934272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353230303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('2095', '0', 0x470407040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303935272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2095', '0', 0x480408040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2095', '0', 0x480409040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2096', '0', 0x4804FF030701000000241900);
INSERT INTO `tile_store` VALUES ('2096', '0', 0x450401040701000000251900);
INSERT INTO `tile_store` VALUES ('2096', '0', 0x450403040701000000251900);
INSERT INTO `tile_store` VALUES ('2096', '0', 0x480400040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2096', '0', 0x480401040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2096', '0', 0x470404040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303936272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313130303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x3A0403040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x3E0403040601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303937272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373530303020676F6C6420636F696E732E0600646F6F726964020900000000);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x3F0403040701000000620600);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x3B0407040601000000251900);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x3A0404040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x3C0407040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x3D0405040601000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303937272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373530303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x3C0404040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303937272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373530303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x3D0406040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303937272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373530303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x3B0408040701000000251900);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x3C0408040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x420402040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x420403040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x400401040701000000241900);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x410401040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303937272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373530303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x400404040601000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303937272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373530303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x400407040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x420407040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x410405040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303937272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373530303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x410407040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x420407040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x400408040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x420408040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x410408040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2097', '0', 0x420408040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2098', '0', 0x470410040701000000C5048002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303938272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2098', '0', 0x470413040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2098', '0', 0x480413040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2099', '0', 0x450419040701000000261900);
INSERT INTO `tile_store` VALUES ('2099', '0', 0x470419040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303939272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2099', '0', 0x49041B040701000000271900);
INSERT INTO `tile_store` VALUES ('2099', '0', 0x44041D040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2099', '0', 0x44041E040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2099', '0', 0x45041F040701000000241900);
INSERT INTO `tile_store` VALUES ('2099', '0', 0x46041E040701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303939272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2099', '0', 0x47041F040701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332303939272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('2100', '0', 0x4104F00307010000001A0700);
INSERT INTO `tile_store` VALUES ('2100', '0', 0x4104F10307010000001A0700);
INSERT INTO `tile_store` VALUES ('2100', '0', 0x4304F3030701000000241900);
INSERT INTO `tile_store` VALUES ('2100', '0', 0x4404F0030701000000660600);
INSERT INTO `tile_store` VALUES ('2100', '0', 0x4604F0030701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313030272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2101', '0', 0x4104F00306010000001A0700);
INSERT INTO `tile_store` VALUES ('2101', '0', 0x4104F10306010000001A0700);
INSERT INTO `tile_store` VALUES ('2101', '0', 0x4404F0030601000000660600);
INSERT INTO `tile_store` VALUES ('2101', '0', 0x4604F1030601000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2102', '0', 0x4A04E7030701000000251900);
INSERT INTO `tile_store` VALUES ('2102', '0', 0x4504E8030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2102', '0', 0x4504E9030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2102', '0', 0x4604E8030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2102', '0', 0x4604E9030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2102', '0', 0x4A04E8030701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313032272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313830303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2102', '0', 0x4A04E9030701000000251900);
INSERT INTO `tile_store` VALUES ('2103', '0', 0x4504E3030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2103', '0', 0x4604E3030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2103', '0', 0x4A04E2030701000000251900);
INSERT INTO `tile_store` VALUES ('2103', '0', 0x4A04E3030701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313033272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313830303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2103', '0', 0x4504E4030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2103', '0', 0x4604E4030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2103', '0', 0x4A04E4030701000000251900);
INSERT INTO `tile_store` VALUES ('2104', '0', 0x4504DE030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2104', '0', 0x4504DF030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2104', '0', 0x4604DE030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2104', '0', 0x4604DF030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2104', '0', 0x4A04DD030701000000251900);
INSERT INTO `tile_store` VALUES ('2104', '0', 0x4A04DE030701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313034272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313830303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2104', '0', 0x4A04DF030701000000251900);
INSERT INTO `tile_store` VALUES ('2105', '0', 0x4604D1030701000000241900);
INSERT INTO `tile_store` VALUES ('2105', '0', 0x4304D5030701000000271900);
INSERT INTO `tile_store` VALUES ('2105', '0', 0x4404D5030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2105', '0', 0x4404D6030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2105', '0', 0x4504D5030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2105', '0', 0x4504D6030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2105', '0', 0x4904D5030701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323030303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2105', '0', 0x4904D6030701000000251900);
INSERT INTO `tile_store` VALUES ('2107', '0', 0x4804C3030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2107', '0', 0x4A04C2030701000000261900);
INSERT INTO `tile_store` VALUES ('2107', '0', 0x4B04C3030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2107', '0', 0x4704C7030701000000C3048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313037272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393430303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('2107', '0', 0x4A04C7030601000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313037272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2107', '0', 0x4804C4030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2107', '0', 0x4A04C5030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313037272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393430303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('2107', '0', 0x4B04C4030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2107', '0', 0x4704C8030701000000251900);
INSERT INTO `tile_store` VALUES ('2107', '0', 0x4904C9030701000000241900);
INSERT INTO `tile_store` VALUES ('2107', '0', 0x4A04C9030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313037272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2107', '0', 0x4B04C9030701000000241900);
INSERT INTO `tile_store` VALUES ('2107', '0', 0x4C04C8030701000000251900);
INSERT INTO `tile_store` VALUES ('2108', '0', 0x3E04D0030701000000891E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2108', '0', 0x3E04D2030701000000891E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2108', '0', 0x3F04D00307010000008A1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2108', '0', 0x3F04D20307010000008A1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2108', '0', 0x4104CF030701000000241900);
INSERT INTO `tile_store` VALUES ('2108', '0', 0x4104D3030701000000C5048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313038272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2109', '0', 0x3B04CF030701000000241900);
INSERT INTO `tile_store` VALUES ('2109', '0', 0x3A04D0030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2109', '0', 0x3A04D1030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2109', '0', 0x3C04D3030701000000C6048002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313039272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2110', '0', 0x3704CF030701000000241900);
INSERT INTO `tile_store` VALUES ('2110', '0', 0x3604D0030701000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2110', '0', 0x3604D1030701000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2110', '0', 0x3804D3030701000000C6048002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313130272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2112', '0', 0x3804D6030701000000C5048002000B006465736372697074696F6E014E00000049742062656C6F6E677320746F20686F75736520273435303030272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2112', '0', 0x3604D8030701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2112', '0', 0x3604D9030701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2113', '0', 0x3C04D6030701000000C5048002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2113', '0', 0x3A04D8030701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2113', '0', 0x3A04D9030701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2114', '0', 0x3E04D8030701000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2114', '0', 0x3E04D9030701000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2114', '0', 0x3F04D8030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2114', '0', 0x3F04D9030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2114', '0', 0x4104D6030701000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2115', '0', 0x3F04D6030601000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313135272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2115', '0', 0x4104D8030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2115', '0', 0x4104D9030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2115', '0', 0x4204D8030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2115', '0', 0x4204D9030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2116', '0', 0x3C04D6030601000000C5048002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313136272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2116', '0', 0x3A04D8030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2116', '0', 0x3A04D9030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2118', '0', 0x3804D6030601000000C6048002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313138272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2118', '0', 0x3604D8030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2118', '0', 0x3604D9030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2119', '0', 0x3704CF030601000000241900);
INSERT INTO `tile_store` VALUES ('2119', '0', 0x3604D0030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2119', '0', 0x3604D1030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2119', '0', 0x3804D3030601000000C5048002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203830303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2120', '0', 0x3B04CF030601000000241900);
INSERT INTO `tile_store` VALUES ('2120', '0', 0x3A04D0030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2120', '0', 0x3A04D1030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2120', '0', 0x3C04D3030601000000C5048002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313230272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203830303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2121', '0', 0x3E04D0030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2121', '0', 0x3E04D1030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2121', '0', 0x3F04D3030601000000C6048002000B006465736372697074696F6E015D00000049742062656C6F6E677320746F20686F7573652027556E6E616D656420486F757365202332313231272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2121', '0', 0x4004CF030601000000241900);
INSERT INTO `tile_store` VALUES ('2121', '0', 0x4204D0030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2121', '0', 0x4204D1030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2122', '0', 0x4F04C2030401000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2122', '0', 0x4F04C3030401000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2122', '0', 0x5304C503040100000067068002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F7573652027466F7262696464656E20546F776572272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343530303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2122', '0', 0x5104C4030501000000C3048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F7573652027466F7262696464656E20546F776572272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2123', '0', 0xCE0769040701000000B81400);
INSERT INTO `tile_store` VALUES ('2123', '0', 0xCF0768040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2123', '0', 0xCF076A040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2123', '0', 0xD20767040601000000B71400);
INSERT INTO `tile_store` VALUES ('2123', '0', 0xD207690404010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202331272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031383230303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('2123', '0', 0xD20768040501000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2123', '0', 0xD30768040501000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2123', '0', 0xD00768040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2123', '0', 0xD0076A040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2123', '0', 0xD307690407010000008C158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202331272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031383230303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2123', '0', 0xD4076B0407010000008E158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202331272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031383230303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2123', '0', 0xD607690407010000008C158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202331272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031383230303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2123', '0', 0xD6076A040701000000B81400);
INSERT INTO `tile_store` VALUES ('2124', '0', 0xDA07620407010000008C158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202332272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2124', '0', 0xDF07630407010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202332272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323630303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2124', '0', 0xDF07650405010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202332272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323630303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('2124', '0', 0xDF07640406010000008C158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202332272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323630303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('2124', '0', 0xE30763040601000000891E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2124', '0', 0xE307630407010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202332272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323630303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2124', '0', 0xE407630406010000008A1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2124', '0', 0xE50762040701000000311900);
INSERT INTO `tile_store` VALUES ('2124', '0', 0xE30764040601000000891E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2124', '0', 0xE00765040701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2124', '0', 0xE00766040701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2124', '0', 0xE407640406010000008A1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2124', '0', 0xE40765040701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2124', '0', 0xE40766040701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2124', '0', 0xE50765040701000000311900);
INSERT INTO `tile_store` VALUES ('2125', '0', 0xC70762040701000000B81400);
INSERT INTO `tile_store` VALUES ('2125', '0', 0xCA0760040501000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2125', '0', 0xCB0760040501000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2125', '0', 0xCE07620405010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202333272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313730303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('2125', '0', 0xCE07620406010000008C158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202333272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313730303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2125', '0', 0xCC07620407010000008C158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202333272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313730303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2125', '0', 0xCA0764040501000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2125', '0', 0xCB0764040501000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2125', '0', 0xD307620407010000008C158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202333272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2125', '0', 0xD30764040701000000B81400);
INSERT INTO `tile_store` VALUES ('2126', '0', 0xDB0759040701000000B71400);
INSERT INTO `tile_store` VALUES ('2126', '0', 0xDB075D0406010000008B158002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202334272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2126', '0', 0xD8075F0407010000008E158002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202334272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2126', '0', 0xDE075C040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2126', '0', 0xDE075D040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2126', '0', 0xDF075C040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2126', '0', 0xDF075D040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2126', '0', 0xE0075B040701000000B81400);
INSERT INTO `tile_store` VALUES ('2126', '0', 0xE0075E040701000000B81400);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x1A08630407010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202335272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031383130303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x150867040701000000B71400);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x1B08690407010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202335272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031383130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x1E086B040601000000B81400);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x1B086D0406010000008E158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202335272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031383130303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x19086F040701000000311900);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x1B086D0407010000008E158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202335272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031383130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x1F086E0406010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x1F086F0406010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x21086E0406010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x21086F0406010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x22086F040601000000B81400);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x20086E0407010000008D1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x21086E0407010000008E1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x1E08700406010000008C158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202335272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031383130303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x1E08700407010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202335272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031383130303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x1908750407010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202335272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031383130303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x1C0876040701000000B71400);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x2008720406010000008D1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x2108720406010000008E1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x2008720407010000008D1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2127', '0', 0x2108720407010000008E1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2128', '0', 0x20085E0407010000008C158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202336272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031353430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2128', '0', 0x22085F0407010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202336272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031353430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2128', '0', 0x24085F040501000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2128', '0', 0x25085F040501000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2128', '0', 0x28085F040501000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2128', '0', 0x29085F040501000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2128', '0', 0x28085F0406010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202336272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031353430303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2128', '0', 0x2708610406010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202336272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031353430303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('2128', '0', 0x2608620407010000008E158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202336272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031353430303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('2128', '0', 0x2808600407010000008C158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202336272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031353430303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2128', '0', 0x250866040701000000B71400);
INSERT INTO `tile_store` VALUES ('2128', '0', 0x2708660407010000008E158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202336272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031353430303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('2128', '0', 0x2808660407010000008E158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202336272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031353430303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('2128', '0', 0x2A0866040701000000B71400);
INSERT INTO `tile_store` VALUES ('2129', '0', 0x18084F040701000000B71400);
INSERT INTO `tile_store` VALUES ('2129', '0', 0x160850040601000000E2068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2129', '0', 0x1608510406010000008B1F8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2129', '0', 0x160850040701000000E2068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2129', '0', 0x1608510407010000008B1F8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2129', '0', 0x1B0852040601000000B81400);
INSERT INTO `tile_store` VALUES ('2129', '0', 0x1B0852040701000000311900);
INSERT INTO `tile_store` VALUES ('2129', '0', 0x1508560406010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202337272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323530303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('2129', '0', 0x1508560407010000008C158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202337272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323530303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2129', '0', 0x1708570407010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202337272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323530303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2129', '0', 0x180857040601000000B71400);
INSERT INTO `tile_store` VALUES ('2129', '0', 0x1B0855040601000000B81400);
INSERT INTO `tile_store` VALUES ('2129', '0', 0x1808540407010000008E158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202337272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323530303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2129', '0', 0x190857040701000000B71400);
INSERT INTO `tile_store` VALUES ('2129', '0', 0x1B0856040701000000B81400);
INSERT INTO `tile_store` VALUES ('2129', '0', 0x14085B0406010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202337272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323530303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('2129', '0', 0x150859040701000000B81400);
INSERT INTO `tile_store` VALUES ('2129', '0', 0x17085E0407010000008C158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202337272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2130', '0', 0x1E08530407010000008D1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2130', '0', 0x1F08530407010000008E1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2130', '0', 0x1D0854040701000000B81400);
INSERT INTO `tile_store` VALUES ('2130', '0', 0x1F08560407010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202338272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343830303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2130', '0', 0x1D0858040701000000311900);
INSERT INTO `tile_store` VALUES ('2130', '0', 0x1E085A0407010000008E158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202338272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343830303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2130', '0', 0x230856040401000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2130', '0', 0x230857040401000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2130', '0', 0x240856040401000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2130', '0', 0x240857040401000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2130', '0', 0x250856040701000000B81400);
INSERT INTO `tile_store` VALUES ('2130', '0', 0x210859040401000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2130', '0', 0x220859040401000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2130', '0', 0x2008580407010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202338272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2130', '0', 0x23085A040701000000B71400);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1704A2030401000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1704A3030401000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1404A2030501000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1404A3030501000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1604A2030501000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1604A3030501000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1904A2030401000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1904A3030401000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1904A2030501000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1904A3030501000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1B04A2030501000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1B04A3030501000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1804A2030701000000FC0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1804A3030701000000FD0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1B04A2030701000000FC0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1B04A3030701000000FD0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1E04A2030701000000FC0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1E04A3030701000000FD0E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1104A4030301000000891E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1204A40303010000008A1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1404A5030401000000D02300);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1704A5030501000000D02300);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1804A5030301000000D02300);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1904A5030301000000D02300);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1804A40307010000006C188002000B006465736372697074696F6E016400000049742062656C6F6E677320746F20686F7573652027466F7262696464656E20436173746C65206F6620476F6473272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203130303030303020676F6C6420636F696E732E0600646F6F726964020900000000);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1B04A40307010000006C188002000B006465736372697074696F6E016400000049742062656C6F6E677320746F20686F7573652027466F7262696464656E20436173746C65206F6620476F6473272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203130303030303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1C04A5030401000000D02300);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1D04A5030501000000D02300);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1E04A40307010000006C188002000B006465736372697074696F6E016400000049742062656C6F6E677320746F20686F7573652027466F7262696464656E20436173746C65206F6620476F6473272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203130303030303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1F04A603070100000069188002000B006465736372697074696F6E016400000049742062656C6F6E677320746F20686F7573652027466F7262696464656E20436173746C65206F6620476F6473272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203130303030303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1204A90307010000006C188002000B006465736372697074696F6E016400000049742062656C6F6E677320746F20686F7573652027466F7262696464656E20436173746C65206F6620476F6473272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203130303030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1304AA030701000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1304AB030701000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1404A8030201000000D02300);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1504A90307010000006C188002000B006465736372697074696F6E016400000049742062656C6F6E677320746F20686F7573652027466F7262696464656E20436173746C65206F6620476F6473272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203130303030303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1604AA030701000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1604AB030701000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1804AA030601000000D0238002000B006465736372697074696F6E016400000049742062656C6F6E677320746F20686F7573652027466F7262696464656E20436173746C65206F6620476F6473272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203130303030303020676F6C6420636F696E732E0600646F6F726964020B00000000);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1904AA030601000000D0238002000B006465736372697074696F6E016400000049742062656C6F6E677320746F20686F7573652027466F7262696464656E20436173746C65206F6620476F6473272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203130303030303020676F6C6420636F696E732E0600646F6F726964020D00000000);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1904A90307010000006C188002000B006465736372697074696F6E016400000049742062656C6F6E677320746F20686F7573652027466F7262696464656E20436173746C65206F6620476F6473272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203130303030303020676F6C6420636F696E732E0600646F6F726964020A00000000);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1A04AA030701000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1A04AB030701000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1E04A8030201000000D02300);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1D04A90307010000006C188002000B006465736372697074696F6E016400000049742062656C6F6E677320746F20686F7573652027466F7262696464656E20436173746C65206F6620476F6473272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203130303030303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1E04AA030701000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1E04AB030701000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x1F04A803070100000069188002000B006465736372697074696F6E016400000049742062656C6F6E677320746F20686F7573652027466F7262696464656E20436173746C65206F6620476F6473272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203130303030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x2004A2030701000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x2004A3030701000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x2204A2030701000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x2204A3030701000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x2D04A4030801000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x2D04A5030801000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x2F04A4030801000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x2F04A5030801000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x2004AA030701000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x2004AB030701000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x2204AA030701000000DE068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x2204AB030701000000DF068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2131', '0', 0x2304A803080100000069188002000B006465736372697074696F6E016400000049742062656C6F6E677320746F20686F7573652027466F7262696464656E20436173746C65206F6620476F6473272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203130303030303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1F083A040401000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1E083B0406010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1E083B0407010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1F083C0404010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964021300000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1E083C040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1E083D040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1E083C0406010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1E083E0406010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1E083F0406010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1E083C0407010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1E083E0407010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1E083F0407010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x20083A040401000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x21083A040401000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x22083A040401000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x23083A040401000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x23083A040501000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x20083B0406010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964020F00000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x23083B0406010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964021200000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x20083B0407010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964021400000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x210839040701000000B71400);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x23083B0407010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964021000000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x24083A040401000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x24083A040501000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x25083B0406010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x25083B0407010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x21083E0404010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964021700000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x22083F040401000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x23083F040401000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x20083C0405010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964020900000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x22083C0405010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964020E00000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x20083F0406010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964020D00000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x23083F0406010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964021100000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x20083F0407010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964021600000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x23083F0407010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964021500000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x24083D040401000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x25083D040401000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x25083C040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x25083D040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x25083C0406010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x25083E0406010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x25083F0406010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x25083C0407010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x25083E0407010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x25083F0407010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1408410406010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1408420406010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1708400406010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964020B00000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1508400407010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1508410407010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1708400407010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1708410407010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1808400407010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1808410407010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1A08400407010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1A08410407010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1F08400405010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964020C00000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1F0841040601000000B71400);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1C0842040701000000B81400);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1408440406010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1408450406010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1508460406010000008D1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1608460406010000008E1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1708450406010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964020A00000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1608460407010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x180847040601000000B71400);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1908440406010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1808440407010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1C08460406010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1F084A0406010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1F084B0406010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x1F084A0407010000008D1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x220840040401000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x230840040401000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x2208410407010000008E158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964021500000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x240841040601000000B71400);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x2208460407010000008E158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x240846040701000000B71400);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x2208490406010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x20084A0407010000008E1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x2308490407010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x2408490406010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F757365202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732033353130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x26084A040601000000731E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x26084B040601000000741E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x25084A0407010000008D1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x26084A0407010000008E1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x22084C0406010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x22084D0406010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x24084D0406010000008D1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2133', '0', 0x25084D0406010000008E1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2134', '0', 0x21082F0407010000008C158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233130272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032343130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2134', '0', 0x0D08360407010000008E158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233130272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032343130303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2134', '0', 0x0E083E040601000000B71400);
INSERT INTO `tile_store` VALUES ('2134', '0', 0x0C083E040701000000B71400);
INSERT INTO `tile_store` VALUES ('2134', '0', 0x150833040701000000891E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2134', '0', 0x1608330407010000008A1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2134', '0', 0x170833040701000000891E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2134', '0', 0x1808330407010000008A1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2134', '0', 0x130835040701000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2134', '0', 0x130836040701000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2134', '0', 0x1908340407010000008B158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233130272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032343130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2134', '0', 0x1B0835040701000000B71400);
INSERT INTO `tile_store` VALUES ('2134', '0', 0x1F0835040701000000B71400);
INSERT INTO `tile_store` VALUES ('2134', '0', 0x12083B040601000000B81400);
INSERT INTO `tile_store` VALUES ('2134', '0', 0x1208380407010000008B158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233130272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032343130303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('2134', '0', 0x150838040701000000891E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2134', '0', 0x1608380407010000008A1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2134', '0', 0x10083E040701000000B71400);
INSERT INTO `tile_store` VALUES ('2134', '0', 0x210832040701000000B81400);
INSERT INTO `tile_store` VALUES ('2135', '0', 0x0F08230405010000008E1500);
INSERT INTO `tile_store` VALUES ('2135', '0', 0x0F082A0405010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233131272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333430303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2135', '0', 0x0D0829040601000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2135', '0', 0x0D082A040601000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2135', '0', 0x0E08280406010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233131272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2135', '0', 0x0F08280407010000008E158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233131272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2135', '0', 0x0E082C040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2135', '0', 0x0F082C040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2135', '0', 0x0F082D0407010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233131272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333430303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2135', '0', 0x110826040401000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2135', '0', 0x110827040401000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2135', '0', 0x110824040601000000B81400);
INSERT INTO `tile_store` VALUES ('2135', '0', 0x120827040601000000B81400);
INSERT INTO `tile_store` VALUES ('2135', '0', 0x110824040701000000B81400);
INSERT INTO `tile_store` VALUES ('2135', '0', 0x120827040701000000B81400);
INSERT INTO `tile_store` VALUES ('2135', '0', 0x100829040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2135', '0', 0x10082A040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2135', '0', 0x11082A040601000000B81400);
INSERT INTO `tile_store` VALUES ('2135', '0', 0x11082A040701000000B81400);
INSERT INTO `tile_store` VALUES ('2136', '0', 0x060824040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2136', '0', 0x060825040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2136', '0', 0x080824040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2136', '0', 0x080825040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2136', '0', 0x0708280406010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233132272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333730303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2136', '0', 0x0708290407010000008E158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233132272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333730303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2136', '0', 0x03082C0406010000008C158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233132272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333730303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('2136', '0', 0x0B082C040601000000B81400);
INSERT INTO `tile_store` VALUES ('2136', '0', 0x0B082D0407010000008B158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233132272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333730303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2136', '0', 0x070830040701000000B71400);
INSERT INTO `tile_store` VALUES ('2137', '0', 0xFF0734040601000000B81400);
INSERT INTO `tile_store` VALUES ('2137', '0', 0xFF0737040601000000B81400);
INSERT INTO `tile_store` VALUES ('2137', '0', 0xFF0734040701000000B81400);
INSERT INTO `tile_store` VALUES ('2137', '0', 0x020831040601000000B71400);
INSERT INTO `tile_store` VALUES ('2137', '0', 0x050831040601000000B71400);
INSERT INTO `tile_store` VALUES ('2137', '0', '');
INSERT INTO `tile_store` VALUES ('2137', '0', 0x0308340407010000008B158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333830303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2137', '0', 0x0408370406010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2137', '0', 0x0508370406010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2137', '0', 0x0608350406010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333830303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2137', '0', 0x0508360407010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333830303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2137', '0', 0x080834040601000000B81400);
INSERT INTO `tile_store` VALUES ('2137', '0', 0x080837040601000000B81400);
INSERT INTO `tile_store` VALUES ('2137', '0', 0x0808350407010000008C158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2137', '0', 0x020839040601000000B71400);
INSERT INTO `tile_store` VALUES ('2137', '0', 0x0408380406010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2137', '0', 0x0508380406010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2137', '0', 0x050839040601000000B71400);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC6074B040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC8074A040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC8074B040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xCC0748040701000000B71400);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xCD0749040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xCD074A040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xCE0749040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xCE074A040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC5074D040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC5074E040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC6074C040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC8074F040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC9074F0407010000008B158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034373430303020676F6C6420636F696E732E0600646F6F726964020900000000);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xCC074D0407010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034373430303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD00749040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD10749040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD3074B040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD4074B040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD1074C040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD2074C040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD0074C040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD1074C040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD2074F0407010000008B158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034373430303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD5074F040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD6074D040701000000B81400);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD6074F040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC30750040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC40750040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC70750040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC80750040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC807510406010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034373430303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC80750040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xCF07530407010000008C158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034373430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC30755040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC40755040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC60754040701000000B71400);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC70755040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC807550406010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034373430303020676F6C6420636F696E732E0600646F6F726964020C00000000);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC80755040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC907570407010000008B158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034373430303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xCC0755040701000000B71400);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC40758040701000000311900);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC60759040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC6075A040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC7075A040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC7075B040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC80759040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC8075A040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC8075A040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xC8075B040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xCC07580407010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034373430303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xCA075C040701000000891E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xCB075C0407010000008A1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xCD075C040701000000891E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xCE075C0407010000008A1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD107510406010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034373430303020676F6C6420636F696E732E0600646F6F726964020D00000000);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD207530407010000008B158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034373430303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD60751040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD60752040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD70751040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD70752040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD80753040701000000B81400);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD107550406010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034373430303020676F6C6420636F696E732E0600646F6F726964020A00000000);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD207570407010000008B158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034373430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD50756040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD60754040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD60756040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD70754040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD1075A040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD2075A040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD0075C040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2138', '0', 0xD1075C040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2139', '0', 0xCF073F0406010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233135272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393930303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('2139', '0', 0xD1073E0406010000008B158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233135272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393930303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2139', '0', 0xD1073F0407010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233135272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2139', '0', 0xD4073C0407010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233135272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393930303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2139', '0', 0xD5073E040701000000B81400);
INSERT INTO `tile_store` VALUES ('2139', '0', 0xCE0742040601000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2139', '0', 0xCE0743040601000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2139', '0', 0xD00742040601000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2139', '0', 0xD00743040601000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2139', '0', 0xD50742040601000000B81400);
INSERT INTO `tile_store` VALUES ('2139', '0', 0xD50742040701000000B81400);
INSERT INTO `tile_store` VALUES ('2139', '0', 0xD10744040701000000B71400);
INSERT INTO `tile_store` VALUES ('2140', '0', 0xD7073B0407010000008C158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233136272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313630303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2140', '0', 0xDB073C0407010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233136272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313630303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2140', '0', 0xDB073E040701000000E2068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2140', '0', 0xDB073F0407010000008B1F8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2140', '0', 0xDC073E040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2140', '0', 0xDC073F040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2140', '0', 0xDB0740040601000000B71400);
INSERT INTO `tile_store` VALUES ('2141', '0', 0xC807360406010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233137272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383630303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('2141', '0', 0xCB0735040701000000B81400);
INSERT INTO `tile_store` VALUES ('2141', '0', 0xC8073B0406010000008D158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233137272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383630303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('2141', '0', 0xCB0739040601000000B81400);
INSERT INTO `tile_store` VALUES ('2141', '0', 0xC8073A0407010000008E158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233137272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2141', '0', 0xCB07390407010000008C158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233137272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383630303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2141', '0', 0xCE073A040701000000B71400);
INSERT INTO `tile_store` VALUES ('2141', '0', 0xC6073C040701000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2141', '0', 0xC6073D040701000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2141', '0', 0xC7073C0407010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2141', '0', 0xC7073D0407010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2141', '0', 0xC8073E040701000000B71400);
INSERT INTO `tile_store` VALUES ('2141', '0', 0xC9073C0407010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2141', '0', 0xC9073D0407010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2141', '0', 0xCA073C040701000000871E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2141', '0', 0xCA073D040701000000881E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2141', '0', 0xCB073C040701000000311900);
INSERT INTO `tile_store` VALUES ('2141', '0', 0xD007390407010000008C158002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233137272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383630303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2142', '0', 0xD8072F040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2142', '0', 0xD30731040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2142', '0', 0xD40731040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2142', '0', 0xD607320406010000008C158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233138272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323230303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('2142', '0', 0xD80730040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2142', '0', 0xDA07320407010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233138272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323230303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2142', '0', 0xD30734040601000000E4068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2142', '0', 0xD407340406010000008C1F8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2142', '0', 0xD507360407010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233138272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323230303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2142', '0', 0xD707350407010000008C158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233138272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323230303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2142', '0', 0xD807340405010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233138272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323230303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('2142', '0', 0xD807340406010000008E158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233138272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323230303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2142', '0', 0xDA0736040601000000B71400);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE6071F040401000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE7071F040401000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE6071E040601000000B71400);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE6071F040601000000E4068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE7071F0406010000008C1F8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE6071E040701000000B71400);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE6071F040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE7071F040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xD607270405010000008B1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xD90725040401000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xDA0725040401000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xDB07270404010000008B158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034353630303020676F6C6420636F696E732E0600646F6F726964021000000000);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xD80725040501000000851E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xD90725040501000000861E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xD80725040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xD90725040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xDA07270407010000008B158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034353630303020676F6C6420636F696E732E0600646F6F726964020400000000);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xDD07270407010000008B158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034353630303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xD607280405010000008C1E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xD8072A040401000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xD8072B040401000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xDA072A040401000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xDA072B040401000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xD8072B040501000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xD9072B040501000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xDA07280405010000008B158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034353630303020676F6C6420636F696E732E0600646F6F726964020E00000000);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xD8072A040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xD8072B040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xD9072A040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xD9072B040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xDA072A040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xDA072B040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xDB07280407010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034353630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xDD07290406010000008B158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034353630303020676F6C6420636F696E732E0600646F6F726964020500000000);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE20722040601000000311900);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE40723040401000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE507220404010000008C158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034353630303020676F6C6420636F696E732E0600646F6F726964021400000000);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE707210404010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034353630303020676F6C6420636F696E732E0600646F6F726964021200000000);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE507220405010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034353630303020676F6C6420636F696E732E0600646F6F726964020F00000000);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE407210406010000008E158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034353630303020676F6C6420636F696E732E0600646F6F726964020C00000000);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE407220407010000008E158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034353630303020676F6C6420636F696E732E0600646F6F726964020A00000000);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE70720040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE80723040501000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE90722040501000000621E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE90723040501000000E3068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE80721040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE80722040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE80723040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE90721040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE90722040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE90723040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE80720040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE80721040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE80723040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE90721040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE90723040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE40724040401000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE70726040601000000B71400);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE507260407010000008E158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034353630303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE607240407010000008B158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034353630303020676F6C6420636F696E732E0600646F6F726964020900000000);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE70726040701000000B71400);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE80724040501000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE5072A0407010000008E158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034353630303020676F6C6420636F696E732E0600646F6F726964020700000000);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE2072E040701000000B81400);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE4072D0404010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034353630303020676F6C6420636F696E732E0600646F6F726964021100000000);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE6072D0404010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034353630303020676F6C6420636F696E732E0600646F6F726964020800000000);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE6072E0405010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034353630303020676F6C6420636F696E732E0600646F6F726964020D00000000);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE6072E0406010000008E158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034353630303020676F6C6420636F696E732E0600646F6F726964020B00000000);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE5072D0407010000008D158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034353630303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE6072C0407010000008B158002000B006465736372697074696F6E015C00000049742062656C6F6E677320746F20686F757365202759616C6168617220486F75736520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732034353630303020676F6C6420636F696E732E0600646F6F726964020600000000);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE9072E040401000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE9072F040401000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE8072F040501000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE9072F040501000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE8072F040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE9072F040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE8072F040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE9072E040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE9072F040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xEA072E040701000000B81400);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE60731040401000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE70731040401000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE60731040501000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE70730040501000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE70731040501000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE60731040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE60732040601000000B71400);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE70731040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE50730040701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE50731040701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE70730040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE70731040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE80730040501000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2143', '0', 0xE80730040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT INTO `tile_store` VALUES ('2144', '0', 0xFD0407030501000000C3048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F75736520275765737465726E20466C6174205649272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2145', '0', 0x0A0507030701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F75736520274561737465726E20466C61742049272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2145', '0', 0x07050A030701000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F75736520274561737465726E20466C61742049272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2146', '0', 0x1805FB020701000000C3048002000B006465736372697074696F6E015600000049742062656C6F6E677320746F20686F7573652027447265616D204C616E652049272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2147', '0', 0x180500030701000000C3048002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F7573652027447265616D204C616E65204949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333230303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2148', '0', 0x180504030701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F7573652027447265616D204C616E6520494949272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2149', '0', 0x180508030701000000C3048002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F7573652027447265616D204C616E65204956272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT INTO `tile_store` VALUES ('2150', '0', 0x2B050F030701000000C3048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F75736520275061726B20466C61742049272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323830303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT INTO `tile_store` VALUES ('2150', '0', 0x290511030701000000C5048002000B006465736372697074696F6E015500000049742062656C6F6E677320746F20686F75736520275061726B20466C61742049272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323830303020676F6C6420636F696E732E0600646F6F726964020100000000);
DROP TRIGGER IF EXISTS `ondelete_accounts`;
DELIMITER ;;
CREATE TRIGGER `ondelete_accounts` BEFORE DELETE ON `accounts` FOR EACH ROW BEGIN
	DELETE FROM `bans` WHERE `type` IN (3, 4) AND `value` = OLD.`id`;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `oncreate_guilds`;
DELIMITER ;;
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Leader', 3, NEW.`id`);
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`);
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ondelete_guilds`;
DELIMITER ;;
CREATE TRIGGER `ondelete_guilds` BEFORE DELETE ON `guilds` FOR EACH ROW BEGIN
	UPDATE `players` SET `guildnick` = '', `rank_id` = 0 WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = OLD.`id`);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `oncreate_players`;
DELIMITER ;;
CREATE TRIGGER `oncreate_players` AFTER INSERT ON `players` FOR EACH ROW BEGIN
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 0, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 1, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 2, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 3, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 4, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 5, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 6, 10);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ondelete_players`;
DELIMITER ;;
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players` FOR EACH ROW BEGIN
	DELETE FROM `bans` WHERE `type` IN (2, 5) AND `value` = OLD.`id`;
	UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
