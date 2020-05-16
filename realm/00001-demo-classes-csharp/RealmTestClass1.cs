// Please note : [Backlink] properties and default values are not represented
// in the schema and thus will not be part of the generated models

using System;
using System.Collections.Generic;
using Realms;

namespace MyProject.Models
{
    public class RealmTestClass1 : RealmObject
    {
        [MapTo("integerValue")]
        public long IntegerValue { get; set; }

        [MapTo("boolValue")]
        public bool BoolValue { get; set; }

        [MapTo("floatValue")]
        public float FloatValue { get; set; }

        [MapTo("doubleValue")]
        public double DoubleValue { get; set; }

        [MapTo("stringValue")]
        public string StringValue { get; set; }

        [MapTo("dateValue")]
        public DateTimeOffset? DateValue { get; set; }

        [MapTo("arrayReference")]
        public IList<RealmTestClass0> ArrayReference { get; }
    }
}
