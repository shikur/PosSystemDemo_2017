$(document).ready(function () {
    var subTotal = 0;
    var tax = 0;
    var total = 0;
    var chageDue = 0;
    var countItems = 0;

    $.ajax({
        type: "POST",
        dataType: "json",
        url: "RequestHandlers/ItemService.svc/GetItems",
        success: function (data) {
            debugger;
            var dataSource = $.parseJSON(data.d);
            var table = $('#tblMenuSearchId').dataTable({
                data: dataSource,
                sorting: false,
                'bSort': false,
                paging: false,
                "showNEntries": false,
                "bInfo": false,
                columns: [
                    { 'data': 'Description' },
                    { 'data': 'Price' }
                ]
            
            });
        }
    });
        
            function GetPosMenu() {

                var table = $('#tblMenuSearchId').dataTable({
                    data: dataSource,
                    sorting: false,
                    paging: false,
                    "showNEntries": false,
                    "bInfo": false,
                    columns: [
                        { 'data': 'Description' },
                        { 'data': 'Price' }
                    ]
                });
            }
        

      //  });

            $('#tblMenuSearchId tbody').on('click', 'tr', function () {

                //  k = k + 1

                var table = $('#tblMenuSearchId').DataTable();
                $('#tblreceiptId').show();
                $('#tblPosMenuID').show();

                var data = table.row($(this)).data();
                var t = $('#tblreceiptId').DataTable();

                //Caluclate and setting up.
                countItems = countItems + 1
                subTotal = subTotal + data.Price;
                tax = tax + data.Price * 0.05;
                total = tax + subTotal;

                var pos = table.length + countItems;
                t.row.addByPos([data.Items_ID + "." + data.Description, "$" + data.Price], pos);
                t.row.addByPos(["SubTotal", "$" + subTotal.toFixed(2)], pos + 1);
                t.row.addByPos(["&nbsp;&nbsp;Tax", "$" + tax.toFixed(2)], pos + 2);
                t.row.addByPos(["Total", "$" + total.toFixed(2)], pos + 3);
                t.row.deleteByPos(["Total", total], pos + 3);
            });
    });