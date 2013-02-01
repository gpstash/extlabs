Ext.define('MyIndo.store.Investors',{
	extend: 'Ext.data.Store',
	model: 'MyIndo.model.Investor',
	proxy: {
		type: 'ajax',
		actionMethods: 'POST',
		url: '/dashboard/store/investors',
		extraParams: {
			'type': 'managements'
		},
		reader: {
			type: 'json',
			root: 'dataDetail'
		}
	}
});