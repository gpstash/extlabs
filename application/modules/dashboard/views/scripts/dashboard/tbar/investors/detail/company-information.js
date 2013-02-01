{
	region: 'north',
	layout: 'border',
	border: false,
	closable: true,
	title: 'Company Information',
	height: 168,
	items: [{
		region: 'west',
		width: '50%',
		items: [{
			region: 'north',
			border: false,
			bodyPadding: '5 5 5 5',
			height: 90,
			autoScroll: true,
			title: 'Detail',
			html: '<table>' +
			'<tr><td style="font-weight:800;width: 250px">Equity Asset (MM)</td><td style="width:20px;text-align:center">:</td><td>' + d.EQUITY_ASSETS + '</td></tr>' +
			'<tr><td style="font-weight:800;width: 250px">Investor Type</td><td style="width:20px;text-align:center">:</td><td>' + d.INVESTOR_TYPE + '</td></tr>' +
			'<tr><td style="font-weight:800;width: 250px">Style</td><td style="width:20px;text-align:center">:</td><td>' + d.STYLE + '</td></tr>' +
			'<tr><td style="font-weight:800;width: 250px">Last Update</td><td style="width:20px;text-align:center">:</td><td>' + d.MODIFIED_DATE + '</td></tr>' +
			'</table>'
		},{
			region: 'north',
			border: false,
			title: 'Sector Holdings',
			autoScroll: true,
			tbar: [{
				xtype: 'button',
				text: 'View Sector Holding Chart',
				listeners: {
					click: function() {
						Ext.create('Ext.Window', {
							title: d.COMPANY_NAME + ' - Sector Holding',
							modal: true,
							resizable: false,
							items: [{
								xtype: 'chart',
								animate: true,
								store: store_pie,
								width: 700,
								height: 400,
								legend: {
									position: 'right'
								},
								theme: 'Base:gradients',
								series: [{
							    	type: 'pie',
							        field: 'population',
							        showInLegend: true,
							        donut: false,
							        tips: {
						                trackMouse: true,
						                width: 170,
						                height: 20,
						                renderer: function(storeItem, item) {
						                	var total = 0;
						                    store_pie.each(function(rec) {
						                        total += rec.get('population');
						                    });
						                    this.setTitle(storeItem.get('state') + ': ' + Math.round(storeItem.get('population') / total * 100) + '%');
						                }
					                },
					                highlight: {
					                 	segment: {
					                    	margin: 20
					                	}
					                },
							       	label: {
							        	field: 'state',
							        	display: 'rotate',
							        	contrast: true,
										font: '14px Arial'
							       }
							    }]
							}]
						}).show();
					}
				}
			},{
				xtype: 'button',
				text: 'Modify Sector Holding Data',
				listeners: {
					click: function() {
						var _x = Ext.create('Ext.Window', {
							title: d.COMPANY_NAME + ' - Sector Holding Data',
							width: 600,
							height: 400,
							resizable: false,
							modal: true,
							items: [{
								xtype: 'gridpanel',
								border: false,
								store: store_pie,
								plugins: [cellEditing],
								autoScroll: true,
								columns: [{
									text: 'Name',
									dataIndex: 'state',
									flex: 1,
									editor: {
										allowBlank: false
									}
								},{
									text: 'Value',
									width: 150,
									dataIndex: 'population',
									align: 'center',
									editor: {
										xtype: 'numberfield',
										minValue: 0,
										allowBlank: false,
										decimalPrecision: 2
									}
								}],
							}],
							tbar: [{
								xtype: 'button',
								text: 'Add New Data',
								listeners: {
									click: function() {
										var _x = Ext.create('Ext.Window', {
											title: 'Add New Sector Holding Data',
											resizable: false,
											width: 400,
											height: 130,
											modal: true,
											xtype: 'form',
											layout: 'form',
											bodyPadding: '5 5 5 5',
											defaultType: 'textfield',
											items: [{
												name: 'state',
												fieldLabel: 'Name',
												emptyText: 'Please input name',
												allowBlank: false
											},{
												name: 'population',
												fieldLabel: 'Value',
												xtype: 'numberfield',
												decimalPrecision: 2,
												minValue: 0,
												value: 0,
												allowBlank: false
											}],
											buttons: [{
												text: 'Save'
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
							},{
								xtype: 'button',
								text: 'Sync',
								listeners: {
									click: function() {
										alert('Sorry, this function is still under development');
									}
								}
							}],
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
			}]
		}]
	},{
		region: 'east',
		width: '50%',
		items: [{
			region: 'north',
			border: false,
			bodyPadding: '5 5 5 5',
			height: 90,
			autoScroll: true,
			title: 'Company Address',
			html: '<div style="width: 50%;float: left">' + d.ADDRESS + '<br/>' + d.LOCATION + '</div>' +
			'<div style="width:50%;float:right">' +
			'<table style="width: 100%">' +
			'<tr><td style="width: 90px;font-weight: 800">Phone 1</td><td style="width: 20px;text-align:center">:</td><td>' + d.PHONE_1 + '</td></tr>' +
			'<tr><td style="width: 90px;font-weight: 800">Phone 2</td><td style="width: 20px;text-align:center">:</td><td>' + d.PHONE_2 + '</td></tr>' +
			'<tr><td style="width: 90px;font-weight: 800">Fax</td><td style="width: 20px;text-align:center">:</td><td>' + d.FAX + '</td></tr>' +
			'<tr><td style="width: 90px;font-weight: 800">Website</td><td style="width: 20px;text-align:center">:</td><td>' + d.WEBSITE + '</td></tr>' +
			'</table>' +
			'</div>'
		},{
			region: 'north',
			border: false,
			title: 'Portfolio Distribution',
			autoScroll: true,
			closable: false,
			tbar: [{
				xtype: 'button',
				text: 'View Portfolio Distribution Chart',
				listeners: {
					click: function() {
						Ext.create('Ext.Window', {
							title: d.COMPANY_NAME + ' - Portfolio Distribution',
							modal: true,
							resizable: false,
							items: [{
								xtype: 'chart',
								animate: true,
								store: store_column,
								width: 700,
								height: 400,
								theme: 'Base:gradients',
								axes: [{
					                type: 'Numeric',
					                position: 'left',
					                fields: ['population'],
					                label: {
					                    renderer: Ext.util.Format.numberRenderer('0,0')
					                },
					                grid: true,
					                minimum: 0
					            }, {
					                type: 'Category',
					                position: 'bottom',
					                fields: ['state']
					            }],
								series: [{
							    	type: 'column',
							        field: 'population',
							        tips: {
						                trackMouse: true,
						                width: 70,
						                height: 20,
						                renderer: function(storeItem, item) {
						                    this.setTitle(storeItem.get('state') + ': ' + storeItem.get('population'));
						                }
					                },
							       	label: {
							        	display: 'insideEnd',
					                	'text-anchor': 'middle',
					                    field: 'state',
					                    renderer: Ext.util.Format.numberRenderer('0'),
					                    orientation: 'vertical',
					                    color: '#333'
							       	},
							      	xField: 'state',
									yField: 'population'
							    }]
							}]
						}).show();
					}
				}
			},{
				xtype: 'button',
				text: 'Modify Portfolio Distribution Data',
				listeners: {
					click: function() {
						var _x = Ext.create('Ext.Window', {
							title: d.COMPANY_NAME + ' - Portfolio Distribution Data',
							width: 600,
							height: 400,
							resizable: false,
							modal: true,
							items: [{
								xtype: 'gridpanel',
								border: false,
								store: store_column,
								plugins: [cellEditing],
								autoScroll: true,
								columns: [{
									text: 'Name',
									dataIndex: 'state',
									flex: 1,
									editor: {
										allowBlank: false
									}
								},{
									text: 'Value',
									width: 150,
									dataIndex: 'population',
									align: 'center',
									editor: {
										xtype: 'numberfield',
										minValue: 0,
										allowBlank: false,
										decimalPrecision: 2
									}
								}],
							}],
							tbar: [{
								xtype: 'button',
								text: 'Add New Data',
								listeners: {
									click: function() {
										var _x = Ext.create('Ext.Window', {
											title: 'Add New Portfolio Distribution Data',
											resizable: false,
											width: 400,
											height: 130,
											modal: true,
											xtype: 'form',
											layout: 'form',
											bodyPadding: '5 5 5 5',
											defaultType: 'textfield',
											items: [{
												name: 'state',
												fieldLabel: 'Name',
												emptyText: 'Please input name',
												allowBlank: false
											},{
												name: 'population',
												fieldLabel: 'Value',
												xtype: 'numberfield',
												decimalPrecision: 2,
												minValue: 0,
												value: 0,
												allowBlank: false
											}],
											buttons: [{
												text: 'Save'
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
							},{
								xtype: 'button',
								text: 'Sync',
								listeners: {
									click: function() {
										alert('Sorry, this function is still under development');
									}
								}
							}],
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
			}]
		}]
	}]
}