<?php 

class MyIndo_Model_Items extends MyIndo_Model_Abstract
{
    protected $_name = 'ITEMS';
    protected $_id = 'ITEM_ID';
    
    public function parser($data)
    {
        $attr = array(
                'XTYPE' => 'xtype',
                'ID' => 'id',
                'REGION' => 'region',
                );
        $json = array();
        foreach($data as $k=>$d) {
            foreach($attr as $_k=>$_d) {
                $json[$k][$_d] = $d[$_k];
            }
        }
        return $json;
    }
    
    /*
    protected $_pc = array();
    
    public function getContent($name, $value, $id)
    {
        $q = $this->select()
        ->where($name . ' = ?', $value)
        ->where('PARENT_ID = ?', $id);
        $x = $q->query()->fetchAll();
        
        if(count($x) > 0) {
        	$this->_pc[$id] = $x;
        }
        foreach($x as $k=>$d) {
            $this->getContent($name, $value, $d['ITEM_ID']);
        }
        
        //print_r($this->_pc);die;
        $this->parseItems($this->_pc);
    }
    
    public function parseItems($data)
    {
        $json = array();
        foreach($data as $k=>$d) {
            if($k == 0) {
                $json['xtype'] = $d['XTYPE'];
                $json['id'] = $d['ID'];
                $json['region'] = $d['REGION'];
            }
        }
        print_r($json);die;
    }
    */
}