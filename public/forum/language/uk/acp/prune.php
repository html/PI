<?php
/**
*
* acp_prune [Ukrainian]
*
* @package language
* @version $Id: prune.php,v 1.14 2007/10/04 15:07:24 acydburn Exp $
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

// User pruning
$lang = array_merge($lang, array(
	'ACP_PRUNE_USERS_EXPLAIN'	=> 'Тут ви можете видаляти (або деактивувати) користувачів вашого форуму. Це може бути зроблено за різними критеріями; за кількістю повідомлень, датою останньої активності і т.і. Критерії можна суміщати, наприклад ви можете видалити користувачів, які заходили на форум до 2002-01-01 і створили менше ніж 10 повідомлень. Як альтернатива, ви можете ввести список користувачів безпосередньо в поле вводу тексту, тоді всі інші критерії будуть проігноровані. Будьте обережні з даною функцією! Видаливши користувача, ви не зможете його відновити.',

	'DEACTIVATE_DELETE'			=> 'Деактивувати або видалити',
	'DEACTIVATE_DELETE_EXPLAIN'	=> 'Оберіть дію над користувачами, пам\'ятайте, що її неможливо буде відмінити!',
	'DELETE_USERS'				=> 'Видалити',
	'DELETE_USER_POSTS'			=> 'Видалити повідомлення користувачів',
	'DELETE_USER_POSTS_EXPLAIN' => 'Видаляє повідомлення користувачів, написані користувачами, які видаляються, не застосовується, якщо ви обрали деактивацію користувачів.',

	'JOINED_EXPLAIN'			=> 'Введіть дату в форматі <kbd>РРРР-ММ-ДД</kbd>.',

	'LAST_ACTIVE_EXPLAIN'		=> 'Введіть дату в форматі <kbd>РРРР-ММ-ДД</kbd>.',

	'PRUNE_USERS_LIST'				=> 'Очистка користувачів',
	'PRUNE_USERS_LIST_DELETE'		=> 'За обраними критеріями для очистки користувачів будуть видалені наступні облікові записи.',
	'PRUNE_USERS_LIST_DEACTIVATE'	=> 'За обраними критеріями для очистки користувачів будуть деактивовані наступні облікові записи.',

	'SELECT_USERS_EXPLAIN'		=> 'Введіть тут імена користувачів, якщо ви не хочете використовувати вищевказані критерії.',

	'USER_DEACTIVATE_SUCCESS'	=> 'Обраних користувачів було успішно деактивовано.',
	'USER_DELETE_SUCCESS'		=> 'Обраних користувачів було успішно видалено.',
	'USER_PRUNE_FAILURE'		=> 'Не знайдено користувачів, які відповідають обраним критеріям.',

	'WRONG_ACTIVE_JOINED_DATE'	=> 'Введена дата не є коректною, формат дати повинен бути <kbd>РРРР-ММ-ДД</kbd>.',
));

// Forum Pruning
$lang = array_merge($lang, array(
	'ACP_PRUNE_FORUMS_EXPLAIN'	=> 'Будуть видалені усі теми, в які не писали і не проглядали встановлену кількість днів. Якщо ви не введете кількість днів, то усі теми буде видалено. За замовчуванням, не будуть видалені теми з опитуваннями, а також прикріплені теми та оголошення.',

	'FORUM_PRUNE'		=> 'Очищення форумів',

	'NO_PRUNE'			=> 'Очистка форумів не проведена.',

	'SELECTED_FORUM'	=> 'Обраний форум',
	'SELECTED_FORUMS'	=> 'Обрані форуми',

	'POSTS_PRUNED'					=> 'Видалено повідомлень',
	'PRUNE_ANNOUNCEMENTS'			=> 'Видаляти оголошення',
	'PRUNE_FINISHED_POLLS'			=> 'Видаляти закриті опитування',
	'PRUNE_FINISHED_POLLS_EXPLAIN'	=> 'Видаляє теми з опитуваннями, які закінчились.',
	'PRUNE_FORUM_CONFIRM'			=> 'Ви впевнені, що хочете очистити форуми з заданими налаштуваннями? Видалені повідомлення та теми не підлягають відновленню.',
	'PRUNE_NOT_POSTED'				=> 'Днів з останнього повідомлення',
	'PRUNE_NOT_VIEWED'				=> 'Днів з останнього перегляду',
	'PRUNE_OLD_POLLS'				=> 'Видаляти старі голосування',
	'PRUNE_OLD_POLLS_EXPLAIN'		=> 'Видаляти теми з голосуваннями, в яких не голосували протягом вказаної кількості днів.',
	'PRUNE_STICKY'					=> 'Видаляти прикріплені теми',
	'PRUNE_SUCCESS'					=> 'Очищення форумів пройшло успішно.',

	'TOPICS_PRUNED'		=> 'Видалено тем',
));

?>