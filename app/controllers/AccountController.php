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

        $this->SendEmailWithToken("max@pochtamt.ru", "lolka");
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
                    $this->flash->success("Учетная запись успешно подтверждена");
                    return $this->response->redirect("index");
                }
            }

        }

        $this->flash->success("Ошибка потверждения учетной записи");

        return $this->response->redirect("index");
    }


    protected function SendEmailWithToken($email, $token)
    {

        $this->mail->setFrom('no-reply@gapps.ispu.ru', 'HelloWorld Messenger Support');

        $this->mail->addAddress($email);

        $this->mail->Subject = 'Registration in HelloWorld Messenger';

        $this->mail->Body =
            "For completing registration go to "
            .($this->tag->linkTo("account/check?token=".$token, "link"));


        if (!($this->mail->send())) {
            $this->flash->error($this->mail->ErrorInfo);
        }

    }
}

