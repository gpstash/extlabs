<?php

class Dashboard_IndexController extends Zend_Controller_Action
{
    public function init()
    {
        $layout = $this->_helper->layout();
        $layout->setLayout('dashboardLayout');
    }
    
    protected function disableLayoutView()
    {
        $this->_helper->layout()->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
    }
    
    public function indexAction()
    {
        $this->_helper->viewRenderer->setNoRender(true);
    }
}