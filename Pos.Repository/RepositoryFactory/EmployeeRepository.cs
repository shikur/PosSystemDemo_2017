using Pos.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Repository.RepositoryFactory
{
    public class EmployeeRepository : Repository<Employees>
    {
        private DbContext _context;
        public EmployeeRepository(DbContext context) : base(context)
        {
            _context = context;
        }

        public IList<Employees> GetEmployees()
        {
            using (var command = _context.CreateCommand())
            {
                command.CommandText = "exec [dbo].[spu_GetEmployees]";

                return this.ToList(command).ToList();
            }
        }

        public Employees LoginEmployee(string id, string password)
        {
            using (var command = _context.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "uspSignm";

                command.Parameters.Add(command.CreateParameter("@pId", id));
                command.Parameters.Add(command.CreateParameter("@pPasswod", password));

                return this.ToList(command).FirstOrDefault();
            }
        }

        public Employees GetEmployeeByEmployeenameOrEmail(string username, string email)
        {
            using (var command = _context.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "uspGetUserByUsernameOrEmail";

                command.Parameters.Add(command.CreateParameter("@pUsername", username));
                command.Parameters.Add(command.CreateParameter("@pEmai", email));

                return this.ToList(command).FirstOrDefault();
            }
        }

        public IList<Employees> GetEmployeeByID(int id)
        {
            using (var command = _context.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(command.CreateParameter("@Emp_ID", id));

                command.CommandText = "exec [dbo].[Spu_GetEmployee]";

                return this.ToList(command).ToList();
            }
        }
    }
}
