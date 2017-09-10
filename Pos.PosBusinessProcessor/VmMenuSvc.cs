using Pos.Models.ViewModels;
using Pos.Repository;
using Pos.Repository.RepositoryFactory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.PosBusinessProcessor
{
    public class VmMenuSvc
    {
        private IConnectionFactory connectionFactory;

        public List<VmMenu> GetMenuColumns(string menuName)
        {
            connectionFactory = ConnectionHelper.GetConnection();
            var context = new DbContext(connectionFactory);
            var itemRep = new VmMenuRepository(context);

            return itemRep.GetAMenuColumns(menuName).ToList();

        }
    }
}
