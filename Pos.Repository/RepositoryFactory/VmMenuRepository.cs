using Pos.Models.ViewModels;
using Pos.Repository;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Repository.RepositoryFactory
{
    public class VmMenuRepository:Repository<VmMenu>
    {
        private DbContext _context;
        public VmMenuRepository(DbContext context)
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

                return this.ToList(command).ToList();
            }
        }
    }
}
