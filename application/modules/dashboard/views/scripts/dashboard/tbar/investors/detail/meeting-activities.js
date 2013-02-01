{
	xtype: 'gridpanel',
	region: 'north',
	closable: true,
	height: 110,
	id: 'meeting-activities-small',
	title: 'Meeting Activities',
	store: store_meetingActivities,
	columns: [{
		text: 'Meeting Activity Name',
		dataIndex: 'MEETING_ACTIVITY_NAME',
		flex: 1
	},{
		text: 'Meeting Date',
		dataIndex: 'MEETING_DATE',
		width: 100,
		align: 'center'
	}],
	tbar: [{
		xtype: 'button',
		text: 'Add Meeting Activity',
		listeners: {
			click: function() {
				var addMeetingActivities = Ext.create('Ext.Window', {
					title: 'Add New Meeting Activity',
					width: 400,
					height: 130,
					modal: true,
					xtype: 'form',
					layout: 'form',
					bodyPadding: '5 5 5 5',
					defaultType: 'textfield',
					resizable: false,
					items: [{
						fieldLabel: 'Meeting Name',
						name: 'MEETING_ACTIVITY_NAME',
						allowBlank: false
					},{
						fieldLabel: 'Meeting Date',
						name: 'MEETING_DATE',
						allowBlank: false,
						xtype: 'datefield',
						format: 'Y/m/d'
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
								addMeetingActivities.close();
							}
						}
					}]
				}).show();
			}
		}
	},/*{
		xtype: 'button',
		text: 'View Detail',
		listeners: {
			click: function() {
				var _cObj = Ext.getCmp('meeting-activities-small');
				var dtSel = _cObj.getSelectionModel().getSelection();
				if(dtSel.length > 0) {

				} else {
					var _x = Ext.create('Ext.Window', {
						title: 'Message',
						html: '<p>&nbsp;</p><p style="text-align:center">You did not select any Meeting Activity</p>',
						width: 260,
						height: 120,
						modal: true,
						bodyPadding: '5 5 5 5',
						buttons: [{
							text: 'Close',
							listeners: {
								click: function() {
									_x.close();
								}
							}
						}]
					}).show();
				}
			}
		}
	},*/{
		xtype: 'button',
		text: 'View In New Window',
		listeners: {
			click: function() {
				Ext.create('Ext.Window', {
					title: d.COMPANY_NAME + ' - Meeting Activities',
					width: 1000,
					minHeight: 100,
					maxHeight: 500,
					modal: true,
					resizable: false,
					items: [{
						xtype: 'gridpanel',
						border: false,
						store: store_meetingActivities,
						autoScroll: true,
						minheight: 100,
						plugins: [cellEditing],
						id: 'meeting-activities-large-window',
						columns: [{
							text: 'Meeting ID',
							width: 100,
							dataIndex: 'MEETING_ACTIVITY_ID',
							align: 'center'
						},{
							text: 'Meeting Activity Name',
							dataIndex: 'MEETING_ACTIVITY_NAME',
							flex: 1,
							editor: {
								allowBlank: false
							}
						},{
							text: 'Meeting Date',
							dataIndex: 'MEETING_DATE',
							width: 100,
							align: 'center',
							editor: {
								allowBlank: false,
								xtype: 'datefield',
								format: 'Y/m/d'
							}
						}],
						tbar: [{
							xtype: 'button',
							text: 'Add Meeting Activity',
							listeners: {
								click: function() {
									var addMeetingActivities = Ext.create('Ext.Window', {
										title: 'Add New Meeting Activity',
										width: 400,
										height: 130,
										modal: true,
										xtype: 'form',
										layout: 'form',
										bodyPadding: '5 5 5 5',
										defaultType: 'textfield',
										resizable: false,
										items: [{
											fieldLabel: 'Meeting Name',
											name: 'MEETING_ACTIVITY_NAME',
											allowBlank: false
										},{
											fieldLabel: 'Meeting Date',
											name: 'MEETING_DATE',
											allowBlank: false,
											xtype: 'datefield',
											format: 'Y/m/d'
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
													addMeetingActivities.close();
												}
											}
										}]
									}).show();
								}
							}
						},{
							xtype: 'button',
							text: 'View Detail',
							listeners: {
								click: function() {
									var _cObj = Ext.getCmp('meeting-activities-large-window');
									var dtSel = _cObj.getSelectionModel().getSelection();

									if(dtSel.length > 0) {

										var mAttendances = Ext.create('Ext.data.Store', {
											model: 'KeyPerson',
											proxy: {
												type: 'ajax',
												url: sharedData.baseUrl + '/investors/request/get-meeting-attendances',
												reader: {
													type: 'json',
													root: 'data.items'
												},
												actionMethods: {
											        create: 'POST', read: 'POST', update: 'POST', destroy: 'POST'
											    }
											}
										});

										// Meeting Documents 
										Ext.define('MeetingDocument', {
											extend: 'Ext.data.Model',
											fields: [{
												name: 'MEETING_ACTIVITY_DOCUMENT_ID',
												type: 'int'
											},{
												name: 'DOCUMENT_TITLE',
												type: 'string'
											},{
												name: 'FILE_NAME',
												type: 'string'
											},{
												name: 'SIZE',
												type: 'int'
											},{
												name: 'CREATED_DATE',
												type: 'string'
											}]
										});

										var store_doc = Ext.create('Ext.data.Store', {
											model: 'MeetingDocument',
											proxy: {
												type: 'ajax',
												url: sharedData.baseUrl + '/investors/request/get-meeting-documents',
												reader: {
													type: 'json',
													root: 'data.items'
												},
												actionMethods: {
													create: 'POST', read: 'POST', update: 'POST', destroy: 'POST'
												}
											}
										});
										
										var bbar = new Ext.PagingToolbar({
											store: mAttendances,
											displayInfo: true,
											displayMsg: 'Displaying data {0} - {1} of {2}',
											emptyMsg: 'No data to display'
										});

										var bbar2 = new Ext.PagingToolbar({
											store: store_doc,
											displayInfo: true,
											displayMsg: 'Displaying data {0} - {1} of {2}',
											emptyMsg: 'No data to display'
										});

										mAttendances.load({
											params: {
												id: dtSel[0].data.MEETING_ACTIVITY_ID
											}
										});

										store_doc.load({
											params: {
												id: dtSel[0].data.MEETING_ACTIVITY_ID
											}
										});

										Ext.create('Ext.Window', {
											title: dtSel[0].data.MEETING_ACTIVITY_NAME + ' - Detail',
											modal: true,
											resizable: false,
											width: 1000,
											height: 520,
											xtype: 'panel',
											layout: 'border',
											autoScroll: true,
											items: [{
												region: 'north',
												title: 'Meeting Attendances',
												xtype: 'gridpanel',
												border: false,
												height: 248,
												store: mAttendances,
												bbar: bbar,
												columns: [{ 
													text: 'First Name',
													dataIndex: 'FNAME',
													width: 240
												},{
													text: 'Last Name',
													dataIndex: 'LNAME',
													width: 240,
												},{
													text: 'Position',
													dataIndex: 'POSITION',
													width: 238
												},{
													text: 'Phone',
													dataIndex: 'PHONE',
													width: 120
												},{
													text: 'Email',
													dataIndex: 'EMAIL',
													width: 150
												}],
												tbar: [{
													xtype: 'button',
													text: 'Add Meeting Attendance',
													listeners: {
														click: function() {

															var _x = Ext.create('Ext.Window', {
																title: dtSel[0].data.MEETING_ACTIVITY_NAME + ' - Add Meeting Attendance',
																width: 400,
																height: 100,
																modal: true,
																resizable: false,
																xtype: 'form',
																layout: 'form',
																bodyPadding: '5 5 5 5',
																items: [{
																	xtype: 'combobox',
																	displayField: 'FULLNAME',
																	emptyText: 'Select name',
																	labelWidth: 130,
																	fieldLabel: 'Name',
																	typeAhead: true,
																	store: store_keyPersons
																}],
																buttons: [{
																	text: 'Save',
																	listeners: {
																		click: function() {
																			alert('Sorry, this function is still under development');
																		}
																	}
																},{
																	text: 'Close',
																	listeners: {
																		click: function() {
																			_x.close();
																		}
																	}
																}]
															}).show();

														}
													}
												}]
											},{
												region: 'north',
												title: 'Meeting Documents',
												xtype: 'gridpanel',
												border: false,
												height: 240,
												store: store_doc,
												bbar: bbar2,
												columns: [{ 
													text: 'Document Title',
													dataIndex: 'DOCUMENT_TITLE',
													flex: 1
												},{
													text: 'File Name',
													dataIndex: 'FILE_NAME',
													width: 240,
												},{
													text: 'Size',
													dataIndex: 'SIZE',
													width: 120,
													align: 'center'
												},{
													text: 'Uploaded Date',
													dataIndex: 'CREATED_DATE',
													width: 120,
													align: 'center'
												}],
												tbar: [{
													xtype: 'button',
													text: 'Upload Document',
													listeners: {
														click: function() {
															var _x = Ext.create('Ext.Window',{
															    title : 'Upload Document',
															    width : 350,
															    height: 100,
															    modal: true,
															    resizable: false,
															    xtype: 'form',
																layout: 'form',
																frame: true,
																bodyPadding: '5 5 5 5',
																closable: true,
																defaultType: 'textfield',
																autoScroll: true,
																items: [{
																	xtype: 'fileuploadfield',
														            id: 'filedata',
														            emptyText: 'Select a document to upload...',
														            fieldLabel: 'File',
														            buttonText: 'Browse',
														            labelWidth: 30,
														            allowBlank: false
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
																			_x.close();
																		}
																	}
																}]
															}).show();
														}
													}
												}]
											}]
										}).show();

									} else {
										var _x = Ext.create('Ext.Window', {
											title: 'Message',
											html: '<p>&nbsp;</p><p style="text-align:center">You did not select any Meeting Activity</p>',
											width: 260,
											height: 120,
											modal: true,
											bodyPadding: '5 5 5 5',
											buttons: [{
												text: 'Close',
												listeners: {
													click: function() {
														_x.close();
													}
												}
											}]
										}).show();
									}
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
	}]
}