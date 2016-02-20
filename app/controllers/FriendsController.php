<?php

use Phalcon\Http\Response;

class FriendsController extends ControllerBase
{

    public function addfriendAction()
    {
        if ($this->request->isGet()) {

            $user = User::find(
                array(
                    "login = :login:",
                    'bind' => array(
                        'login'    => $this->request->get('login')
                    )
                )
            );

            if ($user) {

                $friends = Friends::findFirst(array(
                    "(login1 = :mylogin: AND login2 = :login:) or (login2 = :mylogin: AND login1 = :login:)",
                    'bind' => array(
                        'mylogin' => $this->session->get('auth')["login"],
                        'login' => $this->request->get('login')
                    )
                ));

                if ($friends) {
                    if ($friends->login1 = $this->session->get('auth')["login"]) $friends->confirrm1 = true;
                    else $friends->confirm2 = true;
                }
                else {
                    $friends = new Friends();
                    $friends->login1 = $this->session->get('auth')["login"];
                    $friends->login2 = $this->request->get('login');
                    $friends->confirm1 = true;
                }


                if ($friends->save()) {

                    $this->flash->success("Пользователь добавлен в друзья");
                    return $this->response->redirect("index");
                }
            }

        }

        $this->flash->error("Ошибка добавления в друзья");
        return $this->response->redirect("index");

    }

}

