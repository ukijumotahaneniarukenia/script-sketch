// Please note : @LinkingObjects and default values are not represented in the schema and thus will not be part of the generated models
package your.package.name.here;

import io.realm.RealmObject;

public class RealmTestClass0 extends RealmObject {
    private long integerValue;
    private String stringValue;
    private byte[] dataValue;

    public long getIntegerValue() { return integerValue; }

    public void setIntegerValue(long integerValue) { this.integerValue = integerValue; }

    public String getStringValue() { return stringValue; }

    public void setStringValue(String stringValue) { this.stringValue = stringValue; }

    public byte[] getDataValue() { return dataValue; }

    public void setDataValue(byte[] dataValue) { this.dataValue = dataValue; }


}
