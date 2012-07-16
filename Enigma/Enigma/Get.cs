using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using Enigma;
using System.Diagnostics;
using Microsoft.JScript;
using System.IO;
using System.Web;
using System.Web.Script.Serialization;
using System.Data.SqlClient;
using System.Configuration;

namespace Enigma
{
    // Start the service and browse to http://<machine_name>:<port>/Service1/help to view the service's generated help page
    // NOTE: By default, a new instance of the service is created for each call; change the InstanceContextMode to Single if you want
    // a single instance of the service to process all calls.	
    [ServiceContract]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerCall)]
    // NOTE: If the service is renamed, remember to update the global.asax.cs file
    public class Get
    {

        [WebInvoke(UriTemplate = "", Method = "POST", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        public RootObjectOut GetMessageByUser(UserIn jm) 
        {
            RootObjectOut output = new RootObjectOut();
            String jsonString = "";
            try
            {
                String strConnection = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
                SqlConnection Connection = new SqlConnection(strConnection);
                String strSQL = string.Format("SELECT message FROM messages WHERE msgTo = '{0}' AND [msgID] = (SELECT MAX(msgID) FROM messages WHERE msgTo='{1}')", jm.user.ToString(),jm.user.ToString());
                SqlCommand Command = new SqlCommand(strSQL, Connection);
                Connection.Open();
                SqlDataReader Dr;
                Dr = Command.ExecuteReader();
                if (Dr.HasRows)
                {
                    if (Dr.Read())
                    {
                        jsonString = Dr.GetValue(0).ToString();
                    }
                }
                Dr.Close();
                Connection.Close();
            }
            catch (Exception ex)
            {
                output.errorMessage = ex.Message;
            }
            finally
            {
            }
            JavaScriptSerializer ser = new JavaScriptSerializer();
            output = ser.Deserialize<RootObjectOut>(jsonString);

            return output;
        }
    }
}
