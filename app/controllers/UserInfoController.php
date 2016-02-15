<?php

use Phalcon\Http\Response;

class UserInfoController extends ControllerBase
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

                $user->gender = ($user->gender == false) ? "муж" : "жен";
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

