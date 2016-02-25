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
                            'login' => $user->login
                        )
                    );


                    if ($this->request->getPost("remember") == "on") {

                        $this->cookies->set("HWM", $user->login, time() + 30 * 86400);
                    }


                    $this->flash->success($this->t->_("hello") . ', ' . $user->name);

                    return $this->response->redirect("index");
                } else {
                    $this->flash->error($this->t->_("confirmAcc"));
                    return $this->response->redirect("index");
                }
            }


            $this->flash->error($this->t->_("wrongLoginPass"));

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
                $this->flash->error($this->t->_("userExists"));
                return;
            }

            if (strlen($this->request->getPost("pass")) < 5) {
                $this->flash->error($this->t->_("shortPass"));
                return;
            }

            if ($this->request->getPost("pass") != $this->request->getPost("pass2")) {
                $this->flash->error($this->t->_("wrong2Pass"));
                return;
            }

            $user = new User();
            $user->login = $this->request->getPost("login");

            $user->gender = ($this->request->getPost("gender") == 1) ? true : false;
            $user->country = $this->request->getPost("country");

            $user->pass = md5($this->request->getPost("pass"));
            $user->name = $this->request->getPost("name");
            $user->email = $this->request->getPost("email");
            $user->token = md5(rand() . rand() . rand());

            if ($user->save()) {
                $this->flash->success($this->t->_("regComplete"));

                if ($this->SendEmailWithToken($user->email, $user->token, $this->t->_("regEmail"))) {


                    return $this->response->redirect("index");
                }

            }

            foreach ($user->getMessages() as $message) {
                $this->flash->error($message->getMessage());
            }
        }


    }

    public function logoutAction()
    {
        $this->session->destroy();
        $this->flash->success($this->t->_("logout"));

        if ($this->cookies->has("HWM"))
            $this->cookies->get("HWM")->delete();

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

                    $this->flash->success($this->t->_("accConfirmed"));
                    return $this->response->redirect("index");
                }

                foreach ($user->getMessages() as $message) {
                    $this->flash->error($message->getMessage());
                }
            }

        }

        $this->flash->error($this->t->_("accConfirmError"));

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

                    if ($this->SendEmailWithToken($user->email, $user->token, $this->t->_("restoreEmail"))) {

                        $this->flash->success($this->t->_("restoreInfo"));
                        return $this->response->redirect("index");
                    }

                }

            }


            $this->flash->error($this->t->_("noUser"));
        }

    }


}

