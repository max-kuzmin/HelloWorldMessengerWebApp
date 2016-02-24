<?php

use Phalcon\Http\Response;

class UserinfoController extends ControllerBase
{

    public function showinfoAction()
    {
        if ($this->request->isGet()) {

            $login = $this->request->get("login");
            $login = $login ? $login : $this->session->get("auth")["login"];

            $user = User::findFirst(
                array(
                    "login = :login:",
                    'bind' => array(
                        'login' => $login
                    )
                )
            );

            if ($user) {

                $user->gender = ($user->gender) ? 1 : 0;
                $this->view->user = $user;

                if ($user->login == $this->session->get("auth")["login"]) {
                    return $this->view->pick("userinfo/showmyinfo");
                } else {

                    $friends = Friends::findFirst(array(
                        "(login1 = :mylogin: AND login2 = :login:) OR (login2 = :mylogin: AND login1 = :login:)",
                        'bind' => array(
                            'mylogin' => $this->session->get('auth')["login"],
                            'login' => $user->login
                        )
                    ));


                    if ($friends &&
                        (($friends->login1 == $this->session->get('auth')["login"] && $friends->confirm1)
                            || ($friends->login2 == $this->session->get('auth')["login"] && $friends->confirm2))
                    ) {
                        $this->view->halffriend = true;
                    } else {
                        $this->view->halffriend = false;
                    }

                    if ($friends &&
                        $friends->confirm1 &&
                        $friends->confirm2
                    ) {
                        $this->view->fullfriend = true;
                    } else {
                        $this->view->fullfriend = false;
                    }


                }


            } else {
                $this->flash->error($this->t->_("userNotFound"));
                return $this->response->redirect("index");
            }

        }
    }


    public function editinfoAction()
    {

        if ($this->request->get("login") == $this->session->get("auth")["login"]) {


            $user = User::findFirst(
                array(
                    "login = :login:",
                    'bind' => array(
                        'login' => $this->request->get("login")
                    )
                )
            );

            //устанавливаем возвращаемое представление
            $user->gender = ($user->gender) ? 1 : 0;
            $this->view->user = $user;
            $this->view->pick("userinfo/editmyinfo");

            //если мы изменили данные через пост запрос
            if ($this->request->isPost()) {

                if (strlen($this->request->getPost("pass")) < 5) {
                    $this->flash->error($this->t->_("shortPass"));
                    return;
                }

                if ($this->request->getPost("pass") != $this->request->getPost("pass2")) {
                    $this->flash->error($this->t->_("wrong2Pass"));
                    return;
                }


                $user->gender = ($this->request->getPost("gender") == 1) ? true : false;
                $user->country = $this->request->getPost("country");
                $user->pass = md5($this->request->getPost("pass"));
                $user->name = $this->request->getPost("name");

                $avatar = $this->request->getUploadedFiles()[0];
                if ($avatar && $avatar->getSize() > 0 && $avatar->getSize() < 1024 * 1024) {

                    $img = Image::findFirst(array(
                        "login = :login:",
                        'bind' => array(
                            'login' => $user->login
                        )
                    ));

                    if (!$img) {
                        $img = new Image();
                        $img->login = $user->login;
                    }

                    $img->img = file_get_contents($avatar->getTempName());

                    if (!$img->save()) {
                        $this->flash->error($this->t->_("errorSavingAvatar"));

                    }
                }

                //если изменилось мыло, то отправляем письмо с подтверждением
                $emailChanged = false;
                if ($user->email != $this->request->getPost("email")) {
                    $user->email = $this->request->getPost("email");
                    $user->token = md5(rand() . rand() . rand());
                    $emailChanged = true;
                }

                if ($user->save()) {

                    if ($emailChanged) {
                        if ($this->SendEmailWithToken($user->email, $user->token, $this->t->_("changeEmail"))) {
                            $this->flash->success($this->t->_("changeEmailInfo"));
                        }
                    } else {
                        $this->flash->success($this->t->_("infoChanged"));
                    }
                }

                foreach ($user->getMessages() as $message) {
                    $this->flash->error($message->getMessage());
                }
            }

        } else {
            $this->flash->error($this->t->_("cantEditAnotherAcc"));
            return $this->response->redirect("index");
        }


    }


    public function getavatarAction()
    {
        if ($this->request->isGet()) {

            $img = Image::findFirst(
                array(
                    "login = :login:",
                    'bind' => array(
                        'login' => $this->request->get("login")
                    )
                )
            );

            $res = new Response();
            $res->setHeader("Content-Type", "image/jpeg");

            if ($img) {
                $res->setContent($img->img);
            } else {
                return $res->setContent(file_get_contents("img/avatar.jpg"));
            }

            return $res;
        }

    }


}

