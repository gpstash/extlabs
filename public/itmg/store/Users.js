Ext.define('MyIndo.store.Users',{
	extend: 'Ext.data.Store',
	model: 'MyIndo.model.User',
	proxy: {
		type: 'ajax',
		actionMethods: 'POST',
		url: '/dashboard/store/users',
		reader: {
			type: 'json',
			root: 'dataDetail.userLists'
		}
	}
});