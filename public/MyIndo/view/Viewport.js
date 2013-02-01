Ext.define('MyIndo.view.Viewport', {

	extend: 'Ext.container.Viewport',
	id: 'main-viewport',
	layout: 'border',

	initComponent: function() {
		var me = this;
		Ext.apply(me, {
			items: [{
				xtype: 'box',
				region: 'north',
				id: 'header',
				html: '<h1>ExtJS LABS</h1>',
				padding: '5 5 5 5'
			},{
				region: 'west',
				id: 'west-panel',
				title: 'Main Menu',
				split: true,
				width: 250,
				collapsible: true,
				margins: '5 0 5 5',
				layout: 'accordion',
				layoutConfig: {
					animate: true
				}
			},{
				xtype: 'tabpanel',
				region: 'center',
				id: 'center-panel',
				margin: '5 5 5 0'
			}]
		});
		this.callParent(arguments);
	}
});