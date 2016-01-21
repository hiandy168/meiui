<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;

class MeiuiFeedbackForm extends Form
{

    public function initialize()
    {
        // phone
        $phone = new Text('phone');
        $phone->setLabel('电话');
        $phone->setFilters(array('striptags', 'string'));
        $phone->addValidators(array(
            new PresenceOf(array(
                'message' => 'phone is required'
            ))
        ));
        $this->add($phone);

        // Email
        $email = new Text('email');
        $email->setLabel('邮件');
        $email->setFilters('email');
        $this->add($email);

        $message = new TextArea('msg');
        $message->setLabel('建议');
        $message->setFilters(array('striptags', 'string'));
        $message->addValidators(array(
            new PresenceOf(array(
                'message' => 'message is required'
            ))
        ));
        $this->add($message);
    }
}