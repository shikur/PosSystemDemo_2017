//Intitial UI/UX Setting up 
        

      
            

            $('.aaf2').on("click", function () {
            

           
                response = $.parseJSON(response);

                $(function () {
                    // var k = $('<div />')
                    // var k = $('<table></table>').attr({ id: "records_table" });
                    // k.addClass("dynTable");
                    // $("#td_id").append("<table id='records_table'></table>")
                    // k.appendTo("#td_id");

                    var table = $('#tblMenuSearchId').dataTable({
                        data: response,
                        sorting: false,
                        paging: false,
                        searching:false,
                        "showNEntries": false,
                        "bInfo": false,
                        columns: [
                            { 'data': 'PosCommandName' }
                        ]
                    });


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


            });

       // var i = document.getElementById("maindiv");
        


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
    