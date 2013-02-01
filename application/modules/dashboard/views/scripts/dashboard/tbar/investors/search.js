if(typeof(Ext.getCmp('search-investor-window')) == 'undefined') {
	var store = Ext.data.StoreManager.lookup('Investors');
	var storeIT = Ext.data.StoreManager.lookup('InvestorTypes');
	var storeLoc = Ext.data.StoreManager.lookup('InvestorLocations');
	
	store.pageSize = store.totalCount;
	storeIT.pageSize = storeIT.totalCount;
	storeLoc.pageSize = storeLoc.totalCount;
	
	var x = Ext.create('Ext.Window',{
	    title : 'Search Investor',
	    id: 'search-investor-window',
	    width : 400,
	    height: 230,
	    modal: true,
	    resizable: false,
	    xtype: 'form',
		layout: 'form',
		frame: true,
		bodyPadding: '5 5 5 5',
		closable: true,
		defaultType: 'textfield',
		items: [{
			xtype: 'combobox',
			emptyText: 'ALL',
			fieldLabel: 'Company Name',
			name: 'COMPANY_NAME',
			labelWidth: 130,
			store: store,
			displayField: 'COMPANY_NAME',
			typeAhead: true
		},{
			xtype: 'combobox',
			emptyText: 'ALL',
			fieldLabel: 'Investor Type',
			name: 'INVESTOR_TYPE',
			labelWidth: 130,
			store: storeIT,
			displayField: 'INVESTOR_TYPE',
			typeAhead: true
		},{
			xtype: 'combobox',
			emptyText: 'ALL',
			fieldLabel: 'Location',
			name: 'LOCATION',
			labelWidth: 130,
			store: storeLoc,
			displayField: 'LOCATION',
			typeAhead: true
		},{
			xtype: 'combobox',
			emptyText: 'ALL',
			fieldLabel: 'Contact Person',
			name: 'CONTACT_PERSON_NAME',
			labelWidth: 130,
			store: [
			   ['Mr. A','Mr. A'],
			   ['Mr. B','Mr. B'],
			   ['Mr. C','Mr. C']
			],
			typeAhead: true
		},{
			xtype: 'combobox',
			emptyText: 'ALL',
			fieldLabel: 'Equity Asset',
			name: 'EQUITY_ASSET',
			labelWidth: 130,
			store: [
                ['Small','Small'],
                ['Medium','Medium'],
                ['Large','Large']
            ],
            editable: false
		},{
			xtype: 'combobox',
			emptyText: 'Please choose one',
			fieldLabel: 'Format',
			name: 'FORMAT',
			labelWidth: 130,
			store: [
			   ['List','List'],
			   ['Detail','Detail']
			],
			allowBlank: false,
			editable: false
		}],
		buttons: [{
			text: 'Search',
			listeners: {
				click: function() {
					alert('Sorry, this function is still under development.');
				}
			}
		},{
			text: 'Cancel',
			listeners : {
				click: function() {
					x.close();
				}
			}
		}]
	}).show();
}