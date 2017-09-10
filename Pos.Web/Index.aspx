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

        .posbgColor {
            color:#ffffff;
            background-color:#3276b1
        }
    </style>
    <div id="maindiv" style="width:100%; height:100%; min-height: !important 1700px; font-family:Arial">
        <div style="background-color:#3276b1; text-align:center">  
                 
               
            </div> 
        <table border="1" style="width:100%; height:100%">
            <tr><td  colspan="3" style="border:0px; text-align:center;"><b   style="width: !important  100%; color:#3276b1; ">Welcome Shikur Yennus  </b> </td></tr>
            <tr style="height:99%;">
                <td style="background-color: #3276b1;text-align:start;vertical-align: top;" id= "td_id">
                    <div id="menuID">
                        <div id="menuPosTitleId" style="background-color:#3276b1; text-align:center">  
                <b   style="padding: 8.5px; width: !important  100%; color:#ffffff">Point of Sales</b>  
               
            </div> 
                <table  id="tblPosMenuID" class="table table-responsive table-hover stripe "  style="width:100%; height:100%; min-height: !important 1700px; font-family:Arial">
            <thead>
               
            </thead>
            <tbody>

            </tbody>
        </table>

                    </div>
                  </td>
                <td style="vertical-align: top;"><div style="padding: 0px; border: 0px solid black; margin-top: 0px; text-align:left; align-content:inherit" class="container-fluid">  
           
            <table id="tblMenuSearchId" class="table table-responsive table-hover">  
                <thead>  
                    <tr style="width: !important 100%">  
                        <th>Description</th>  
                        <th>Unit Price</th>  
                    </tr>  
                </thead> 
                <tbody style="width:100%">

                </tbody> 
              
            </table>  
        </div> </td>
                <td style="vertical-align: top;"> 
                    <div  id="divreceiptID" style="padding: 0px; border: 5px solid black; margin-top: 0px" class="container-fluid">  
            <div style="background-color:#3276b1; text-align:center">  
                <b   style="padding: 8.5px; width: !important  100%; color:#ffffff">Current Sales:</b>  
               
            </div>  
            <br />  
            <table id="tblreceiptId" class="table table-responsive table-hover stripe " style="background-color: !important yellow; font-family:'MS Gothic'">  
                <thead>  
                     <tr>
                <th>Description</th>
                <th>Price</th></tr> 
                </thead>
                
                <tbody style="background-color: !important yellow"></tbody>  
                
                
            </table> 
                        <div style="text-align:center; width:100%"><span style="padding-top:8px">  <button class="btn btn-primary">Save</button> <span style="padding:5px;">|</span><button class="btn btn-primary">Cancel</button></span> </div> 
        </div> 
                  
                </td></tr>
            <tr class="posbgColor" style="height:20px"><td><a href="javascript:void(0)" class="posbgColor" id="lnkposMenu_ID">POS</a></td><td style="align-content:center; text-align:center"><a href="javascript:void(0)" class="posbgColor" id="lnkByItem_ID">By Item</a></td><td style="width:200px">
                 Search</td></tr></table>
    </div>

<div id="dialog" title="Basic dialog">
   <table id="tblEmployeeId" class="table table-responsive table-hover">  
                <thead>  
                    <tr style="width: !important 100%">  
                        <th>Emp_ID</th>  
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Address</th>  
                    </tr>  
                </thead> 
                <tbody style="width:100%">

                </tbody> 
              
            </table>
</div>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.15/datatables.min.css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
    <script src="Scripts/jquery.dataTables.min.js"></script>
    <script src="Scripts/PosJs/tblReceiptjs.js"></script>
    <script src="Scripts/PosJs/PosLayoutjs.js"></script>
    <script src="Scripts/PosJs/PosMenujs.js"></script>
    <script src="Scripts/PosJs/tblMenuSearchjs.js"></script>


 

   

 

</asp:Content>
