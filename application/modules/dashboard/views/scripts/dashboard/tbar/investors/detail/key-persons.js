{
	region: 'north',
	title: 'Key Person',
	xtype: 'gridpanel',
	closable: true,
	store: store_keyPersons,
	height: 110,
	tbar: [{
		xtype: 'button',
		text: 'Add Key Person',
		listeners: {
			click: function() {
				var addKeyPerson = Ext.create('Ext.Window', {
					title: 'Add New Key Person',
					width: 400,
					height: 200,
					modal: true,
					xtype: 'form',
					layout: 'form',
					bodyPadding: '5 5 5 5',
					defaultType: 'textfield',
					resizable: false,
					items: [{
						fieldLabel: 'First Name',
						name: 'FNAME',
						allowBlank: false
					},{
						fieldLabel: 'Last Name',
						name: 'LNAME',
						allowBlank: false
					},{
						fieldLabel: 'Position',
						name: 'POSITION',
						allowBlank: false
					},{
						fieldLabel: 'Phone',
						name: 'PHONE'
					},{
						fieldLabel: 'Email',
						name: 'EMAIL'
					}],
					buttons: [{
						text: 'Save',
						listeners: {
							click: function() {
								alert('Sorry, this function is still under development.');
							}
						}
					},{
						text: 'Cancel',
						listeners: {
							click: function() {
								addKeyPerson.close();
							}
						}
					}]
				}).show();
			}
		}
	},{
		xtype: 'button',
		text: 'View In New Window',
		listeners: {
			click: function() {
				Ext.create('Ext.Window', {
					title: d.COMPANY_NAME + ' - Key Persons',
					width: 1000,
					minHeight: 100,
					maxHeight: 500,
					modal: true,
					resizable: false,
					items: [{
						xtype: 'gridpanel',
						border: false,
						store: store_keyPersons,
						autoScroll: true,
						minheight: 100,
						plugins: [cellEditing],
						columns: [{ 
							text: 'First Name',
							dataIndex: 'FNAME',
							width: 200,
							editor: {
								allowBlank: false
							}
						},{
							text: 'Last Name',
							dataIndex: 'LNAME',
							width: 200,
							editor: {
								allowBlank: false
							}
						},{
							text: 'Position',
							dataIndex: 'POSITION',
							width: 160,
							editor: {
								allowBlank: false
							}
						},{
							text: 'Phone',
							dataIndex: 'PHONE',
							width: 120,
							editor: {
								allowBlank: true
							}
						},{
							text: 'Email',
							dataIndex: 'EMAIL',
							width: 150,
							editor: {
								allowBlank: true
							}
						},{
							text: 'Last Update',
							dataIndex: 'MODIFIED_DATE',
							flex: 1,
							align: 'center'
						}],
						tbar: [{
							xtype: 'button',
							text: 'Add New Key Person',
							listeners: {
								click: function() {
									var addKeyPerson = Ext.create('Ext.Window', {
										title: 'Add New Key Person',
										width: 400,
										height: 200,
										modal: true,
										xtype: 'form',
										layout: 'form',
										bodyPadding: '5 5 5 5',
										defaultType: 'textfield',
										resizable: false,
										items: [{
											fieldLabel: 'First Name',
											name: 'FNAME',
											allowBlank: false
										},{
											fieldLabel: 'Last Name',
											name: 'LNAME',
											allowBlank: false
										},{
											fieldLabel: 'Position',
											name: 'POSITION',
											allowBlank: false
										},{
											fieldLabel: 'Phone',
											name: 'PHONE'
										},{
											fieldLabel: 'Email',
											name: 'EMAIL'
										}],
										buttons: [{
											text: 'Save',
											listeners: {
												click: function() {
													alert('Sorry, this function is still under development.');
												}
											}
										},{
											text: 'Cancel',
											listeners: {
												click: function() {
													addKeyPerson.close();
												}
											}
										}]
									}).show();
								}
							}
						},{
							xtype: 'button',
							text: 'Sync',
							listeners: {
								click: function() {
									alert('Sorry, this function is still under development');
								}
							}
						}]
					}]
				}).show();
			}
		}
	}],
	columns: [{ 
		text: 'First Name',
		dataIndex: 'FNAME',
		width: 200
	},{
		text: 'Last Name',
		dataIndex: 'LNAME',
		width: 200
	},{
		text: 'Position',
		dataIndex: 'POSITION',
		width: 160
	},{
		text: 'Phone',
		dataIndex: 'PHONE',
		width: 120
	},{
		text: 'Email',
		dataIndex: 'EMAIL',
		width: 150
	},{
		text: 'Last Update',
		dataIndex: 'MODIFIED_DATE',
		flex: 1,
		align: 'center'
	}],
}