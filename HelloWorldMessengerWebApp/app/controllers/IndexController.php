<?php

class IndexController extends ControllerBase
{

    public function indexAction()
    {
        if ($this->session->get("auth")) {

            $this->view->login = $this->session->get("auth")["login"];

            $this->dispatcher->forward(
                array(
                    "controller" => "userinfo",
                    "action"     => "showinfo"
                )
            );

        }
        else {
            $this->view->login = false;

            $this->dispatcher->forward(
                array(
                    "controller" => "account",
                    "action"     => "login"
                )
            );
        }

    }

}

