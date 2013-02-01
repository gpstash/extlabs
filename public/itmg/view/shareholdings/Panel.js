/**
 * Shareholdings Panel View
 * Author : gilang.pratama.putra - PT MyIndo Cyber Media
 * Created Date : January 3, 2013
 */
Ext.define('MyIndo.view.shareholdings.Panel', {

	extend: 'Ext.panel.Panel',
	alias: 'widget.shareholdingsPanel',
	
	initComponent: function() {
		Ext.apply(this, {
			id: 'shareholdings-tree-panel',
			rootVisible: false,
			autoscroll: true,
			title: 'Shareholdings'
		});
		
		this.callParent(arguments);
	}
});