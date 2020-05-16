// Please note : @LinkingObjects and default values are not represented in the schema and thus will not be part of the generated models
package your.package.name.here

import io.realm.RealmObject
import java.util.Date
import io.realm.RealmList

open class RealmTestClass1 : RealmObject() {

    var integerValue: Long = 0
    var boolValue: Boolean = false
    var floatValue: Float = 0.0f
    var doubleValue: Double = 0.0
    var stringValue: String? = null
    var dateValue: Date? = null
    var arrayReference: RealmList<RealmTestClass0> = RealmList()

}
