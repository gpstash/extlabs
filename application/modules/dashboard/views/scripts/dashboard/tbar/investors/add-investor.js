if(typeof(Ext.getCmp('add-new-investor-window')) == 'undefined') {
	var storeIT = Ext.data.StoreManager.lookup('InvestorTypes');
	var storeLoc = Ext.data.StoreManager.lookup('InvestorLocations');
	console.log(storeLoc);
	storeIT.pageSize = storeIT.totalCount;
	storeLoc.pageSize = storeLoc.totalCount;
	
	var x = Ext.create('Ext.Window',{
	    title : 'Add New Investor',
	    id: 'add-new-investor-window',
	    width : 650,
	    height: 500,
	    modal: true,
	    resizable: false,
	    xtype: 'form',
		layout: 'form',
		frame: true,
		bodyPadding: '5 5 5 5',
		closable: true,
		defaultType: 'textfield',
		autoScroll: true,
		items: [{
			fieldLabel: 'Company Name',
			name: 'COMPANY_NAME',
			allowBlank: false
		},{
			fieldLabel: 'Equity Asset',
			name: 'EQUITY_ASSET',
			xtype: 'numberfield',
			minValue: 0,
			allowBlank: false
		},{
			xtype: 'combobox',
			fieldLabel: 'Investor Type',
			name: 'INVESTOR_TYPE',
			labelWidth: 130,
			store: storeIT,
			displayField: 'INVESTOR_TYPE',
			typeAhead: true,
			allowBlank: false,
			emptyText: 'Select Investor Type'
		},{
			fieldLabel: 'Style',
			name: 'STYLE',
			allowBlank: false
		},{
			fieldLabel: 'Company Address',
			name: 'COMPANY_ADDRESS',
			xtype: 'htmleditor',
			height: 90
		},{
			fieldLabel: 'Location',
			name: 'LOCATION',
			xtype: 'combobox',
			displayField: 'LOCATION',
			store: storeLoc,
			typeAhead: true,
			allowBlank: false,
			emptyText: 'Select Location'
		},{
			fieldLabel: 'Phone Number #1',
			name: 'PHONE_1',
			labelWidth: 130
		},{
			fieldLabel: 'Phone Number #2',
			name: 'PHONE_2',
			labelWidth: 130,
		},{
			fieldLabel: 'Fax',
			name: 'FAX'
		},{
			fieldLabel: 'Email #1',
			name: 'EMAIL_1'
		},{
			fieldLabel: 'Email #2',
			name: 'EMAIL_2'
		},{
			fieldLabel: 'Company Overview',
			name: 'COMPANY_OVERVIEW',
			xtype: 'htmleditor',
			height: 90
		},{
			fieldLabel: 'Investment Strategy',
			name: 'INVESTMENT_STRATEGY',
			xtype: 'htmleditor',
			height: 90
		}],
		buttons: [{
			text: 'Save',
			listeners: {
				click: function() {
					alert('Sorry, this function is still under development.');
				}
			}
		},{
			text: 'Cancel',
			listeners: {
				click: function() {
					x.close();
				}
			}
		}]
	}).show();
}