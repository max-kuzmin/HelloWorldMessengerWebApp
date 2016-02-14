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

            if ($user && $user->token == "") {

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

            if ($this->request->getPost("pass") != $this->request->getPost("pass2")) {
                $this->flash->error("Пароли не совпадают");
                return;
            }

            $user = new User();
            $user->login = $this->request->getPost("login");
            $user->pass = md5($this->request->getPost("pass"));
            $user->name = $this->request->getPost("name");
            $user->email = $this->request->getPost("email");
            $user->token = md5(rand().rand().rand());

            if ($user->save()) {

                if ($this->SendEmailWithToken($user->email, $user->token)) {

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

    protected function SendEmailWithToken($email, $token)
    {

        $this->mail->setFrom('kuzmin@gapps.ispu.ru', 'HelloWorld Messenger Support');

        $this->mail->addAddress($email);

        $this->mail->Subject = 'Registration in HelloWorld Messenger';

        $this->mail->Body =
            "For completing registration go to "
            .($this->tag->linkTo("account/check?token=".$token, "link"));


        $success = $this->mail->send();

        if (!$success) {
            $this->flash->error($this->mail->ErrorInfo);
        }

        return $success;

    }
}

