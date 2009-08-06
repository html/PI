<?php
/**
*
* acp_language [Ukrainian]
*
* @package language
* @version $Id: language.php,v 1.16 2007/10/04 15:07:24 acydburn Exp $
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
	'ACP_FILES'						=> 'Файли мов адміністратора',
	'ACP_LANGUAGE_PACKS_EXPLAIN'	=> 'Тут ви маєте можливість встановлювати/видаляти мовні пакети.',

	'EMAIL_FILES'			=> 'Шаблони E-mail',

	'FILE_CONTENTS'				=> 'Вміст файлу',
	'FILE_FROM_STORAGE'			=> 'Файл з папки зберігання файлів',

	'HELP_FILES'				=> 'Файли допомоги',

	'INSTALLED_LANGUAGE_PACKS'	=> 'Встановлені мовні пакети',
	'INVALID_LANGUAGE_PACK'		=> 'Обраний мовний пакет скоріш за все невірний. Будь-ласка, перевірте його і завантажте його ще раз при необхідності.',
	'INVALID_UPLOAD_METHOD'		=> 'Обраний метод завантаження невірний, будь-ласка оберіть інший.',

	'LANGUAGE_DETAILS_UPDATED'			=> 'Інформація про мову успішно оновлено.',
	'LANGUAGE_ENTRIES'					=> 'Мовні елементи',
	'LANGUAGE_ENTRIES_EXPLAIN'			=> 'Тут ви можете змінити існуючі або ще неперекладені елементи мовного пакету.<br /><strong>Примітка:</strong> Якщо ви змінили файл мови, змінений файл буде збережено в окремій папці для завантаження його вами з сервера. Зміни не будуть видимі користувачам, поки ви не заміните старі файли мови на сервері (завантаживши нові туди).',
	'LANGUAGE_FILES'					=> 'Файли мови',
	'LANGUAGE_KEY'						=> 'Ключ мови',
	'LANGUAGE_PACK_ALREADY_INSTALLED'	=> 'Цей мовний пакет вже встановлено.',
	'LANGUAGE_PACK_DELETED'				=> 'Мовний пакет <strong>%s</strong> успішно видалено. Усім користувачам, які використовували цей мовний пакет, встановлено мовний пакет за замовчуванням.',
	'LANGUAGE_PACK_DETAILS'				=> 'Інформація про мовний пакет',
	'LANGUAGE_PACK_INSTALLED'			=> 'Мовний пакет <strong>%s</strong> успішно встановлено.',
	'LANGUAGE_PACK_ISO'					=> 'ISO',
	'LANGUAGE_PACK_LOCALNAME'			=> 'Локальна назва',
	'LANGUAGE_PACK_NAME'				=> 'Назва',
	'LANGUAGE_PACK_NOT_EXIST'			=> 'Обраний мовний пакет не існує.',
	'LANGUAGE_PACK_USED_BY'				=> 'Використовується (включаючи роботів)',
	'LANGUAGE_VARIABLE'					=> 'Змінна',
	'LANG_AUTHOR'						=> 'Автор мовного пакету',
	'LANG_ENGLISH_NAME'					=> 'Англійська назва',
	'LANG_ISO_CODE'						=> 'Код ISO',
	'LANG_LOCAL_NAME'					=> 'Локальна назва',

	'MISSING_LANGUAGE_FILE'		=> 'Відсутній файл мови: <strong style="color:red">%s</strong>',
	'MISSING_LANG_VARIABLES'	=> 'Відсутні змінні мови',
	'MODS_FILES'				=> 'Мовні файли MOD-ів',

	'NO_FILE_SELECTED'				=> 'Ви не вказали файл мови.',
	'NO_LANG_ID'					=> 'Ви не вказали мовний пакет.',
	'NO_REMOVE_DEFAULT_LANG'		=> 'Ви не можете видалити мовний пакет за замовчуванням.<br />Якщо ви хочете видалити цей мовний пакет, спочатку змініть мову за замовчуванням.',
	'NO_UNINSTALLED_LANGUAGE_PACKS'	=> 'Немає невстановлених мовних пакетів',

	'REMOVE_FROM_STORAGE_FOLDER'		=> 'Видалити з папки зберігання',

	'SELECT_DOWNLOAD_FORMAT'	=> 'Оберіть формат для завантаження',
	'SUBMIT_AND_DOWNLOAD'		=> 'Відправити і завантажити файл з сервера',
	'SUBMIT_AND_UPLOAD'			=> 'Відправити і завантажити файл на сервер',

	'THOSE_MISSING_LANG_FILES'			=> 'Наступні мовні змінні відсутні в %s папці мови',
	'THOSE_MISSING_LANG_VARIABLES'		=> 'Наступні мовні змінні відсутні в <strong>%s</strong> мовному пакеті',

	'UNINSTALLED_LANGUAGE_PACKS'	=> 'Невстановлені мовні пакети',

	'UNABLE_TO_WRITE_FILE'		=> 'Неможливо записати файл до %s.',
	'UPLOAD_COMPLETED'			=> 'Завантаження пройшло успішно.',
	'UPLOAD_FAILED'				=> 'Завантаження не відбулось з невідомих причин. Замініть при потребі необхідний файл вручну.',
	'UPLOAD_METHOD'				=> 'Метод завантаження',
	'UPLOAD_SETTINGS'			=> 'Налаштування завантаження',

	'WRONG_LANGUAGE_FILE'		=> 'Обраний файл мови невірний.',
));

?>