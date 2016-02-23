<?php

use Phalcon\Acl\Resource;
use Phalcon\Events\Event;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Mvc\User\Plugin;
use Phalcon\Acl;
use Phalcon\Acl\Role;
use Phalcon\Acl\Adapter\Memory;

class SecurityPlugin extends Plugin {

    public function beforeExecuteRoute(Event $event, Dispatcher $dispatcher)
    {

        //если не залогинен, но есть кука с логином
        if (!$this->session->get('auth') && $this->cookies->has("HWM")) {

            $login = rtrim($this->cookies->get("HWM")->getValue(), "\0");
            $user = User::findFirst(
                array(
                    "login = :login:",
                    'bind' => array(
                        'login' => $login
                    )
                )
            );

            if ($user) {
                $this->session->set(
                    'auth',
                    array(
                        'login' => $login
                    )
                );
            }
        }



        if (!$this->session->get('auth')) {
            $role = 'Guests';
        } else {
            $role = 'Users';
        }

        $controller = $dispatcher->getControllerName();
        $action = $dispatcher->getActionName();

        // список соответвия методов ролям
        $acl = $this->getAcl();

        $allowed = $acl->isAllowed($role, $controller, $action);
        if ($allowed != Acl::ALLOW) {

            // если у роли нет доступа возвращаемся на главную
            $this->flash->error($this->t->_("noaccess"));
            $dispatcher->forward(
                array(
                    'controller' => 'index',
                    'action'     => 'index'
                )
            );

            // отмена выполнения текущего метода
            return false;
        }

        return true;
    }


    //получить список доступных ролям методов
    public function getAcl()
    {

        $acl = new Memory();

        $acl->setDefaultAction(Acl::DENY);

        $acl->addRole(new Role('Users'));
        $acl->addRole(new Role('Guests'));


        //приватные методы пользователя
        $userResources = array(
            'account'    => array('logout'),
            'userinfo'    => array('showinfo', 'getavatar', 'editinfo'),
            'dialog'   => array('showdialogs', 'createdialog', 'addusertodialog', 'removedialog', 'renamedialog', 'checknew'),
            'message' => array('showmessages', 'addmessage', 'showimage'),
            'search' => array('searchusers'),
            'friends' => array('addfriend', 'showfriends', 'removefriend', 'checknew')
        );
        foreach ($userResources as $resource => $actions) {
            $acl->addResource(new Resource($resource), $actions);
        }

        //приватные методы гостя
        $guestResources = array(
            'account'    => array('register', 'login', 'forgotpass'),
        );
        foreach ($guestResources as $resource => $actions) {
            $acl->addResource(new Resource($resource), $actions);
        }

        //открытые методы
        $publicResources = array(
            'index'    => array('index', 'error404'),
            'account'    => array('check')
        );
        foreach ($publicResources as $resource => $actions) {
            $acl->addResource(new Resource($resource), $actions);
        }


        //соотносим с ролями
        foreach ($publicResources as $resource => $actions) {
            foreach ($actions as $action) {
                $acl->allow('Guests', $resource, $action);
                $acl->allow('Users', $resource, $action);
            }
        }

        foreach ($userResources as $resource => $actions) {
            foreach ($actions as $action) {
                $acl->allow('Users', $resource, $action);
            }
        }

        foreach ($guestResources as $resource => $actions) {
            foreach ($actions as $action) {
                $acl->allow('Guests', $resource, $action);
            }
        }

        return $acl;
    }

}



