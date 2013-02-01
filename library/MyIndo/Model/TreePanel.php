<?php 

class MyIndo_Model_TreePanel extends MyIndo_Model_Abstract
{
    protected $_name = 'TREE_PANEL';
    protected $_id = 'TREE_PANEL_ID';
    
    public function parser($data)
    {
        $attr = array(
                'ID' => 'id',
                'TITLE' => 'title',
                'ROOTVISIBLE' => 'rootVisible',
                'AUTOSCROLL' => 'autoScroll'
                );
        $json = array();
        
        // Fixer :
        foreach($data as $k=>$d) {
            $data[$k]['ROOTVISIBLE'] = ($d['ROOTVISIBLE'] == 0) ? false : true;
            $data[$k]['AUTOSCROLL'] = ($d['AUTOSCROLL'] == 0) ? false : true;
        }
        
        // JSON Builder :
        foreach($data as $k=>$d) {
            foreach($attr as $_k=>$_d) {
            	$json[$k][$_d] = $d[$_k];
            }
        }
        return $json;
    }
}