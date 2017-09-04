using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Pos.Web
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Application_BeginRequest()
        { HttpContext.Current.Response.AddHeader("Access-Control-Allow-Origin", "*");
            if (Request.HttpMethod == "OPTIONS")
            {
               
                Response.StatusCode = (int)System.Net.HttpStatusCode.OK;
                Response.AppendHeader("Access-Control-Allow-Origin", Request.Headers.GetValues("Origin")[0]);
                Response.AddHeader("Access-Control-Allow-Headers", "Content-Type, Accept");
                Response.AddHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE");
                Response.AppendHeader("Access-Control-Allow-Credentials", "true");
                Response.End();
            }
        }
    }
}