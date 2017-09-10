using Pos.Models;
using Pos.Repository;
using Pos.Repository.RepositoryFactory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.PosBusinessProcessor
{
   public class EmployeeSvc
    {
        private IConnectionFactory connectionFactory;

        public List<Employees> GetEmployees()
        {
            connectionFactory = ConnectionHelper.GetConnection();
            var context = new DbContext(connectionFactory);
            var empRep = new EmployeeRepository(context);

            return empRep.GetEmployees().ToList();

        }
    }
}
