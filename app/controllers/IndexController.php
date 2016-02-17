<?php

class IndexController extends ControllerBase
{

    public function indexAction()
    {
        if ($this->session->get("auth")) {
            $this->view->login = $this->session->get("auth")["login"];
        }
        else {
            $this->view->login = false;
        }
    }

}

