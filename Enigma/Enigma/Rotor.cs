using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Enigma
{
    //public struct RotorType
    //{
    //    public string type;
    //    public string RotorClass;
    //    public string[] CharacterMapping;
    //}

    public struct RotorI
    {
        public static string[] charMapping = { "E", "K", "M", "F", "L", "G", "D", "Q", "V", "Z", "N", "T", "O", "W", "Y", "H", "X", "U", "S", "P", "A", "I", "B", "R", "C", "J" };
        public static int notch = 18;
    }
    public struct RotorII
    {
        public static string[] charMapping = { "A", "J", "D", "K", "S", "I", "R", "U", "X", "B", "L", "H", "W", "T", "M", "C", "Q", "G", "Z", "N", "P", "Y", "F", "V", "O", "E" };
        public static int notch = 6;
    }
    public struct RotorIII
    {
        public static string[] charMapping = { "B", "D", "F", "H", "J", "L", "C", "P", "R", "T", "X", "V", "Z", "N", "Y", "E", "I", "W", "G", "A", "K", "M", "U", "S", "Q", "O" };
        public static int notch = 23;
    }
    public struct RotorIV
    {
        public static string[] charMapping = { "E", "S", "O", "V", "P", "Z", "J", "A", "Y", "Q", "U", "I", "R", "H", "X", "L", "N", "F", "T", "G", "K", "D", "C", "M", "W", "B" };
        public static int notch = 11;
    }
    public struct RotorV
    {
        public static string[] charMapping = { "V", "Z", "B", "R", "G", "I", "T", "Y", "U", "P", "S", "D", "N", "H", "L", "X", "A", "W", "M", "J", "Q", "O", "F", "E", "C", "K" };
        public static int notch = 26;
    }
    public struct ReflectorA
    {
        public static string[] charMapping = { "E", "J", "M", "Z", "A", "L", "Y", "X", "V", "B", "W", "F", "C", "R", "Q", "U", "O", "N", "T", "S", "P", "I", "K", "H", "G", "D" };
    }
    public struct ReflectorB
    {
        public static string[] charMapping = { "Y", "R", "U", "H", "Q", "S", "L", "D", "P", "X", "N", "G", "O", "K", "M", "I", "E", "B", "F", "Z", "C", "W", "V", "J", "A", "T" };
    }
    public enum RotorClass { Rotor, Reflector };

    public class Rotor
    {
        public RotorClass rotorClass { get; set; }
        public string[] rotorArray { get; set; }
        public int startingPosition { get; set; }
        public int currentPosition { get; set; }
        public int notchPosition { get; set; }
        
        public Rotor()
        {
        }

        public Rotor(RotorClass rc, string[] ra, int sp)
        {
            rotorClass = rc;
            rotorArray = ra;
            startingPosition = sp;
            currentPosition = startingPosition;
        }
    }
}