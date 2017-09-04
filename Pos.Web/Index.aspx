<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Pos.Web.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .dynTable {
            color:white;
            align-content:flex-start;
            text-align:start;
            position:relative;  height: 100%;
            margin-top:0px auto;
            vertical-align:top !important;
           
           min-height:initial;
           margin-top:0px;

        }
    </style>
    <div id="maindiv" style="width:100%; height:100%">
        <table border="1" style="width:100%; height:100%">
            <tr style="height:99%;">
                <td style="background-color: #006dcc;text-align:start;" id= "td_id">
                    
                <table  style="margin:0px; height:100%;" >
                <tr><td ><b class="label label-danger" style="padding: 8.5px">Point of Sales</b>  
                </td></tr>
                     
                    <tr><td><a style="color:white;" class="showHide" data-columnindex="0">Orders</a> </td></tr> 
                    <tr><td><a style="color:white" class="" data-columnindex="1">Invoices</a> </td></tr> 
                    <tr><td><a style="color:white"" data-columnindex="2">Activity</a> </td></tr> 
                    <tr><td><a style="color:white"data-columnindex="3">Reports</a></td></tr>  
                   <tr><td> <a style="color:white" data-columnindex="4">Customers</a>  </td></tr>
                   <tr><td> <a style="color:white" data-columnindex="5">Items</a>  </td></tr>
                   <tr><td> <a style="color:white" data-columnindex="6">Setting</a> </td></tr> 
                   <tr><td> <a style="color:white" data-columnindex="7">Help</a> </td></tr>

                </table> 
                  </td>
                <td><div style="padding: 0px; border: 0px solid black; margin-top: 0px" class="container-fluid">  
            <%--<div style="height:100%">  
                <b class="label label-danger" style="padding: 8.5px">Click to Show or Hide Column:</b>  
               <%-- <div class="btn-group btn-group-sm">  
                    <a class="showHide btn btn-primary" data-columnindex="0">ID</a>  
                    <a class="showHide btn btn-primary" data-columnindex="1">FirstName</a>  
                    <a class="showHide btn btn-primary" data-columnindex="2">LastName</a>  
                    <a class="showHide btn btn-primary" data-columnindex="3">FeesPaid</a>  
                    <a class="showHide btn btn-primary" data-columnindex="4">Gender</a>  
                    <a class="showHide btn btn-primary" data-columnindex="5">Email</a>  
                    <a class="showHide btn btn-primary" data-columnindex="6">TelephoneNumber</a>  
                    <a class="showHide btn btn-primary" data-columnindex="7">Date of Birth</a>  
                </div>  
            </div>  
            <br /> --%> 
            <table id="studentTable2" class="table table-responsive table-hover" ">  
                <thead>  
                    <tr style="width: !important 100%">  
                        <th>Description</th>  
                        <th>Const</th>  
                     
                    </tr>  
                </thead> 
                <tbody style="width:100%">

                </tbody> 
              
            </table>  
        </div> </td>
                <td> 
                    <div style="padding: 0px; border: 5px solid black; margin-top: 0px" class="container-fluid">  
            <div>  
                <b class="label label-danger" style="padding: 8.5px">Click to Show or Hide Column:</b>  
                <%--<div class="btn-group btn-group-sm">  
                    <a class="showHide btn btn-primary" data-columnindex="0">ID</a>  
                    <a class="showHide btn btn-primary" data-columnindex="1">shikurFirstName</a>  
                    <a class="showHide btn btn-primary" data-columnindex="2">LastName</a>  
                    <a class="showHide btn btn-primary" data-columnindex="3">FeesPaid</a>  
                    <a class="showHide btn btn-primary" data-columnindex="4">Gender</a>  
                    <a class="showHide btn btn-primary" data-columnindex="5">Email</a>  
                    <a class="showHide btn btn-primary" data-columnindex="6">TelephoneNumber</a>  
                    <a class="showHide btn btn-primary" data-columnindex="7">Date of Birth</a>  
                </div> --%> 
            </div>  
            <br />  
            <table id="studentTable" class="table table-responsive table-hover">  
                <thead>  
                     
                </thead>
                
                <tbody></tbody>  
                
                
            </table>  
        </div> 
                    recipts body
                </td></tr>
            <tr style="height:20px"><td><a href="javascript:void(0)" class="aaf" id="users_id">POS</a></td><td><a href="javascript:void(0)" class="aaf2" id="users_id2">largemenu   |   <input id="Button1" type="button" value="Execute" onclick=" WCFJSON();" /></a></td><td style="width:200px">

              
     
        
    
               
                                                                                        Search</td></tr></table>

       <table  id="tabDocumenti" class="table table-responsive table-hover">
            <thead>
               
            </thead>
            <tbody>

            </tbody>
        </table>

    </div>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.15/datatables.min.css"/>
 
<%--<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.15/datatables.min.js"></script>      --%>
    <script src="Scripts/jquery.dataTables.min.js"></script>

    <script type="text/javascript">
        $(function () {
            $("#td_id").attr('width', '420px');
            //alert("selam");
        });

        $('.aaf').on("click", function () {
            var usersid = $(this).attr("id");
            $("#td_id").attr('width', '5px');
            $("#td_id").html('');
            var currurnt_cell = $(this).html();
            if (currurnt_cell) {
                if( currurnt_cell == 'POS')
                {
                    var response = '[{"PosCommandName":"Point of Sales"},{"PosCommandName":"_____________"},{"PosCommandName":"Orders"},{"PosCommandName":"Invoices"},{"PosCommandName":"Activity"},{ "PosCommandName":"Reports"},{"PosCommandName":"Customers"}, {"PosCommandName":"Items" },{"PosCommandName":"Setting" },{"PosCommandName":"Help" }]';
                    // convert string to JSON
                    response = $.parseJSON(response);
                    var i = 0;
                    $(function () {
                        // var k = $('<div />')
                        // var k = $('<table></table>').attr({ id: "records_table" });
                        // k.addClass("dynTable");
                        // $("#td_id").append("<table id='records_table'></table>")
                        // k.appendTo("#td_id");


                        var row = $("<div></div>").appendTo("#td_id");

                        row.addClass("dynTable");
                        $("<hr/>").appendTo(row)
                        $.each(response, function (i, item) {
                            //var row = $("<tr></tr>").appendTo(k);
                            //$("<td></td>").text(item.rank).appendTo(row);
                            //$("<td></td>").text(item.content).appendTo(row);
                            //$("<td></td>").text(item.UID).appendTo(row);


                            $("<div></div>").text(item.PosCommandName).appendTo(row);
                            //$("<div></div>").text(item.content).appendTo(row);
                            //$("<div></div>").text(item.UID).appendTo(row);
                            // row.appendTo("#td_id")
                            //console.log($tr.wrap('<p>').html());
                        }

                        );

                        //k.appendTo(row)
                    });
                    $(this).html("");
                    $(this).html("Hide");
                }
                else {
                    $(this).html("");
                    $(this).html("POS");
                }
            }
            
        })

        $('.aaf2').on("click", function () {
            

            var response = '[{"PosCommandName":"Orders"},{"PosCommandName":"Invoices"},{"PosCommandName":"Activity"},{ "PosCommandName":"Reports"},{"PosCommandName":"Customers"}, {"PosCommandName":"Items" },{"PosCommandName":"Setting" },{"PosCommandName":"Help" }]';
            // convert string to JSON
            response = $.parseJSON(response);

            $(function () {
               // var k = $('<div />')
               // var k = $('<table></table>').attr({ id: "records_table" });
               // k.addClass("dynTable");
                // $("#td_id").append("<table id='records_table'></table>")
                // k.appendTo("#td_id");


                var row = $("<div></div>").appendTo("#td_id");

                row.addClass("dynTable");
                $.each(response, function (i, item) {
                    //var row = $("<tr></tr>").appendTo(k);
                    //$("<td></td>").text(item.rank).appendTo(row);
                    //$("<td></td>").text(item.content).appendTo(row);
                    //$("<td></td>").text(item.UID).appendTo(row);
                    
                   
                    $("<div></div>").text(item.PosCommandName).appendTo(row);
                    //$("<div></div>").text(item.content).appendTo(row);
                    //$("<div></div>").text(item.UID).appendTo(row);
                   // row.appendTo("#td_id")
                    //console.log($tr.wrap('<p>').html());
                }

                );

                //k.appendTo(row)
            });


        })

        var i = document.getElementById("maindiv");
        


        // go full-screen
        //if (i.requestFullscreen) {
        //    alert("1 works")
        //    i.requestFullscreen();
        //} else if (i.webkitRequestFullscreen) {
           
        //    i.webkitRequestFullscreen();
        //} else if (i.mozRequestFullScreen) {
        //    alert("3 works")
        //    i.mozRequestFullScreen();
        //} else if (i.msRequestFullscreen) {///////
        //    alert("4 works")
        //    i.msRequestFullscreen();
        //}
        //else
        //{
        //    alert("nothing works")
        //}
    </script>

    <script type="text/javascript">
      
    var Type;
    var Url;
    var Data;
    var ContentType;
    var DataType;
    var ProcessData;
    function WCFJSON() {
        var userid = "1";
        Type = "POST";
        Url = "Service2.svc/GetItems";
        Data = "";
        ContentType = "application/json; charset=utf-8";
        DataType = "json"; varProcessData = true; 
        CallService();
    }

    function CallService() {
        $.ajax({
            type: Type, //GET or POST or PUT or DELETE verb
            url: Url, // Location of the service
            data: Data, //Data sent to server
            contentType: ContentType, // content type sent to server
            dataType: DataType, //Expected data format from server
            processdata: ProcessData, //True or False
            success: function(msg) {//On Successfull service call
                //ServiceSucceeded(msg);
            },
            error: ServiceFailed// When Service call fails
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

        //public string Description { get; set; }
        //public string Brand { get; set; }
        //public decimal Cost { get; set; }
        //public decimal Price { get; set; }
        //public decimal Weight { get; set; }
        alert("test")
        var jsonObject = $.parseJSON(result.d);
        //alert(jsonObject.Cost);
        //alert(jsonObject.Description);
      
        $('#studentTable2').dataTable({
            data: jsonObject,
            columns: [
                      { 'jsonObject': 'Description' },
                      { 'jsonObject': 'Brand' },
                      { 'jsonObject': 'Cost' },
            ],
            searching: true,
            paging: false
        });
        debugger;

        //var customers = eval(result.d);
        //var html = "";
        //$.each(customers, function () {
        //    html += "<span>Name: " + this.Description + " Id: " + this.Cost + "</span><br />";
        //});
        //$("#studentTable2").html(html == "" ? "No results" : html);

       

    //    var k = $.parseJSON(result.d);
    //    if (DataType == "json") {
    //        for (var key in k) {
                
    //            alert(k[key].Description);
    //        }
    //        ProcessData = k;

    //        $('#studentTable2').DataTable({
    //            "aaData": k,
    //            "processing": true,
    //            "bPaginate": false,
    //            "bFilter": false,
    //            "bSort": false,
    //            "bInfo": false,
               
    //        });
         
    //   //var resultObject =  result.GetUserResult;
        
    //    //if (resultObject && resultObject.length) {
    //    //    for (i = 0; i < resultObject.length; i++) {
    //    //        alert(resultObject[i]);
    //    //    }
    //    //}
    //    //else { alert("was size zero")}
       
    //    //alert(result.d);
    //    //alert("works!")
            
    //}
        
    }

    function loadTable(results) {
        var table = '';
        for (var post in results) {
            var row = '<tr>';
 
            row += '<td>' + results[post].Name + '</td>';
            row += '<td>' + results[post].Publisher + '</a></td>';
            row += '<td><img src="' + results[post].ImageUrl + 
                   '" style="width: 100px; height=150px" /></td>';
 
            row += '</tr>';
 
            row.appendTo()
        }
 
        table += '</tbody></table>';
 
        $('#gameTable').html(table);
 
    }

function ServiceFailed(xhr) {
    alert(xhr.responseText);

    if (xhr.responseText) {
        var err = xhr.responseText;
        if (err)
            alert(err);
            //error(err);
        else
            error({ Message: "Unknown server error." })
    }
    
    return;
}

//$(document).ready(
//    function () {
//        alert("get start");
//        WCFJSON();
//    }
//);
</script>

    <script type="text/javascript">
        $(document).ready(function () {

            //$('#tabDocumenti').dataTable({
            //    "processing": true,
            //    "serverSide": true,
            //    "ajax": {
            //        "url": "Service2.svc/GetItems",
            //        "dataSrc": "d"
            //    },
            //    "columns": [
            //        {
            //            "data": "Description",
            //            "data": "Brand"
            //        }
            //    ]
                   
            //});
            $.ajax({  
                type: "POST",  
                dataType: "json",  
                url: "Service2.svc/GetItems",  
                success: function (data) {
                    debugger;
                    var dataSource = $.parseJSON(data.d);
                  var table=  $('#studentTable2').dataTable({
                        data: dataSource,
                        sorting: false,
                        paging:false,
                        columns: [
                            { 'data': 'Description' },
                            { 'data': 'Price' }
                        ]
                    });

                    //$('.showHide').on('click', function () {
                    //    var tableColumn = datatableVariable.column($(this).attr('data-columnindex'));
                    //    tableColumn.visible(!tableColumn.visible());
                    //});
                }

            });

            $('#studentTable2 tbody').on('click', 'tr', function () {
                //if ($(this).hasClass('selected')) {
                //    $(this).removeClass('selected');
                //    alert('test');
                //}
                //else {
                //    table.$('tr.selected').removeClass('selected');
                //    $(this).addClass('selected');
                //}
                var table = $('#studentTable2').DataTable();
                $('#studentTable_wrapper').show()
                var data = table.row($(this)).data();
                var t = $('#studentTable').DataTable();
                var counter = "test"
                t.row.add([
                    counter + '.1',
                    counter + '.2',
                    counter + '.3'
                   
                ]).draw(false);
               
            });
        });

        //$(document).ready(function () {
        //    var t = $('#studentTable').DataTable();
        //    var counter = 1;

        //    $('#addRow').on('click', function () {
        //        t.row.add([
        //            counter + '.1',
        //            counter + '.2',
        //            counter + '.3',
        //            counter + '.4',
        //            counter + '.5'
        //        ]).draw(false);

        //        counter++;
        //    });

        //    // Automatically add a first row of data
        //    $('#addRow').click();
        //});

        $(document).ready(function () {
            $('#studentTable').dataTable({
                'bSort': false,
                'aoColumns': [
                      { sWidth: "45%", bSearchable: false, bSortable: false },
                      { sWidth: "45%", bSearchable: false, bSortable: false },
                      { sWidth: "10%", bSearchable: false, bSortable: false }
                ],
                "scrollY": "200px",
                "scrollCollapse": true,
                "info": true,
                "paging": false,
                "searching": false,
                "showNEntries": false,
                "bInfo": false,
                "sEmptyTable": "",
                "bStateSave": true
            });
            $('#studentTable_wrapper').hide()
        });
        </script>

</asp:Content>
