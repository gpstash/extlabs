<?php 

class MyIndo_Model_Models extends MyIndo_Model_Abstract
{
    protected $_name = 'MODELS';
    protected $_id = 'MODEL_ID';
    
    public function getModels($data)
    {
        $contentModelModel = new MyIndo_Model_ContentModel();
        $modelFieldsModel = new MyIndo_Model_ModelFields();
        $sModel = new MyIndo_Model_Stores();
        
        $models = array();
        
        foreach($data as $k=>$d) {
            $temp = $contentModelModel->getListByKey('CONTENT_ID', $d['CONTENT_ID']);
            foreach($temp as $_k=>$_d) {
                $modelDetail = $this->getDetailByKey('MODEL_ID', $_d['MODEL_ID']);
                $models[$_k]['modelName'] = $modelDetail['NAME'];
                $models[$_k]['fields'] = $modelFieldsModel->getFields($modelDetail['MODEL_ID']);
                
                $detail = $contentModelModel->getDetailByKey('CONTENT_ID', $d['CONTENT_ID']);
                $models[$_k]['store'] = $sModel->getStore($detail['MODEL_ID']);
            }
        }
        
        return $models;
    }
    
    public function getContentModel($content_id)
    {
        $cmModel = new MyIndo_Model_ContentModel();
        $mModel = new MyIndo_Model_Models();
        $mfModel = new MyIndo_Model_ModelFields();
        $sModel = new MyIndo_Model_Stores();
        
        $json = array();
        
        $detail = $cmModel->getDetailByKey('CONTENT_ID', $content_id);
        $detailModel = $mModel->getDetailByKey('MODEL_ID', $detail['MODEL_ID']);
        
        $json['modelName'] = $detailModel['NAME'];
        $json['fields'] = $mfModel->getFields($detail['MODEL_ID']);
        $json['store'] = $sModel->getStore($detail['MODEL_ID']);
        
        return $json;
    }
}