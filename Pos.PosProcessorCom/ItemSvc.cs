using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace Pos.PosProcessorCom
{
    
    public class ItemSvc
    {
        private IConnectionFactory connectionFactory;

        public String GetItems()
        {
            connectionFactory = ConnectionHelper.GetConnection();
            var context = new DbContext(connectionFactory);
            var itemRep = new ItemRepository(context);

            string items = JsonConvert.SerializeObject(itemRep.GetItems());

            return items;

        }
    }
}
