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

    public class Rotor
    {
        public int Id { get; set; }
        public string StringValue { get; set; }
        public string[] RotorI = { "E", "K", "M", "F", "L", "G", "D", "Q", "V", "Z", "N", "T", "O", "W", "Y", "H", "X", "U", "S", "P", "A", "I", "B", "R", "C", "J" };
        public string[] RotorII = { "A", "J", "D", "K", "S", "I", "R", "U", "X", "B", "L", "H", "W", "T", "M", "C", "Q", "G", "Z", "N", "P", "Y", "F", "V", "O", "E" };
        public string[] RotorIII = { "B", "D", "F", "H", "J", "L", "C", "P", "R", "T", "X", "V", "Z", "N", "Y", "E", "I", "W", "G", "A", "K", "M", "U", "S", "Q", "O" };
        public string[] RotorIV = { };
    }
}