using Newtonsoft.Json;
using Pos.PosBusinessProcessor;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

namespace Pos.Web.RequestHandlers
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class PosMenuService
    {
        private MenuSvc _PosMenuSv = new MenuSvc();
        private VmMenuSvc _VmMenuSv = new VmMenuSvc();
        private EmployeeSvc _EmployeeSvc = new EmployeeSvc();
        private ItemSvc _ItemSvc = new ItemSvc();
        // To use HTTP GET, add [WebGet] attribute. (Default ResponseFormat is WebMessageFormat.Json)
        // To create an operation that returns XML,
        //     add [WebGet(ResponseFormat=WebMessageFormat.Xml)],
        //     and include the following line in the operation body:
        //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
        [OperationContract]
        public string GetMenuColumns(string menu)
        {
            // Add your operation implementation here
            return  JsonConvert.SerializeObject(this._VmMenuSv.GetMenuColumns(menu)); 
        }

        [OperationContract]
        public string GetTableData(string menu)
        {
            switch (menu)
            {
                case "Employee":
                    return JsonConvert.SerializeObject(this._EmployeeSvc.GetEmployees());
                case "Item":
                    return JsonConvert.SerializeObject(this._ItemSvc.GetItems());
                default:
                    return null;
                   
            }
           
        }

        // Add more operations here and mark them with [OperationContract]
    }
}
