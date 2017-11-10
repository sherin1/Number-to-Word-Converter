using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NUnit.Tests
{
    [TestFixture]
    public class DecimalValidatorTests
    {
        [TestCase("9.0", 9.0)]
        [TestCase("34.2", 34.2)]
        [TestCase("554.84285592", 554.84285592)]
        public void Add_DecimalNumber_ReturnDecimal(string number, decimal expected)
        {
            Assert.IsNotNull(expected);
            Assert.AreEqual(expected, (decimal)expected);
        }

        [TestCase("4", 4.0)]
        [TestCase("567", 567.0)]
        public void Add_Integer_ReturnDecimal(string number, decimal expected)
        {
         
            Assert.IsNotNull(expected);
            Assert.AreEqual(expected, (decimal)expected);
        }

        [TestCase("8,9.0", 89.0)]
        [TestCase("1,345,978.0", 1345978.0)]
        public void Add_NumberWithThousandSeparators_ReturnDecimal(string number, decimal expected)
        {
            
            Assert.IsNotNull(expected);
            Assert.AreEqual(expected, (decimal)expected);
        }

        [TestCase("8 9.0", 89.0)]
        [TestCase("1 345 978.0", 1345978.0)]
        public void Add_NumberWithSpaces_ReturnDecimal(string number, decimal expected)
        {
           
            Assert.IsNotNull(expected);
            Assert.AreEqual(expected, (decimal)expected);
        }

        [TestCase("-4", -4.0)]
        [TestCase("-34.2", -34.2)]
        [TestCase("-5,978.0", -5978.0)]
        public void Add_NegativeNumber_ReturnDecimal(string number, decimal expected)
        {
         
            Assert.IsNotNull(expected);
            Assert.AreEqual(expected, (decimal)expected);
        }

        [TestCase("xcvxv", null)]
        [TestCase("$23.45", null)]
        public void Add_String_ReturnNull(string number, decimal? expected)
        {
          
            Assert.AreEqual(expected, expected);
        }
    }
}
