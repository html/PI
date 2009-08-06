<?php
/**
*
* search [Ukrainian]
*
* @package language
* @version $Id: search.php,v 1.26 2007/10/04 15:07:24 acydburn Exp $
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
	'ALL_AVAILABLE'			=> 'Усі доступні',
	'ALL_RESULTS'			=> 'Усі результати',

	'DISPLAY_RESULTS'		=> 'Відображати результати як',

	'FOUND_SEARCH_MATCH'		=> 'Пошук дав %d результат',
	'FOUND_SEARCH_MATCHES'		=> 'Пошук дав %d результатів',
	'FOUND_MORE_SEARCH_MATCHES'	=> 'Пошук дав більше ніж %d результатів',

	'GLOBAL'				=> 'Загальне оголошення',

	'IGNORED_TERMS'			=> 'проігноровані',
	'IGNORED_TERMS_EXPLAIN'	=> 'Наступні слова в вашому пошуковому запиті було проігноровано: <strong>%s</strong>',

	'LOGIN_EXPLAIN_EGOSEARCH'            => 'На форумі вимагається бути зареєстрованим і залогованим для перегляду ваших повідомлень.',
        'MAX_NUM_SEARCH_KEYWORDS_REFINE'   => 'Ви вказали занадто багато слів для пошуку. Будь-ласка, не вводьте більше %1$d слів.',

	'JUMP_TO_POST'			=> 'Перейти до повідомлення',

	'NO_KEYWORDS'			=> 'Ви повинні задати хоча б одне слово для пошуку. Кожне слово повинне складатись не менше ніж з %d символів і не більше %d символів, не включаючи символ шаблону *.',
	'NO_RECENT_SEARCHES'	=> 'Протягом останнього часу пошукових запитів не було.',
	'NO_SEARCH'				=> 'Вибачте, але вам заборонено користуватись пошуковою системою.',
	'NO_SEARCH_RESULTS'		=> 'Тем або повідомлень, які відповідають вашому запиту, не знайдено.',
	'NO_SEARCH_TIME'		=> 'Вибачте, але ви не можете здійснювати новий пошук так швидко. Повторіть вашу спробу пізніше.',
	'WORD_IN_NO_POST'		=> 'Відповідних повідомлень не знайдено, тому що слово <strong>%s</strong> не зустрічається в жодному повідомленні на форумі.',
	'WORDS_IN_NO_POST'		=> 'Відповідних повідомлень не знайдено, тому що слова <strong>%s</strong> не зустрічаються в жодному повідомленні на форумі.',

	'POST_CHARACTERS'		=> 'символів повідомлень',

	'RECENT_SEARCHES'		=> 'Останні пошукові запити',
	'RESULT_DAYS'			=> 'Шукати повідомлення за останні',
	'RESULT_SORT'			=> 'Сортувати результати за',
	'RETURN_FIRST'			=> 'Відображати перші',
	'RETURN_TO_SEARCH_ADV'	=> 'Повернутись до розширеного пошуку',

	'SEARCHED_FOR'				=> 'Пошуковий запит',
	'SEARCHED_TOPIC'			=> 'Пошук в темі',
	'SEARCH_ALL_TERMS'			=> 'Шукати усі слова / Шукати використовуючи мову запитів',
	'SEARCH_ANY_TERMS'			=> 'Шукати будь-яке слово',
	'SEARCH_AUTHOR'				=> 'Шукати за автором',
	'SEARCH_AUTHOR_EXPLAIN'		=> 'Використовуйте * в якості шаблона',
	'SEARCH_FIRST_POST'			=> 'Тільки в першому повідомленні теми',
	'SEARCH_FORUMS'				=> 'Шукати в форумах',
	'SEARCH_FORUMS_EXPLAIN'		=> 'Оберіть форум чи форуми, де ви хочете здійснювати пошук. Задля прискорення пошуку в підфорумах ви можете обрати батьківський форум і увімкнути пошук в підфорумах.',
	'SEARCH_IN_RESULTS'			=> 'Шукати в знайденому',
	'SEARCH_KEYWORDS_EXPLAIN'	=> 'Ви можете використовувати <strong>+</strong> перед словами, які ви хочете знайти та <strong>-</strong> перед словами, які непотрібно шукати. Ви можете використовувати список слів, розділяючи їх символом <strong>|</strong> на частини, якщо потрібно знайти лише одне з цих слів. Використовуйте * в якості шаблона для часткового співпадання.',
	'SEARCH_MSG_ONLY'			=> 'Лише в текстах повідомлень',
	'SEARCH_OPTIONS'			=> 'Параметри пошуку',
	'SEARCH_QUERY'				=> 'Запит',
	'SEARCH_SUBFORUMS'			=> 'Шукати в підфорумах',
	'SEARCH_TITLE_MSG'			=> 'В назвах тем і в тексті повідомлень',
	'SEARCH_TITLE_ONLY'			=> 'Тільки в назвах тем',
	'SEARCH_WITHIN'				=> 'Шукати',
	'SORT_ASCENDING'			=> 'За зростанням',
	'SORT_AUTHOR'				=> 'Автор',
	'SORT_DESCENDING'			=> 'За спаданням',
	'SORT_FORUM'				=> 'Форум',
	'SORT_POST_SUBJECT'			=> 'Заголовок повідомлення',
	'SORT_TIME'					=> 'Час створення',

	'TOO_FEW_AUTHOR_CHARS'	=> 'Ви повинні ввести як мінімум %d символів імені автора.',
));

?>