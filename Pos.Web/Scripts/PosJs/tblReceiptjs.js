jQuery.fn.dataTable.Api.register('row.addByPos()', function (data, index) {
    var currentPage = this.page();

    //insert the row
    this.row.add(data);

    //move added row to desired index
    var rowCount = this.data().length - 1,
        insertedRow = this.row(rowCount).data(),
        tempRow;

    for (var i = rowCount; i >= index; i--) {
        tempRow = this.row(i - 1).data();// to do table changed to this
        this.row(i).data(tempRow);
        this.row(i - 1).data(insertedRow);
    }

    //refresh the current page
    this.page(currentPage).draw(false);
});

jQuery.fn.dataTable.Api.register('row.deleteByPos()', function (data, index) {
    var currentPage = this.page();

    //insert the row
    

    //move added row to desired index
    var rowCount = this.data().length - 1,
        insertedRow = this.row(rowCount).data(),
        tempRow;

    for (var i = rowCount; i >= index; i--) {
        tempRow = this.row(i - 1).data();// to do table changed to this
        this.row(i).remove ();
        
    }

    //refresh the current page
    this.page(currentPage).draw(false);
});
$('#tblreceiptId').dataTable({
    'bSort': false,
    'aoColumns': [
          { sWidth: "60%", bSearchable: false, bSortable: false },
          { sWidth: "40%", bSearchable: false, bSortable: false },

    ],
    "scrollY": "400px",
    "scrollCollapse": true,
    "info": true,
    "paging": false,
    "searching": false,
    "showNEntries": false,
    "bInfo": false,
    "sEmptyTable": "",
    "bStateSave": true,
    "createdRow": function (row, data, dataIndex) {

        $("#divreceiptID").show();
        //$('td:eq(0)', row ).append("<div class='col1d'><button class='editBut'>Shikur</button></div>");
    },
    buttons: [{ extend: 'copy', text: 'Copy to clipboard' }]
});