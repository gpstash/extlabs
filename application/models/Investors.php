<?php

class Application_Model_Investors Extends Application_Model_Abstract
{
	protected $_name = 'INVESTORS';
	protected $_id = 'INVESTOR_ID';
	
	public function getInvestors($limit, $offset)
	{
	    $q = $this->select()
	    ->setIntegrityCheck(false)
	    ->order($this->_id . ' ASC')
	    ->from($this->_name,array('*'))
	    ->join('LOCATIONS','LOCATIONS.LOCATION_ID = INVESTORS.LOCATION_ID', array('*'))
	    ->join('INVESTOR_TYPE','INVESTOR_TYPE.INVESTOR_TYPE_ID = INVESTORS.INVESTOR_TYPE_ID', array('*'))
	    ->limit($limit, $offset);
	    
	    return $q->query()->fetchAll();
	}
	
	public function getDetailInvestor($investor_id)
	{
	    $q = $this->select()
	    ->setIntegrityCheck(false)
	    ->where($this->_id . ' = ?', $investor_id)
	    ->from($this->_name,array('*'))
	    ->join('LOCATIONS','LOCATIONS.LOCATION_ID = INVESTORS.LOCATION_ID', array('*'))
	    ->join('INVESTOR_TYPE','INVESTOR_TYPE.INVESTOR_TYPE_ID = INVESTORS.INVESTOR_TYPE_ID', array('*'));
	    return $q->query()->fetch();
	}
}