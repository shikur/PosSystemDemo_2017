using Pos.Models.ViewModels;
using Pos.Repository;
using Pos.Repository.RepositoryFactory;
using System.Collections.Generic;
using System.Linq;

namespace Pos.PosBusinessProcessor
{
    public class MenuSvc
    {
        private IConnectionFactory connectionFactory;

        public List<VmMenu> GetMenuColumns(string menuName)
        {
            connectionFactory = ConnectionHelper.GetConnection();
            var context = new DbContext(connectionFactory);
            var itemRep = new MenuRepository(context);

            return (dynamic)itemRep.GetAMenuColumns(menuName).ToList();

        }
    }
}
