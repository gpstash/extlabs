<?php 

class MyIndo_Model_Contents extends MyIndo_Model_Abstract
{
    protected $_name = 'CONTENTS';
    protected $_id = 'CONTENT_ID';
    
    public function parser($data)
    {
        $gpModel = new MyIndo_Model_GridpanelColumns();
        $mModel = new MyIndo_Model_Models();
        $ctModel = new MyIndo_Model_ContentTbar();
        
    	$attr = array(
    			'XTYPE' => 'xtype',
    	        'STORE' => 'store',
    	        'BORDER' => 'border',
    			'ID' => 'id',
    			'REGION' => 'region',
    	);
    	
    	$json = array();
    	foreach($data as $k=>$d) {
    	    
    	    if($d['XTYPE'] == 'gridpanel') {
    	        
    	        // Columns :
    	        $json[$k]['columns'] = $gpModel->getColumns($d[$this->_id]);
    	        
    	        // Tbar :
    	        $tbar = $ctModel->getTbar($d[$this->_id]);
    	        if(count($tbar) > 0) {
    	        	$json[$k]['tbar'] = $tbar;
    	        }
    	    }
    	    
    	    $d['BORDER'] = $d['BORDER'] == 0 ? false : true;
    	    
    		foreach($attr as $_k=>$_d) {
    			$json[$k][$_d] = $d[$_k];
    		}
    	}
    	return $json;
    }
}