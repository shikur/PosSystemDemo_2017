using Pos.Models;
using Pos.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Repository.RepositoryFactory
{
   public class MenuRepository: Repository<Menu>
    {
        private DbContext _context;
        public MenuRepository (DbContext context)
            : base(context)
        {
            _context = context;
        }

        public List<VmMenu> GetAMenuColumns(string menuName)
        {
            using (var command = _context.CreateCommand())
            {
               
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[dbo].[spu_GetColumnForAmenu]";

                command.Parameters.Add(command.CreateParameter("@menuName", menuName));

                return (dynamic)this.ToList(command).ToList();
            }
        }
    }
}
