/**
 * Menus Store
 * Author : gilang.pratama.putra - PT MyIndo Cyber Media
 * Created date : January 10, 2013
 */
Ext.define('MyIndo.store.Menus',{
	extend: 'Ext.data.Store',
	model: 'MyIndo.model.Menu',
	autoLoad: true,
	proxy: {
		type: 'ajax',
		actionMethods: 'POST',
		url: '/dashboard/store/menus',
		extraParams: {
			'type': 'menu'
		},
		reader: {
			type: 'json',
			root: 'dataDetail.menu'
		}
	}
});