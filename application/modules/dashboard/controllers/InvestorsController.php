<?php

class Dashboard_InvestorsController extends Zend_Controller_Action
{
	protected $_investors;
	public function init()
	{
		$this->_helper->viewRenderer->setNoRender(true);
		$this->_helper->layout()->disableLayout();

		// Define Models :
		$this->_investors = new Application_Model_Investors();
	}

	public function listsAction()
	{
		$params = $this->_getAllParams();

		$list = $this->_investors->getListLimit($params['limit'], $params['start']);

		$data = array(
			'data' => array(
				'items' => $list
				),
			'params' => $params,
			'error_code' => 0,
			'error_message' => '',
			'access_right' => 1
			);

		MyIndo_Tools_Return::returnJSON($data);
	}
}