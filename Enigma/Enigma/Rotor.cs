using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Enigma
{
    public class RotorIn
    {
        public string rclass { get; set; }
        public string rtype { get; set; }
        public string slot { get; set; }
        public char start { get; set; }
    }

    public class Plugboard
    {
        public string from { get; set; }
        public string to { get; set; }
    }

    public class RootObjectIn
    {
        public string encryption { get; set; }
        public string message { get; set; }
        public List<RotorIn> rotors { get; set; }
        public List<Plugboard> plugboard { get; set; }
    }

    public class EndingPosition
    {
        public string slot { get; set; }
        public string end { get; set; }
    }

    public class EncryptionPath
    {
        public string From { get; set; }
        public string To { get; set; }
    }

    public class RootObjectOut
    {
        public string encryptedMessage { get; set; }
        public List<EndingPosition> endingPositions { get; set; }
        public List<EncryptionPath> encryptionPath { get; set; }
    }

    public class RotorI
    {
        public char[] charMapping = { 'E', 'K', 'M', 'F', 'L', 'G', 'D', 'Q', 'V', 'Z', 'N', 'T', 'O', 'W', 'Y', 'H', 'X', 'U', 'S', 'P', 'A', 'I', 'B', 'R', 'C', 'J' };
        public int notch = 18;
    }
    public class RotorII
    {
        public char[] charMapping = { 'A', 'J', 'D', 'K', 'S', 'I', 'R', 'U', 'X', 'B', 'L', 'H', 'W', 'T', 'M', 'C', 'Q', 'G', 'Z', 'N', 'P', 'Y', 'F', 'V', 'O', 'E' };
        public int notch = 6;
    }
    public class RotorIII
    {
        public char[] charMapping = { 'B', 'D', 'F', 'H', 'J', 'L', 'C', 'P', 'R', 'T', 'X', 'V', 'Z', 'N', 'Y', 'E', 'I', 'W', 'G', 'A', 'K', 'M', 'U', 'S', 'Q', 'O' };
        public int notch = 23;
    }
    public class RotorIV
    {
        public char[] charMapping = { 'E', 'S', 'O', 'V', 'P', 'Z', 'J', 'A', 'Y', 'Q', 'U', 'I', 'R', 'H', 'X', 'L', 'N', 'F', 'T', 'G', 'K', 'D', 'C', 'M', 'W', 'B' };
        public int notch = 11;
    }
    public class RotorV
    {
        public char[] charMapping = { 'V', 'Z', 'B', 'R', 'G', 'I', 'T', 'Y', 'U', 'P', 'S', 'D', 'N', 'H', 'L', 'X', 'A', 'W', 'M', 'J', 'Q', 'O', 'F', 'E', 'C', 'K' };
        public int notch = 26;
    }
    public class ReflectorC
    {
        public char[] charMapping = { 'E', 'J', 'M', 'Z', 'A', 'L', 'Y', 'X', 'V', 'B', 'W', 'F', 'C', 'R', 'Q', 'U', 'O', 'N', 'T', 'S', 'P', 'I', 'K', 'H', 'G', 'D' };
    }
    public class ReflectorB
    {
        public char[] charMapping = { 'Y', 'R', 'U', 'H', 'Q', 'S', 'L', 'D', 'P', 'X', 'N', 'G', 'O', 'K', 'M', 'I', 'E', 'B', 'F', 'Z', 'C', 'W', 'V', 'J', 'A', 'T' };
    }
    public enum RotorClass { Rotor, Reflector };
    public enum RotorType { I, II, III, IV, V, B, C };

    public class Rotor
    {
        public RotorClass rotorClass { get; set; }
        public char[] rotorMapping { get; set; }
        public Object rotorObject; 
        public int startingPosition { get; set; }
        public int currentPosition { get; set; }
        public int notchPosition { get; set; }
        
        public Rotor()
        {
        }

        public Rotor(RotorClass rc, RotorType rt, int sp)
        {
            rotorClass = rc;
            Object ro;
            switch (rt)
            {
                case RotorType.I:
                    ro = new RotorI();
                    break;
                case RotorType.II:
                    ro = new RotorII(); 
                    break;
                case RotorType.III:
                    ro = new RotorIII(); 
                    break;
                case RotorType.IV:
                    ro = new RotorIV(); 
                    break;
                case RotorType.V:
                    ro = new RotorV(); 
                    break;
                case RotorType.B:
                    ro = new ReflectorB(); 
                    break;
                case RotorType.C:
                    ro = new ReflectorC(); 
                    break;
                default:
                    ro = null;
                    break;
            }
            rotorObject = ro;
            startingPosition = sp;
            currentPosition = startingPosition;
        }
    }
}