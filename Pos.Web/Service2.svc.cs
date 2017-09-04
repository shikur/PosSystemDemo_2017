using Newtonsoft.Json;
using Pos.Models;
using Pos.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

namespace Pos.Web
{
    [ServiceContract]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class Service2
    {
        private IConnectionFactory connectionFactory;
        // To use HTTP GET, add [WebGet] attribute. (Default ResponseFormat is WebMessageFormat.Json)
        // To create an operation that returns XML,
        //     add [WebGet(ResponseFormat=WebMessageFormat.Xml)],
        //     and include the following line in the operation body:
        //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
        [OperationContract]
        public string DoWork()
        {

            return null;
           // string k = '{ "COLUMNS": [ {"REGISTRATION_DT" : "19901212", "USERNAME" : "kudos", "PASSWORD" : "tx91!#1" },{"REGISTRATION_DT" : "19940709", "USERNAME" : "jenny", "PASSWORD" : "fxuf#2" }, {"REGISTRATION_DT" : "20070110", "USERNAME" : "benji12", "PASSWORD" : "rabbit19" } ]}';
        }

        [OperationContract]
        public string GetItems()
        {
            connectionFactory = ConnectionHelper.GetConnection();

            var context = new DbContext(connectionFactory);

            var itemRep = new ItemRepository(context);
            string k = JsonConvert.SerializeObject(itemRep.GetItems());

            return k;
        }

        // Add more operations here and mark thCem with [OperationContract]
    }
}
