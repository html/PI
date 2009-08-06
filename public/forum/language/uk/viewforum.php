<?php
/**
*
* viewforum [Ukrainian]
*
* @package language
* @version $Id: viewforum.php,v 1.18 2007/10/04 15:07:24 acydburn Exp $
* @copyright (c) 2005 phpBB Group
* @license http://opensource.org/licenses/gpl-license.php GNU Public License
*
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

$lang = array_merge($lang, array(
	'ACTIVE_TOPICS'	=> 'Активні теми',
	'ANNOUNCEMENTS'	=> 'Оголошення',
	'FORUM_PERMISSIONS'	=> 'Права доступу',
	'ICON_ANNOUNCEMENT'	=> 'Оголошення',
	'ICON_STICKY'	=> 'Прикріплено',
	'LOGIN_NOTIFY_FORUM'	=> 'Ви отримали повідомлення про нове повідомлення на форумі, будь-ласка, авторизуйтесь для перегляду.',
	'MARK_TOPICS_READ'	=> 'Позначити теми прочитаними',
	'NEW_POSTS_HOT'	=> 'Нові повідомлення [ Популярна тема ]',
	'NEW_POSTS_LOCKED'	=> 'Нові повідомлення [ Тема закрита ]',
	'NO_NEW_POSTS_HOT'	=> 'Немає нових повідомлень [ Популярна тема ]',
	'NO_NEW_POSTS_LOCKED'	=> 'Немає нових повідомень [ Тема закрита ]',
	'NO_READ_ACCESS'	=> 'Ви не маєте прав доступу для читання повідомлень у цьому форумі.',
	'POST_FORUM_LOCKED'	=> 'Форум закрито',
	'TOPICS_MARKED'	=> 'Усі повідомлення цього форуму позначено прочитаними',
	'VIEW_FORUM'	=> 'Перегляд форуму',
	'VIEW_FORUM_TOPIC'	=> '1 тема',
	'VIEW_FORUM_TOPICS'	=> 'Тем: %d',
));

?>