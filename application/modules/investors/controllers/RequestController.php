<?php 

class Investors_RequestController extends Zend_Controller_Action
{
    protected $_investors;
    protected $_locations;
    protected $_investorType;
    protected $_investorKeyPersons;
    protected $_meetingActivities;
    protected $_meetingActivityPersons;
    protected $_meetingActivityDocuments;
    protected $_posts;
    protected $_default_limit;
    protected $_limit;
    protected $_offset;
    
    public function init()
    {
        $this->_helper->viewRenderer->setNoRender(true);
        $this->_helper->layout()->disableLayout();
        $this->_default_limit = 25;
        
        if($this->getRequest()->isPost()) {
            $this->_posts = $this->getRequest()->getPost();
        } else {
            $this->_posts = array();
        }
        
        $this->_limit = (isset($this->_posts['limit'])) ? $this->_posts['limit'] : $this->_default_limit;
        $this->_offset = (isset($this->_posts['start'])) ? $this->_posts['start'] : 0;
        
        /* Init Models */
        $this->_investors = new Application_Model_Investors();
        $this->_locations = new Application_Model_Locations();
        $this->_investorType = new Application_Model_InvestorType();
        $this->_investorKeyPersons =  new Application_Model_InvestorKeyPersons();
        $this->_meetingActivities = new Application_Model_MeetingActivities();
        $this->_meetingActivityPersons = new Application_Model_MeetingActivityPersons();
        $this->_meetingActivityDocuments = new Application_Model_MeetingActivityDocuments();
        
        if(!$this->getRequest()->isPost()) {
            die('Why so serious ?');
        }
    }
    
    // START : INVESTORS
    
    public function listInvestorsAction()
    {
        $lists = $this->_investors->getInvestors($this->_limit, $this->_offset);
        
        $return = array(
                'data' => array(
                        'params' => $this->_posts,
                        'items' => $lists,
                        'totalCount' => $this->_investors->count()
                        )
                );
        
        MyIndo_Tools_Return::returnJSON($return);
    }
    
    public function addInvestorsAction()
    {
        
        $return = array();
        
        MyIndo_Tools_Return::returnJSON($return);
    }
    
    public function editInvestorsAction()
    {
        $return = array(
                'data' => array(
                        'posts' => $this->_posts
                        )
                );
        
        MyIndo_Tools_Return::returnJSON($return);
    }
    
    public function deleteInvestorsAction()
    {
        $return = array();
        
        MyIndo_Tools_Return::returnJSON($return);
    }
    
    public function getDetailInvestorAction()
    {
        $detail = $this->_investors->getDetailInvestor($this->_posts['id']);
        
        $return = array(
                'data' => array(
                        'items' => $detail
                        )
                );
        
        MyIndo_Tools_Return::returnJSON($return);
    }
    
    // END : INVESTORS
    
    // START : LOCATIONS
    
    public function listLocationsAction()
    {
        $lists = $this->_locations->getListLimit($this->_limit, $this->_offset);
        
        $return = array(
        		'data' => array(
        				'params' => $this->_posts,
        				'items' => $lists,
        				'totalCount' => $this->_locations->count()
        		)
        );
                
        MyIndo_Tools_Return::returnJSON($return);
    }
    
    public function addLocationsAction()
    {
        $return = array();
        
        MyIndo_Tools_Return::returnJSON($return);
    }
    
    public function editLocations()
    {
        $return = array(
                'data' => array(
                        'posts' => $this->_posts
                        )
                );
        
        MyIndo_Tools_Return::returnJSON($return);
    }
    
    public function deleteLocations()
    {
        $return = array();
        
        MyIndo_Tools_Return::returnJSON($return);
    }
    
    // END : LOCATIONS
    
    // START : INVESTOR_TYPE
    
    public function listInvestortypeAction()
    {
        $lists = $this->_investorType->getListLimit($this->_limit, $this->_offset);
        
        $return = array(
        		'data' => array(
        				'params' => $this->_posts,
        				'items' => $lists,
        				'totalCount' => $this->_investorType->count()
        		)
        );
        
        MyIndo_Tools_Return::returnJSON($return);
    }
    
    public function addInvestortypeAction()
    {
        $return = array();
        
        MyIndo_Tools_Return::returnJSON($return);
    }
    
    public function editInvestortypeAction()
    {
        $return = array();
        
        MyIndo_Tools_Return::returnJSON($return);
    }
    
    public function deleteInvestortypeAction()
    {
        $return = array();
        
        MyIndo_Tools_Return::returnJSON($return);
    }
    
    // END : INVESTOR_TYPE

    // START : INVESTOR KEY PERSON

    public function getKeyPersonsAction()
    {
        if(isset($this->_posts['id'])) {
            $lists = $this->_investorKeyPersons->getListByKey('INVESTOR_ID', $this->_posts['id']);
        } else {
            $lists = $this->_investorKeyPersons->getList();
        }

        foreach($lists as $k=>$d) {
            $lists[$k]['FULLNAME'] = $d['FNAME'] . ' ' . $d['LNAME'];
        }

        $return = array(
            'data' => array(
                'items' => $lists
                )
            );
        
        MyIndo_Tools_Return::returnJSON($return);
    }

    // END : INVESTOR KEY PERSON

    // START : MEETING ACTIVITIES

    public function getMeetingActivitiesAction()
    {
        $return = array(
            'data' => array(
                'items' => $this->_meetingActivities->getListByKey('INVESTOR_ID', $this->_posts['id'])
                )
            );
        
        MyIndo_Tools_Return::returnJSON($return);
    }

    // END : MEETING ACTIVITIES

    // START : MEETING ATTENDANCES

    public function getMeetingAttendancesAction()
    {
        $return = array(
            'data' => array(
                'items' => $this->_meetingActivityPersons->getPersons($this->_posts['id'])
                )
            );
        
        MyIndo_Tools_Return::returnJSON($return);
    }

    // END : MEETING ATTENDANCES

    // START : MEETING DOCUMENTS 

    public function getMeetingDocumentsAction()
    {
        $return = array(
            'data' => array(
                'items' => $this->_meetingActivityDocuments->getListByKey('MEETING_ACTIVITY_ID', $this->_posts['id'])
                )
            );

        MyIndo_Tools_Return::returnJSON($return);
    }

    // END : MEETING DOCUMENTS
}