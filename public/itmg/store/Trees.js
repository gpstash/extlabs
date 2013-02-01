Ext.define('MyIndo.store.Trees', {
	extend: 'Ext.data.Store',
	model: 'MyIndo.model.Tree',
	proxy: {
		type: 'ajax',
		actionMethods: 'POST',
		url: '/dashboard/store/trees',
		reader: {
			type: 'json',
			root: 'dataDetail'
		}
	}
});