CREATE TABLE  `gallery_info` (
  `id` int(11) NOT NULL auto_increment,
  `file_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE  `files` (
  `id` int(11) NOT NULL auto_increment,
  `scope` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file` blob,
  `public` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8
