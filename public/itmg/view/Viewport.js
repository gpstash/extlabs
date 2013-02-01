/**
 * Viewport
 * Author : gilang.pratama.putra - PT MyIndo Cyber Media
 * Created Date : Janyary 3, 2013
 */
Ext.define('MyIndo.view.Viewport', {
	
	extend: 'Ext.Viewport',
	layout: 'border',

	initComponent: function() {

		Ext.apply(this, {
			items: [{
				xtype: 'box',
				region: 'north',
				id: 'header',
				html: '<h1>ITMG - Investor Relation Database System</h1>',
				height: 34
			},{
				region		 : 'west',
				id			 : 'west-panel',
				title   	 : 'Main Menu',
				split		 : true,
	            width		 : 250,
	            collapsible  : true,
	            margins		 : '5 0 5 5',
	            layout		 : 'accordion',
	            layoutConfig : {
	                animate  : true
	            },
	            dockedItems: [{
	            	xtype: 'toolbar',
	            	items: [{
	            		xtype: 'button',
	            		id: 'config-button',
	            		text: 'Configuration'
	            	}]
	            }]
			},{
				xtype: 'tabpanel',
				region: 'center',
				id: 'center-panel',
				margin: '5 5 5 0',
				items: [{
			        title: 'Home',
			        html: 'Home',
			        itemId: 'home',
			        margin: '5 5 5 5',
			        closable: true
			    }]
			}]
		});

		/*
		Ext.Ajax.request({
			url: '/dashboard/store/menus',
			params : {
				'type': 'menu'
			},
			success: function(d) {
				var panel = Ext.getCmp('west-panel');
				var data = Ext.decode(d.responseText).dataDetail;
				for(var i=0;i<data.menu.length;i++) {
					panel.add(Ext.create('MyIndo.view.' + data.menu[i].name + '.Panel'));
				}
			}
		});
		*/
		
		this.callParent(arguments);
		
	}
});