<?php

class MyIndo_Tools_Return
{
	public static function returnJSON($data)
	{
	    $data['error_code'] = 0;
	    $data['error_message'] = '';
	    $data['has_access'] = 1;
		echo Zend_Json::encode($data);
	}
}