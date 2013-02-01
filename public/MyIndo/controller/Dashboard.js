Ext.define('MyIndo.controller.Dashboard', {
	extend: 'Ext.app.Controller',
	
	init: function() {

		var me = this;
		Ext.QuickTips.init();
		this.control({
			'#west-panel': {
				//render: me.onPanelRendered
			}
		});
		
		Ext.define('sharedData', {
			singleton: true,
			activeItems: [],
			count: 0,
			defaultMinHeightValue: 62,
			baseUrl: 'http://itmg.local',
			tbar: []
		});
		
		Ext.EventManager.onWindowResize(function() {

			Ext.each(sharedData.activeItems, function(data, index) {
				var _p = Ext.getCmp(data);
				if(typeof(_p) == 'object') {
					_p.height = Ext.getBody().getViewSize().height - sharedData.defaultMinHeightValue;
				}
			});
		});
	},

	onPanelRendered: function() {
		
		var me = this;
		var panel = Ext.getCmp('west-panel');
		var container = Ext.getCmp('center-panel');
		
		Ext.Ajax.request({
			url: sharedData.baseUrl + '/dashboard/request/tree-panel',
			params: {
				type: 'tree-panel'
			},
			success: function(data) {
				
				var obj = Ext.JSON.decode(data.responseText);
				Ext.each(obj.data.items, function(content) {
					

					// Load Tree Store :
					Ext.Ajax.request({
						url: sharedData.baseUrl + '/dashboard/request/tree-store',
						params: {
							id: content.id
						},
						success: function(_data) {
							
							var _obj = Ext.JSON.decode(_data.responseText);
							
							// Add Store to content : 
							content.store = Ext.create('Ext.data.TreeStore', _obj.data.items);
							
							// Listeners :
							content.listeners = {
								itemClick: function(view, records, item, index, eventObj) {
									if(records.isLeaf()) {
										if(!container.items.get(records.data.id + '-tabs')) {
											container.add(Ext.create('Ext.panel.Panel', {
												title: records.data.text,
												closable: true,
												id: records.data.id + '-tabs',
												border: false
											}));
											
											// Tab Content :
											var tabContent = Ext.getCmp(records.data.id + '-tabs');
											
											// Get Tab Content :
											Ext.Ajax.request({
												url: sharedData.baseUrl + '/dashboard/request/tab-content',
												params: {
													id: records.data.id
												},
												success: function(__xdata) {
													
													var __xobj = Ext.decode(__xdata.responseText);
												
													// Define Models :
													Ext.each(__xobj.data.models, function(_m){

														Ext.define(_m.modelName, {
															extend: 'Ext.data.Model',
															fields: _m.fields
														});
														
														// Define Store :
														Ext.create('Ext.data.Store', {
															pageSize: 15,
															model: _m.modelName,
															storeId: _m.store.storeName,
															proxy: _m.store.proxy,
															sorters: _m.store.sorters,
															autoDestroy: false,
															autoLoad: true
														});
														
													});
													
													// Reset active items :
													sharedData.activeItems = new Array();
													sharedData.count = 0;
													
													Ext.each(__xobj.data.items, function(_i, index) {
														
														var temp = _i.store;
														__xobj.data.items[index].store = Ext.data.StoreManager.lookup(temp);
														__xobj.data.items[index].height = Ext.getBody().getViewSize().height - sharedData.defaultMinHeightValue;
														
														// Store active items :
														sharedData.activeItems[sharedData.count] = _i.id;
														sharedData.count++;
														
														// Add function to tbar button :
														if(_i.tbar.length > 0) {
															Ext.each(_i.tbar, function(_tbar,_tbarIdx) {
																__xobj.data.items[index].tbar[_tbarIdx].listeners = {
																	click: function() {

																		var loading_panel = Ext.create('Ext.Window', {
																			title: 'Message',
																			html: '<p>&nbsp;</p><p style="text-align:center">Loading data, please wait..</p>',
																			width: 260,
																			height: 86,
																			modal: true,
																			closable: false,
																			bodyPadding: '5 5 5 5'
																		}).show();

																		Ext.Ajax.request({
																			url: sharedData.baseUrl + '/dashboard/request/get-tbar-listener',
																			params: {
																				id: _tbar.id
																			},
																			success: function(_tbarData) {
																				loading_panel.close();
																				var __objTbar = Ext.decode(_tbarData.responseText);
																				eval(__objTbar.data.listener);
																			}
																		});
																	}
																};
															});
														}
														
														if(__xobj.data.items[index].xtype == 'gridpanel') {
															
															// Bottom Bar Panel Init :
															var comboBbar = new Ext.form.ComboBox({
															  name : 'perpage',
															  width: 50,
															  store: new Ext.data.ArrayStore({fields:['id'],data:[['15'],['25'],['50']]}),
															  mode : 'local',
															  value: '15',
															  listWidth     : 40,
															  triggerAction : 'all',
															  displayField  : 'id',
															  valueField    : 'id',
															  editable      : false,
															  forceSelection: true
															});
															
															var bbar = new Ext.PagingToolbar({
																store: Ext.data.StoreManager.lookup(temp),
																displayInfo: true,
																displayMsg: 'Displaying data {0} - {1} of {2}',
																emptyMsg: 'No data to display',
																items: [
																    '-',
																    'Records per page',
																    '-',
																    comboBbar
																]
															});
															
															comboBbar.on('select', function(combo, _records) {
																var _store = Ext.data.StoreManager.lookup(temp);
																_store.pageSize = parseInt(_records[0].get('id'), 10);
																_store.loadPage(1);
															}, this);
															
															// Bottom Bar :
															__xobj.data.items[index].bbar = bbar;
															

															// Cell editing plugin :
															var cellEditing = Ext.create('Ext.grid.plugin.RowEditing', {
																clicksToMoveEditor: 1,
														        autoCancel: false
														    });
															__xobj.data.items[index].plugins = [cellEditing];
															
															// Update columns[for live cell data editing]
															Ext.each(_i.columns, function(_col, _colIdx) {
																if(_col.editable) {
																	if(_col.dataType == 'string') {
																		__xobj.data.items[index].columns[_colIdx].editor = {
																			allowBlank: false
																		};
																	} else if(_col.dataType == 'int') {
																		__xobj.data.items[index].columns[_colIdx].editor = {
																			xtype: 'numberfield',
																			allowBlank: false,
																			minValue: 0
																		};
																	} else if(_col.dataType == 'combobox') {
																		
																		// Define Model :
																		Ext.define(_col.model.modelName, {
																			extend: 'Ext.data.Model',
																			fields: _col.model.fields
																		});
																		
																		// Define Store :
																		Ext.create('Ext.data.Store', {
																			pageSize: 100,
																			model: _col.model.modelName,
																			storeId: _col.store.storeName,
																			proxy: _col.store.proxy,
																			sorters: _col.store.sorters,
																			autoDestroy: false,
																			autoLoad: true
																		});
																		
																		__xobj.data.items[index].columns[_colIdx].editor = new Ext.form.field.ComboBox({
																			displayField: _col.displayField,
																		    width: 500,
																		    labelWidth: 130,
																		    store: Ext.data.StoreManager.lookup(_col.store.storeName),
																		    typeAhead: true,
																		    editable: false
																		});
																		
																	}
																}
															});
															
														}
													});
													
													//console.log(__xobj.data.items);
													tabContent.add(Ext.create('Ext.panel.Panel'), {
														border: false,
														layout: 'fit',
														autoScroll: true,
														items: __xobj.data.items
													});
														
												}
											});
										}
										container.setActiveTab(records.data.id + '-tabs');
									}
								}
							};
							
							// Add to panel :
							panel.add(Ext.create('Ext.tree.Panel', content));
							
						}
					});
				});
			}
		});
	},
	
	onTbarButtonClicked: function() {
		console.log('abc');
	}
});