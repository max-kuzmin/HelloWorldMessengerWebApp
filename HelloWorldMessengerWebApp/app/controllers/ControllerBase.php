<?php

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{


    function SendEmailWithToken($email, $token, $message)
    {
        $this->mail->setFrom('kuzmin@gapps.ispu.ru', 'HelloWorld Messenger Support');
        $this->mail->addAddress($email);
        $this->mail->Subject = 'Registration in HelloWorld Messenger';
        $this->mail->Body =
            $message
            .($this->tag->linkTo("account/check?token=".$token, "link"));


        $success = $this->mail->send();
        if (!$success) {
            $this->flash->error($this->mail->ErrorInfo);
        }

        return $success;

    }
}
