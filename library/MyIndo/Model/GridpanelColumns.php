<?php 

class MyIndo_Model_GridpanelColumns extends MyIndo_Model_Abstract
{
    protected $_name = 'GRIDPANEL_COLUMNS';
    protected $_id = 'GRIDPANEL_COLUMN_ID';
    
    public function getColumns($id)
    {
        $stores = new MyIndo_Model_Stores();
        $models = new MyIndo_Model_Models();
        $modelFields = new MyIndo_Model_ModelFields();
        
        $q = $this->select()
        ->where('CONTENT_ID = ?', $id)
        ->order('INDEX ASC');
        
        $x = $q->query()->fetchAll();
        $json = array();
        foreach($x as $k=>$d) {
            $json[$k]['text'] = $d['TEXT'];
            $json[$k]['dataIndex'] = $d['DATAINDEX'];
            $json[$k]['width'] = (int)$d['WIDTH'];
            $json[$k]['align'] = $d['ALIGN'];
            $json[$k]['dataType'] = $d['DATA_TYPE'];
            $json[$k]['editable'] = ($d['EDITABLE'] == 0) ? false : true;
            if($d['DATA_TYPE'] == 'combobox') {
                
                $json[$k]['displayField'] = $d['DISPLAY_FIELD'];
                $json[$k]['storeName'] = $d['STORE'];
                
                $detailStore = $stores->getDetailByKey('NAME', $d['STORE']);
                
                $json[$k]['model'] = array(
                        'modelName' => $models->getValue('MODEL_ID', $detailStore['MODEL_ID'], 'NAME'),
                        'fields' => $modelFields->getFields($detailStore['MODEL_ID'])
                        );
                $json[$k]['store'] = $stores->getStore($detailStore['MODEL_ID']);
            }
        }
        return $json;
    }
}