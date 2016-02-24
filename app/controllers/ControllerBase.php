<?php

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{


    function SendEmailWithToken($email, $token, $message)
    {
        $this->mail->setFrom('kuzmin@gapps.ispu.ru', $this->t->_("emailSender"));
        $this->mail->addAddress($email);
        $this->mail->Subject = $this->t->_("emailTopic");
        $this->mail->Body =
            $message
            . ($this->tag->linkTo("account/check?token=" . $token, "link"));


        $success = $this->mail->send();
        if (!$success) {
            $this->flash->error($this->mail->ErrorInfo);
        }

        return $success;

    }
}
