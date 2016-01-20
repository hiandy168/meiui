<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Validation\Validator\PresenceOf;

class SearchForm extends Form
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

        $keyword = new Text("keyword");
        $keyword->setLabel("搜索关键字");
        $keyword->setFilters(array('striptags', 'string'));
        $keyword->addValidators(array(
            new PresenceOf(array(
                'message' => 'keyword is required'
            ))
        ));
        $this->add($keyword);
    }

}