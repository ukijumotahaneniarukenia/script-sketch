// Please note : @LinkingObjects and default values are not represented in the schema and thus will not be part of the generated models
package your.package.name.here;

import io.realm.RealmObject;
import java.util.Date;
import io.realm.RealmList;

public class RealmTestClass1 extends RealmObject {
    private long integerValue;
    private boolean boolValue;
    private float floatValue;
    private double doubleValue;
    private String stringValue;
    private Date dateValue;
    private RealmList<RealmTestClass0> arrayReference;

    public long getIntegerValue() { return integerValue; }

    public void setIntegerValue(long integerValue) { this.integerValue = integerValue; }

    public boolean isBoolValue() { return boolValue; }

    public void setBoolValue(boolean boolValue) { this.boolValue = boolValue; }

    public float getFloatValue() { return floatValue; }

    public void setFloatValue(float floatValue) { this.floatValue = floatValue; }

    public double getDoubleValue() { return doubleValue; }

    public void setDoubleValue(double doubleValue) { this.doubleValue = doubleValue; }

    public String getStringValue() { return stringValue; }

    public void setStringValue(String stringValue) { this.stringValue = stringValue; }

    public Date getDateValue() { return dateValue; }

    public void setDateValue(Date dateValue) { this.dateValue = dateValue; }

    public RealmList<RealmTestClass0> getArrayReference() { return arrayReference; }

    public void setArrayReference(RealmList<RealmTestClass0> arrayReference) { this.arrayReference = arrayReference; }


}
