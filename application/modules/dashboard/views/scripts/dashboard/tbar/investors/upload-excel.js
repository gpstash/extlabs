if(typeof(Ext.getCmp('upload-excel-window')) == 'undefined') {

	var x = Ext.create('Ext.Window',{
	    title : 'Upload Excel',
	    id: 'upload-excel-window',
	    width : 350,
	    height: 100,
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
			xtype: 'fileuploadfield',
            id: 'filedata',
            emptyText: 'Select a document to upload...',
            fieldLabel: 'File',
            buttonText: 'Browse',
            labelWidth: 30,
            allowBlank: false
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
	
} else {
	console.log(Ext.getCmp('upload-excel-window'));
}