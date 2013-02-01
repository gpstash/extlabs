<?php

class MyIndo_Model_Abstract Extends Zend_Db_Table_Abstract
{
	public function getList()
	{
		$q = $this->select();
		return $q->query()->fetchAll();
	}

	public function getListByKey($name, $value)
	{
		$q = $this->select()
		->where($name . ' = ?', $value);
		return $q->query()->fetchAll();
	}

	public function getDetailByKey($name, $value)
	{
		$q = $this->select()
		->where($name . ' = ?', $value);
		return $q->query()->fetch();
	}

	public function getIdByKey($name, $value)
	{
		$q = $this->select()
		->where($name . ' = ?', $value);
		$x = $q->query()->fetch();
		
		return $x[$this->_id];
	}

	public function getValue($name, $value, $what)
	{
		$q = $this->select()
		->where($name . ' = ?', $value);
		$x = $q->query()->fetch();
		return $x[$what];
	}
}