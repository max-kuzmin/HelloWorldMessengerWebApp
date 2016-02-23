<?php
/**
 * Services are globally registered in this file
 *
 * @var \Phalcon\Config $config
 */

use Phalcon\Crypt;
use Phalcon\Di\FactoryDefault;
use Phalcon\Http\Response\Cookies;
use Phalcon\Mvc\View;
use Phalcon\Mvc\Url as UrlResolver;
use Phalcon\Mvc\View\Engine\Volt as VoltEngine;
use Phalcon\Session\Adapter\Files as SessionAdapter;
use Phalcon\Flash\Session as Flash;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Events\Manager;
use Phalcon\Mvc\Model\Metadata\Memory as MetaDataAdapter;
use Libraries\PHPMailer\PHPMailer;
use Phalcon\Translate\Adapter\NativeArray;

/**
 * The FactoryDefault Dependency Injector automatically register the right services providing a full stack framework
 */
$di = new FactoryDefault();

/**
 * The URL component is used to generate all kind of urls in the application
 */
$di->setShared('url', function () use ($config) {
    $url = new UrlResolver();
    $url->setBaseUri($config->application->baseUri);

    return $url;
});

/**
 * Setting up the view component
 */
$di->setShared('view', function () use ($config) {

    $view = new View();

    $view->setViewsDir($config->application->viewsDir);

    $view->registerEngines(array(
        '.volt' => function ($view, $di) use ($config) {

            $volt = new VoltEngine($view, $di);

            $volt->setOptions(array(
                'compiledPath' => $config->application->cacheDir,
                'compiledSeparator' => '_'
            ));

            return $volt;
        },
        '.phtml' => 'Phalcon\Mvc\View\Engine\Php'
    ));

    return $view;
});

/**
 * Database connection is created based in the parameters defined in the configuration file
 */
$di->setShared('db', function () use ($config) {
    $dbConfig = $config->database->toArray();
    $adapter = $dbConfig['adapter'];
    unset($dbConfig['adapter']);

    $class = 'Phalcon\Db\Adapter\Pdo\\' . $adapter;

    return new $class($dbConfig);
});

/**
 * If the configuration specify the use of metadata adapter use it or use memory otherwise
 */
$di->setShared('modelsMetadata', function () {
    return new MetaDataAdapter();
});

/**
 * Register the session flash service with the Twitter Bootstrap classes
 */
$di->setShared('flash', function () {
    return new Flash(array(
        'error'   => 'alert alert-danger alert-dismissible',
        'success' => 'alert alert-success alert-dismissible',
        'notice'  => 'alert alert-info alert-dismissible',
        'warning' => 'alert alert-warning alert-dismissible'
    ));
});

/**
 * Start the session the first time some component request the session service
 */
$di->setShared('session', function () {

    $session = new SessionAdapter(array('uniqueId' => 'HWM'));
    $session->start();

    return $session;
});


$di->setShared('dispatcher', function() {

    //проверка на авторизацию
    $eventsManager = new Manager();
    $eventsManager->attach('dispatch:beforeExecuteRoute', new SecurityPlugin);

    //перехват 404
    $eventsManager->attach(
        "dispatch:beforeException",
        function($event, $dispatcher, $exception)
        {
            switch ($exception->getCode()) {
                case Dispatcher::EXCEPTION_HANDLER_NOT_FOUND:
                case Dispatcher::EXCEPTION_ACTION_NOT_FOUND:

                    $dispatcher->forward(
                        array(
                            'controller' => 'index',
                            'action'     => 'error404',
                        )
                    );
                    return false;
            }
        }
    );

    $dispatcher = new Dispatcher();
    $dispatcher->setEventsManager($eventsManager);

    return $dispatcher;
});

$di->setShared('crypt', function () {
    $crypt = new Crypt();

    $crypt->setKey('83dk19a283dk19a2');
    $crypt->setCipher("rijndael-128");

    return $crypt;
});


$di->setShared('cookies', function () {
    $cookies = new Cookies();

    $cookies->useEncryption(true);

    return $cookies;
});


$di->setShared('mail', function () {
    $mail = new PHPMailer;

    $mail->isSMTP();
    $mail->isHTML(true);

    $mail->Host = 'smtp.gmail.com';
    $mail->Port = 587;
    $mail->SMTPSecure = 'tls';
    $mail->SMTPAuth = true;
    $mail->Username = "kuzmin@gapps.ispu.ru";
    $mail->Password = "Max89109981293";

    //$mail->SMTPDebug = 1;
    //$mail->Debugoutput = 'html';
    return $mail;
    }
);



$di->setShared('t', function () {
    require APP_PATH.'/app/messages/ru.php';
    return new NativeArray(
        array(
            "content" => $messages
        )
    );
});


$di->setShared('countries', function () {
    require APP_PATH.'/app/messages/ru.php';
    return $countries;
});

$di->setShared('genders', function () {
    require APP_PATH.'/app/messages/ru.php';
    return $genders;
});