<?php

use Phalcon\Http\Response;

class UserinfoController extends ControllerBase
{

    public function showinfoAction()
    {
        if ($this->request->isGet()) {

            $user = User::findFirst(
                array(
                    "login = :login:",
                    'bind' => array(
                        'login' => $this->request->get("login")
                    )
                )
            );

            if ($user) {

                $user->gender = ($user->gender) ? 1 : 0;
                $this->view->user = $user;


                if ($user->login == $this->session->get("auth")["login"]) {
                    return $this->view->pick("userinfo/showmyinfo");
                }
            } else {
                $this->flash->error("Пользователь не найден");
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
                    $this->flash->error("Пароль слишком короткий");
                    return;
                }

                if ($this->request->getPost("pass") != $this->request->getPost("pass2")) {
                    $this->flash->error("Пароли не совпадают");
                    return;
                }


                $user->gender = ($this->request->getPost("gender") == 1) ? true : false;
                $user->country = $this->request->getPost("country");
                $user->pass = md5($this->request->getPost("pass"));
                $user->name = $this->request->getPost("name");

                $avatar = $this->request->getUploadedFiles()[0];
                if ($avatar && $avatar->getSize()>0 && $avatar->getSize()<1024*1024) {

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
                        $this->flash->error("Ошибка сохранения аватара");

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
                        if ($this->SendEmailWithToken($user->email, $user->token, "For changing email go to")) {
                            $this->flash->success("Данные изменены. Письмо с подтверждением отправлено на указанный e-mail");
                        }
                    } else {
                        $this->flash->success("Данные изменены");
                    }
                }

                foreach ($user->getMessages() as $message) {
                    $this->flash->error($message->getMessage());
                }
            }

        } else {
            $this->flash->error("Вы можете редактировать только свою учетную запись");
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

