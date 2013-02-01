<?php

class IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        if($this->getRequest()->isPost()) {
            if(!empty($_SERVER['HTTP_X_REQUESTED_WITH'])) {
                $this->_helper->layout()->disableLayout();
                $this->_helper->viewRenderer->setNoRender(true);
                echo "{success:true}";
            }
        }
    }


}

