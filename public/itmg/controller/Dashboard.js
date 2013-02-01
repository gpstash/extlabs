/**
 * Dashboard Controller
 * Author : gilang.pratama.putra - PT MyIndo Cyber Media
 * Created date : January 3, 2013
 */

Ext.define('MyIndo.controller.Dashboard', {
	
	extend : 'Ext.app.Controller',

	stores: ['Menus','Trees'],

	models: ['Menu','Tree'],

	init: function() {
		var me = this;
		var gilang = 'here i am';

		this.getMenusStore().on({
			scope : me,
			load : me.onMenusStoreLoad
		});

		this.control({
			'investorsPanel': {
				scope: me,
				//selectionchange: me.onInvestorsPanelChange,
				itemclick: me.onInvestorsClick
			}
		});
	},

	onInvestorsClick: function(view, records, item, index, eventObj) {
		var mainPanel = Ext.getCmp('center-panel');
		//console.log(records);
		if(records.data.leaf) {
			if(!mainPanel.items.get(records.data.id + '-tabs')) {
				mainPanel.add({
					title: records.data.text,
					id: records.data.id + '-tabs',
					closable: true
				});
				this.getContent(records.data.id);
			}
			mainPanel.setActiveTab(records.data.id + '-tabs'); // activate tabs
		}
		//console.log(records);
	},

	getContent: function(id) {
		Ext.Ajax.request({
			url: '/dashboard/store/investors',
			params: {
				id: id
			},
			success: function(data) {
				var json = Ext.JSON.decode(data.responseText);
				var container = Ext.getCmp(id + '-tabs');
			}
		});
	},

	/*
	onInvestorsPanelChange: function(view, records) {
		var mainPanel = Ext.getCmp('center-panel');
		console.log(mainPanel);
		//console.log(mainPanel.items);
		if(records[0].data.leaf) {
			if(!mainPanel.items.get(records[0].data.id + '-tabs')) {
				mainPanel.add(Ext.create('Ext.tab.Panel', {
					title: records[0].data.text,
					id: records[0].data.id + '-tabs',
					closable: true,
					html: 'Tab Content bla bla <br/><br/>' + records[0].data.id + '-tabs'
				}));
			}

			mainPanel.setActiveTab(records[0].data.id + '-tabs'); // activate tabs

			//console.log(mainPanel.items.get(records[0].data.id + '-tabs'));
			//console.log(records[0].data);
		}
		//console.log(records[0].data);
		//invPanel.getSelectionModel().on('select', function(selModel, record) {
	    //    if(record.get('leaf')) {
	    //    	
	    //    }
	    //});
	},
	*/

	loadTree: function(params) {
		var store = Ext.create('Ext.data.TreeStore', {
			root: {
				expanded: true
			},
			proxy: {
				type: 'ajax',
				url: '/dashboard/store/trees'
			}
		});
	},

	onMenusStoreLoad: function(store, records) {
		//console.log(store.data);
		//console.log(store.data.items[0].data.name);
		var panel = Ext.getCmp('west-panel');
		var me = this;
		Ext.each(store.data.items,function(value) {
			//console.log(value.data.name);
			panel.add(Ext.create('MyIndo.view.' + value.data.name + '.Panel'));
			//me.loadTree(value.data.name);
		});
	},
});