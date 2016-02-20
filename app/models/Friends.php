<?php

use Phalcon\Mvc\Model\Validator\PresenceOf;
use Phalcon\Mvc\Model\Validator\StringLength;

class Friends extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var string
     */
    public $login1;

    /**
     *
     * @var string
     */
    public $login2;

    /**
     *
     * @var int
     */
    public $id;

    /**
     *
     * @var bool
     */
    public $confirm1;

    /**
     *
     * @var bool
     */
    public $confirm2;


    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'friends';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return User[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return User
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public function initialize()
    {
        $this->belongsTo("login1", "User", "login", array('alias' => 'User1', "foreignKey" => true));
        $this->belongsTo("login2", "User", "login", array('alias' => 'User2', "foreignKey" => true));
    }



    public function validation()
    {

        $this->validate(new StringLength(array(
            "field" => 'login1',
            'max' => 20,
            'min' => 3
        )));

        $this->validate(new StringLength(array(
            "field" => 'login2',
            'max' => 20,
            'min' => 3
        )));

        $this->validate(
        new PresenceOf(
            array(
                "field"  => "confirm1",
            )
        )
    );

        $this->validate(
            new PresenceOf(
                array(
                    "field"  => "confirm2",
                )
            )
        );

        return $this->validationHasFailed() != true;
    }


}
