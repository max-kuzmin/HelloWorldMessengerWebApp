<?php

use Phalcon\Http\Response;

class MessageController extends ControllerBase
{

    public function showmessagesAction()
    {
        if ($this->request->isGet()) {

            $userdialog = UserDialog::findFirst(array(
                "dialog_id = :dialogid: AND login = :login:",
                'bind' => array(
                    'dialogid'    => $this->request->get("dialogid"),
                    'login' => $this->session->get("auth")["login"]
                )
            ));

            $time = $this->request->get("time");
            if (!$time) $time = 0;

            if ($userdialog) {
                $dialog = $userdialog->getDialog();

                if ($dialog) {

                    $messages = $dialog->getMessage(
                        array(
                            "time > :time:",
                            "bind" => array(
                                "time" => $time
                            )
                        )
                    );


                    $this->view->messages = count($messages) > 0 ? $messages : array();

                    //отмечаем диалог как прочитанный
                    $userdialog->new = false;
                    $userdialog->save();

                    return;
                }
            }
                $this->flash->error("Диалог не найден");
                return $this->response->redirect("index");

        }
    }


    public function addmessageAction() {

        if ($this->request->isPost()) {

            $txt = $this->request->get("text");

            if ($txt && strlen($txt)>0) {

                $userDialog = UserDialog::findFirst(
                    array(
                        "dialog_id = :dialogid: AND login = :login:",
                        'bind' => array(
                            'dialogid' => $this->request->get("dialogid"),
                            'login' => $this->session->get("auth")["login"]
                        )
                    )
                );

                if ($userDialog) {


                    $dialog = $userDialog->getDialog();

                    if ($dialog) {

                        $message = new Message();
                        $message->login = $this->session->get("auth")["login"];
                        $message->dialog_id = $dialog->dialog_id;
                        $message->time = time();

                        $message->text = $txt;


                        if ($message->save()) {

                            $dialog->time = $message->time;
                            $dialog->save();

                            //показываем другим пользователям что есть новые сообщения
                            $userdialogs = $dialog->getUserDialog(
                                array(
                                    "login != :login:",
                                    'bind' => array(
                                        'login' => $this->session->get("auth")["login"]
                                    )
                                )
                            );

                            foreach ($userdialogs as $userdialog) {
                                $userdialog->new = true;
                                $userdialog->save();
                            }


                            $res = new Response();
                            $res->setJsonContent(array("status" => 'OK'));

                            return $res;
                        }

                        $res = new Response();
                        $res->setJsonContent(array("status" => 'ERROR'));

                        return $res;
                    }

                }
            }


            $this->flash->error("Диалог не найден");
            return $this->response->redirect("index");

        }
    }

}

