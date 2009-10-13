<?php
$articlesModel = new ArticlesModel;
$galleryModel = new GalleryModel;

/**
 * Articles block
 */
$articles = array(
    array(
        'label' => 'Додати статтю',
        'controller' => 'articles',
        'top' => true,
        'action' => 'add',
        'privilege' => 'add',
        'params' => array(
        )
    ),
);

foreach($articlesModel->listAll() as $item){
    $articles[] = array(
        'label' => $item->title,
        'action' => 'view',
        'controller' => 'articles',
        'params' => array(
            'id' => $item->id
        ),
        'pages' => array(
            array(
                'label' => 'Редагувати',
                'action' => 'edit',
                'controller' => 'articles',
                'privilege' => 'edit',
                'params' => array(
                    'id' => $item->id
                ),
            ),
            array(
                'label' => 'Видалити',
                'action' => 'delete',
                'controller' => 'articles',
                'privilege' => 'delete',
                'params' => array(
                    'id' => $item->id
                )
            )
        )
    );
}

/**
 * Gallery block
 */

$controller = 'gallery';

$gallery = array(
    array(
        'label' => 'Додати картинку',
        'controller' => $controller,
        'top' => true,
        'action' => 'add',
        'privilege' => 'add',
        'params' => array(
        )
    ),
);

$action = 'view';

foreach($galleryModel->listAll() as $item){
    $params =  array(
        'id' => $item->id
    );

    $gallery[] = array(
        'label' => $item->getTitle(),
        'action' => $action,
        'controller' => $controller,
        'params' => $params,
        'pages' => array(
            array(
                'label' => 'Редагувати',
                'action' => 'edit',
                'privilege' => 'edit',
                'controller' => $controller,
                'params' => $params
            ),
            array(
                'label' => 'Видалити',
                'action' => 'delete',
                'privilege' => 'delete',
                'controller' => $controller,
                'params' => $params
            )
        )
    );
}

return array(
    array(
        'id' => 'main',
        'controller' => 'index',
        'action' => 'index',
        'label' => 'Головна',
        'pages' => array(
            array(
                'label' => 'Реєстрація',
                'controller' => 'user',
                'action' => 'register',
                'privilege' => 'register'
            ),
            array(
                'id' => 'login',
                'label' => 'Авторизація',
                'controller' => 'user',
                'action' => 'login',
                'privilege' => 'login'
            ),
            array(
                'label' => 'Статті',
                'controller' => 'articles',
                'action' => 'index',
                'pages' => $articles
            ),
            array(
                'label' => 'Галерея',
                'controller' => 'gallery',
                'action' => 'index',
                'pages' => $gallery
            ),
        )
    )
);
