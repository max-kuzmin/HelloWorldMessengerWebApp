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

        $auth = $this->session->get('auth');
        if (!$auth) {
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
            $this->flash->error("У вас недостаточно прав для выполнения данного действия");
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
        );
        foreach ($userResources as $resource => $actions) {
            $acl->addResource(new Resource($resource), $actions);
        }

        //приватные методы гостя
        $guestResources = array(
            'account'    => array('register', 'login', 'check'),
        );
        foreach ($guestResources as $resource => $actions) {
            $acl->addResource(new Resource($resource), $actions);
        }

        //открытые методы
        $publicResources = array(
            'index'    => array('index'),
            'about'    => array('index')
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



