using Pos.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Repository.RepositoryFactory
{
    public class ItemRepository : Repository<Item>
{
        private DbContext _context;
        public ItemRepository(DbContext context)
            : base(context)
        {
            _context = context;
        }

        public IList<Item> GetItems()
        {
            using (var command = _context.CreateCommand())
            {
                command.CommandText = "exec dbo.spu_GetItems";

                return this.ToList(command).ToList();
            }
        }

        public Item CreateItem(Item item)
        {
            using (var command = _context.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "spu_AddUpdateItem";

                command.Parameters.Add(command.CreateParameter("@Parameter1", 1)) ;
                command.Parameters.Add(command.CreateParameter("@pLastName", item.Items_ID));
                command.Parameters.Add(command.CreateParameter("@pUserName", item.UPC));
                command.Parameters.Add(command.CreateParameter("@pPassword", item.Weight));
                command.Parameters.Add(command.CreateParameter("@pEmail", item.Price));
                command.Parameters.Add(command.CreateParameter("@pUserName", item.Description));
                command.Parameters.Add(command.CreateParameter("@pPassword", item.Shape));
                command.Parameters.Add(command.CreateParameter("@pEmail", item.Size));
                command.Parameters.Add(command.CreateParameter("@pEmail", item.Taxable));

                return this.ToList(command).FirstOrDefault();
            }
        }

       
    }
}
