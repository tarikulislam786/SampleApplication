using System;
using System.Configuration;
using SampleApplication.Utils.Infrastructure.Contract;

namespace SampleApplication.Utils.Infrastructure
{
    public class ConnectionStringProvider : IConnectionStringProvider
    {
        public string ConnectionString
        {
            get
            {
                var server = ConfigurationManager.ConnectionStrings["POS"].ConnectionString;
                if(string.IsNullOrEmpty(server))
                    throw new Exception("A valid connection string needs to be set in the configuration file.");
                return server;
            }
        }
    }
}