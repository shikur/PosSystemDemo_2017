using Newtonsoft.Json;
using Pos.Repository;
using Pos.Repository.RepositoryFactory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

namespace Pos.Web.Services
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class EmployeeService
    {
        private IConnectionFactory connectionFactory;

        [OperationContract]
        public string GetEmployee(int id)
        {
            connectionFactory = ConnectionHelper.GetConnection();

            var context = new DbContext(connectionFactory);

            var EmployeeRep = new EmployeeRepository(context);
            string k = JsonConvert.SerializeObject(EmployeeRep.GetEmployeeByID(id));

            return k;
        }

        // Add more operations here and mark them with [OperationContract]
    }
}
