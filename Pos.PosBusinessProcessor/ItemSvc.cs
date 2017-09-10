using System;
using Pos.Repository;
using Pos.Models;
using System.Collections.Generic;
using System.Linq;
using Pos.Repository.RepositoryFactory;

namespace Pos.PosBusinessProcessor
{
    public class ItemSvc
    {
        private IConnectionFactory connectionFactory;

        public  List<Item> GetItems()
        {
            connectionFactory = ConnectionHelper.GetConnection();
            var context = new DbContext(connectionFactory);
            var itemRep = new ItemRepository(context);

            return itemRep.GetItems().ToList(); 

        }
    }
}
