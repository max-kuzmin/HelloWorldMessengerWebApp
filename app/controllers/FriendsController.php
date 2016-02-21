<?php

use Phalcon\Http\Response;

class FriendsController extends ControllerBase
{

    public function addfriendAction()
    {
        if ($this->request->isGet()) {

            $user = User::findFirst(
                array(
                    "login = :login:",
                    'bind' => array(
                        'login'    => $this->request->get('login')
                    )
                )
            );

            if ($user && $user->login != $this->session->get('auth')["login"]) {

                $friends = Friends::findFirst(array(
                    "(login1 = :mylogin: AND login2 = :login:) OR (login2 = :mylogin: AND login1 = :login:)",
                    'bind' => array(
                        'mylogin' => $this->session->get('auth')["login"],
                        'login' => $user->login
                    )
                ));

                if ($friends) {
                    if ($friends->login1 == $this->session->get('auth')["login"]) {

                        /*if ($friends->confirm1) {
                            $this->flash->error("Пользователь уже в друзьях, необходимо дождаться, пока он добавит вас в друзья тоже");
                            return $this->response->redirect($this->request->getHTTPReferer());
                        }*/

                        $friends->confirm1 = true;

                    }
                    else {

                        /*if ($friends->confirm2) {
                            $this->flash->error("Пользователь уже в друзьях, необходимо дождаться, пока он добавит вас в друзья тоже");
                            return $this->response->redirect($this->request->getHTTPReferer());
                        }*/

                        $friends->confirm2 = true;

                    }
                }
                else {
                    $friends = new Friends();
                    $friends->login1 = $this->session->get('auth')["login"];
                    $friends->login2 = $this->request->get('login');
                    $friends->confirm1 = true;
                    $friends->confirm2 = false;
                }


                if ($friends->save()) {

                    $this->flash->success($this->t->_("userAddedInFriends"));
                    return $this->response->redirect($this->request->getHTTPReferer());
                }
            }

        }

        $this->flash->error($this->t->_("errorAddingInFriends"));
        return $this->response->redirect("index");

    }


    public function showfriendsAction()
    {
        if ($this->request->isGet()) {

            $friends = Friends::find(
                array(
                    "login1 = :mylogin: OR login2 = :mylogin:",
                    'bind' => array(
                        'mylogin' => $this->session->get("auth")["login"]
                    )
                )
            );

            $users = array();

            foreach ($friends as $friend) {
                if ($friend->login1 == $this->session->get("auth")["login"]) {
                    $users[] = array($friend->getUser2(), $friend->confirm1) ;
                }
                else {
                    $users[] = array($friend->getUser1(), $friend->confirm2);
                }
            }

            $this->view->friends = $users;
        }
        else {
            $this->view->friends = false;
        }
    }



    public function removefriendAction()
    {
        if ($this->request->isGet()) {

            $user = User::findFirst(
                array(
                    "login = :login:",
                    'bind' => array(
                        'login'    => $this->request->get('login')
                    )
                )
            );

            if ($user) {

                $friends = Friends::findFirst(array(
                    "(login1 = :mylogin: AND login2 = :login:) OR (login2 = :mylogin: AND login1 = :login:)",
                    'bind' => array(
                        'mylogin' => $this->session->get('auth')["login"],
                        'login' => $user->login
                    )
                ));

                if ($friends) {
                    $friends->delete();
                    $this->flash->success($this->t->_("userRemovedFromFriends"));
                    return $this->response->redirect($this->request->getHTTPReferer());
                }

            }

        }

        $this->flash->error($this->t->_("errorRemovingFromFriends"));
        return $this->response->redirect("index");

    }

}

