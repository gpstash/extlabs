<?php 

class MyIndo_Model_ContentTbar extends MyIndo_Model_Abstract
{
    protected $_name = 'CONTENT_TBAR';
    protected $_id = 'CONTENT_TBAR_ID';
    
    public function getTbar($content_id)
    {
        $data = $this->getListByKey('CONTENT_ID', $content_id);
        $json = array();
        
        $attr = array(
                'ID' => 'id',
                'XTYPE' => 'xtype',
                'TEXT' => 'text',
                'ICONCLS' => 'iconCls',
                'DISABLED' => 'disabled'
                );
        foreach($data as $k=>$d) {
            
            $d['DISABLED'] = ($d['DISABLED'] == 0) ? false : true;
         	
            foreach($attr as $_k=>$_d) {
                if($_k == 'ICONCLS') {
                    if(!empty($d['ICONCLS']) && $d['ICONCLS'] != '' && $d['ICONCLS'] != null) {
                        $json[$k][$_d] = $d[$_k];
                    }
                } else {
                	$json[$k][$_d] = $d[$_k];
                }
            }
        }
        
        return $json;
    }
}