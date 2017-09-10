$(function () {
    //Global variables
    var Type; var Url; var Data; var ContentType;
    var DataType; var ProcessData; var selectedMenu; var isMenuPosCreated = 0;
    var columns ;
    var sourceData;

    //Create init setting env 
    $("#divreceiptID").hide(); $('#menuPosTitleId').hide();
    PopulatePosMenu(false, "tblPosMenuID");
    //PosGetItems();
    $('.posbgColor').on('click', 'td', function (e) {
        e.preventDefault();

        menuSelected = $(this).closest('tr').find('td:eq(0)').text();
        if (menuSelected == "POS") {

            if (isMenuPosCreated == 0) {
                PopulatePosMenu(true, "tblPosMenuID");
            }
            $('#menuID').show(); $('#menuPosTitleId').show();
            menuPosTitleId
            $(this).closest('tr').find('td:eq(0)').text("Hide");
            isMenuPosCreated = 1;
        }
        else {

            $('#menuID').hide(); $('#menuPosTitleId').hide();
            $(this).closest('tr').find('td:eq(0)').text("POS");
        }


    });
   
    function Menu(menuType) {
        debugger;
        Type = "POST";
        Url = "RequestHandlers/PosMenuService.svc/GetMenuColumns";
        Data = '{"menu": "' + menuType + '"}';
        ContentType = "application/json; charset=utf-8";
        DataType = "json"; varProcessData = true;
       return MenuService("menu");
    }
    function GetPosTableData(menuType) {
        debugger;
        Type = "POST";
        Url = "RequestHandlers/PosMenuService.svc/GetTableData";
        Data = '{"menu": "' + menuType + '"}';
        ContentType = "application/json; charset=utf-8";
        DataType = "json"; varProcessData = true;
       return MenuService("posTableData");
    }
    function PopulatePosMenu(isPosMenuVisible, tblId) {
        if (tblId)
        { tblId = "#" + tblId; }
        if (isPosMenuVisible) {
            var posMenuData = '[{"PosCommandName":"Orders"},{"PosCommandName":"Employee"},{"PosCommandName":"Invoices"},{"PosCommandName":"Activity"},{ "PosCommandName":"Reports"},{"PosCommandName":"Customers"}, {"PosCommandName":"Items" },{"PosCommandName":"Setting" },{"PosCommandName":"Help" }]';
            // convert string to JSON
            var listPosMenu = $.parseJSON(posMenuData);
            var targetID = "#" + tblId;
            var table = $(tblId).dataTable({
                data: listPosMenu,
                "paging": false,
                "searching": false,
                "showNEntries": false,
                "bInfo": false,
                "bStateSave": false,
                "bSort": false,
                columns: [
                    { 'data': 'PosCommandName' }
                ]
            })
        }
        else {

            $(tblId).children().html("");
        }

    }
    // Function to call WCF  Service       
    function MenuService(serviceType) {
        $.ajax({
            type: Type,
            url: Url,
            data: Data,
            contentType: ContentType,
            dataType: DataType,
            processdata: ProcessData,
            success: function (data) {
                
                var dataSource = $.parseJSON(data.d);
                return dataSource;
                   
               
                
            },
            error: ServiceFailed
        });
    }
    function ServiceFailed(result) {
        alert('Service call failed: ' + result.status + '' + result.statusText);
        Type = null;
        varUrl = null;
        Data = null;
        ContentType = null;
        DataType = null;
        ProcessData = null;
    }
   
    function ServiceSucceeded(result) {
        var dataSource = $.parseJSON(result.d);
        if (DataType == "json") {
            debugger;
            resultObject = dataSource;
            $('#displayTable').datatable(resultObject);

            if (resultObject) {
                $("#dialog").dialog({
                    title: menuSelected
                });
                var title = selectedMenu;
                
            }


        }

    }
    function GetMenuUI(data, columns) {
        debugger;
        var tableHeaders;
        var dataSource = $.parseJSON(data.d);
        $.each(columns, function (i, val) {
            tableHeaders += "<th>" + val.ColumnName + "</th>";
        });

        $("#dialog").empty();
        $("#dialog").append('<table id="displayTable" class="display" cellspacing="0" width="100%"><thead><tr>' + tableHeaders + '</tr></thead></table>');
        //$("#tableDiv").find("table thead tr").append(tableHeaders);  

        $('#displayTable').dataTable(data);
        $("#dialog").dialog({
            title: selectedMenu
        });

        //var dataSource;
        //alert("see");
        //$.ajax({
        //    type: "POST",
        //    dataType: "json",
        //    url: "RequestHandlers/PosMenuService.svc/GetTableData",
        //    data: '{"menu": "' + menuType + '"}',
        //    "success": function (json) {
        //        alert("mamo success")
        //        var tableHeaders;
        //        dataSource = $.parseJSON(json.d);
        //        $('#displayTable').dataTable(dataSource);
        //    },
        //    "dataType": "json"
        //});
    }
    function ServiceFailed(xhr) {
        alert(xhr.responseText);

        if (xhr.responseText) {
            var err = xhr.responseText;
            if (err)
                error(err);
            else
                error({ Message: "Unknown server error." })
        }

        return;
    }
    function PosGetItems() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "RequestHandlers/ItemService.svc/GetItems",
            success: function (data) {

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
            }

        });
    }
   // $("#tblreceiptId").hide();
    
    function PosGetEmployee(employee) {
        alert("employee method works");
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "RequestHandlers/EmployeeService.svc/GetEmployees",
            success: function (data) {
                debugger;
                
                var dataSource = $.parseJSON(data.d);
                var table = $('#tblEmployeeId').dataTable({
                    data: dataSource,
                    sorting: false,
                    'bSort': false,
                    paging: false,
                    "showNEntries": false,
                    "bInfo": false,
                    columns: [
                        { 'data': 'Emp_ID' },
                        { 'data': 'Name' },
                        { 'data': 'Phone' },
                        { 'data': 'Email' },
                        { 'data': 'Address' }
                    ]

                    
                });

                if (dataSource) {
                    $("#dialog").dialog({
                        title: menuSelected,
                        autoResize: true,
                        modal: true,
                        width: 'auto'
                    });
                    var title = selectedMenu;

                }

                //function GetPosMenu() {
                //    var table = $('#tblMenuSearchId').dataTable({
                //        data: dataSource,
                //        sorting: false,
                //        paging: false,
                //        "showNEntries": false,
                //        "bInfo": false,
                //        columns: [
                //            { 'data': 'Description' },
                //            { 'data': 'Price' }
                //        ]
                //    });
                //}
            }

        });
    }

    $('#menuID tbody').on('click', 'tr', function () {
        menuSelected = $(this).closest('tr').find('td:eq(0)').text();
        debugger;
        alert("shikur Yennus");
        if (menuSelected = "Employee")
        {
            PosGetEmployee(menuSelected)

        }
        else
        {

        }

        

        //var columns = Menu(menuSelected);
        //var dataset = GetPosTableData(menuSelected)

        //GetMenuUI(dataset, columns);

    });
});