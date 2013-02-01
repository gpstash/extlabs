/**
 * Investors Panel View
 * Author : gilang.pratama.putra - PT MyIndo Cyber Media
 * Created Date : January 3, 2013
 */
Ext.define('MyIndo.view.investors.Panel', {
	
	extend: 'Ext.tree.Panel',
	alias: 'widget.investorsPanel',

	initComponent: function() {

		var store = Ext.create('Ext.data.TreeStore', {
			root: {
				expanded: true
			},
			proxy: {
				type: 'ajax',
				actionMethods: 'POST',
				url: '/dashboard/store/trees',
				extraParams: {
					'type': 'investors'
				}
			}
		});

		Ext.apply(this, {
			id: 'investors-tree-panel',
			rootVisible: false,
			autoscroll: true,
			title: 'Investors',
			store: store
		});
		
		this.callParent(arguments);
	}
});