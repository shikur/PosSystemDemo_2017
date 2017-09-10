using System.Collections.Generic;
using System.ServiceModel;
using Pos.Models;
using System.ServiceModel.Web;

namespace Pos.AppServices
{
   [ServiceContract]
   public interface IItemService
    {
        
        [OperationContract]
        [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json)]
        List<Employees> GetAllItems();
        [OperationContract]
        [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json)]
        List<Employees> GetItem();

        [OperationContract]
        [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json)]
        void UpdateItem(Employees item);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void DeleteItem(int itemid);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void InsertItem(int itemid);


    }
}
