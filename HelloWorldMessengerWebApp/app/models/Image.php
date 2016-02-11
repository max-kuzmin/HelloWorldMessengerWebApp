<?php

use Phalcon\Mvc\Model\Message;
use Phalcon\Mvc\Model\Validator\PresenceOf;
use Phalcon\Mvc\Model\Validator\Uniqueness;

class Image extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $img_id;

    /**
     *
     * @var string
     */
    public $img;

    /**
     *
     * @var string
     */
    public $login;

    /**
     *
     * @var integer
     */
    public $message_id;

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'image';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Image[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Image
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public function initialize()
    {
        $this->belongsTo("login", "User", "login", array("foreignKey" => array("allowNulls" => true)));
        $this->belongsTo("message_id", "Message", "message_id", array("foreignKey" => array("allowNulls" => true)));
    }




    public function validation()
    {
        $this->validate(
            new PresenceOf(
                array(
                    "field"  => "img",
                )
            )
        );


        $this->validate(
            new Uniqueness(
                array(
                    "field"  => "img_id",
                )
            )
        );


        if ($this->login == null && $this->message_id == null) {
            $message = new Message(
                "Image must belong to message or must be user's avatar",
                null,
                "InvalidValue"
            );

            $this->appendMessage($message);

            //return false;
        }


        return $this->validationHasFailed() != true;
    }

}
