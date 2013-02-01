/**
 * Shareprices Panel View
 * Author : gilang.pratama.putra - PT MyIndo Cyber Media
 * Created Date : January 3, 2013
 */
Ext.define('MyIndo.view.shareprices.Panel', {

	extend: 'Ext.panel.Panel',
	alias: 'widget.sharepricesPanel',
	
	initComponent: function() {
		Ext.apply(this, {
			id: 'shareprices-tree-panel',
			rootVisible: false,
			autoscroll: true,
			title: 'Shareprices'
		});
		
		this.callParent(arguments);
	}
});