/**
 * Menu Model
 * Author : gilang.pratama.putra - PT MyIndo Cyber Media
 * Created date : January 10, 2013
 */
Ext.define('MyIndo.model.Menu',{
	extend: 'Ext.data.Model',
	fields: [
		{name:'title',  type: 'string'},
		{name:'name',   type: 'string'}
	],/*,
	proxy: {
		type: 'ajax',
		actionMethods: 'POST',
		url: '/dashboard/store/menus',
		extraParams: {
			'type': 'menu'
		},
		reader: {
			type: 'json',
			record: 'dataDetail'
		}
	}
	*/
});