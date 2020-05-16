// Please note : @LinkingObjects and default values are not represented in the schema and thus will not be part of the generated models
package your.package.name.here;

import io.realm.RealmObject;

public class RealmTestClass2 extends RealmObject {
    private long integerValue;
    private boolean boolValue;
    private RealmTestClass1 objectReference;

    public long getIntegerValue() { return integerValue; }

    public void setIntegerValue(long integerValue) { this.integerValue = integerValue; }

    public boolean isBoolValue() { return boolValue; }

    public void setBoolValue(boolean boolValue) { this.boolValue = boolValue; }

    public RealmTestClass1 getObjectReference() { return objectReference; }

    public void setObjectReference(RealmTestClass1 objectReference) { this.objectReference = objectReference; }


}
