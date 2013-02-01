<?php

class MyIndo_Ext_Abstract
{
	protected $_xtype;
	protected $_autoScroll;
	protected $_border;
	protected $_disabled;
	protected $_id;
	protected $_width;

	public function __construct()
	{
		$this->_xtype = '';
		$this->_autoScroll = false;
		$this->_border = true;
		$this->_disabled = false;
		$this->_id = 'default-id-' . rand(000,999) . '-' . microtime();
		$this->_width = 300;
	}

	public function setXtype($string)
	{
		$this->_xtype = $string;
	}

	public function getXtype()
	{
		return $this->_xtype;
	}

	public function setAutoScroll($boolean)
	{
		$this->_autoScroll = $boolean;
	}

	public function getAutoScroll()
	{
		return $this->_autoScroll;
	}

	public function setBorder($boolean)
	{
		$this->_border = $boolean;
	}

	public function getBorder()
	{
		return $this->_border;
	}

	public function setDisabeld($boolean)
	{
		$this->_disabled = $boolean;
	}

	public function getDisabled()
	{
		return $this->_disabled;
	}

	public function setId($string)
	{
		$this->_id = $string;
	}

	public function getId()
	{
		return $this->_id;
	}

	public function setWidth($int)
	{
		$this->_width = $int;
	}

	public function getWidth()
	{
		return $this->_width;
	}
}