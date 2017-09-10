using Newtonsoft.Json;
using Pos.PosBusinessProcessor;
using System.ServiceModel;
using System.ServiceModel.Activation;

namespace Pos.Web.RequestHandlers
{
    [ServiceContract]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class EmployeeService
    {
        private EmployeeSvc _employeeSvc;

        public EmployeeService() { _employeeSvc = new EmployeeSvc(); }

        [OperationContract]
        public string GetEmployees()
        {
            var lstEmployees = new EmployeeSvc();
            return JsonConvert.SerializeObject(lstEmployees.GetEmployees());
        }
    }
}
