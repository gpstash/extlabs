<?php

class Dashboard_RequestController extends Zend_Controller_Action
{
	protected $_posts;
	protected $_treePanelModel;
	protected $_treeStoreModel;
	protected $_treeStoreChildrenModel;
	protected $_itemsModel;
	protected $_contentsModel;
	protected $_modelsModel;
	protected $_contentTbarModel;
	protected $_contentTbarListenerModel;

	public function init()
	{
	    // Init Models :
	    
	    $this->_treePanelModel = new MyIndo_Model_TreePanel();
	    $this->_treeStoreModel = new MyIndo_Model_TreeStore();
	    $this->_treeStoreChildrenModel = new MyIndo_Model_TreeStoreChildren();
	    $this->_itemsModel = new MyIndo_Model_Items();
	    $this->_contentsModel = new MyIndo_Model_Contents();
	    $this->_modelsModel = new MyIndo_Model_Models();
	    $this->_contentTbarModel = new MyIndo_Model_ContentTbar();
	    $this->_contentTbarListenerModel = new MyIndo_Model_ContentTbarListener();
	    
	    // End of : Init Models
	    
		$this->_helper->viewRenderer->setNoRender(true);
		$this->_helper->layout()->disableLayout();
		if($this->getRequest()->isPost()) {
			$this->_posts = $this->getRequest()->getPost();
		} else {
			die("Why so serious ?");
		}
	}
	
	public function treePanelAction()
	{
	    $treePanels = $this->_treePanelModel->getList();
	    $treePanelJSON = $this->_treePanelModel->parser($treePanels);
	    
	    // Return Array :
	    $return = array(
	            'data' => array(
	            	'items' => $treePanelJSON
	            	)
	            );
	    
	    MyIndo_Tools_Return::returnJSON($return);
	}
	
	public function treeStoreAction()
	{
	    $treePanelId = $this->_treePanelModel->getIdByKey('ID', $this->_posts['id']);
	    $treeStoreDetail = $this->_treeStoreModel->getDetailByKey('TREE_PANEL_ID', $treePanelId);
	    $treeStoreId = $treeStoreDetail['TREE_STORE_ID'];
	    $treeStoreChildrens = $this->_treeStoreChildrenModel->getListByKey('TREE_STORE_ID', $treeStoreId);
	    $items = $this->_treeStoreChildrenModel->parser($treeStoreChildrens);
	    
	    // Return Array :
	    $return = array(
	            'data' => array(
	            	'items' => $items
	            	)
	            );
	    
	    MyIndo_Tools_Return::returnJSON($return);
	}
	
	public function tabContentAction()
	{   
	    // Get Contents :
	    $treeStoreChildrenId = $this->_treeStoreChildrenModel->getIdByKey('ID', $this->_posts['id']);
	    $lists = $this->_contentsModel->getListByKey('TREE_STORE_CHILDREN_ID', $treeStoreChildrenId);
	    $jsonContents = $this->_contentsModel->parser($lists);
	    
	    // Get Model :
	    $modelsArr = $this->_modelsModel->getModels($lists);
	    
	    //Return Array
	    $return = array(
	            'data' => array(
	            	'items' => $jsonContents,
	                'models' => $modelsArr
	            	)
	            );
	    
	    MyIndo_Tools_Return::returnJSON($return);
	}
	
	// START : TBAR LISTENERS
	public function getTbarListenerAction()
	{
	    //$this->_contentTbarListenerModel->getDetailByKey('CONTENT_TBAR_LISTENER_ID', $this->_contentTbarModel->getIdByKey('ID', $this->_posts['id']))
	    $detail = $this->_contentTbarListenerModel->getDetailByKey('CONTENT_TBAR_ID', $this->_contentTbarModel->getIdByKey('ID', $this->_posts['id']));
	    $return = array(
	            'data' => array(
	                    'listener' => $this->view->render($detail['LISTENER_PATH'])
	                    )
	            );
	    MyIndo_Tools_Return::returnJSON($return);
	}
}