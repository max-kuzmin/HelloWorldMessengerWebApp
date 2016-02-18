<?php

use Phalcon\Http\Response;

class DialogController extends ControllerBase
{

    public function showdialogsAction()
    {
        if ($this->request->isGet()) {

            $userdialogs = UserDialog::find(
                array(
                    "login = :login:",
                    'bind' => array(
                        'login' => $this->session->get("auth")["login"]
                    )
                )
            );

            $dialogs = Array();

            foreach ($userdialogs as $userdialog) {
                $dialogs[]=$userdialog->getDialog();
            }

                $this->view->dialogs=$dialogs;

        }
    }

}

