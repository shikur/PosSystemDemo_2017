using Newtonsoft.Json;
using Pos.PosBusinessProcessor;
using System.ServiceModel;
using System.ServiceModel.Activation;

namespace Pos.Web.RequestHandlers
{
    [ServiceContract]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class ItemService
    {
        private ItemSvc  _itemSvc;
        //public ItemService(ItemService itemService)
        //{
        //    this._itemService = itemService;
        //}
        public ItemService()
        {
            this._itemSvc = new ItemSvc();
        }

        [OperationContract]
        public string GetItems()
        {
            return JsonConvert.SerializeObject(this._itemSvc.GetItems());
        }
    }
}
