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
    public class Encrypt
    {
        Boolean DoubleRotate = false;
        Rotor[] slotArray;
        Plugboard[] plugArray;
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
            else if (i == 1)
            {
                if (slotArray[i].currentPosition == (slotArray[i].rotorObject.notch - 1))
                {
                    DoubleRotate = true;
                }
            }

            if (slotArray[i].currentPosition == slotArray[i].rotorObject.notch && i < (slotArray.Count() - 1))
            {
                ArrayRotate(i + 1);
            }
        }

        [WebInvoke(UriTemplate = "", Method = "POST", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        public RootObjectOut GetMachineByParam(RootObjectIn jm) //(Stream s)
        {
          RootObjectOut output = new RootObjectOut();
            String EncodedMessage = "";
            output.errorMessage = "";

            if (jm.encryption == null)
            {
                output.errorMessage = "encryption key required";
                return output;
            }
            if (jm.msgTo == null)
            {
                output.errorMessage = "msgTo key required";
                return output;
            }
            if (jm.msgFrom == null)
            {
                output.errorMessage = "msgFrom key required";
                return output;
            }
            if (jm.message == null)
            {
                jm.message = "";
            }
            if (jm.message == "")
            {
                output.errorMessage = "message is null";
            }
            if (jm.rotors == null)
            {
                output.errorMessage = "At least 3 rotors and 1 reflector must be sent. Rotor key is required.";
                return output;
            }
            else if (jm.rotors.Count() < 4)
            {
                output.errorMessage = "At least 3 rotors and 1 reflector must be sent.";
                return output;
            }
            else
            {
                Boolean reflectorFound = false;
                Boolean invalidTypeFound = false;
                Boolean multipleReflectors = false;
                foreach (RotorIn rIn in jm.rotors)
                {
                    if (rIn.rclass.ToString().ToLower() == "reflector")
                    {
                        if (reflectorFound)
                        {
                            multipleReflectors = true;
                            break;
                        }
                        reflectorFound=true;
                        if (rIn.rtype != "B" && rIn.rtype != "C")
                        {
                            invalidTypeFound = true;
                        }
                    }
                    else if (rIn.rtype != "I" && rIn.rtype != "II" && rIn.rtype != "III" && rIn.rtype != "IV" && rIn.rtype != "V")
                    {
                        invalidTypeFound = true;
                    }
                    if (invalidTypeFound)
                        break;
                }
                if (multipleReflectors)
                {
                    output.errorMessage = "Multiple reflectors found. Can only send one reflector type.";
                    return output;
                }
                if (invalidTypeFound)
                {
                    output.errorMessage = "Valid rotor types include \"I\", \"II\", \"III\", \"IV\", \"V\". Valid reflector types include \"B\", \"C\".";
                    return output;
                }
                if (!reflectorFound)
                {
                    output.errorMessage = "Must include 1 reflector";
                    return output;
                }

            }
            if (jm.plugboard == null)
            {
                jm.plugboard = new List<Plugboard>();
                Array.Resize<Plugboard>(ref plugArray, jm.plugboard.Count);
            }
            String TypedMessage = jm.message;
            String messageTo = jm.msgTo;
            String messageFrom = jm.msgFrom; 
            if (jm.encryption.ToLower() == "on")
            {
                if (jm.plugboard.Count() > 0)
                {
                    Array.Resize<Plugboard>(ref plugArray, jm.plugboard.Count);
                    int j = 0;
                    foreach (Plugboard plugs in jm.plugboard)
                    {
                        plugArray[j] = new Plugboard();
                        plugArray[j].from = plugs.from;
                        plugArray[j].to = plugs.to;
                        j++;
                    }
                }
                TypedMessage = TypedMessage.ToUpper().Replace(" ", "");
                Array.Resize<Rotor>(ref slotArray, jm.rotors.Count - 1);
                foreach (RotorIn currSlot in jm.rotors)
                {
                    if (currSlot.rclass == "rotor")
                    {
                        slotArray[System.Convert.ToInt32(currSlot.slot) - 1] = new Rotor();
                        slotArray[System.Convert.ToInt32(currSlot.slot) - 1].rotorClass = RotorClass.Rotor;
                        dynamic ro;
                        switch (currSlot.rtype)
                        {
                            case "I":
                                ro = new RotorI();
                                break;
                            case "II":
                                ro = new RotorII();
                                break;
                            case "III":
                                ro = new RotorIII();
                                break;
                            case "IV":
                                ro = new RotorIV();
                                break;
                            case "V":
                                ro = new RotorV();
                                break;
                            default:
                                ro = new RotorI();
                                break;
                        }
                        slotArray[System.Convert.ToInt32(currSlot.slot) - 1].rotorObject = ro;
                        slotArray[System.Convert.ToInt32(currSlot.slot) - 1].startingPosition = System.Convert.ToInt32(currSlot.start) - 65;
                        slotArray[System.Convert.ToInt32(currSlot.slot) - 1].currentPosition = slotArray[System.Convert.ToInt32(currSlot.slot) - 1].startingPosition;
                    }
                    else if (currSlot.rclass == "reflector")
                    {
                        reflector = new Rotor();
                        reflector.rotorClass = RotorClass.Rotor;
                        dynamic ro;
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
                char encodedLetter;
                //plugboard
                char newc;
                output.letters = new List<Letter>();
                output.endingPositions = new List<EndingPosition>();
                foreach (char c in TypedMessage)
                {
                    Letter l = new Letter();
                    l.encryptionPath = new List<EncryptionPath>();
                    EncryptionPath ep = new EncryptionPath();
                    newc = c;
                    for (int i = 0; i<=(plugArray.Count() - 1); i++)
                    {
                        if (c == plugArray[i].from || c == plugArray[i].to)
                        {
                            if (c == plugArray[i].from)
                                newc = plugArray[i].to;
                            else
                                newc = plugArray[i].from;
                            ep = new EncryptionPath(); 
                            ep.From = c;
                            ep.To=newc;
                            l.encryptionPath.Add(ep);
                            break;
                        }
                    }
                    ArrayRotate(0);
                    //proceed forward through rotors
                    Int32 nextPosition = ValidateCharPosition((System.Convert.ToInt32(newc) - 65) + slotArray[0].currentPosition);
                    ep = new EncryptionPath();
                    ep.From = newc;
                    encodedLetter = slotArray[0].rotorObject.charMapping[nextPosition];
                    ep.To = encodedLetter;
                    l.encryptionPath.Add(ep);
                    for (int i = 1; (i <= slotArray.Count() - 1); i++)
                    {
                        nextPosition = ValidateCharPosition((System.Convert.ToInt32(encodedLetter) - 65) - slotArray[i - 1].currentPosition + slotArray[i].currentPosition);
                        ep = new EncryptionPath();
                        ep.From = encodedLetter;
                        encodedLetter = slotArray[i].rotorObject.charMapping[nextPosition];
                        ep.To = encodedLetter;
                        l.encryptionPath.Add(ep);
                    }
                    //enter reflector
                    nextPosition = ValidateCharPosition((System.Convert.ToInt32(encodedLetter) - 65 - slotArray[slotArray.Count() - 1].currentPosition));
                    ep = new EncryptionPath();
                    ep.From = encodedLetter;
                    encodedLetter = reflector.rotorObject.charMapping[nextPosition];
                    ep.To = encodedLetter;
                    l.encryptionPath.Add(ep);
                    //back through rotors
                    Int32 arrayPosition = ValidatePosition((System.Convert.ToInt32(encodedLetter) + slotArray[2].currentPosition));
                    ep = new EncryptionPath();
                    ep.From = encodedLetter;
                    encodedLetter = System.Convert.ToChar(arrayPosition);
                    ep.To = encodedLetter;
                    l.encryptionPath.Add(ep);
                    for (int i = slotArray.Count() - 1; i >= 1; i--)
                    {
                        arrayPosition = ValidatePosition(Array.IndexOf(slotArray[i].rotorObject.charMapping, encodedLetter) - slotArray[i].currentPosition + slotArray[i - 1].currentPosition + 65);
                        ep = new EncryptionPath();
                        ep.From = encodedLetter;
                        encodedLetter = System.Convert.ToChar(arrayPosition);
                        ep.To = encodedLetter;
                        l.encryptionPath.Add(ep);
                    }
                    //enter initial rotor
                    arrayPosition = ValidatePosition(Array.IndexOf(slotArray[0].rotorObject.charMapping, encodedLetter) - slotArray[0].currentPosition + 65);
                    ep = new EncryptionPath();
                    ep.From = encodedLetter;
                    encodedLetter = System.Convert.ToChar(arrayPosition);
                    ep.To = encodedLetter;
                    l.encryptionPath.Add(ep);
                    for (int i = 0; i <= (plugArray.Count() - 1); i++)
                    {
                        if (encodedLetter == plugArray[i].from || encodedLetter == plugArray[i].to)
                        {
                            ep = new EncryptionPath();
                            ep.From = encodedLetter;
                            if (encodedLetter == plugArray[i].from)
                                encodedLetter = plugArray[i].to;
                            else
                                encodedLetter = plugArray[i].from;
                            ep.To = encodedLetter;
                            l.encryptionPath.Add(ep);
                            break;
                        }
                    }
                    EncodedMessage = EncodedMessage + encodedLetter;
                    output.letters.Add(l);
                }
            }
            else
            {
                EncodedMessage = TypedMessage;
            }
            for (int i = 0; i <= (slotArray.Count() - 1); i++)
            {
                EndingPosition ePos = new EndingPosition();
                ePos.slot = (i + 1).ToString();
                ePos.end = System.Convert.ToChar(slotArray[i].currentPosition+65);
                output.endingPositions.Add(ePos);
            }
            output.encryptedMessage = EncodedMessage;

            try
            {
                String strConnection = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
                SqlConnection Connection = new SqlConnection(strConnection);
                JavaScriptSerializer ser = new JavaScriptSerializer();
                String s = ser.Serialize(output);
                String strSQL = string.Format("INSERT INTO messages VALUES ('{0}','{1}','{2}')", jm.msgFrom.ToString(), jm.msgTo.ToString(), s);
                SqlCommand Command = new SqlCommand(strSQL, Connection);
                Connection.Open();
                Command.ExecuteNonQuery();
                
                Connection.Close();
            }
            catch (Exception ex)
            {
                output.errorMessage = ex.Message;
            }
            finally
            {
            }

            return output;
        }
    }
}
