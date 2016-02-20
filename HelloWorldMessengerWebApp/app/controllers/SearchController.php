<?php

use Phalcon\Http\Response;

class SearchController extends ControllerBase
{

    public function searchusersAction()
    {
        if ($this->request->isPost()) {

            if (strlen($this->request->getPost("query"))<1 || strlen($this->request->getPost("query"))>50){
                $this->flash->error("Неверная длина запроса");
                $this->view->users = null;
                return;
            }

            $users = User::find(
                array(
                    "(login LIKE :login: OR name LIKE :name: OR email LIKE :email:) AND login != :myLogin:",
                    'bind' => array(
                        'login'    => "%".$this->request->getPost("query")."%",
                        'name' => "%".$this->request->getPost("query")."%",
                        'email' => "%".$this->request->getPost("query")."%",
                        'myLogin' => $this->session->get('auth')['login']
                    )
                )
            );

            $this->view->users = $users;
        }
        else {
            $this->view->users = null;
        }
    }

}

