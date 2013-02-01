<?php

class Test_IndexController extends Zend_Controller_Action
{
    public function indexAction()
    {
        $form = new test_Form_Login();
        $lostpw = new test_Form_Lostpw();
        $this->view->form = $form;
        $this->view->lostpw = $lostpw;
    }
}