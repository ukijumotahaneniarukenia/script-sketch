// Please note : [Backlink] properties and default values are not represented
// in the schema and thus will not be part of the generated models

using System;
using System.Collections.Generic;
using Realms;

namespace MyProject.Models
{
    public class RealmTestClass2 : RealmObject
    {
        [MapTo("integerValue")]
        public long IntegerValue { get; set; }

        [MapTo("boolValue")]
        public bool BoolValue { get; set; }

        [MapTo("objectReference")]
        public RealmTestClass1 ObjectReference { get; set; }
    }
}
