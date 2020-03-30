CREATE TABLE IF NOT EXISTS `handyman_handyman` (
	`id`	integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`date_joined`	datetime NOT NULL,
	`username`	varchar(26) NOT NULL UNIQUE,
	`first_name`	varchar(26) NOT NULL,
	`last_name`	varchar(26) NOT NULL,
	`mi`	varchar(1) NOT NULL,
	`street`	varchar(26) NOT NULL,
	`city`	varchar(26) NOT NULL,
	`state`	varchar(2) NOT NULL,
	`zip`	integer unsigned NOT NULL CHECK(`zip`>=0),
	`cell_phone`	varchar(31) NOT NULL,
	`work_phone`	varchar(31) NOT NULL,
	`specialty`	varchar(26) NOT NULL
);
CREATE TABLE IF NOT EXISTS `django_session` (
	`session_key`	varchar(40) NOT NULL,
	`session_data`	text NOT NULL,
	`expire_date`	datetime NOT NULL,
	PRIMARY KEY(`session_key`)
);
CREATE TABLE IF NOT EXISTS `auth_group` (
	`id`	integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`name`	varchar(150) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS `ticket_ticket` (
	`day`	datetime NOT NULL,
	`ticket_number`	integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`location`	varchar(26) NOT NULL,
	`type`	varchar(26) NOT NULL,
	`problem`	text NOT NULL,
	`ticket_open`	bool NOT NULL,
	`assigned_employee_id`	varchar(26),
	FOREIGN KEY(`assigned_employee_id`) REFERENCES `handyman_handyman`(`username`)
);
CREATE TABLE IF NOT EXISTS `ticket_ticketstatus` (
	`id`	integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`day`	datetime NOT NULL,
	`status`	varchar(26) NOT NULL,
	`reason`	text NOT NULL,
	`ticket_id`	integer NOT NULL,
	FOREIGN KEY(`ticket_id`) REFERENCES `ticket_ticket`(`ticket_number`)
);
CREATE TABLE IF NOT EXISTS `django_content_type` (
	`id`	integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`app_label`	varchar(100) NOT NULL,
	`model`	varchar(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS `django_migrations` (
	`id`	integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`app`	varchar(255) NOT NULL,
	`name`	varchar(255) NOT NULL,
	`applied`	datetime NOT NULL
);
CREATE TABLE IF NOT EXISTS `auth_user` (
	`id`	integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`password`	varchar(128) NOT NULL,
	`last_login`	datetime,
	`is_superuser`	bool NOT NULL,
	`username`	varchar(150) NOT NULL UNIQUE,
	`first_name`	varchar(30) NOT NULL,
	`email`	varchar(254) NOT NULL,
	`is_staff`	bool NOT NULL,
	`is_active`	bool NOT NULL,
	`date_joined`	datetime NOT NULL,
	`last_name`	varchar(150) NOT NULL
);
CREATE TABLE IF NOT EXISTS `auth_permission` (
	`id`	integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`content_type_id`	integer NOT NULL,
	`codename`	varchar(100) NOT NULL,
	`name`	varchar(255) NOT NULL,
	FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`)
);
CREATE TABLE IF NOT EXISTS `django_admin_log` (
	`id`	integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`action_time`	datetime NOT NULL,
	`object_id`	text,
	`object_repr`	varchar(200) NOT NULL,
	`change_message`	text NOT NULL,
	`content_type_id`	integer,
	`user_id`	integer NOT NULL,
	`action_flag`	smallint unsigned NOT NULL CHECK(`action_flag`>=0),
	FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`),
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`)
);
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
	`id`	integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`user_id`	integer NOT NULL,
	`permission_id`	integer NOT NULL,
	FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`),
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`)
);
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
	`id`	integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`user_id`	integer NOT NULL,
	`group_id`	integer NOT NULL,
	FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`),
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`)
);
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
	`id`	integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`group_id`	integer NOT NULL,
	`permission_id`	integer NOT NULL,
	FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`),
	FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`)
);
INSERT INTO `ticket_ticketstatus` (`id`,`day`,`status`,`reason`,`ticket_id`) VALUES (1,'2020-03-23 21:23:27.607110','Queue','Ticket Created',1),
 (2,'2020-03-23 21:23:41.281871','Assigned','Assigned to Gary B',1),
 (3,'2020-03-23 21:26:22.194256','Awaiting','Cabinets need new hard ware. Parts are on order.',1),
 (4,'2020-03-23 21:26:36.941410','In Progress','Received new parts.',1),
 (5,'2020-03-23 21:26:52.624435','Completed','Installed new hinges.',1),
 (6,'2020-03-23 21:27:34.145889','Closed','Customer was happy with new cabinet hinges. Closed the ticket.',1),
 (7,'2020-03-28 21:51:01.756718','Queue','Ticket Created',2),
 (8,'2020-03-28 21:53:45.584810','Queue','Ticket Created',3),
 (9,'2020-03-28 22:06:55.681009','Queue','Ticket Created',4),
 (10,'2020-03-28 22:15:24.651472','Queue','Ticket Created',5),
 (11,'2020-03-28 22:45:46.011276','Queue','Ticket Created',6),
 (12,'2020-03-28 23:07:37.805954','Queue','Ticket Created.',7),
 (13,'2020-03-28 23:39:31.216985','Queue','Ticket Created',8),
 (14,'2020-03-28 23:40:56.700602','Queue','Ticket Created',9);
INSERT INTO `ticket_ticket` (`day`,`ticket_number`,`location`,`type`,`problem`,`ticket_open`,`assigned_employee_id`) VALUES ('2020-03-23 21:16:43.295840',1,'Interior','Cabinets','My cabinets are falling off the hinges.',0,'garyb'),
 ('2020-03-23 21:18:12.600257',2,'Exterior','Cement','My driveway is cracking',1,'katym'),
 ('2020-03-26 01:09:46.603844',3,'Interior','Heating','My heater is making a strange banging noise.',1,'garyb'),
 ('2020-03-26 01:10:48.988888',4,'Interior','Heating','My heater is making a strange banging noise.',1,'rockyb'),
 ('2020-03-26 01:10:53.999374',5,'Interior','Heating','My heater is making a strange banging noise.',1,NULL),
 ('2020-03-26 01:25:52.272253',6,'Exterior','Air Conditioning','My ac is not cold.',1,NULL),
 ('2020-03-28 22:46:45.943921',7,'Interior','Windows','Windows are borken.',1,NULL),
 ('2020-03-28 22:47:47.240832',8,'Interior','Flooring','scratched',1,NULL),
 ('2020-03-28 23:40:06.093702',9,'Exterior','Roof','Our birds heads are falling off.',1,NULL);
INSERT INTO `django_session` (`session_key`,`session_data`,`expire_date`) VALUES ('y0gbgy064bx9la7b4uivasn0x8sysdaq','MDkwMzc2NDRiMTE5YWM0MjM5MDk1ZTVhMjRhZTUzMWY1ZTlkYTI1ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNzAzZTJjY2FkM2ZkMmM2MzkwYjRkMzM3OWNiNTk4YTQxYWFiOTgwIn0=','2020-04-07 00:49:51.072002'),
 ('4fcdfhhlt7m8y2clz1zm6vy8my6hw63q','MDkwMzc2NDRiMTE5YWM0MjM5MDk1ZTVhMjRhZTUzMWY1ZTlkYTI1ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNzAzZTJjY2FkM2ZkMmM2MzkwYjRkMzM3OWNiNTk4YTQxYWFiOTgwIn0=','2020-04-07 01:06:56.204760');
INSERT INTO `handyman_handyman` (`id`,`date_joined`,`username`,`first_name`,`last_name`,`mi`,`street`,`city`,`state`,`zip`,`cell_phone`,`work_phone`,`specialty`) VALUES (1,'2020-03-23 21:15:51.674909','garyb','Gary','Bennet','D','3478 North 10th Street','Omaha','NE',68124,'+14023990956','+14023990956','General'),
 (2,'2020-03-29 17:22:03.575229','katym','Katherine','McClusky','P','6782 Miles Street','Ames','IA',50010,'+15155543499','','Plumber'),
 (3,'2020-03-29 17:22:41.923324','rockyb','Rocky','Balboa','R','2820 Arboretum Dr','Bellevue','NE',68005,'+14025555555','','Carpenter');
INSERT INTO `auth_user` (`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`email`,`is_staff`,`is_active`,`date_joined`,`last_name`) VALUES (1,'pbkdf2_sha256$180000$b9sVuO1KP7qW$/Dc4tDvp9ZetbP1Qp8jHgcVK2l6FfgNrtGvrRovcToA=','2020-03-29 17:20:35.133438',1,'john','John','jgarza@unomaha.edu',1,1,'2020-03-23 21:14:37','Garza'),
 (2,'pbkdf2_sha256$180000$d6amZd3aWQt4$wFuyOnEctIh98vUTJkW1GuFIrgsQmNTWX4xn6Q9vrx8=','2020-03-25 01:44:19.445618',0,'instructor','George','groyce@unomaha.edu',0,1,'2020-03-25 01:41:34.316090','');
INSERT INTO `auth_permission` (`id`,`content_type_id`,`codename`,`name`) VALUES (1,1,'add_logentry','Can add log entry'),
 (2,1,'change_logentry','Can change log entry'),
 (3,1,'delete_logentry','Can delete log entry'),
 (4,1,'view_logentry','Can view log entry'),
 (5,2,'add_permission','Can add permission'),
 (6,2,'change_permission','Can change permission'),
 (7,2,'delete_permission','Can delete permission'),
 (8,2,'view_permission','Can view permission'),
 (9,3,'add_group','Can add group'),
 (10,3,'change_group','Can change group'),
 (11,3,'delete_group','Can delete group'),
 (12,3,'view_group','Can view group'),
 (13,4,'add_user','Can add user'),
 (14,4,'change_user','Can change user'),
 (15,4,'delete_user','Can delete user'),
 (16,4,'view_user','Can view user'),
 (17,5,'add_contenttype','Can add content type'),
 (18,5,'change_contenttype','Can change content type'),
 (19,5,'delete_contenttype','Can delete content type'),
 (20,5,'view_contenttype','Can view content type'),
 (21,6,'add_session','Can add session'),
 (22,6,'change_session','Can change session'),
 (23,6,'delete_session','Can delete session'),
 (24,6,'view_session','Can view session'),
 (25,7,'add_handyman','Can add My Work Force'),
 (26,7,'change_handyman','Can change My Work Force'),
 (27,7,'delete_handyman','Can delete My Work Force'),
 (28,7,'view_handyman','Can view My Work Force'),
 (29,8,'add_ticket','Can add My Ticket'),
 (30,8,'change_ticket','Can change My Ticket'),
 (31,8,'delete_ticket','Can delete My Ticket'),
 (32,8,'view_ticket','Can view My Ticket'),
 (33,9,'add_ticketstatus','Can add My Ticket Status'),
 (34,9,'change_ticketstatus','Can change My Ticket Status'),
 (35,9,'delete_ticketstatus','Can delete My Ticket Status'),
 (36,9,'view_ticketstatus','Can view My Ticket Status');
INSERT INTO `django_content_type` (`id`,`app_label`,`model`) VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'auth','user'),
 (5,'contenttypes','contenttype'),
 (6,'sessions','session'),
 (7,'handyman','handyman'),
 (8,'ticket','ticket'),
 (9,'ticket','ticketstatus');
INSERT INTO `django_admin_log` (`id`,`action_time`,`object_id`,`object_repr`,`change_message`,`content_type_id`,`user_id`,`action_flag`) VALUES (1,'2020-03-23 21:15:51.729993','1','garyb','[{`added`: {}}]',7,1,1),
 (2,'2020-03-23 21:16:43.302740','1','Ticket object (1)','[{`added`: {}}]',8,1,1),
 (3,'2020-03-23 21:18:12.606056','2','Ticket object (2)','[{`added`: {}}]',8,1,1),
 (4,'2020-03-23 21:23:27.617550','1','TicketStatus object (1)','[{`added`: {}}]',9,1,1),
 (5,'2020-03-23 21:23:41.283735','2','TicketStatus object (2)','[{`added`: {}}]',9,1,1),
 (6,'2020-03-23 21:26:22.222082','3','TicketStatus object (3)','[{`added`: {}}]',9,1,1),
 (7,'2020-03-23 21:26:36.943757','4','TicketStatus object (4)','[{`added`: {}}]',9,1,1),
 (8,'2020-03-23 21:26:52.625945','5','TicketStatus object (5)','[{`added`: {}}]',9,1,1),
 (9,'2020-03-23 21:27:07.456034','1','1','[{`changed`: {`fields`: [`Ticket open`]}}]',8,1,2),
 (10,'2020-03-23 21:27:34.149968','6','TicketStatus object (6)','[{`added`: {}}]',9,1,1),
 (11,'2020-03-25 01:43:00.463902','1','john','[{`changed`: {`fields`: [`First name`, `Last name`]}}]',4,1,2),
 (12,'2020-03-29 17:21:22.711322','4','katym','',4,1,3),
 (13,'2020-03-29 17:21:22.940773','3','rockyb','',4,1,3),
 (14,'2020-03-29 17:22:03.609058','2','katym','[{`added`: {}}]',7,1,1),
 (15,'2020-03-29 17:22:41.975693','3','rockyb','[{`added`: {}}]',7,1,1);
INSERT INTO `django_migrations` (`id`,`app`,`name`,`applied`) VALUES (1,'contenttypes','0001_initial','2020-03-23 21:14:01.138959'),
 (2,'auth','0001_initial','2020-03-23 21:14:01.385583'),
 (3,'admin','0001_initial','2020-03-23 21:14:01.617311'),
 (4,'admin','0002_logentry_remove_auto_add','2020-03-23 21:14:01.879175'),
 (5,'admin','0003_logentry_add_action_flag_choices','2020-03-23 21:14:02.129647'),
 (6,'contenttypes','0002_remove_content_type_name','2020-03-23 21:14:02.351981'),
 (7,'auth','0002_alter_permission_name_max_length','2020-03-23 21:14:02.752237'),
 (8,'auth','0003_alter_user_email_max_length','2020-03-23 21:14:03.029275'),
 (9,'auth','0004_alter_user_username_opts','2020-03-23 21:14:03.274537'),
 (10,'auth','0005_alter_user_last_login_null','2020-03-23 21:14:03.511866'),
 (11,'auth','0006_require_contenttypes_0002','2020-03-23 21:14:03.732331'),
 (12,'auth','0007_alter_validators_add_error_messages','2020-03-23 21:14:03.970869'),
 (13,'auth','0008_alter_user_username_max_length','2020-03-23 21:14:04.261811'),
 (14,'auth','0009_alter_user_last_name_max_length','2020-03-23 21:14:04.653299'),
 (15,'auth','0010_alter_group_name_max_length','2020-03-23 21:14:04.892395'),
 (16,'auth','0011_update_proxy_permissions','2020-03-23 21:14:05.161213'),
 (17,'handyman','0001_initial','2020-03-23 21:14:05.412954'),
 (18,'sessions','0001_initial','2020-03-23 21:14:05.658268'),
 (19,'ticket','0001_initial','2020-03-23 21:14:05.920647');
 
ALTER TABLE `ticket_ticketstatus` ADD INDEX `ticket_id` (`ticket_ticketstatus_ticket_id_bafa590b`) ;

ALTER TABLE `ticket_ticket` ADD INDEX `assigned_employee_id`(`ticket_ticket_assigned_employee_id_bc588675`);

ALTER TABLE `django_session` ADD INDEX `expire_date` (`django_session_expire_date_a5c62663`);

ALTER TABLE `auth_permission` ADD INDEX `content_type_id` (`auth_permission_content_type_id_2f476e4b`);

ALTER TABLE `auth_permission` ADD INDEX `content_type_id` (`auth_permission_content_type_id_codename_01ab375a_uniq`);

ALTER TABLE `auth_permission` ADD INDEX `codename` (`auth_permission_content_type_id_codename_01ab375a_uniq`);

ALTER TABLE `django_content_type` ADD UNIQUE INDEX `app_label` (`django_content_type_app_label_model_76bd3d3b_uniq`);

ALTER TABLE `django_content_type` ADD UNIQUE INDEX `model` (`django_content_type_app_label_model_76bd3d3b_uniq`);

ALTER TABLE `django_admin_log` ADD INDEX `user_id` (`django_admin_log_user_id_c564eba6`);

ALTER TABLE `django_admin_log` ADD INDEX `content_type_id` (`django_admin_log_content_type_id_c4bce8eb`);

ALTER TABLE `auth_user_user_permissions` ADD INDEX `permission_id` (`auth_user_user_permissions_permission_id_1fbb5f2c`);

ALTER TABLE `auth_user_user_permissions` ADD INDEX `user_id` (`auth_user_user_permissions_user_id_a95ead1b`);

ALTER TABLE `auth_user_user_permissions` ADD INDEX `user_id` (`auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`);

ALTER TABLE `auth_user_user_permissions` ADD INDEX `permission_id` (`auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`);

ALTER TABLE `auth_user_groups` ADD INDEX `group_id` (`auth_user_groups_group_id_97559544`);

ALTER TABLE `auth_user_groups` ADD INDEX `user_id` (`auth_user_groups_user_id_6a12ed8b`);

ALTER TABLE `auth_user_groups` ADD UNIQUE INDEX `user_id` (`auth_user_groups_user_id_group_id_94350c0c_uniq`);

ALTER TABLE `auth_user_groups` ADD UNIQUE INDEX `group_id` (`auth_user_groups_user_id_group_id_94350c0c_uniq`);

ALTER TABLE `auth_group_permissions` ADD INDEX `permission_id` (`auth_group_permissions_permission_id_84c5c92e`);

ALTER TABLE `auth_group_permissions` ADD INDEX `group_id` (`auth_group_permissions_group_id_b120cbf9`);

ALTER TABLE `auth_group_permissions` ADD INDEX `group_id` (`auth_group_permissions_group_id_permission_id_0cd325b0_uniq`);ALTER TABLE `auth_group_permissions` ADD INDEX `permission_id` (`auth_group_permissions_group_id_permission_id_0cd325b0_uniq`);

COMMIT;
