<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Validation\Validator\PresenceOf;

class ClassificationForm extends Form
{

    /**
     * Initialize the companies form
     */
    public function initialize($entity = null, $options = array())
    {

        if (!isset($options['edit'])) {
            $element = new Text("id");
            $this->add($element->setLabel("Id"));
        } else {
            $this->add(new Hidden("id"));
        }

        $catname = new Text("catname");
        $catname->setLabel("分类名称");
        $catname->setFilters(array('striptags', 'string'));
        $catname->addValidators(array(
            new PresenceOf(array(
                'message' => 'catname is required'
            ))
        ));
        $this->add($catname);
    }

}