<?php

class Application_Model_MeetingActivityPersons extends Application_Model_Abstract
{
	protected $_name = 'MEETING_ACTIVITY_PERSONS';

	public function getPersons($meeting_id)
	{
		$q = $this->select()
		->from($this->_name, array(''))
		->setIntegrityCheck(false)
		->where('MEETING_ACTIVITY_PERSONS.MEETING_ACTIVITY_ID = ?', $meeting_id)
		->join('MEETING_ACTIVITIES', 'MEETING_ACTIVITIES.MEETING_ACTIVITY_ID = MEETING_ACTIVITY_PERSONS.MEETING_ACTIVITY_ID', array('INVESTOR_ID'));
		$x = $q->query()->fetch();

		$INVESTOR_ID = $x['INVESTOR_ID'];

		$q = $this->select()
		->setIntegrityCheck(false)
		->from('INVESTOR_KEY_PERSONS',array('*'))
		->where('INVESTOR_ID = ?', $INVESTOR_ID)
		->order('FNAME ASC');

		return $q->query()->fetchAll();
	}
}