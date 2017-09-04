using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.Text;
using System.Threading.Tasks;
using Pos.Models;
using Pos.Repository;

namespace Pos.AppServices
{
    [ServiceContract]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class ItemService : IItemService 
    {
        private IConnectionFactory connectionFactory;

        public void DeleteItem(int itemid)
        {
            throw new NotImplementedException();
        }

        public List<Employees> GetAllItems()
        {
            throw new NotImplementedException();
        }

        public List<Employees> GetItem()
        {
            throw new NotImplementedException();
        }

        public IList<Item> GetItems()
        {
            connectionFactory = ConnectionHelper.GetConnection();

            var context = new DbContext(connectionFactory);

            var itemRep = new ItemRepository(context);

            return itemRep.GetItems();
        }

        public void InsertItem(int itemid)
        {
            throw new NotImplementedException();
        }

        public Item RegisterUser(Item item)
        {
            connectionFactory = ConnectionHelper.GetConnection();

            var context = new DbContext(connectionFactory);

            var userRep = new ItemRepository(context);

            return userRep.CreateItem(item);
        }

        public void UpdateItem(Employees item)
        {
            throw new NotImplementedException();
        }
    }
}
