using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.Text;
using System.Threading.Tasks;
using Pos.Models;
using Pos.Repository;

namespace Pos.Services
{
    [ServiceContract]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class ItemService
    {
        private IConnectionFactory connectionFactory;

        public IList<Item> GetItems()
        {
            connectionFactory = ConnectionHelper.GetConnection();

            var context = new DbContext(connectionFactory);

            var itemRep = new ItemRepository(context);

            return itemRep.GetItems();
        }

        public User RegisterUser(User user)
        {
            connectionFactory = ConnectionHelper.GetConnection();

            var context = new DbContext(connectionFactory);

            var userRep = new UserRepository(context);

            return userRep.CreateUser(user);
        }
    }
}
