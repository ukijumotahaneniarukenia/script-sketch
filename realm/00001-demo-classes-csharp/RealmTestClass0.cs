// Please note : [Backlink] properties and default values are not represented
// in the schema and thus will not be part of the generated models

using System;
using System.Collections.Generic;
using Realms;

namespace MyProject.Models
{
    public class RealmTestClass0 : RealmObject
    {
        [MapTo("integerValue")]
        public long IntegerValue { get; set; }

        [MapTo("stringValue")]
        public string StringValue { get; set; }

        [MapTo("dataValue")]
        public byte[] DataValue { get; set; }
    }
}
