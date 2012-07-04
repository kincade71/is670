using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using Enigma;

namespace Enigma
{
    // Start the service and browse to http://<machine_name>:<port>/Service1/help to view the service's generated help page
    // NOTE: By default, a new instance of the service is created for each call; change the InstanceContextMode to Single if you want
    // a single instance of the service to process all calls.	
    [ServiceContract]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerCall)]
    // NOTE: If the service is renamed, remember to update the global.asax.cs file
    public class Encrypt
    {
        // TODO: Implement the collection resource that will contain the Rotor instances

        private void Rotate()
        {
            
        }

        [WebGet(UriTemplate = "", ResponseFormat = WebMessageFormat.Json)]

        public Boolean GetCollection()
        {
            Boolean DoubleRotate = false;
            // TODO: Replace the current implementation to return a collection of Rotor instances
            Rotor slot1 = new Rotor(RotorClass.Rotor, RotorType.I, 0);
            Rotor slot2 = new Rotor(RotorClass.Rotor, RotorType.II, 0);
            Rotor slot3 = new Rotor(RotorClass.Rotor, RotorType.III, 0);
            Rotor reflector = new Rotor(RotorClass.Reflector, RotorType.B, 0);

            string s = "ENIGMA";
            s = s.ToUpper();
            char encodedLetter;
            //plugboard
            foreach (char c in s)
            {
                slot1.currentPosition++;
                if (slot1.currentPosition > 26)
                {
                    slot1.currentPosition = 1;
                }
                if (DoubleRotate)
                {
                    slot2.currentPosition++;
                    DoubleRotate = false;
                }
                if (slot1.currentPosition == slot1.notchPosition)
                {
                    slot2.currentPosition++;
                    if (slot2.currentPosition > 26)
                    {
                        slot2.currentPosition = 1;
                    }
                    DoubleRotate = true;
                    if (slot2.currentPosition == slot2.notchPosition)
                    {
                        slot3.currentPosition++;
                        if (slot3.currentPosition > 26)
                        {
                            slot3.currentPosition = 1;
                        }
                    }
                }
                encodedLetter = ((RotorI)slot1.rotorObject).charMapping[(Convert.ToInt32(c) - 65)+slot1.currentPosition];
                Int32 nextPosition = (Convert.ToInt32(encodedLetter) - 65 - slot1.currentPosition);
                if (nextPosition < 0)
                {
                    nextPosition = 26;
                }
                encodedLetter = ((RotorII)slot2.rotorObject).charMapping[nextPosition];
                nextPosition = (Convert.ToInt32(encodedLetter) - 65 - slot2.currentPosition);
                if (nextPosition < 0)
                {
                    nextPosition = 26;
                }
                encodedLetter = ((RotorIII)slot3.rotorObject).charMapping[nextPosition];
                nextPosition = (Convert.ToInt32(encodedLetter) - 65 - slot3.currentPosition);
                if (nextPosition < 0)
                {
                    nextPosition = 26;
                }
                encodedLetter = ((ReflectorB)reflector.rotorObject).charMapping[nextPosition];

                //back through rotors
                encodedLetter = Convert.ToChar(Convert.ToInt32(encodedLetter) + slot3.currentPosition);
                char a = Convert.ToChar(Array.IndexOf(((RotorIII)slot3.rotorObject).charMapping,encodedLetter) - slot3.currentPosition + slot2.currentPosition + 65);
                char b = Convert.ToChar(Array.IndexOf(((RotorIII)slot3.rotorObject).charMapping,a) - slot2.currentPosition + slot1.currentPosition + 65);
                encodedLetter = Convert.ToChar(Array.IndexOf(((RotorIII)slot3.rotorObject).charMapping, b) - slot1.currentPosition +65);
            }

            return true;//new List<Rotor>() { new Rotor() { rotorClass = slot1.rotorClass, rotorMapping = ((RotorI)(x.rotorObject)).charMapping, startingPosition = x.startingPosition, notchPosition = ((RotorI)(x.rotorObject)).notch, currentPosition = x.currentPosition } };
        }

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
