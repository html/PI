CREATE TABLE  `pi`.`articles` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `public` tinyint(10) NOT NULL default '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8
