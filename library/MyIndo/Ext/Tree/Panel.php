<?php

class MyIndo_Ext_Tree_Panel extends MyIndo_Ext_Abstract
{

	protected $_autoDestroy;
	protected $_closable;

	public function __construct()
	{
		$this->_autoDestroy = true;
		$this->_closable = false;
	}

	public function setAutoDestroy($boolean)
	{
		$this->_autoDestroy = $boolean;
	}

	public function getAutoDestroy()
	{
		return $this->_autoDestroy;
	}

	public function setClosable($boolean)
	{
		$this->_closable = $boolean;
	}

	public function getClosable()
	{
		return $this->_closable;
	}
}