<?php

class Dashboard_StoreController extends Zend_Controller_Action
{
	public function init()
	{
		$this->disableViewLayout();
	}
	
	protected function disableViewLayout()
    {
	    $this->_helper->viewRenderer->setNoRender(true);
	    $this->_helper->layout()->disableLayout();
    }
    
    protected function isAjax()
    {
	    if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
		    return true;
	    } else {
		    return false;
	    }
    }

    public function investorsAction()
    {
        if($this->isAjax() && $this->getRequest()->isPost()) {

            $posts = $this->getRequest()->getPost();

            $data = array('dataDetail'=>array(
                'contenct' => 'this->is->content'
                ));

            echo Zend_Json::encode($data);
        }
    }

    public function menusAction()
    {
    	if($this->isAjax() && $this->getRequest()->isPost()) {
			$data = array('dataDetail'=>array(
				'menu' => array(
					array(
						'name' => 'investors',
						'title' => 'Investors'
						),
					array(
						'name' => 'peers',
						'title' => 'Peers'
						),
					array(
						'name' => 'shareholdings',
						'title' => 'Shareholdings'
						),
					array(
						'name' => 'shareprices',
						'title' => 'Shareprices'
						)
					)
				));
			echo Zend_Json::encode($data);
		}
    }

    public function treesAction()
    {
    	if($this->isAjax() && $this->getRequest()->isPost()) {
    		$data = array(
    			'text' => '.',
    			'children' => array(
    				array(
    					'text' => 'Menu',
    					'expanded' => true,
    					'children' => array(
    						array(
    							'text' => 'Users Management',
    							'id' => 'main_menu_user_management',
    							'leaf' => true
    							),
    						array(
    							'text' => 'Menu #2',
    							'id' => 'main_menu2',
    							'leaf' => true
    							),
    						array(
    							'text' => 'Menu #3',
    							'id' => 'main_menu3',
    							'leaf' => true
    							),
    						array(
    							'text' => 'Menu #4',
    							'id' => 'main_menu4',
    							'leaf' => true
    							)
    						)
    					)
    				)
    			);
    		/*
    		$data = array(
    			'text' => '.',
    			'children' => array(
    				array(
    				'text' => 'Basic Ext Layout',
    				'expanded' => true,
    				'children' => array(
    					array(
    						'text' => 'Menu 1',
    						'id' => 'menu-1-id',
    						'leaf' => true
    						),
    					array(
    						'text' => 'Menu 1',
    						'id' => 'menu-1-id',
    						'leaf' => true
    						)
    					)
    				)
    			));
    		*/
    		echo Zend_Json::encode($data);
    	}
    }

    public function usersAction()
    {
        $data = array(
            'dataDetail' => array(
                'userLists' => array(
                    array(
                        'username' => 'gilang',
                        'fname' => 'Gilang',
                        'lname' => 'Pratama Putra'
                        ),
                    array(
                        'username' => 'galih',
                        'fname' => 'Girindra',
                        'lname' => 'Dwi Putra'
                        ),
                    array(
                        'username' => 'donna',
                        'fname' => 'Petricia',
                        'lname' => 'Donna Paramitha'
                        ),
                    array(
                        'username' => 'gannie',
                        'fname' => 'Mochammad',
                        'lname' => 'Gannie Dharmawan'
                        )
                    )
                )
            );
    }
}