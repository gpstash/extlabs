/**
 * Peers Panel View
 * Author : gilang.pratama.putra - PT MyIndo Cyber Media
 * Created Date : January 3, 2013
 */
Ext.define('MyIndo.view.peers.Panel', {

	extend: 'Ext.panel.Panel',
	alias: 'widget.peersPanel',
	
	initComponent: function() {

		Ext.apply(this, {
			id: 'peers-tree-panel',
			rootVisible: false,
			autoscroll: true,
			title: 'Peers'
		}); 
		
		this.callParent(arguments);
	}
});