<?php
/**
* acp_permissions (phpBB Permission Set) [Ukrainian]
*
* @package language
* @version $Id: permissions_phpbb.php 8911 2008-09-23 13:03:33Z acydburn $
* @copyright (c) 2005 phpBB Group
* @license http://opensource.org/licenses/gpl-license.php GNU Public License
*/

/**
* DO NOT CHANGE
*/
if (!defined('IN_PHPBB'))
{
	exit;
}

if (empty($lang) || !is_array($lang))
{
	$lang = array();
}

// DEVELOPERS PLEASE NOTE
//
// All language files should use UTF-8 as their encoding and the files must not contain a BOM.
//
// Placeholders can now contain order information, e.g. instead of
// 'Page %s of %s' you can (and should) write 'Page %1$s of %2$s', this allows
// translators to re-order the output of data while ensuring it remains correct
//
// You do not need this where single placeholders are used, e.g. 'Message %d' is fine
// equally where a string contains only two placeholders which are used to wrap text
// in a url you again do not need to specify an order e.g., 'Click %sHERE%s' is fine

/**
*	MODDERS PLEASE NOTE
*	
*	You are able to put your permission sets into a separate file too by
*	prefixing the new file with permissions_ and putting it into the acp 
*	language folder.
*
*	An example of how the file could look like:
*
*	<code>
*
*	if (empty($lang) || !is_array($lang))
*	{
*		$lang = array();
*	}
*
*	// Adding new category
*	$lang['permission_cat']['bugs'] = 'Bugs';
*
*	// Adding new permission set
*	$lang['permission_type']['bug_'] = 'Bug Permissions';
*
*	// Adding the permissions
*	$lang = array_merge($lang, array(
*		'acl_bug_view'		=> array('lang' => 'Can view bug reports', 'cat' => 'bugs'),
*		'acl_bug_post'		=> array('lang' => 'Can post bugs', 'cat' => 'post'), // Using a phpBB category here
*	));
*
*	</code>
*/

// Define categories and permission types
$lang = array_merge($lang, array(
	'permission_cat'	=> array(
		'actions'		=> 'Дії',
		'content'		=> 'Вміст',
		'forums'		=> 'Форуми',
		'misc'			=> 'Різне',
		'permissions'	=> 'Права доступу',
		'pm'			=> 'Приватні повідомлення',
		'polls'			=> 'Опитування',
		'post'			=> 'Повідомлення',
		'post_actions'	=> 'Дії з повідомленнями',
		'posting'		=> 'Написання повідомлень',
		'profile'		=> 'Профіль',
		'settings'		=> 'Налаштування',
		'topic_actions'	=> 'Дії з темами',
		'user_group'	=> 'Користувачі  та групи',
	),

	'permission_type'	=> array(
		'u_'			=> 'Права доступу користувача',
		'a_'			=> 'Права доступу адміністратора',
		'm_'			=> 'Права доступу модератора',
		'f_'			=> 'Права доступу для форума',
	),
));

// User Permissions
$lang = array_merge($lang, array(
	'acl_u_viewprofile'	=> array('lang' => 'Може переглядати профілі', 'cat' => 'profile'),
	'acl_u_chgname'		=> array('lang' => 'Може змінювати ім\'я', 'cat' => 'profile'),
	'acl_u_chgpasswd'	=> array('lang' => 'Може змінювати пароль', 'cat' => 'profile'),
	'acl_u_chgemail'	=> array('lang' => 'Може змінювати адресу e-mail', 'cat' => 'profile'),
	'acl_u_chgavatar'	=> array('lang' => 'Може змінювати аватар', 'cat' => 'profile'),
	'acl_u_chggrp'		=> array('lang' => 'Може змінювати групу за замовчуванням', 'cat' => 'profile'),

	'acl_u_attach'		=> array('lang' => 'Може приєднувати файли', 'cat' => 'post'),
	'acl_u_download'	=> array('lang' => 'Може завантажувати файли', 'cat' => 'post'),
	'acl_u_savedrafts'	=> array('lang' => 'Може зберігати чернетки', 'cat' => 'post'),
	'acl_u_chgcensors'	=> array('lang' => 'Може вимикати цензор слів', 'cat' => 'post'),
	'acl_u_sig'			=> array('lang' => 'Може змінювати підпис', 'cat' => 'post'),

	'acl_u_sendpm'		=> array('lang' => 'Може надсилати приватні повідомлення', 'cat' => 'pm'),
	'acl_u_masspm'		=> array('lang' => 'Може надсилати пп декільком користувачам', 'cat' => 'pm'),
	'acl_u_masspm_group'	=> array('lang' => 'Може надсилати пп групам', 'cat' => 'pm'),
	'acl_u_readpm'		=> array('lang' => 'Може читати приватні повідомлення', 'cat' => 'pm'),
	'acl_u_pm_edit'		=> array('lang' => 'Може редагувати власні приватні повідомлення', 'cat' => 'pm'),
	'acl_u_pm_delete'	=> array('lang' => 'Може видаляти приватні повідомлення з власної папки', 'cat' => 'pm'),
	'acl_u_pm_forward'	=> array('lang' => 'Може перенаправляти приватні повідомлення', 'cat' => 'pm'),
	'acl_u_pm_emailpm'	=> array('lang' => 'Може надсилати приватні повідомлення електронною поштою', 'cat' => 'pm'),
	'acl_u_pm_printpm'	=> array('lang' => 'Може друкувати приватні повідомлення', 'cat' => 'pm'),
	'acl_u_pm_attach'	=> array('lang' => 'Може приєднувати файли в приватні повідомлення', 'cat' => 'pm'),
	'acl_u_pm_download'	=> array('lang' => 'Може завантажувати файли в приватних повідомленнях', 'cat' => 'pm'),
	'acl_u_pm_bbcode'	=> array('lang' => 'Може вставляти BBCode в приватних повідомленнях', 'cat' => 'pm'),
	'acl_u_pm_smilies'	=> array('lang' => 'Може вставляти смайлики в приватних повідомленнях', 'cat' => 'pm'),
	'acl_u_pm_img'		=> array('lang' => 'Може вставляти зображення в приватних повідомленнях', 'cat' => 'pm'),
	'acl_u_pm_flash'	=> array('lang' => 'Може вставляти Flash в приватних повідомленнях', 'cat' => 'pm'),

	'acl_u_sendemail'	=> array('lang' => 'Може надсилати листи e-mail', 'cat' => 'misc'),
	'acl_u_sendim'		=> array('lang' => 'Може надсилати миттєві повідомлення', 'cat' => 'misc'),
	'acl_u_ignoreflood'	=> array('lang' => 'Може ігнорувати затримку фладу', 'cat' => 'misc'),
	'acl_u_hideonline'	=> array('lang' => 'Може приховати онлайн статус', 'cat' => 'misc'),
	'acl_u_viewonline'	=> array('lang' => 'Може переглядати прихованих користувачів', 'cat' => 'misc'),
	'acl_u_search'		=> array('lang' => 'Може здійснювати пошук на форумі', 'cat' => 'misc'),
));

// Forum Permissions
$lang = array_merge($lang, array(
	'acl_f_list'		=> array('lang' => 'Може бачити форум', 'cat' => 'post'),
	'acl_f_read'		=> array('lang' => 'Може читати форум', 'cat' => 'post'),
	'acl_f_post'		=> array('lang' => 'Може створювати нові теми', 'cat' => 'post'),
	'acl_f_reply'		=> array('lang' => 'Може відповідати в теми', 'cat' => 'post'),
	'acl_f_icons'		=> array('lang' => 'Може використовувати значки тем/повідомлень', 'cat' => 'post'),
	'acl_f_announce'	=> array('lang' => 'Може розміщувати оголошення', 'cat' => 'post'),
	'acl_f_sticky'		=> array('lang' => 'Може створювати прикріплені теми', 'cat' => 'post'),

	'acl_f_poll'		=> array('lang' => 'Може створювати опитування', 'cat' => 'polls'),
	'acl_f_vote'		=> array('lang' => 'Може голосувати в опитуваннях', 'cat' => 'polls'),
	'acl_f_votechg'		=> array('lang' => 'Може змінювати відданий голос', 'cat' => 'polls'),

	'acl_f_attach'		=> array('lang' => 'Може приєднувати файли', 'cat' => 'content'),
	'acl_f_download'	=> array('lang' => 'Може завантажувати файли', 'cat' => 'content'),
	'acl_f_sigs'		=> array('lang' => 'Може використовувати підписи', 'cat' => 'content'),
	'acl_f_bbcode'		=> array('lang' => 'Може вставляти BBCode', 'cat' => 'content'),
	'acl_f_smilies'		=> array('lang' => 'Може вставляти смайлики', 'cat' => 'content'),
	'acl_f_img'			=> array('lang' => 'Може вставляти зображення', 'cat' => 'content'),
	'acl_f_flash'		=> array('lang' => 'Може вставляти Flash', 'cat' => 'content'),

	'acl_f_edit'		=> array('lang' => 'Може редагувати власні повідомлення', 'cat' => 'actions'),
	'acl_f_delete'		=> array('lang' => 'Може видаляти власні повідомлення', 'cat' => 'actions'),
	'acl_f_user_lock'	=> array('lang' => 'Може блокувати власні теми', 'cat' => 'actions'),
	'acl_f_bump'		=> array('lang' => 'Може піднімати теми', 'cat' => 'actions'),
	'acl_f_report'		=> array('lang' => 'Може писати скарги', 'cat' => 'actions'),
	'acl_f_subscribe'	=> array('lang' => 'Може підписуватись на форум', 'cat' => 'actions'),
	'acl_f_print'		=> array('lang' => 'Може роздруковувати теми', 'cat' => 'actions'),
	'acl_f_email'		=> array('lang' => 'Може надсилати теми електронною поштою', 'cat' => 'actions'),

	'acl_f_search'		=> array('lang' => 'Може здійснювати пошук на форумі', 'cat' => 'misc'),
	'acl_f_ignoreflood' => array('lang' => 'Може ігнорувати затримку фладу', 'cat' => 'misc'),
	'acl_f_postcount'	=> array('lang' => 'Лічильник повідомлень увімкнено<br /><em>Зауважте, що дане налаштування застосувується лише для нових повідомлень.</em>', 'cat' => 'misc'),
	'acl_f_noapprove'	=> array('lang' => 'Може створювати повідомлення без одобрення', 'cat' => 'misc'),
));

// Moderator Permissions
$lang = array_merge($lang, array(
	'acl_m_edit'		=> array('lang' => 'Може редагувати повідомлення', 'cat' => 'post_actions'),
	'acl_m_delete'		=> array('lang' => 'Може видаляти повідомлення', 'cat' => 'post_actions'),
	'acl_m_approve'		=> array('lang' => 'Може одобрювати повідомлення', 'cat' => 'post_actions'),
	'acl_m_report'		=> array('lang' => 'Може закривати та видаляти скарги', 'cat' => 'post_actions'),
	'acl_m_chgposter'	=> array('lang' => 'Може змінювати автора повідомлення', 'cat' => 'post_actions'),

	'acl_m_move'	=> array('lang' => 'Може переносити теми', 'cat' => 'topic_actions'),
	'acl_m_lock'	=> array('lang' => 'Може блокувати теми', 'cat' => 'topic_actions'),
	'acl_m_split'	=> array('lang' => 'Може розділяти теми', 'cat' => 'topic_actions'),
	'acl_m_merge'	=> array('lang' => 'Може об\'єднувати теми', 'cat' => 'topic_actions'),

	'acl_m_info'	=> array('lang' => 'Може переглядати інформацію про повідомлення', 'cat' => 'misc'),
	'acl_m_warn'	=> array('lang' => 'Може робити попередження<br /><em>Це налаштування встановлюється тільки глобально і не є форумним.</em>', 'cat' => 'misc'), // This moderator setting is only global (and not local)
	'acl_m_ban'		=> array('lang' => 'Може керувати баном<br /><em>Це налаштування встановлюється тільки глобально і не є форумним.</em>', 'cat' => 'misc'), // This moderator setting is only global (and not local)
));

// Admin Permissions
$lang = array_merge($lang, array(
	'acl_a_board'		=> array('lang' => 'Може змінювати налаштування форуму/перевіряти наявність оновлень', 'cat' => 'settings'),
	'acl_a_server'		=> array('lang' => 'Може змінювати налаштування серверу', 'cat' => 'settings'),
	'acl_a_jabber'		=> array('lang' => 'Може змінювати налаштування Jabber', 'cat' => 'settings'),
	'acl_a_phpinfo'		=> array('lang' => 'Може переглядати налаштування php', 'cat' => 'settings'),

	'acl_a_forum'		=> array('lang' => 'Може керувати форумами', 'cat' => 'forums'),
	'acl_a_forumadd'	=> array('lang' => 'Може створювати нові підфоруми', 'cat' => 'forums'),
	'acl_a_forumdel'	=> array('lang' => 'Може видаляти форумs', 'cat' => 'forums'),
	'acl_a_prune'		=> array('lang' => 'Може здійснювати очистку форумів', 'cat' => 'forums'),

	'acl_a_icons'		=> array('lang' => 'Може змінювати значки тем/повідомлень та смайлики', 'cat' => 'posting'),
	'acl_a_words'		=> array('lang' => 'Може змінювати цензор слів', 'cat' => 'posting'),
	'acl_a_bbcode'		=> array('lang' => 'Може визначати теги BBCode', 'cat' => 'posting'),
	'acl_a_attach'		=> array('lang' => 'Може змінювати налаштування приєднаних файлів', 'cat' => 'posting'),

	'acl_a_user'		=> array('lang' => 'Може керувати користувачами', 'cat' => 'user_group'),
	'acl_a_userdel'		=> array('lang' => 'Може видаляти/очищати користувачів', 'cat' => 'user_group'),
	'acl_a_group'		=> array('lang' => 'Може керувати групами', 'cat' => 'user_group'),
	'acl_a_groupadd'	=> array('lang' => 'Може створювати нові групи', 'cat' => 'user_group'),
	'acl_a_groupdel'	=> array('lang' => 'Може видаляти групи', 'cat' => 'user_group'),
	'acl_a_ranks'		=> array('lang' => 'Може керувати званнями', 'cat' => 'user_group'),
	'acl_a_profile'		=> array('lang' => 'Може керувати додатковими полями профілю', 'cat' => 'user_group'),
	'acl_a_names'		=> array('lang' => 'Може керувати забороненими іменами', 'cat' => 'user_group'),
	'acl_a_ban'			=> array('lang' => 'Може керувати баном', 'cat' => 'user_group'),

	'acl_a_viewauth'	=> array('lang' => 'Може переглядати права доступу', 'cat' => 'permissions'),
	'acl_a_authgroups'	=> array('lang' => 'Може змінювати права доступу для конкретних груп', 'cat' => 'permissions'),
	'acl_a_authusers'	=> array('lang' => 'Може змінювати права доступу для конкретних користувачів', 'cat' => 'permissions'),
	'acl_a_fauth'		=> array('lang' => 'Може змінювати права доступу форуму', 'cat' => 'permissions'),
	'acl_a_mauth'		=> array('lang' => 'Може змінювати права доступу модератора', 'cat' => 'permissions'),
	'acl_a_aauth'		=> array('lang' => 'Може змінювати права доступу адміністратора', 'cat' => 'permissions'),
	'acl_a_uauth'		=> array('lang' => 'Може змінювати права доступу користувача', 'cat' => 'permissions'),
	'acl_a_roles'		=> array('lang' => 'Може керувати ролями', 'cat' => 'permissions'),
	'acl_a_switchperm'	=> array('lang' => 'Може використовувати інші права доступу', 'cat' => 'permissions'),

	'acl_a_styles'		=> array('lang' => 'Може керувати стилями', 'cat' => 'misc'),
	'acl_a_viewlogs'	=> array('lang' => 'Може переглядати логи', 'cat' => 'misc'),
	'acl_a_clearlogs'	=> array('lang' => 'Може очищувати логи', 'cat' => 'misc'),
	'acl_a_modules'		=> array('lang' => 'Може керувати модулями', 'cat' => 'misc'),
	'acl_a_language'	=> array('lang' => 'Може керувати мовними пакетами', 'cat' => 'misc'),
	'acl_a_email'		=> array('lang' => 'Може здійснювати масове розсилання e-mail', 'cat' => 'misc'),
	'acl_a_bots'		=> array('lang' => 'Може керувати ботами', 'cat' => 'misc'),
	'acl_a_reasons'		=> array('lang' => 'Може керувати списком скарг/причин', 'cat' => 'misc'),
	'acl_a_backup'		=> array('lang' => 'Може стоврювати резервні копії / відновлювати базу даних', 'cat' => 'misc'),
	'acl_a_search'		=> array('lang' => 'Може керувати пошуковими індексами і їх налаштуваннями', 'cat' => 'misc'),
));

?>