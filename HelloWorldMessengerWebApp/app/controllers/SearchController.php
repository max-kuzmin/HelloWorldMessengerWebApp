<?php

use Phalcon\Http\Response;

class SearchController extends ControllerBase
{

    public function searchusersAction()
    {

        if (strlen($this->request->get("query")) >= 1 && strlen($this->request->get("query")) <= 50) {

            $users = User::find(
                array(
                    "(login LIKE :login: OR name LIKE :name: OR email LIKE :email:) AND login != :myLogin:",
                    'bind' => array(
                        'login' => "%" . $this->request->get("query") . "%",
                        'name' => "%" . $this->request->get("query") . "%",
                        'email' => "%" . $this->request->get("query") . "%",
                        'myLogin' => $this->session->get('auth')['login']
                    )
                )
            );

            $this->view->users = $users;
            $this->view->query = $this->request->get('query');
        }
        else {
            $this->view->users = null;
            $this->view->query = '';
        }
    }
}

