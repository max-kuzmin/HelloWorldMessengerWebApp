<?php

use Phalcon\Mvc\Model\Validator\PresenceOf;
use Phalcon\Mvc\Model\Validator\Uniqueness;
use Phalcon\Mvc\Model\Validator\StringLength;
use Phalcon\Mvc\Model\Validator\Email;

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
    public $email;

    /**
     *
     * @var string
     */
    public $token;

    /**
     *
     * @var bool
     */
    public $gender;

    /**
     *
     * @var string
     */
    public $country;

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

        $this->hasMany("login", "Friends", "login1", array('alias' => 'Friends1'));
        $this->hasMany("login", "Friends", "login2", array('alias' => 'Friends2'));
    }



    public function validation()
    {

        $this->validate(
            new Uniqueness(
                array(
                    "field"  => "login",
                    'message' => $this->getDI()->get('t')->_("userExists")
                )
            )
        );


        $this->validate(new StringLength(array(
            "field" => 'login',
            'max' => 20,
            'min' => 3,
            'messageMinimum' => $this->getDI()->get('t')->_("loginShortLong"),
            'messageMaximum' => $this->getDI()->get('t')->_("loginShortLong"),
        )));

        $this->validate(new StringLength(array(
            "field" => 'pass',
            'max' => 32,
            'min' => 32,
            'messageMinimum' => $this->getDI()->get('t')->_("passMD5"),
            'messageMaximum' => $this->getDI()->get('t')->_("passMD5"),
        )));


        $this->validate(
            new Email(
                array(
                    "field"  => "email",
                    'message' => $this->getDI()->get('t')->_("wrongEmail")
                )
            )
        );

        $this->validate(new StringLength(array(
            "field" => 'name',
            'min' => 3,
            'messageMinimum' => $this->getDI()->get('t')->_("nameShort")
        )));

        $this->validate(
            new PresenceOf(
                array(
                    "field"  => "country",
                    'message' => $this->getDI()->get('t')->_("needCountry")
                )
            )
        );

        $this->validate(
            new PresenceOf(
                array(
                    "field"  => "gender",
                    'message' => $this->getDI()->get('t')->_("needGender")
                )
            )
        );



        return $this->validationHasFailed() != true;
    }


}
