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

        Boolean DoubleRotate = false;
        Rotor[] slotArray;
        Rotor slot1;
        Rotor slot2;
        Rotor slot3;
        Rotor reflector;

        private Int32 ValidateCharPosition(Int32 validateInt)
        {
            Int32 validInt;

            validInt = validateInt;
            if (validInt > 25)
            {
                validInt = validInt - 26;
            }

            else if (validInt < 0)
            {
                validInt = validInt + 26;
            }

            return validInt;
        }

        private Int32 ValidatePosition(Int32 validateInt)
        {
            Int32 validInt;

            validInt = validateInt;
            if (validInt > 90)
            {
                validInt = validInt - 26;
            }

            else if (validInt < 65)
            {
                validInt = validInt + 26;
            }

            return validInt;
        }

        private void Rotate()
        {
            slot1.currentPosition++;
            if (slot1.currentPosition > 25)
            {
                slot1.currentPosition = slot1.currentPosition - 26;
            }

            if (DoubleRotate)
            {
                slot2.currentPosition++;
                DoubleRotate = false;
                if (slot2.currentPosition == ((RotorII)(slot2).rotorObject).notch)
                {
                    slot3.currentPosition++;
                    if (slot3.currentPosition > 25)
                    {
                        slot3.currentPosition = slot3.currentPosition - 26;
                    }
                }
            }

            if (slot1.currentPosition == ((RotorI)(slot1).rotorObject).notch)
            {
                slot2.currentPosition++;
                if (slot2.currentPosition > 25)
                {
                    slot2.currentPosition = slot2.currentPosition - 26;
                }

                if (slot2.currentPosition == ((RotorII)(slot2).rotorObject).notch - 1)
                {
                    DoubleRotate = true;
                }
                else
                {
                    if (slot2.currentPosition == ((RotorII)(slot2).rotorObject).notch)
                    {
                        slot3.currentPosition++;
                        if (slot3.currentPosition > 25)
                        {
                            slot3.currentPosition = slot3.currentPosition - 26;
                        }
                    }
                }
            }
        }

        private void ArrayRotate(Int32 i)
        {
            slotArray[i].currentPosition++;
            if (slotArray[i].currentPosition > 25)
            {
                slotArray[i].currentPosition = slotArray[i].currentPosition - 26;
            }

            if (i == 0)
            {
                if (DoubleRotate)
                {
                    DoubleRotate = false;
                    ArrayRotate(i + 1);
                }
            }
            //typeof(slotArray[i]).rotorObject)
            System.Type thisType = slotArray[i].rotorObject.GetType();
            if (slotArray[i].currentPosition == ((thisType.GetMethod("CAST").MakeGenericMethod)(slotArray[i]).rotorObject).notch)
            {
            }
            //slot1.currentPosition++;
            //if (slot1.currentPosition > 25)
            //{
            //    slot1.currentPosition = slot1.currentPosition - 26;
            //}

            if (DoubleRotate)
            {
                slot2.currentPosition++;
                DoubleRotate = false;
                if (slot2.currentPosition == ((RotorII)(slot2).rotorObject).notch)
                {
                    slot3.currentPosition++;
                    if (slot3.currentPosition > 25)
                    {
                        slot3.currentPosition = slot3.currentPosition - 26;
                    }
                }
            }

            if (slot1.currentPosition == ((RotorI)(slot1).rotorObject).notch)
            {
                slot2.currentPosition++;
                if (slot2.currentPosition > 25)
                {
                    slot2.currentPosition = slot2.currentPosition - 26;
                }

                if (slot2.currentPosition == ((RotorII)(slot2).rotorObject).notch - 1)
                {
                    DoubleRotate = true;
                }
                else
                {
                    if (slot2.currentPosition == ((RotorII)(slot2).rotorObject).notch)
                    {
                        slot3.currentPosition++;
                        if (slot3.currentPosition > 25)
                        {
                            slot3.currentPosition = slot3.currentPosition - 26;
                        }
                    }
                }
            }
        }

        [WebGet(UriTemplate = "", ResponseFormat = WebMessageFormat.Json)]
        public Boolean GetCollection()
        {
            String EncodedMessage = "";
            String TypedMessage = "PRFWGDEB";

            TypedMessage = TypedMessage.ToUpper().Replace(" ","");
            char encodedLetter;
            //plugboard
            foreach (char c in TypedMessage)
            {
                Rotate();
                Int32 nextPosition = ValidateCharPosition((System.Convert.ToInt32(c) - 65) + slot1.currentPosition);
                encodedLetter = ((RotorI)slot1.rotorObject).charMapping[nextPosition];
                nextPosition = ValidateCharPosition((System.Convert.ToInt32(encodedLetter) - 65) - slot1.currentPosition + slot2.currentPosition);
                encodedLetter = ((RotorII)slot2.rotorObject).charMapping[nextPosition];
                nextPosition = ValidateCharPosition((System.Convert.ToInt32(encodedLetter) - 65) - slot2.currentPosition + slot3.currentPosition);
                encodedLetter = ((RotorIII)slot3.rotorObject).charMapping[nextPosition];
                nextPosition = ValidateCharPosition((System.Convert.ToInt32(encodedLetter) - 65 - slot3.currentPosition));
                encodedLetter = ((ReflectorB)reflector.rotorObject).charMapping[nextPosition];

                //back through rotors
                Int32 arrayPosition = ValidatePosition((System.Convert.ToInt32(encodedLetter) + slot3.currentPosition));
                encodedLetter = System.Convert.ToChar(arrayPosition);
                arrayPosition = ValidatePosition(Array.IndexOf(((RotorIII)slot3.rotorObject).charMapping, encodedLetter) - slot3.currentPosition + slot2.currentPosition + 65);
                encodedLetter = System.Convert.ToChar(arrayPosition);
                arrayPosition = ValidatePosition(Array.IndexOf(((RotorII)slot2.rotorObject).charMapping, encodedLetter) - slot2.currentPosition + slot1.currentPosition + 65);
                encodedLetter = System.Convert.ToChar(arrayPosition);
                arrayPosition = ValidatePosition(Array.IndexOf(((RotorI)slot1.rotorObject).charMapping, encodedLetter) - slot1.currentPosition + 65);
                encodedLetter = System.Convert.ToChar(arrayPosition);
                EncodedMessage = EncodedMessage + encodedLetter;
            }
            Debug.WriteLine("Incoming Message: " + TypedMessage);
            Debug.WriteLine("Encoded Message: " + EncodedMessage);

            return true;//new List<Rotor>() { new Rotor() { rotorClass = slot1.rotorClass, rotorMapping = ((RotorI)(x.rotorObject)).charMapping, startingPosition = x.startingPosition, notchPosition = ((RotorI)(x.rotorObject)).notch, currentPosition = x.currentPosition } };
        }

        [WebInvoke(UriTemplate = "", Method = "POST", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        public RootObjectIn GetMachineByParam(Stream s)
        {
            StreamReader reader = new StreamReader(s);
            string res = reader.ReadToEnd();
            reader.Close();
            reader.Dispose();
            JavaScriptSerializer ser = new JavaScriptSerializer();
            RootObjectIn jm = ser.Deserialize<RootObjectIn>(res);

            Array.Resize<Rotor>(ref slotArray, jm.rotors.Count-1);
            foreach (RotorIn currSlot in jm.rotors)
            {
                if (currSlot.rclass == "rotor")
                {
                    slotArray[System.Convert.ToInt32(currSlot.slot) - 1] = new Rotor();
                    slotArray[System.Convert.ToInt32(currSlot.slot) - 1].rotorClass = RotorClass.Rotor;
                    Object ro;
                    switch (currSlot.rtype)
                    {
                        case "I":
                            ro=new RotorI();
                            break;
                        case "II":
                            ro=new RotorII();
                            break;
                        case "III":
                            ro=new RotorIII();
                            break;
                       case "IV":
                            ro=new RotorIV();
                            break;
                        case "V":
                            ro=new RotorV();
                            break;
                       default:
                            ro=new RotorI();
                            break;
                    }
                    slotArray[System.Convert.ToInt32(currSlot.slot) - 1].rotorObject = ro;
                    slotArray[System.Convert.ToInt32(currSlot.slot) - 1].startingPosition = System.Convert.ToInt32(currSlot.start) - 65;
                }
                else if (currSlot.rclass == "reflector")
                {
                    reflector = new Rotor();
                    reflector.rotorClass = RotorClass.Rotor;
                    Object ro;
                    switch (currSlot.rtype)
                    {
                        case "B":
                            ro = new ReflectorB();
                            break;
                        case "C":
                            ro = new ReflectorC();
                            break;
                        default:
                            ro = new ReflectorB();
                            break;
                    }
                    reflector.rotorObject = ro;
                }
            }
            String EncodedMessage = "";
            String TypedMessage = "PRFWGDEB";

            TypedMessage = TypedMessage.ToUpper().Replace(" ", "");
            char encodedLetter;
            //plugboard
            foreach (char c in TypedMessage)
            {
                Rotate();
                Int32 nextPosition = ValidateCharPosition((System.Convert.ToInt32(c) - 65) + slot1.currentPosition);
                encodedLetter = ((RotorI)slot1.rotorObject).charMapping[nextPosition];
                nextPosition = ValidateCharPosition((System.Convert.ToInt32(encodedLetter) - 65) - slot1.currentPosition + slot2.currentPosition);
                encodedLetter = ((RotorII)slot2.rotorObject).charMapping[nextPosition];
                nextPosition = ValidateCharPosition((System.Convert.ToInt32(encodedLetter) - 65) - slot2.currentPosition + slot3.currentPosition);
                encodedLetter = ((RotorIII)slot3.rotorObject).charMapping[nextPosition];
                nextPosition = ValidateCharPosition((System.Convert.ToInt32(encodedLetter) - 65 - slot3.currentPosition));
                encodedLetter = ((ReflectorB)reflector.rotorObject).charMapping[nextPosition];

                //back through rotors
                Int32 arrayPosition = ValidatePosition((System.Convert.ToInt32(encodedLetter) + slot3.currentPosition));
                encodedLetter = System.Convert.ToChar(arrayPosition);
                arrayPosition = ValidatePosition(Array.IndexOf(((RotorIII)slot3.rotorObject).charMapping, encodedLetter) - slot3.currentPosition + slot2.currentPosition + 65);
                encodedLetter = System.Convert.ToChar(arrayPosition);
                arrayPosition = ValidatePosition(Array.IndexOf(((RotorII)slot2.rotorObject).charMapping, encodedLetter) - slot2.currentPosition + slot1.currentPosition + 65);
                encodedLetter = System.Convert.ToChar(arrayPosition);
                arrayPosition = ValidatePosition(Array.IndexOf(((RotorI)slot1.rotorObject).charMapping, encodedLetter) - slot1.currentPosition + 65);
                encodedLetter = System.Convert.ToChar(arrayPosition);
                EncodedMessage = EncodedMessage + encodedLetter;
            }
            Debug.WriteLine("Incoming Message: " + TypedMessage);
            Debug.WriteLine("Encoded Message: " + EncodedMessage);

            return jm;
        }

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
