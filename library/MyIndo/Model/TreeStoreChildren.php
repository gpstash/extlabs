<?php 

class MyIndo_Model_TreeStoreChildren extends MyIndo_Model_Abstract
{
    protected $_name = 'TREE_STORE_CHILDREN';
    protected $_id = 'TREE_STORE_CHILDREN_ID';
    
    public function parser($data)
    {
        foreach($data as $k=>$d) {
            $data[$k]['LEAF'] = ($d['LEAF'] == 0) ? false : true;
        }
        $attr = array(
                'TEXT' => 'text',
                'ID' => 'id',
                'LEAF' => 'leaf'
                );
        
        $json = array(
        		'root' => array(
        				'children' => array()
        		)
        );
        foreach($data as $k=>$d) {
            foreach($attr as $_k=>$_d) {
                $json['root']['children'][$k][$_d] = $d[$_k];
            }
        }
        
        return $json;
    }
}