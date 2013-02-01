<?php

class Test_Form_Login extends Zend_Form
{
    public function init()
    {
        $this->setMethod('POST')
    	->setAttrib('autocomplete','off')
    	->setAttrib('class','form with-margin')
    	->setAttrib('name','login-form')
    	->setAttrib('id','login-form');
    	
    	$login = new Zend_Form_Element_Hidden('login');
    	$login->setValue('login');
    	
    	$hash = new Zend_Form_Element_Hidden('hash');
    	
    	$username = new Zend_Form_Element_Text('USERNAME');
    	$username->setAttrib('id','USERNAME')
    	->setAttrib('class','full-width')
    	->setLabel('<span class="big">Username</span>');
    	
    	$password = new Zend_Form_Element_Password('PASSWORD');
    	$password->setAttrib('id','PASSWORD')
    	->setAttrib('class','full-width')
    	->setAttrib('maxLength','30')
    	->setLabel('<span class="big">Password</span>');
    	
    	$button = new Zend_Form_Element_Button('Login');
    	$button->setAttrib('type','submit')
    	->setAttrib('class','float-right');
    	
    	$this->addElements(array(
    	        $login,
    	        $hash,
    	        $username,
    	        $password,
    	        $button
    	        ));
    	
    	$this->clearDecorators();
    	
    	$this->addDecorator('FormElements')
    	->addDecorator('Form');
    	
    	$this->setElementDecorators(array(
    			array('ViewHelper'),
    			array('Errors'),
    			array('Description'),
    			array('Label'),
    			array('HtmlTag', array('tag' => 'p', 'class'=>'inline-small-label'))
    	));	
    	
    	$login->setDecorators(array(
    	        array('ViewHelper')
    	));
    	$hash->setDecorators(array(
    			array('ViewHelper')
    	));
    	$button->setDecorators(array(
    	        array('ViewHelper')
    	        ));
    	
    	$username->getDecorator('Label')->setOption('escape',false);
    	$password->getDecorator('Label')->setOption('escape',false);
    }
}