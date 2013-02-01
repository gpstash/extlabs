var grid = Ext.getCmp('investors-list-investors-grid');
var store = grid.getStore();
var selected = grid.getSelectionModel().getSelection();

if(selected.length > 0) {

	if(typeof(Ext.getCmp('view-detail-investor-window')) == 'undefined') {
		
		var xyz = Ext.create('Ext.Window', {
			title: 'Message',
			html: '<p>&nbsp;</p><p style="text-align:center">Loading investor data, please wait..</p>',
			width: 260,
			height: 86,
			modal: true,
			closable: false,
			bodyPadding: '5 5 5 5'
		}).show();

		// Cell editing plugin :
		var cellEditing = Ext.create('Ext.grid.plugin.RowEditing', {
			clicksToMoveEditor: 1,
	        autoCancel: false
	    });

		Ext.define('PieChart', {
			extend: 'Ext.data.Model',
        	fields: ['state', 'population']
		});

		Ext.define('KeyPerson', {
			extend: 'Ext.data.Model',
			fields: [{
				name: 'FNAME',
				type: 'string'
			},{
				name: 'LNAME',
				type: 'string'
			},{
				name: 'FULLNAME',
				type: 'string'
			},{
				name: 'POSITION',
				type: 'string'
			},{
				name: 'PHONE',
				type: 'string'
			},{
				name: 'PHONE',
				type: 'string'
			},{
				name: 'CREATED_DATE',
				type: 'string'
			},{
				name: 'MODIFIED_DATE',
				type: 'string'
			}]
		});

		Ext.define('MeetingActivity', {
			extend: 'Ext.data.Model',
			fields: [{
				name: 'MEETING_ACTIVITY_ID',
				type: 'int'
			},{
				name: 'MEETING_ACTIVITY_NAME',
				type: 'string'
			},{
				name: 'MEETING_DATE',
				type: 'string'
			}]
		});

		var store_pie = Ext.create('Ext.data.Store', {
		    model: 'PieChart',
		    data: [{
		    	state: 'Finance',
		    	population: 65
		    },{
		    	state: 'Energy Minerals',
		    	population: 10.3
		    },{
		    	state: 'Producer Manufacturing',
		    	population: 9.2
		    },{
		    	state: 'Industrial Service',
		    	population: 7.8
		    },{
		    	state: 'Electronic Technology',
		    	population: 7.8
		    }]
		});

		var store_column = Ext.create('Ext.data.Store', {
			model: 'PieChart',
			data: [{
				state: 'Mega',
		    	population: 13.6
			},{
				state: 'Large',
		    	population: 29.9
			},{
				state: 'Mid',
		    	population: 39.6
			},{
				state: 'Small',
		    	population: 16.9
			},{
				state: 'Micro',
		    	population: 0
			}]
		});

		var store_keyPersons = Ext.create('Ext.data.Store', {
			model: 'KeyPerson',
			proxy: {
				type: 'ajax',
				url: sharedData.baseUrl + '/investors/request/get-key-persons',
				reader: {
					type: 'json',
					root: 'data.items'
				},
				actionMethods: {
		            create: 'POST', read: 'POST', update: 'POST', destroy: 'POST'
		        }
			}
		});

		var store_meetingActivities = Ext.create('Ext.data.Store', {
			model: 'MeetingActivity',
			proxy: {
				type: 'ajax',
				url: sharedData.baseUrl + '/investors/request/get-meeting-activities',
				reader: {
					type: 'json',
					root: 'data.items'
				},
				actionMethods: {
		            create: 'POST', read: 'POST', update: 'POST', destroy: 'POST'
		        }
			}
		});

		store_keyPersons.load({
			params: {
				id: selected[0].get('INVESTOR_ID')
			}
		});

		store_meetingActivities.load({
			params: {
				id: selected[0].get('INVESTOR_ID')
			}
		});

		Ext.Ajax.request({
			url: sharedData.baseUrl + '/investors/request/get-detail-investor',
			params: {
				id: selected[0].get('INVESTOR_ID')
			},
			success: function(_cdata) {
				xyz.close();
				var _objCdata = Ext.decode(_cdata.responseText);
				var d = _objCdata.data.items;

				Ext.create('Ext.Window',{
				    title : 'Detail Investor : ' + d.COMPANY_NAME,
				    id: 'view-detail-investor-window',
				    width : 1000,
				    height: 618,
				    modal: true,
				    resizable: false,
				    xtype: 'panel',
					layout: 'border',
					closable: true,
					border: true,
					autoScroll: true,
					items: [
					<?php echo $this->render('dashboard/tbar/investors/detail/company-information.js')?>,
					<?php echo $this->render('dashboard/tbar/investors/detail/company-overview.js')?>,
					<?php echo $this->render('dashboard/tbar/investors/detail/investment-strategy.js')?>,
					<?php echo $this->render('dashboard/tbar/investors/detail/key-persons.js')?>,
					<?php echo $this->render('dashboard/tbar/investors/detail/meeting-activities.js')?>
					]
				}).show();
			}
		});
		
	}

} else {

	var x = Ext.create('Ext.Window', {
		title: 'Message',
		html: '<p>&nbsp;</p><p style="text-align:center">You did not select any investor</p>',
		width: 260,
		height: 120,
		modal: true,
		resizable: false,
		bodyPadding: '5 5 5 5',
		buttons: [{
			text: 'Close',
			listeners: {
				click: function() {
					x.close();
				}
			}
		}]
	}).show();

}