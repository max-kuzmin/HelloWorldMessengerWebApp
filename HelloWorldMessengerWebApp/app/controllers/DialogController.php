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
                $dialog = $userdialog->getDialog();

                $users = array();
                $otherUserdialogs = $dialog->getUserdialog(
                    array(
                        "login != :login:",
                        'bind' => array(
                            'login' => $this->session->get("auth")["login"]
                        )
                    )
                );

                foreach ($otherUserdialogs as $otherUserdialog){
                    $users[] = $otherUserdialog->getUser();
                }

                $dialogs[]=array(
                    $dialog,
                    $users,
                    $userdialog->new
                );
            }

                $this->view->dialogs=$dialogs;

        }
    }



    public function checknewAction() {

        if ($this->request->isGet()) {

            $userdialogs = UserDialog::find(
                array(
                    "login = :login: AND new = true",
                    'bind' => array(
                        'login' => $this->session->get("auth")["login"]
                    )
                )
            );

            return $this->response->setJsonContent(["status" => count($userdialogs)]);
        }
    }


    public function createdialogAction()
    {
        $user = User::findFirst(
            array(
                "login = :login:",
                'bind' => array(
                    'login'    => $this->request->get('login')
                )
            )
        );

        if ($user) {


            $friends = Friends::findFirst(array(
                "(login1 = :mylogin: AND login2 = :login:) OR (login2 = :mylogin: AND login1 = :login:)",
                'bind' => array(
                    'mylogin' => $this->session->get('auth')["login"],
                    'login' => $user->login
                )
            ));


            if (!($friends && $friends->confirm1 && $friends->confirm2)) {
                $this->flash->error($this->t->_("mustBeFriendsToCreateDialog"));
                return $this->response->redirect($this->request->getHTTPReferer());
            }


            $dialog = new Dialog();
            $dialog->time = time();
            $dialog->name = $this->session->get('auth')['login']." - ".$user->login;

            if ($dialog->save()) {

                $userdialog = new UserDialog();
                $userdialog->dialog_id = $dialog->dialog_id;
                $userdialog->new = true;
                $userdialog->login = $user->login;

                $userdialog2 = new UserDialog();
                $userdialog2->dialog_id = $dialog->dialog_id;
                $userdialog2->new = false;
                $userdialog2->login = $this->session->get('auth')['login'];

                if ($userdialog->save() && $userdialog2->save()) {
                    $this->flash->success($this->t->_("dialogCreated"));
                    return $this->response->redirect("message/showmessages?dialogid=" . $dialog->dialog_id);
                }
            }
        }

        $this->flash->error($this->t->_("dialogCreationError"));
        return $this->response->redirect("index");
    }

    public function addusertodialogAction()
    {
        $user = User::findFirst(
            array(
                "login = :login:",
                'bind' => array(
                    'login'    => $this->request->get('login')
                )
            )
        );

        if ($user) {

            //проверка, является ли пользователь другом
            $friends = Friends::findFirst(array(
                "(login1 = :mylogin: AND login2 = :login:) OR (login2 = :mylogin: AND login1 = :login:)",
                'bind' => array(
                    'mylogin' => $this->session->get('auth')["login"],
                    'login' => $user->login
                )
            ));

            if (!($friends && $friends->confirm1 && $friends->confirm2)) {
                $this->flash->error($this->t->_("mustBeFriendsToAddUser"));
                return $this->response->redirect($this->request->getHTTPReferer());
            }


            $myuserdialog = UserDialog::findFirst(
                array(
                    "dialog_id = :dialogid: AND login = :login:",
                    'bind' => array(
                        'dialogid'    => $this->request->get('dialogid'),
                        'login' => $this->session->get('auth')["login"]
                    )
                )
            );

            if ($myuserdialog) {

                $userdialog = UserDialog::findFirst(
                    array(
                        "dialog_id = :dialogid: AND login = :login:",
                        'bind' => array(
                            'dialogid'    => $this->request->get('dialogid'),
                            'login' => $user->login
                        )
                    )
                );

                if ($userdialog) {
                    $this->flash->error($this->t->_("userAlreadyInDialog"));
                    return $this->response->redirect($this->request->getHTTPReferer());
                }

                $userdialog = new UserDialog();
                $userdialog->new = true;
                $userdialog->dialog_id = $myuserdialog->dialog_id;
                $userdialog->login = $user->login;

                if ($userdialog->save()) {
                    $this->flash->success($this->t->_("userAddedToDialog"));
                    return $this->response->redirect($this->request->getHTTPReferer());
                }
            }
        }

        $this->flash->error($this->t->_("errorAddingUserInDialog"));
        return $this->response->redirect("index");
    }



    public function removedialogAction()
    {

        $myuserdialog = UserDialog::findFirst(
            array(
                "dialog_id = :dialogid: AND login = :login:",
                'bind' => array(
                    'dialogid' => $this->request->get('dialogid'),
                    'login' => $this->session->get('auth')["login"]
                )
            )
        );

        if ($myuserdialog) {
            if ($myuserdialog->delete()) {
                $this->flash->success($this->t->_("dialogRemoved"));
                return $this->response->redirect('dialog/showdialogs');
            }
        }

        $this->flash->error($this->t->_("errorRemovingDialog"));
        return $this->response->redirect('dialog/showdialogs');
    }



    public function renamedialogAction()
    {

        $myuserdialog = UserDialog::findFirst(
            array(
                "dialog_id = :dialogid: AND login = :login:",
                'bind' => array(
                    'dialogid' => $this->request->get('dialogid'),
                    'login' => $this->session->get('auth')["login"]
                )
            )
        );

        if ($myuserdialog && strlen($this->request->get('name'))>1) {
            $dialog = $myuserdialog->getDialog();
            $dialog->name = $this->request->get('name');
            if ($dialog->save()) {
                $this->flash->success($this->t->_("dialogRenamed"));
                return $this->response->redirect('dialog/showdialogs');
            }
        }

        $this->flash->error($this->t->_("errorRenamingDialog"));
        return $this->response->redirect($this->request->getHTTPReferer());
    }

}

