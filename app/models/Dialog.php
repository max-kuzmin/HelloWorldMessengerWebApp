<?php

use Phalcon\Mvc\Model\Validator\PresenceOf;
use Phalcon\Mvc\Model\Validator\Uniqueness;
use Phalcon\Mvc\Model\Validator\StringLength;
use Phalcon\Mvc\Model\Relation;

class Dialog extends \Phalcon\Mvc\Model
{


    /**
     *
     * @var string
     */
    public $dialog_id;

    /**
     *
     * @var integer
     */
    public $name;

    /**
     *
     * @var string
     */
    public $time;

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'dialog';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Dialog[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Dialog
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public function initialize()
    {
        $this->hasMany("dialog_id", "UserDialog", "dialog_id", array('foreignKey' => array('action' => Relation::ACTION_CASCADE)));
        $this->hasMany("dialog_id", "Message", "dialog_id", array('foreignKey' => array('action' => Relation::ACTION_CASCADE)));
    }


    public function validation()
    {
        $this->validate(
            new PresenceOf(
                array(
                    "field" => "name"
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

        $this->validate(
            new Uniqueness(
                array(
                    "field" => "dialog_id"
                )
            )
        );

        $this->validate(new StringLength(array(
            "field" => 'name',
            'max' => 50,
            'min' => 3
        )));

        return $this->validationHasFailed() != true;
    }

}
