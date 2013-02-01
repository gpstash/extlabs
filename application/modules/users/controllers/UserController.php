<?php

class Users_UserController extends Zend_Controller_Action
{
    public function init()
    {
        
    }
    
    protected function disableLayoutView()
    {
        $this->_helper->layout()->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
    }
    
    public function loginAction()
    {
        $this->disableLayoutView();
        if($this->getRequest()->isPost()) {
            $posts = $this->getRequest()->getPost();
            if(!empty($_SERVER['HTTP_X_REQUESTED_WITH'])) {
                $success = true;
                if($success) {
                    echo Zend_Json::encode(array('success'=>true));
                } else {
                    echo Zend_Json::encode(array(
                            'success' => false,
                            'errors' => array(
                                    'no' => 1001,
                                    'reason' => 'Invalid Username or Password'
                                    )
                            ));
                }
            }
        }
    }
    
    public function logoutAction()
    {
        $this->_helper->viewRenderer->setNoRender(true);
        $this->_helper->layout()->disableLayout();
        $this->_redirect('/');
    }
}