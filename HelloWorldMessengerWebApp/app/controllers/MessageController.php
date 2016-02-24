<?php

use Phalcon\Http\Response;
use Phalcon\Mvc\View;

class MessageController extends ControllerBase
{

    public function showmessagesAction()
    {
        if ($this->request->isGet()) {

            $userdialog = UserDialog::findFirst(array(
                "dialog_id = :dialogid: AND login = :login:",
                'bind' => array(
                    'dialogid' => $this->request->get("dialogid"),
                    'login' => $this->session->get("auth")["login"]
                )
            ));


            if ($userdialog) {
                $dialog = $userdialog->getDialog();

                if ($dialog) {

                    $messages = $dialog->getMessage(
                        array(
                            "order" => "time DESC",
                            "limit" => 10
                        )
                    );

                    //======
                    $names = array();
                    $images = array();
                    foreach ($messages as $message) {
                        $names[$message->login] = $message->getUser()->name;
                        $images[$message->message_id] = ($message->getImage()->count() > 0) ? true : false;
                    }
                    $this->view->names = $names;
                    $this->view->images = $images;
                    //======


                    $messages = array_reverse($messages->toArray());

                    $this->view->messages = count($messages) > 0 ? $messages : array();
                    $this->view->dialog = $dialog;

                    //отмечаем диалог как прочитанный
                    $userdialog->new = false;
                    $userdialog->save();

                    $this->view->new = false;

                    return;
                }
            }
        }
        $this->flash->error($this->t->_("dialogNotFound"));
        return $this->response->redirect("index");
    }


    public function showlastmessagesAction()
    {
        if ($this->request->isGet() && $this->request->has("time")) {

            $userdialog = UserDialog::findFirst(array(
                "dialog_id = :dialogid: AND login = :login:",
                'bind' => array(
                    'dialogid' => $this->request->get("dialogid"),
                    'login' => $this->session->get("auth")["login"]
                )
            ));

            $time = $this->request->get("time");
            if ($time < 0) $time = 0;

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

                    //======
                    $names = array();
                    $images = array();
                    foreach ($messages as $message) {
                        $names[$message->login] = $message->getUser()->name;
                        $images[$message->message_id] = ($message->getImage()->count() > 0) ? true : false;
                    }
                    $this->view->names = $names;
                    $this->view->images = $images;
                    //======


                    $this->view->messages = count($messages) > 0 ? $messages->toArray() : array();

                    //отмечаем диалог как прочитанный
                    $userdialog->new = false;
                    $userdialog->save();

                    $this->view->new = true;
                    $this->view->setRenderLevel(View::LEVEL_NO_RENDER);
                    return $this->view->partial("message/partial");
                }
            }

        }

        $this->flash->error($this->t->_("wrongQuery"));
        return $this->response->redirect("index");
    }


    public function showprevmessagesAction()
    {
        if ($this->request->isGet() && $this->request->has("time")) {

            $userdialog = UserDialog::findFirst(array(
                "dialog_id = :dialogid: AND login = :login:",
                'bind' => array(
                    'dialogid' => $this->request->get("dialogid"),
                    'login' => $this->session->get("auth")["login"]
                )
            ));

            $time = $this->request->get("time");
            if ($time < 0) $time = time();

            if ($userdialog) {
                $dialog = $userdialog->getDialog();

                if ($dialog) {

                    $messages = $dialog->getMessage(
                        array(
                            "time < :time:",
                            "bind" => array(
                                "time" => $time
                            ),
                            "order" => "time DESC",
                            "limit" => 10

                        )
                    );


                    //======
                    $names = array();
                    $images = array();
                    foreach ($messages as $message) {
                        $names[$message->login] = $message->getUser()->name;
                        $images[$message->message_id] = ($message->getImage()->count() > 0) ? true : false;
                    }
                    $this->view->names = $names;
                    $this->view->images = $images;
                    //======


                    $messages = array_reverse($messages->toArray());

                    $this->view->messages = count($messages) > 0 ? $messages : array();

                    //отмечаем диалог как прочитанный
                    $userdialog->new = false;
                    $userdialog->save();

                    $this->view->new = false;

                    $this->view->setRenderLevel(View::LEVEL_NO_RENDER);
                    return $this->view->partial("message/partial");
                }
            }

        }

        $this->flash->error($this->t->_("wrongQuery"));
        return $this->response->redirect("index");
    }


    public function addmessageAction()
    {

        if ($this->request->isPost()) {

            $txt = $this->request->getPost("text");

            if ($txt && strlen($txt) > 0) {

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

                            //сохранение картинки
                            $file = $this->request->getUploadedFiles()[0];
                            if ($file && $file->getSize() > 0 && $file->getSize() < 1024 * 1024) {

                                $img = new Image();
                                $img->message_id = $message->message_id;


                                $img->img = file_get_contents($file->getTempName());

                                if (!$img->save()) {
                                    $this->flash->error($this->t->_("errorSavingImg"));
                                }
                            }

                            $res = new Response();
                            $res->setJsonContent(array("status" => 'OK'));

                            return $res;
                        }

                        $res = new Response();
                        $res->setJsonContent(array("status" => 'error'));

                        return $res;
                    }

                }
            }


            $this->flash->error($this->t->_("dialogNotFound"));
            return $this->response->redirect("index");

        }
    }


    public function showimageAction()
    {
        if ($this->request->isGet()) {

            $message = Message::findFirst(
                array(
                    "message_id = :messageid:",
                    'bind' => array(
                        'messageid' => $this->request->get("messageid")
                    )
                )
            );

            if ($message) {
                $userdialog = $message->getDialog()->getUserdialog(
                    array(
                        "login = :login:",
                        'bind' => array(
                            'login' => $this->session->get('auth')['login']
                        )
                    )
                )->getFirst();

                if ($userdialog) {
                    $img = $message->getImage()->getFirst();

                    if ($img) {
                        $res = new Response();
                        $res->setHeader("Content-Type", "image/jpeg");
                        $res->setContent($img->img);
                        return $res;
                    }
                }
            }


            return $this->response->setJsonContent(array("status" => "error"));

        }

    }

}

