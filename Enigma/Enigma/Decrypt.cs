using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

namespace Enigma
{
    // Start the service and browse to http://<machine_name>:<port>/Service1/help to view the service's generated help page
    // NOTE: By default, a new instance of the service is created for each call; change the InstanceContextMode to Single if you want
    // a single instance of the service to process all calls.	
    [ServiceContract]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerCall)]
    // NOTE: If the service is renamed, remember to update the global.asax.cs file
    public class Decrypt
    {
        // TODO: Implement the collection resource that will contain the Rotor instances

        //[WebGet(UriTemplate = "", ResponseFormat=WebMessageFormat.Json)]
        //public List<Rotor> GetCollection()
        //{
        //    // TODO: Replace the current implementation to return a collection of Rotor instances
        //    return new List<Rotor>() { new Rotor() { Id = 1, StringValue = "Decrypt" } };
        //}

    //    [WebInvoke(UriTemplate = "", Method = "POST")]
    //    public Rotor Create(Rotor instance)
    //    {
    //        // TODO: Add the new instance of Rotor to the collection
    //        throw new NotImplementedException();
    //    }

    //    [WebGet(UriTemplate = "{id}")]
    //    public Rotor Get(string id)
    //    {
    //        // TODO: Return the instance of Rotor with the given id
    //        throw new NotImplementedException();
    //    }

    //    [WebInvoke(UriTemplate = "{id}", Method = "PUT")]
    //    public Rotor Update(string id, Rotor instance)
    //    {
    //        // TODO: Update the given instance of Rotor in the collection
    //        throw new NotImplementedException();
    //    }

    //    [WebInvoke(UriTemplate = "{id}", Method = "DELETE")]
    //    public void Delete(string id)
    //    {
    //        // TODO: Remove the instance of Rotor with the given id from the collection
    //        throw new NotImplementedException();
    //    }

    }
}
