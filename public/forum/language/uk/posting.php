<?php
/**
*
* posting [Ukrainian]
*
* @package language
* @version $Id: posting.php 8555 2008-05-15 14:10:11Z Kellanved $
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
	'VIEW_PRIVATE_MESSAGE'  => '%sПереглянути розміщене вами приватне повідомлення%s',
	'POLL_OPTIONS_EDIT_EXPLAIN'	=> 'Розміщуйте кожен варіант з нової стрічки. Ви можете ввести до <strong>%d</strong> варіантів. Якщо ви видалите або додасте варіанти, усі попередні голоси будуть скинуті.',
	'POST_APPROVAL_NOTIFY'	=> 'Вас буде повідомлено, коли ваше повідомлення буде одобрено.',
	'TOO_MANY_CHARS_POST'	=> 'Ваше повідомлення містить %1$d символів. Максимально дозволена кількість символів становить %2$d.',
	'TOO_MANY_CHARS_SIG'	=> 'Ваш підпис містить %1$d символів. Максимально дозволена кількість символів становить %2$d.',
	'BBCODE_A_HELP'	=> 'Вставити приєднаний файл: [attachment=]filename.ext[/attachment]',
	'BBCODE_LISTITEM_HELP'	=> 'Список елементів: [*]text[/*]',
	'DRAFT_LOADED_PM'	=> 'Чернетку завантажено в поле написання повідомлення, ви можете завершити написання приватного повідомлення зараз.<br />Вашу чернетку буде видалено після відсилання цього приватного повідомлення.',
	'FONT_COLOR_HIDE'	=> 'Приховати колір шрифта',
	'POLL_TITLE_TOO_LONG'	=> 'Заголовок голосування повинен містити до 100 символів.',
	'POLL_TITLE_COMP_TOO_LONG'	=> 'Заголовок вашого голосування занадто довгий, спробуйте видалити коди BBCode або смайлики.',
	'ADD_ATTACHMENT'	=> 'Завантажити файл',
	'ADD_ATTACHMENT_EXPLAIN'	=> 'Якщо ви бажаєте приєднати один або більше файлів заповніть нижчеподані поля',
	'ADD_FILE'	=> 'Додати файл',
	'ADD_POLL'	=> 'Створити опитування',
	'ADD_POLL_EXPLAIN'	=> 'Якщо ви не хочете створювати опитування в вашому повідомленні залиште поля порожніми',
	'ALREADY_DELETED'	=> 'Це повідомлення вже видалене.',
	'ATTACH_QUOTA_REACHED'	=> 'Досягнуто максимально допустимий розмір приєднаних файлів.',
	'ATTACH_SIG'	=> 'Приєднати підпис (підписи можна змінювати в панелі керування)',
	'BBCODE_B_HELP'	=> 'Жирний текст: [b]текст[/b]  (alt+b)',
	'BBCODE_C_HELP'	=> 'Код: [code]код[/code]  (alt+c)',
	'BBCODE_E_HELP'	=> 'Список: Додає елемент списку',
	'BBCODE_F_HELP'	=> 'Розмір шрифту: [size=85]маленький текст[/size]',
	'BBCODE_IS_OFF'	=> '%sBBCode%s <em>вимкнено</em>',
	'BBCODE_IS_ON'	=> '%sBBCode%s <em>увімкнено</em>',
	'BBCODE_I_HELP'	=> 'Курсивний текст: [i]текст[/i]  (alt+i)',
	'BBCODE_L_HELP'	=> 'Список: [list]текст[/list]  (alt+l)',
	'BBCODE_O_HELP'	=> 'Впорядкований список: [list=]текст[/list]  (alt+o)',
	'BBCODE_P_HELP'	=> 'Вставити зображення: [img]http://url_зображення[/img]  (alt+p)',
	'BBCODE_Q_HELP'	=> 'Цитата: [quote]текст[/quote]  (alt+q)',
	'BBCODE_S_HELP'	=> 'Колір шрифту: [color=red]текст[/color]  Порада: ви можете також використовувати конструкцію color=#FF0000',
	'BBCODE_U_HELP'	=> 'Підкреслений текст: [u]текст[/u]  (alt+u)',
	'BBCODE_W_HELP'	=> 'Вставити URL: [url]http://url[/url] чи [url=http://url]URL text[/url]  (alt+w)',
	'BBCODE_D_HELP'	=> 'Флеш: [flash=ширина,висота]http://url[/flash]  (alt+d)',
	'BUMP_ERROR'	=> 'Ви не можете піднімати цю тему відразу після останнього повідомлення.',
	'CANNOT_DELETE_REPLIED'	=> 'Вибачте, але ви можете видаляти лише ті повідомлення, на які ще надійшли відповіді.',
	'CANNOT_EDIT_POST_LOCKED'	=> 'Це повідомлення заблоковане. Ви більше не можете редагувати це повідомлення.',
	'CANNOT_EDIT_TIME'	=> 'Ви більше не можете редагувати чи видалити це повідомлення',
	'CANNOT_POST_ANNOUNCE'	=> 'Вибачте, але ви не можете створювати оголошення.',
	'CANNOT_POST_STICKY'	=> 'Вибачте, але ви не можете створювати прикріплених тем.',
	'CHANGE_TOPIC_TO'	=> 'Змінити тему на',
	'CLOSE_TAGS'	=> 'Закрити теги',
	'CURRENT_TOPIC'	=> 'Поточна тема',
	'DELETE_FILE'	=> 'Видалити файл',
	'DELETE_MESSAGE'	=> 'Видалити повідомлення',
	'DELETE_MESSAGE_CONFIRM'	=> 'Ви впевнені, що хочете видалити це повідомлення?',
	'DELETE_OWN_POSTS'	=> 'Вибачте, але ви можете видаляти лише свої повідомлення.',
	'DELETE_POST_CONFIRM'	=> 'Ви впевнені, що хочете видалити це повідомлення?',
	'DELETE_POST_WARN'	=> 'Видалене повідомлення не може бути відновленим',
	'DISABLE_BBCODE'	=> 'Вимкнути BBCode',
	'DISABLE_MAGIC_URL'	=> 'Не перетворювати автоматично адреси URL в посилання',
	'DISABLE_SMILIES'	=> 'Вимкнути смайлики',
	'DISALLOWED_CONTENT'      => 'Завантаження файлу на сервер було відхилено через те, що дваний файл було ідентифіковано як можливий спосіб атаки.',
	'DISALLOWED_EXTENSION'	=> 'Розширення %s заборонене',
	'DRAFT_LOADED'	=> 'Чернетку завантажено, можливо ви хочете завершити написання вашого повідомлення зараз.<br />Вашу чернетку буде видалено  відразу після розміщення цього повідомлення.',
	'DRAFT_SAVED'	=> 'Чернетку успішно збережено.',
	'DRAFT_TITLE'	=> 'Заголовок чернетки',
	'EDIT_REASON'	=> 'Причина редагування цього повідомлення',
	'EMPTY_FILEUPLOAD'	=> 'Завантажений файл порожній',
	'EMPTY_MESSAGE'	=> 'Необхідно ввести текст повідомлення.',
	'EMPTY_REMOTE_DATA'	=> 'Не вдається завантажити файл, будь-ласка, спробуйте завантажити його вручну.',
	'FLASH_IS_OFF'	=> '[flash] <em>вимкнено</em>',
	'FLASH_IS_ON'	=> '[flash] <em>увімкнено</em>',
	'FLOOD_ERROR'	=> 'Ви не можете написати повідомлення так швидко.',
	'FONT_COLOR'	=> 'Колір шрифту',
	'FONT_HUGE'	=> 'Гігантський',
	'FONT_LARGE'	=> 'Великий',
	'FONT_NORMAL'	=> 'Нормальний',
	'FONT_SIZE'	=> 'Розмір шрифту',
	'FONT_SMALL'	=> 'Маленький',
	'FONT_TINY'	=> 'Дрібний',
	'GENERAL_UPLOAD_ERROR'	=> 'Не вдається завантажити файл в %s',
	'IMAGES_ARE_OFF'	=> '[img] <em>вимкнено</em>',
	'IMAGES_ARE_ON'	=> '[img] <em>увімкнено</em>',
	'INVALID_FILENAME'	=> '%s недорустиме ім\'я файлу',
	'LOAD'	=> 'Завантажити',
	'LOAD_DRAFT'	=> 'Завантажити чернетку',
	'LOAD_DRAFT_EXPLAIN'	=> 'Тут ви маєте можливість вибрати чернетку, яку ви хочете використати для продовження написання повідомлення. Ваше поточне повідомлення буде видалене, увесь вміст повідомлення буде втрачено. Перегляд, редагування і видалення чернеток можливий в панелі керування.',
	'LOGIN_EXPLAIN_BUMP'	=> 'Вам необхідно авторизуватись для підняття тем в цьому форумі.',
	'LOGIN_EXPLAIN_DELETE'	=> 'Вам необхідно авторизуватись для видалення повідомлень у цьому форумі.',
	'LOGIN_EXPLAIN_POST'	=> 'Вам необхідно авторизуватись для створення тем у цьому форумі.',
	'LOGIN_EXPLAIN_QUOTE'	=> 'Вам необхідно авторизуватись для цитування повідомень у цьому форумі.',
	'LOGIN_EXPLAIN_REPLY'	=> 'Вам необхідно авторизуватись для того, щоб відповідати на повідомлення у цьому форумі.',
	'MAX_FONT_SIZE_EXCEEDED'	=> 'Ви можете використовувати лише шрифти, розмір яких не більший від %1$d.',
	'MAX_FLASH_HEIGHT_EXCEEDED'	=> 'Ваші файли флеш можуть бути не більше %1$d пікселів в висоту.',
	'MAX_FLASH_WIDTH_EXCEEDED'	=> 'Ваші файли флеш можуть бути не більше %1$d пікселів в ширину.',
	'MAX_IMG_HEIGHT_EXCEEDED'	=> 'Ваші зображення можуть бути не більше %1$d пікселів в висоту.',
	'MAX_IMG_WIDTH_EXCEEDED'	=> 'Ваші зображення можуть бути не більше %1$d пікселів в ширину.',
	'MESSAGE_BODY_EXPLAIN'	=> 'Введіть ваше повідомлення тут, воно може містити не більше ніж <strong>%d</strong> символів.',
	'MESSAGE_DELETED'	=> 'Повідомлення було видалене успішно',
	'MORE_SMILIES'	=> 'Більше смайликів',
	'NOTIFY_REPLY'	=> 'Повідомте мене, коли в цю тему надійде відповідь',
	'NOT_UPLOADED'	=> 'Не вдалося завантажити файл.',
	'NO_DELETE_POLL_OPTIONS'	=> 'Ви не можете видалити існуючі варіанти відповідей',
	'NO_PM_ICON'	=> 'Немає значка ПП',
	'NO_POLL_TITLE'	=> 'Ви не ввели назву опитування',
	'NO_POST'	=> 'Повідомлення не існує.',
	'NO_POST_MODE'	=> 'Не задано режим повідомлення',
	'PARTIAL_UPLOAD'	=> 'Файл завантажено неповністю',
	'PHP_SIZE_NA'	=> 'Надто великий розмір приєднаного файлу.<br />Неможливо визначити максимально допустимий розмір, встановлений PHP в php.ini.',
	'PHP_SIZE_OVERRUN'	=> 'Надто великий розмір приєднаного файлу, максимально допустимий розмір файлу %1$d %2$s.<br />Зауважте, ця величина встановлена в php.ini і не може бути перевищена.',
	'PLACE_INLINE'	=> 'Вставити в текст повідомлення',
	'POLL_DELETE'	=> 'Видалити опитування',
	'POLL_FOR'	=> 'Обмеження в часі',
	'POLL_FOR_EXPLAIN'	=> 'Поставте 0 або залиште порожнім, щоб опитування не закінчувалось ніколи',
	'POLL_MAX_OPTIONS'	=> 'Кількість варіантів відповіді для одного користувача',
	'POLL_MAX_OPTIONS_EXPLAIN'	=> 'Число варіантів, за які може проголосувати кожен учасник.',
	'POLL_OPTIONS'	=> 'Варіанти відповідей',
	'POLL_OPTIONS_EXPLAIN'	=> 'Помістіть кожен варіант на нову стрічку. Ви можете ввести не більше <strong>%d</strong> варіантів',
	'POLL_QUESTION'	=> 'Питання',
	'POLL_VOTE_CHANGE'	=> 'Дозволити переголосування',
	'POLL_VOTE_CHANGE_EXPLAIN'	=> 'Якщо дозволено учасники можуть змінювати свій голос.',
	'POSTED_ATTACHMENTS'	=> 'Приєднані файли',
	'POST_CONFIRMATION'	=> 'Підтвердження відправлення',
	'POST_CONFIRM_EXPLAIN'	=> 'Для запобігання автоматичним відправленням вам необіхдно ввести код підтвердження. Цей код зображений на картинці, яку ви бачите внизу. Якщо ви з якихось причин не можете прочитати цей код, будь-ласка зв\'яжіться з %sадміністратором форуму%s.',
	'POST_DELETED'	=> 'Повідомлення успішно видалено',
	'POST_EDITED'	=> 'Повідомлення успішно відредаговано',
	'POST_EDITED_MOD'	=> 'Повідомлення відредаговане але потребує одобрення модератора',
	'POST_GLOBAL'	=> 'Важливо',
	'POST_ICON'	=> 'Значок повідомлення',
	'POST_NORMAL'	=> 'Звичайне',
	'POST_REVIEW'	=> 'Попередній перегляд',
	'POST_REVIEW_EXPLAIN'	=> 'Було додано як мінімум одне нове повідомлення в цій темі. Можливо,  з цієї причини ви захочете змінити зміст свого повідомлення.',
	'POST_STORED'	=> 'Повідомлення успішно додане',
	'POST_STORED_MOD'	=> 'Повідомлення додане, але воно потребує одобрення модератором',
	'POST_TOPIC_AS'	=> 'Створити нову тему як',
	'PROGRESS_BAR'	=> 'Індикатор завантаження',
	'QUOTE_DEPTH_EXCEEDED'	=> 'Максимально допустима кількість вкладених одна в одну цитат в повідомленні: %1$d .',
	'SAVE'	=> 'Зберегти',
	'SAVE_DATE'	=> 'Останні зміни внесено',
	'SAVE_DRAFT'	=> 'Зберегти чернетку',
	'SAVE_DRAFT_CONFIRM'	=> 'Майте на увазі, що збережені чернетки можуть містити лише тему і текст повідомлення, усі інші елементи будуть усунуті. Ви хочете зберегти вашу чернетку?',
	'SMILIES'	=> 'Смайлики',
	'SMILIES_ARE_OFF'	=> 'Смайлики <em>вимкнено</em>',
	'SMILIES_ARE_ON'	=> 'Смайлики <em>увімкнено</em>',
	'STICKY_ANNOUNCE_TIME_LIMIT'	=> 'Строк для прикріпленої теми/оголошення',
	'STICK_TOPIC_FOR'	=> 'Прикріпити тему на',
	'STICK_TOPIC_FOR_EXPLAIN'	=> 'Введіть 0 або залиште поле порожнім, щоб тема завжди була прикріпленою',
	'STYLES_TIP'	=> 'Порада:  Для виділеного тексту стилі можна застосовувати швидше',
	'TOO_FEW_CHARS'	=> 'Ваше повідомлення надто коротке.',
	'TOO_FEW_POLL_OPTIONS'	=> 'Ви повинні ввести хоча б два варіанти',
	'TOO_MANY_ATTACHMENTS'	=> 'Неможливо прикріпити ще один файл, максимальна кількість: %d.',
	'TOO_MANY_CHARS'	=> 'Ваше повідомлення надто велике.',
	'TOO_MANY_POLL_OPTIONS'	=> 'Ви намагались обрати занадто багато варіантів відповіді в опитуванні',
	'TOO_MANY_SMILIES'	=> 'Ваше повідомлення містить надто багато смайликів. Максимально допустима кількість смайликів в повідомленні: %d.',
	'TOO_MANY_URLS'	=> 'Ваше повідомлення містить надто багато посилань. Максимально допустима кількість посилань: %d.',
	'TOO_MANY_USER_OPTIONS'	=> 'Ви не можете вибрати стільки варіантів відповіді в опитуванні',
	'TOPIC_BUMPED'	=> 'Тему успішно піднято',
	'UNAUTHORISED_BBCODE'	=> 'Ви не можете використовувати наступні коди BBCode: %s',
	'UNGLOBALISE_EXPLAIN'	=> 'Для того, щоб змінити тему з важливої на звичайну, вам необхідно обрати форум, в якому ви хочете, щоб вона відображалась.',
	'UPDATE_COMMENT'	=> 'Оновити коментар',
	'URL_INVALID'	=> 'Вказане ваме URL-посилання невірне.',
	'URL_NOT_FOUND'	=> 'Вказаний файл не знайдено.',
	'URL_IS_OFF'	=> '[url] <em>вимкнено</em>',
	'URL_IS_ON'	=> '[url] <em>увімкнено</em>',
	'USER_CANNOT_BUMP'	=> 'Ви не можете піднімати теми у цьому форумі',
	'USER_CANNOT_DELETE'	=> 'Ви не можете видаляти повідомень у цьому форумі',
	'USER_CANNOT_EDIT'	=> 'Ви не можете редагувати повідомлення у цьому форумі',
	'USER_CANNOT_REPLY'	=> 'Ви не можете створювати нові повідомлення у цьому форумі',
	'USER_CANNOT_FORUM_POST'	=> 'Ви не можете розміщати повідомлення у цьому форумі, тип форуму не дозволяє цього.',
	'VIEW_MESSAGE'	=> '%sПереглянути ваше повідомлення%s',
	'WRONG_FILESIZE'	=> 'Файл надто великий, максимально дозволений розмір файлу: %1d %2s',
	'WRONG_SIZE'	=> 'Зображення має бути не менше  %1$d пікселів в ширину, %2$d пікселів в висоту та не більше %3$d пікселів в ширину та %4$d пікселів в висоту. Розмір відправленого зображення: %5$d пікселів в ширину та %6$d пікселів в висоту.',
));

?>