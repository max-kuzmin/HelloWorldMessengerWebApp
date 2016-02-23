<?php

use Phalcon\Http\Response;
use Phalcon\Mvc\View;

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

            $this->view->users = array_slice($users->toArray(), 0, 10);
            $this->view->query = $this->request->get('query');


            //Вывод частичного поиска
            if ($this->request->get("partial") == 1 && $this->request->get("page") >= 0) {
                $this->view->users = array_slice($users->toArray(), $this->request->get("page") * 10, 10);

                $this->view->setRenderLevel(View::LEVEL_NO_RENDER);
                return $this->view->partial("search/partial");
            }

        } else {
            $this->view->users = null;
            $this->view->query = '';
        }
    }
}

