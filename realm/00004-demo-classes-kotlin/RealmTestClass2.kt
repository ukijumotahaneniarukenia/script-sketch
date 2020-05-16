// Please note : @LinkingObjects and default values are not represented in the schema and thus will not be part of the generated models
package your.package.name.here

import io.realm.RealmObject

open class RealmTestClass2 : RealmObject() {

    var integerValue: Long = 0
    var boolValue: Boolean = false
    var objectReference: RealmTestClass1? = null

}
