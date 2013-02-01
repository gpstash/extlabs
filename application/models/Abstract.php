<?php

class Application_Model_Abstract extends Zend_Db_Table_Abstract
{
	public function getList()
	{
		$q = $this->select();
		return $q->query()->fetchAll();
	}
	public function getListLimit($limit, $offset)
	{
		$q = $this->select()
		->limit($limit, $offset);
		return $q->query()->fetchAll();
	}
	
	public function count()
	{
	    $q = $this->select();
	    return $q->query()->rowCount();
	}
	
	public function getDetailByKey($name, $value)
	{
	    $q = $this->select()
	    ->where($name . ' = ?', $value);
	    
	    if($q->query()->rowCount() > 0) {
	        return $q->query()->fetch();
	    } else {
	        return array();
	    }
	}

	public function getListByKey($name, $value)
	{
		$q = $this->select()
		->where($name . ' = ?', $value);
		return $q->query()->fetchAll();
	}
}