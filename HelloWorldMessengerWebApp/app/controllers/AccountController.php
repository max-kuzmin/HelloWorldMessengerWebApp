<?php

use Phalcon\Http\Request;

class AccountController extends ControllerBase
{

    public function loginAction()
    {

        if ($this->request->isPost()) {

            $login = $this->request->getPost("login");
            $pass = $this->request->getPost("pass");

            $user = User::findFirst(
                array(
                    "login = :login: AND pass = :pass:",
                    'bind' => array(
                        'login' => $login,
                        'pass' => md5($pass)
                    )
                )
            );

            if ($user) {

                if ($user->token == "") {
                    $this->session->set(
                        'auth',
                        array(
                            'login' => $user->login,
                            'name' => $user->name
                        )
                    );

                    $this->flash->success('Привет, ' . $user->name);

                    return $this->response->redirect("index");
                }
                else {
                    $this->flash->error('Сначала необходимо подтвердить вашу учетную запись');
                    return $this->response->redirect("index");
                }
            }



            $this->flash->error('Неверный логин или пароль');

        }

    }

    public function registerAction()
    {

        if ($this->request->isPost()) {

            $user = User::findFirst(
                array(
                    "login = :login:",
                    'bind' => array(
                        'login' => $this->request->getPost("login")
                    )
                )
            );

            if ($user) {
                $this->flash->error("Пользователь с таким логином уже существует");
                return;
            }

            if (strlen($this->request->getPost("pass"))<5) {
                $this->flash->error("Пароль слишком короткий");
                return;
            }

            if ($this->request->getPost("pass") != $this->request->getPost("pass2")) {
                $this->flash->error("Пароли не совпадают");
                return;
            }

            $user = new User();
            $user->login = $this->request->getPost("login");

            $user->gender = ($this->request->getPost("gender") == 1)? true : false;
            $user->country = $this->request->getPost("country");

            $user->pass = md5($this->request->getPost("pass"));
            $user->name = $this->request->getPost("name");
            $user->email = $this->request->getPost("email");
            $user->token = md5(rand().rand().rand());

            if ($user->save()) {

                if ($this->SendEmailWithToken($user->email, $user->token, "For completing registration go to ")) {

                    $this->flash->success("Регистрация завершена. Письмо с подтверждением отправлено на указанный e-mail");
                    return $this->response->redirect("index");
                }

            }

            foreach ($user->getMessages() as $message) {
                $this->flash->error($message->getMessage());
            }
        }

        //$this->flash->error("Ошибка регистрации");

    }

    public function logoutAction()
    {
        $this->session->remove("auth");
        $this->flash->success("Вы вышли из системы");

        return $this->response->redirect("index");
    }

    public function checkAction()
    {

        $token = $this->request->get("token");

        if ($token) {

            $user = User::findFirst(
                array(
                    "token = :token:",
                    'bind' => array(
                        'token' => $token
                    )
                )
            );

            if ($user) {

                $user->token = "";


                if ($user->save()) {

                    $this->session->set(
                        'auth',
                        array(
                            'login' => $user->login,
                            'name' => $user->name
                        )
                    );

                    $this->flash->success("Учетная запись успешно подтверждена");
                    return $this->response->redirect("index");
                }

                foreach ($user->getMessages() as $message) {
                    $this->flash->error($message->getMessage());
                }
            }

        }

        $this->flash->error("Ошибка потверждения учетной записи");

        return $this->response->redirect("index");
    }



    public function forgotPassAction()
    {


        if ($this->request->isPost()) {

            $user = User::findFirst(
                array(
                    "email = :email: AND login = :login:",
                    'bind' => array(
                        'email' => $this->request->getPost("email"),
                        'login' => $this->request->getPost("login")
                    )
                )
            );

            if ($user) {

                $user->token = md5(rand() . rand() . rand());

                if ($user->save()) {

                    if ($this->SendEmailWithToken($user->email, $user->token, "For restoring account go to ")) {

                        $this->flash->success("Письмо с ключем для входа отправлено на указанный e-mail");
                        return $this->response->redirect("index");
                    }

                }

            }


            $this->flash->error("Учетная запись не найдена");
        }

    }


}

