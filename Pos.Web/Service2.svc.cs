﻿using Newtonsoft.Json;
using Pos.Models;
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

namespace Pos.Web
{
    [ServiceContract]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class Service2
    {
        private IConnectionFactory connectionFactory;

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
