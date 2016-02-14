<?php

use Phalcon\Mvc\Model\Validator\PresenceOf;
use Phalcon\Mvc\Model\Validator\Uniqueness;
use Phalcon\Mvc\Model\Validator\StringLength;

class User extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var string
     */
    public $login;

    /**
     *
     * @var string
     */
    public $pass;

    /**
     *
     * @var string
     */
    public $name;

    /**
     *
     * @var string
     */
    public $info;

    /**
     *
     * @var string
     */
    public $token;

    /**
     *
     * @var string
     */
    public $email;

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'user';
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
        $this->hasMany("login", "Message", "login");
        $this->hasMany("login", "Image", "login");
        $this->hasMany("login", "UserDialog", "login");
    }



    public function validation()
    {
        $this->validate(
            new Uniqueness(
                array(
                    "field"  => "login",
                )
            )
        );


        $this->validate(new StringLength(array(
            "field" => 'login',
            'max' => 20,
            'min' => 3
        )));

        $this->validate(new StringLength(array(
            "field" => 'pass',
            'max' => 20,
            'min' => 5
        )));

        $this->validate(
            new PresenceOf(
                array(
                    "field"  => "info",
                )
            )
        );

        $this->validate(new StringLength(array(
            "field" => 'name',
            'min' => 3
        )));

        return $this->validationHasFailed() != true;
    }


    public function beforeSave()
    {
        $this->pass = md5($this->pass);
    }

}
