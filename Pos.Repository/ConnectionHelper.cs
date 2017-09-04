using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pos.Repository
{
    public static class ConnectionHelper
    {
        public static IConnectionFactory GetConnection()
        {
            return new DbConnectionFactory("poscnn");
        }
    }
}