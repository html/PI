<?php
/**
*
* memberlist [Ukrainian]
*
* @package language
* @version $Id: memberlist.php 8574 2008-05-29 13:59:47Z Kellanved $
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
	'EMPTY_MESSAGE_IM'	=> 'Ви повинні вказати повідомлення для відправлення.',
	'ALL'	=> 'Усі',
	'SEND_AIM_MESSAGE'	=> 'Відіслати AIM-повідомлення',
	'SEND_ICQ_MESSAGE'	=> 'Відіслати ICQ-повідомлення',
	'SEND_JABBER_MESSAGE'	=> 'Відіслати Jabber-повідомлення',
	'SEND_MSNM_MESSAGE'	=> 'Відіслати MSNM/WLM-повідомлення',
	'SEND_YIM_MESSAGE'	=> 'Відіслати YIM-повідомлення',
	'ABOUT_USER'	=> 'Профіль',
	'ACTIVE_IN_FORUM'	=> 'Найбільша активність в форумі',
	'ACTIVE_IN_TOPIC'	=> 'Найбільша активність в темі',
	'ADD_FOE'	=> 'Додати в недруги',
	'ADD_FRIEND'	=> 'Додати в Друзі',
	'AFTER'	=> 'після',
	'BEFORE'	=> 'до',
	'CC_EMAIL'	=> 'Вислати мені копію цього e-mail повідомлення',
	'CONTACT_USER'	=> 'Контактна інформація',
	'DEST_LANG'	=> 'Мова',
	'DEST_LANG_EXPLAIN'	=> 'Оберіть мову отримувача повідомлення (якщо доступна).',
	'EMAIL_BODY_EXPLAIN'	=> 'Це повідомлення буде відправлене як звичайний текст, без коду HTML або BBCode. Зворотньою адресою цього повідомлення буде встановлена ваша адреса e-mail.',
	'EMAIL_DISABLED'	=> 'Вибачте, але усі функції, пов\'язані з e-mail вимкнено.',
	'EMAIL_SENT'	=> 'E-mail повідомлення відправлено.',
	'EMAIL_TOPIC_EXPLAIN'	=> 'Це повідомлення буде відправлене як звичайний текст, без коду HTML або BBCode. Зауважте, що інформація про тему вже включена в повідомлення. Зворотньою адресою для цього повідомлення буде вказана ваша адреса e-mail.',
	'EMPTY_ADDRESS_EMAIL'	=> 'Ви повинні вказати правильну адресу e-mail одержувача.',
	'EMPTY_MESSAGE_EMAIL'	=> 'Ви повинні ввести текст повідомлення для відправлення.',
	'EMPTY_NAME_EMAIL'	=> 'Ви повинні ввести справжнє ім\'я одержувача.',
	'EMPTY_SUBJECT_EMAIL'	=> 'Необхідно задати тему повідомлення e-mail.',
	'EQUAL_TO'	=> 'рівне',
	'FIND_USERNAME_EXPLAIN'	=> 'Скористайтесь цією формою для пошуку конкретних користувачів. Вам необов\'язково заповняти усі поля. Для часткового співпадання використовуйте * в якості шаблону. При введенні дат використовуйте формат <kbd>рррр-мм-дд</kbd>, наприклад <samp>2004-02-29</samp>. Поставте галочки для вибору одного чи кількох імен користувачів (якщо попередня форма дозволяє це) і натисність Обрати відмічені для повернення до попередньої форми.',
	'FLOOD_EMAIL_LIMIT'	=> 'Ви не можете надіслати ще один лист так швидко. Будь-ласка, пробуйте пізніше.',
	'GROUP_LEADER'	=> 'Лідер групи',
	'HIDE_MEMBER_SEARCH'	=> 'Приховати пошук учасників',
	'IM_ADD_CONTACT'	=> 'Додати в список контактів',
	'IM_AIM'	=> 'Зауважте, що для цього вам необхідно мати встановлений AOL Instant Messenger.',
	'IM_AIM_EXPRESS'	=> 'AIM Express',
	'IM_DOWNLOAD_APP'	=> 'Завантажити програму',
	'IM_ICQ'	=> 'Зауважте, що ці користувачі могли вимкнути отримання миттєвих повідомлень від невідомих.',
	'IM_JABBER'	=> 'Зауважте, що ці користувачі могли вимкнути отримання миттєвих повідомлень від невідомих.',
	'IM_JABBER_SUBJECT'	=> 'Це повідомлення згенероване автоматично, будь-ласка, не відповідайте на нього! Повідомлення від користувача %1$s з %2$s',
	'IM_MESSAGE'	=> 'Ваше повідомлення',
	'IM_MSNM'	=> 'Зауважте, що для цього вам необхідно мати встановлений Windows Messenger.',
	'IM_MSNM_BROWSER'	=> 'Ваш браузер не підтримує цю функцію.',
	'IM_MSNM_CONNECT'	=> 'MSNM не відповідає.\\nДля продовження вам необхідно з\'єднатись з MSNM.',
	'IM_NAME'	=> 'Ваше ім\'я',
	'IM_NO_JABBER'	=> 'Вибачте, відправка безпосередньо Jabber-користувачам не підтримується цим форумом. Вам необхідно мати встановлений Jabber-клієнт на вашому комп\'ютері для того, щоб зв\'язатись з цим користувачем.',
	'IM_RECIPIENT'	=> 'Одержувач',
	'IM_SEND'	=> 'Відправити повідомлення',
	'IM_SEND_MESSAGE'	=> 'Відправити повідомлення',
	'IM_SENT_JABBER'	=> 'Ваше повідомлення для %1$s було успішно відправлене.',
	'IM_USER'	=> 'Відправити миттєве повідомлення',
	'LAST_ACTIVE'	=> 'Останнє відвідування',
	'LESS_THAN'	=> 'менше ніж',
	'LIST_USER'	=> '1 користувач',
	'LIST_USERS'	=> '%d користувачів',
	'LOGIN_EXPLAIN_LEADERS'	=> 'Ви повинні бути зареєстровані та залоговані для перегляду списку команди.',
	'LOGIN_EXPLAIN_MEMBERLIST'	=> 'Ви повинні бути зареєстровані та залоговані для перегляду списку учасників.',
	'LOGIN_EXPLAIN_SEARCHUSER'	=> 'Ви повинні бути зареєстровані та залоговані для пошуку учасників.',
	'LOGIN_EXPLAIN_VIEWPROFILE'	=> 'Ви повинні бути зареєстровані та залоговані для перегляду профілів.',
	'MORE_THAN'	=> 'більше за',
	'NO_EMAIL'	=> 'Вам не дозволено надсилати e-mail повідомлення цьому учаснику.',
	'IM_NO_DATA'	=> 'There is no suitable contact information for this user.',
	'NO_VIEW_USERS'	=> 'Ви не маєте прав доступу для перегляду списку учасників або профілів.',
	'ORDER'	=> 'Сортувати',
	'OTHER'	=> 'Інший',
	'POST_IP'	=> 'Написане з IP/домену',
	'RANK'	=> 'Звання',
	'REAL_NAME'	=> 'Ім\'я одержувача',
	'RECIPIENT'	=> 'Одержувач',
	'REMOVE_FOE'	=> 'Видалити з списку недругів',
	'REMOVE_FRIEND'	=> 'Видалити з списку друзів',
	'SEARCH_USER_POSTS'	=> 'Знайти усі повідомлення користувача',
	'SELECT_MARKED'	=> 'Обрати відмічені',
	'SELECT_SORT_METHOD'	=> 'Оберіть метод сортування',
	'SEND_IM'	=> 'Миттєві повідомлення',
	'SEND_MESSAGE'	=> 'Повідомлення',
	'SORT_EMAIL'	=> 'E-mail',
	'SORT_LAST_ACTIVE'	=> 'Останнє відвідування',
	'SORT_POST_COUNT'	=> 'Кількість повідомлень',
	'USERNAME_BEGINS_WITH'	=> 'Ім\'я починається з',
	'USER_ADMIN'	=> 'Адмініструвати',
	'USER_BAN'            => 'Заборона доступу',
	'USER_FORUM'	=> 'Статистика користувача',
	'USER_ONLINE'	=> 'Онлайн',
	'USER_PRESENCE'	=> 'Присутність на форумі',
	'VIEWING_PROFILE'	=> 'Перегляд профілю учасника %s',
	'VISITED'	=> 'Останній візит',
	'WWW'	=> 'Вебсайт',
));

?>