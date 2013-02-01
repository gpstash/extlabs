<?php 

class MyIndo_Model_ModelFields extends MyIndo_Model_Abstract
{
    protected $_name = 'MODEL_FIELDS';
    protected $_id = 'MODEL_FIELD_ID';
    
    public function getFields($model_id)
    {
        $list = $this->getListByKey('MODEL_ID', $model_id);
        $json = array();
        foreach($list as $k=>$d) {
            $json[$k]['name'] = $d['NAME'];
            $json[$k]['type'] = $d['TYPE'];
        }
        return $json;
    }
}