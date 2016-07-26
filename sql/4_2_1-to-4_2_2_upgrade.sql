--
--  Comment Meta Language Constructs:
--
--  #IfNotTable
--    argument: table_name
--    behavior: if the table_name does not exist,  the block will be executed

--  #IfTable
--    argument: table_name
--    behavior: if the table_name does exist, the block will be executed

--  #IfColumn
--    arguments: table_name colname
--    behavior:  if the table and column exist,  the block will be executed

--  #IfMissingColumn
--    arguments: table_name colname
--    behavior:  if the table exists but the column does not,  the block will be executed

--  #IfNotColumnType
--    arguments: table_name colname value
--    behavior:  If the table table_name does not have a column colname with a data type equal to value, then the block will be executed

--  #IfNotRow
--    arguments: table_name colname value
--    behavior:  If the table table_name does not have a row where colname = value, the block will be executed.

--  #IfNotRow2D
--    arguments: table_name colname value colname2 value2
--    behavior:  If the table table_name does not have a row where colname = value AND colname2 = value2, the block will be executed.

--  #IfNotRow3D
--    arguments: table_name colname value colname2 value2 colname3 value3
--    behavior:  If the table table_name does not have a row where colname = value AND colname2 = value2 AND colname3 = value3, the block will be executed.

--  #IfNotRow4D
--    arguments: table_name colname value colname2 value2 colname3 value3 colname4 value4
--    behavior:  If the table table_name does not have a row where colname = value AND colname2 = value2 AND colname3 = value3 AND colname4 = value4, the block will be executed.

--  #IfNotRow2Dx2
--    desc:      This is a very specialized function to allow adding items to the list_options table to avoid both redundant option_id and title in each element.
--    arguments: table_name colname value colname2 value2 colname3 value3
--    behavior:  The block will be executed if both statements below are true:
--               1) The table table_name does not have a row where colname = value AND colname2 = value2.
--               2) The table table_name does not have a row where colname = value AND colname3 = value3.

--  #IfRow2D
--    arguments: table_name colname value colname2 value2
--    behavior:  If the table table_name does have a row where colname = value AND colname2 = value2, the block will be executed.

--  #IfRow3D
--        arguments: table_name colname value colname2 value2 colname3 value3
--        behavior:  If the table table_name does have a row where colname = value AND colname2 = value2 AND colname3 = value3, the block will be executed.

--  #IfIndex
--    desc:      This function is most often used for dropping of indexes/keys.
--    arguments: table_name colname
--    behavior:  If the table and index exist the relevant statements are executed, otherwise not.

--  #IfNotIndex
--    desc:      This function will allow adding of indexes/keys.
--    arguments: table_name colname
--    behavior:  If the index does not exist, it will be created

--  #EndIf
--    all blocks are terminated with a #EndIf statement.

--  #IfNotListReaction
--    Custom function for creating Reaction List

--  #IfNotListOccupation
--    Custom function for creating Occupation List

#IfNotRow clinical_rules id rule_blood_pressure
INSERT INTO `clinical_rules` ( `id`, `pid`, `active_alert_flag`, `passive_alert_flag`, `cqm_flag`, `cqm_nqf_code`, `cqm_pqri_code`, `amc_flag`, `amc_code`, `patient_reminder_flag` ) VALUES ('rule_blood_pressure', 0, 0, 0, 0, '', '', 0, '', 0);
#EndIf

#IfNotRow2D list_options list_id clinical_rules option_id rule_blood_pressure
INSERT INTO `list_options` ( `list_id`, `option_id`, `title`, `seq`, `is_default` ) VALUES ('clinical_rules', 'rule_blood_pressure', 'Measure Blood Pressure', 1610, 0);
#EndIf

#IfNotRow rule_action id rule_blood_pressure
INSERT INTO `rule_action` ( `id`, `group_id`, `category`, `item` ) VALUES ('rule_blood_pressure', 1, 'act_cat_measure', 'act_bp');
#EndIf

#IfNotRow rule_reminder id rule_blood_pressure
INSERT INTO `rule_reminder` ( `id`, `method`, `method_detail`, `value` ) VALUES ('rule_blood_pressure', 'clinical_reminder_pre', 'week', '2');
INSERT INTO `rule_reminder` ( `id`, `method`, `method_detail`, `value` ) VALUES ('rule_blood_pressure', 'clinical_reminder_post', 'month', '1');
INSERT INTO `rule_reminder` ( `id`, `method`, `method_detail`, `value` ) VALUES ('rule_blood_pressure', 'patient_reminder_pre', 'week', '2');
INSERT INTO `rule_reminder` ( `id`, `method`, `method_detail`, `value` ) VALUES ('rule_blood_pressure', 'patient_reminder_post', 'month', '1');
#EndIf

#IfNotRow rule_target id rule_blood_pressure
INSERT INTO `rule_target` ( `id`, `group_id`, `include_flag`, `required_flag`, `method`, `value`, `interval` ) VALUES ('rule_blood_pressure', 1, 1, 1, 'target_database', '::form_vitals::bps::::::ge::1', 0);
INSERT INTO `rule_target` ( `id`, `group_id`, `include_flag`, `required_flag`, `method`, `value`, `interval` ) VALUES ('rule_blood_pressure', 1, 1, 1, 'target_database', '::form_vitals::bpd::::::ge::1', 0);
#EndIf

#IfNotRow clinical_rules id rule_inr_measure
INSERT INTO `clinical_rules` ( `id`, `pid`, `active_alert_flag`, `passive_alert_flag`, `cqm_flag`, `cqm_nqf_code`, `cqm_pqri_code`, `amc_flag`, `amc_code`, `patient_reminder_flag` ) VALUES ('rule_inr_measure', 0, 0, 0, 0, '', '', 0, '', 0);
#EndIf

#IfNotRow2D list_options list_id clinical_rules option_id rule_inr_measure
INSERT INTO `list_options` ( `list_id`, `option_id`, `title`, `seq`, `is_default` ) VALUES ('clinical_rules', 'rule_inr_measure', 'Measure INR', 1620, 0);
#EndIf

#IfNotRow rule_action id rule_inr_measure
INSERT INTO `rule_action` ( `id`, `group_id`, `category`, `item` ) VALUES ('rule_inr_measure', 1, 'act_cat_measure', 'act_lab_inr');
#EndIf

#IfNotRow rule_reminder id rule_inr_measure
INSERT INTO `rule_reminder` ( `id`, `method`, `method_detail`, `value` ) VALUES ('rule_inr_measure', 'clinical_reminder_pre', 'week', '2');
INSERT INTO `rule_reminder` ( `id`, `method`, `method_detail`, `value` ) VALUES ('rule_inr_measure', 'clinical_reminder_post', 'month', '1');
INSERT INTO `rule_reminder` ( `id`, `method`, `method_detail`, `value` ) VALUES ('rule_inr_measure', 'patient_reminder_pre', 'week', '2');
INSERT INTO `rule_reminder` ( `id`, `method`, `method_detail`, `value` ) VALUES ('rule_inr_measure', 'patient_reminder_post', 'month', '1');
#EndIf

#IfNotRow rule_target id rule_inr_measure
INSERT INTO `rule_target` ( `id`, `group_id`, `include_flag`, `required_flag`, `method`, `value`, `interval` ) VALUES ('rule_inr_measure', 1, 1, 1, 'target_proc', 'INR::CPT4:85610::::::ge::1', 0);
#EndIf

#IfMissingColumn patient_data billing_note
SET @group_name = (SELECT group_name FROM layout_options WHERE field_id='lname' AND form_id='DEM');
SET @backup_group_name = (SELECT group_name FROM layout_options WHERE field_id='DOB' AND form_id='DEM');
SET @seq = (SELECT MAX(seq) FROM layout_options WHERE group_name = IFNULL(@group_name,@backup_group_name) AND form_id='DEM');
INSERT INTO `layout_options` (`form_id`, `field_id`, `group_name`, `title`, `seq`, `data_type`, `uor`, `fld_length`, `max_length`, `list_id`, `titlecols`, `datacols`, `default_value`, `edit_options`, `description`) VALUES ('DEM', 'billing_note', IFNULL(@group_name,@backup_group_name), 'Billing Note', @seq+1, 2, 1, 60, 0, '', 1, 3, '', '', 'Patient Level Billing Note (Collections)' ) ;
ALTER TABLE patient_data ADD COLUMN billing_note text NOT NULL default '';
UPDATE `patient_data` SET `billing_note` = `genericval2` WHERE `genericname2` = 'Billing';
UPDATE `patient_data` SET `genericval2` = '', `genericname2` = '' WHERE `genericname2` = 'Billing';
#EndIf

#IfMissingColumn lang_languages lang_is_rtl
ALTER TABLE `lang_languages` ADD COLUMN `lang_is_rtl` TINYINT DEFAULT 0;
UPDATE `lang_languages` SET `lang_is_rtl`=1 WHERE `lang_code` IN ('he','ar') OR `lang_description` IN('Hebrew','Arabic');
#EndIf

#IfMissingColumn procedure_report date_collected_tz
ALTER TABLE `procedure_report` ADD COLUMN `date_collected_tz` varchar(5) DEFAULT '' COMMENT '+-hhmm offset from UTC';
#EndIf

#IfMissingColumn procedure_report date_report_tz
ALTER TABLE `procedure_report` ADD COLUMN `date_report_tz` varchar(5) DEFAULT '' COMMENT '+-hhmm offset from UTC';
#EndIf

UPDATE `clinical_rules` SET `cqm_2014_flag` = 1 WHERE `id` = 'rule_influenza_ge_50_cqm' AND `pid` = 0;
UPDATE `clinical_rules` SET `cqm_2014_flag` = 1 WHERE `id` = 'rule_dm_a1c_cqm' AND `pid` = 0;

#IfMissingColumn lists subtype
ALTER TABLE `lists` ADD COLUMN `subtype` varchar(31) NOT NULL DEFAULT '';
#EndIf

#IfMissingColumn list_options subtype
ALTER TABLE `list_options` ADD COLUMN `subtype` varchar(31) NOT NULL DEFAULT '';
#EndIf

#IfNotRow2D list_options list_id lists option_id issue_subtypes
INSERT INTO list_options (list_id,option_id,title) VALUES ('lists','issue_subtypes','Issue Subtypes');
INSERT INTO list_options (list_id, option_id,title, seq) VALUES ('issue_subtypes', 'eye', 'Eye',10);
#EndIf

UPDATE `clinical_rules` SET `amc_2014_stage1_flag` = 1, `amc_2014_stage2_flag` = 1 WHERE `id` = 'med_reconc_amc' AND `pid` = 0;
UPDATE `clinical_rules` SET `amc_2014_stage1_flag` = 1, `amc_2014_stage2_flag` = 1 WHERE `id` = 'med_reconc_amc' AND `pid` = 0;

DROP TABLE IF EXISTS `batchcom`;
CREATE TABLE `batchcom` (
  `id` bigint(20) NOT NULL auto_increment,
  `patient_id` int(11) NOT NULL default '0',
  `sent_by` bigint(20) NOT NULL default '0',
  `msg_type` varchar(60) default NULL,
  `msg_subject` varchar(255) default NULL,
  `msg_text` mediumtext,
  `msg_date_sent` datetime NOT NULL default '1000-01-01 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `drugs`;
CREATE TABLE drugs (
  drug_id       int(11)      NOT NULL auto_increment,
  name          varchar(255) NOT NULL DEFAULT '',
  ndc_number    varchar(20)  NOT NULL DEFAULT '',
  on_order      int(11)      NOT NULL DEFAULT 0,
  reorder_point int(11)      NOT NULL DEFAULT 0,
  last_notify   date         NOT NULL DEFAULT '1000-01-01',
  reactions     text         NOT NULL DEFAULT '',
  form          int(3)       NOT NULL DEFAULT 0,
  size          int(11)      NOT NULL DEFAULT 0,
  unit          int(11)      NOT NULL DEFAULT 0,
  route         int(11)      NOT NULL DEFAULT 0,
  substitute    int(11)      NOT NULL DEFAULT 0,
  PRIMARY KEY (drug_id)
) ENGINE=MyISAM;


DROP TABLE IF EXISTS `drug_inventory`;
CREATE TABLE `drug_inventory` (
  `inventory_id` int(11) NOT NULL auto_increment,
  `drug_id` int(11) NOT NULL,
  `lot_number` varchar(20) default NULL,
  `expiration` date default NULL,
  `manufacturer` varchar(255) default NULL,
  `on_hand` int(11) NOT NULL default '0',
  `warehouse_id` varchar(31) NOT NULL DEFAULT '',
  `vendor_id` bigint(20) NOT NULL DEFAULT 0,
  `last_notify` date NOT NULL default '1000-01-01',
  `destroy_date` date default NULL,
  `destroy_method` varchar(255) default NULL,
  `destroy_witness` varchar(255) default NULL,
  `destroy_notes` varchar(255) default NULL,
  PRIMARY KEY  (`inventory_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `insurance_data`;
CREATE TABLE `insurance_data` (
  `id` bigint(20) NOT NULL auto_increment,
  `type` enum('primary','secondary','tertiary') default NULL,
  `provider` varchar(255) default NULL,
  `plan_name` varchar(255) default NULL,
  `policy_number` varchar(255) default NULL,
  `group_number` varchar(255) default NULL,
  `subscriber_lname` varchar(255) default NULL,
  `subscriber_mname` varchar(255) default NULL,
  `subscriber_fname` varchar(255) default NULL,
  `subscriber_relationship` varchar(255) default NULL,
  `subscriber_ss` varchar(255) default NULL,
  `subscriber_DOB` date default NULL,
  `subscriber_street` varchar(255) default NULL,
  `subscriber_postal_code` varchar(255) default NULL,
  `subscriber_city` varchar(255) default NULL,
  `subscriber_state` varchar(255) default NULL,
  `subscriber_country` varchar(255) default NULL,
  `subscriber_phone` varchar(255) default NULL,
  `subscriber_employer` varchar(255) default NULL,
  `subscriber_employer_street` varchar(255) default NULL,
  `subscriber_employer_postal_code` varchar(255) default NULL,
  `subscriber_employer_state` varchar(255) default NULL,
  `subscriber_employer_country` varchar(255) default NULL,
  `subscriber_employer_city` varchar(255) default NULL,
  `copay` varchar(255) default NULL,
  `date` date NOT NULL default '1000-01-01',
  `pid` bigint(20) NOT NULL default '0',
  `subscriber_sex` varchar(25) default NULL,
  `accept_assignment` varchar(5) NOT NULL DEFAULT 'TRUE',
  `policy_type` varchar(25) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `pid_type_date` (`pid`,`type`,`date`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `openemr_postcalendar_events`;
CREATE TABLE `openemr_postcalendar_events` (
  `pc_eid` int(11) unsigned NOT NULL auto_increment,
  `pc_catid` int(11) NOT NULL default '0',
  `pc_multiple` int(10) unsigned NOT NULL,
  `pc_aid` varchar(30) default NULL,
  `pc_pid` varchar(11) default NULL,
  `pc_title` varchar(150) default NULL,
  `pc_time` datetime default NULL,
  `pc_hometext` text,
  `pc_comments` int(11) default '0',
  `pc_counter` mediumint(8) unsigned default '0',
  `pc_topic` int(3) NOT NULL default '1',
  `pc_informant` varchar(20) default NULL,
  `pc_eventDate` date NOT NULL default '1000-01-01',
  `pc_endDate` date NOT NULL default '1000-01-01',
  `pc_duration` bigint(20) NOT NULL default '0',
  `pc_recurrtype` int(1) NOT NULL default '0',
  `pc_recurrspec` text,
  `pc_recurrfreq` int(3) NOT NULL default '0',
  `pc_startTime` time default NULL,
  `pc_endTime` time default NULL,
  `pc_alldayevent` int(1) NOT NULL default '0',
  `pc_location` text,
  `pc_conttel` varchar(50) default NULL,
  `pc_contname` varchar(50) default NULL,
  `pc_contemail` varchar(255) default NULL,
  `pc_website` varchar(255) default NULL,
  `pc_fee` varchar(50) default NULL,
  `pc_eventstatus` int(11) NOT NULL default '0',
  `pc_sharing` int(11) NOT NULL default '0',
  `pc_language` varchar(30) default NULL,
  `pc_apptstatus` varchar(15) NOT NULL default '-',
  `pc_prefcatid` int(11) NOT NULL default '0',
  `pc_facility` smallint(6) NOT NULL default '0' COMMENT 'facility id for this event',
  `pc_sendalertsms` VARCHAR(3) NOT NULL DEFAULT 'NO',
  `pc_sendalertemail` VARCHAR( 3 ) NOT NULL DEFAULT 'NO',
  `pc_billing_location` SMALLINT (6) NOT NULL DEFAULT '0',
  `pc_room` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY  (`pc_eid`),
  KEY `basic_event` (`pc_catid`,`pc_aid`,`pc_eventDate`,`pc_endDate`,`pc_eventstatus`,`pc_sharing`,`pc_topic`),
  KEY `pc_eventDate` (`pc_eventDate`)
) ENGINE=MyISAM AUTO_INCREMENT=7 ;

