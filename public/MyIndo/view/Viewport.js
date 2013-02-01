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
				cls : 'headerbg',
				html: '<div class="logo"><img src="/image/logo.png" /></div><div class="adminNav">'+
					'<ul>'+
						'<li>Welcome, Administrator | </li>'+
						'<li><a href="#"><img src="image/logout.png"/> Logout</a></li>'+
					'</ul>'+
					'</div>',
				height: 124,
				padding: '0 0 5 5'
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