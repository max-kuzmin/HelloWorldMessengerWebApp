<?php

use Phalcon\Mvc\Model\Relation;
use Phalcon\Mvc\Model\Validator\PresenceOf;
use Phalcon\Mvc\Model\Validator\Uniqueness;
use Phalcon\Mvc\Model\Validator\StringLength;

class Message extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $message_id;

    /**
     *
     * @var string
     */
    public $login;

    /**
     *
     * @var integer
     */
    public $dialog_id;

    /**
     *
     * @var string
     */
    public $time;

    /**
     *
     * @var string
     */
    public $text;

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'message';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Message[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Message
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }


    public function initialize()
    {
        $this->belongsTo("dialog_id", "Dialog", "dialog_id", array("foreignKey" => true));
        $this->belongsTo("login", "User", "login");
        $this->hasMany("message_id", "Image", "message_id", array('foreignKey' => array('action' => Relation::ACTION_CASCADE)));
    }


    public function validation()
    {
        $this->validate(
            new Uniqueness(
                array(
                    "field" => "message_id"
                )
            )
        );


        $this->validate(
            new PresenceOf(
                array(
                    "field" => "login"
                )
            )
        );

        $this->validate(
            new PresenceOf(
                array(
                    "field" => "dialog_id"
                )
            )
        );

        $this->validate(
            new PresenceOf(
                array(
                    "field" => "time"
                )
            )
        );

        $this->validate(new StringLength(array(
            "field" => 'text',
            'min' => 1
        )));

        return $this->validationHasFailed() != true;
    }

}
